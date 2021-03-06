{*******************************************************************************
* Unit      : TBlowfish                                                        *
********************************************************************************
* Purpose   : Encapulates the Blowfish cipher with various cipher modes        *
********************************************************************************
* Copyright : This component is copyright TSM Inc. 1999                        *
*             This source code may not be distributed to third parties in      *
*             or in part without the written permission of TSM Inc.            *
*             All rights reserved. Liability limited to replacement of         *
*             this original source code in the case of loss or damage because  *
*             the use or misuse of this software.                              *
********************************************************************************
* Version   : 25.02.98  - 1.0   Original component                             *
*             08.03.98  - 1.01  Additional cipher modes added                  *
*             09.03.98  - 1.02  Fix padding routine for files                  *
*             17.03.98  - 1.03  Added property 'Registered' for easier tracking*
*                       - 1.03  Added procedure 'GetVersion' to retrieve vers. *
*             20.03.98  - 1.04  Added expiry date for Freeware versions.       *
*             04.04.98  - 1.05  Rework of engine for improved performance      *
*                       - 1.05  Now produces the correct test vector results   *
*             08.04.98  - 1.05a Fixed the expiry date so that it works intl.   *
*             16.04.98  - 1.05b Fixed problem with the ordering of LoadIV and  *
*                               LoadString                                     *
*             25.04.98  - 1.05c Fixed problem when defined as object           *
*             17.07.98  - 1.06  Added base64 encoding to en/decrypt string     *
*             10.08.98  - 1.10  Delphi4 / CBC MAC support added                *
*             22.08.98  - 1.10a Fixed bug with zero length strings             *
*             27.09.98  - 1.11  Added Stream functionality                     *
*             30.10.98  - 1.12  Performance improvements                       *
*             22.01.99  - 1.14  Error in En- & Decrypt file/ stream resolved   *
*             26.03.99  - 1.14a Init error in "InitialiseString" fixed         *
*             26.03.99  - 1.14b File enc/dec read only + optimizations         *
*             04.10.99  - 1.15  Delphi5 update/CB4 update                      *
********************************************************************************
* Switches  : COMPONENT  - Compiles as a VCL component (otherwise unit)        *
*             COMMANDLINE- Allows override of mode from command line compiler  *
*             UNLIMITED  - Allows key restriction for Wassenaar treaty         *
*******************************************************************************}

{$R-} {$A-} {$Q-}

{$ifndef COMMANDLINE}        // Commanline overrides the follwing presets
     {$define COMPONENT}     //(COMPONENT, OBJECT)
{$endif}

// this allows compatibility with the D5 compiler
{$ifdef VER130}
     {$define VER120}
{$endif}
{$ifdef VER140}
     {$define VER120}
{$endif}
// this allows compatibility with the C++B4 compiler
{$ifdef VER125}
     {$define VER120}
{$endif}

{$define UNLIMITED}

(* This section of code implements the 64 bit limit imposed by the Wassennar
   agreement. The key is limited to 64 bits. Should you be in a country where
   the Wassennar agreement is not in force, undefine the WASSENAAR_LIMITED
   variable. *)

unit Blowfish;

interface



uses
     Classes, SysUtils;

const
     // general constants
     // Blowfish has an 8 byte block
     BLOCKSIZE = 8;
     // the buffer for file encryption
     BUFFERSIZE = 4096;

{*
  Defines the byte view of the 32bit DoublWord.
  - byte3 is the LSB.
  - byte0 is the MSB.*}
type SingleBytes = Record
     byte3: Byte; //LSB
     byte2: BYTE;
     byte1: BYTE;
     byte0: BYTE; //MSB
end;


{*
   Exception raised when key setup incomplete for a given mode.
*}

type EKeyError = class(Exception);


{*
   Exception raised when file manipulation creates an error.
*}

type EFileError = class(Exception);

{*
  Exception raised when the input string for decryptstring suspect.
*}

type EInputError = class(Exception);

{*
  Defines the 32 bit half data block with various views.
  The switch VER120 is used because Delphi4 uses the cardinal integer
  differently to D2/D3.
*}

type DoublWord = record
  case Integer Of

   0: (LWord: Cardinal);

   1: (w: singleBytes);
   2: (fByte: Array[0..3] of Byte);
 end;


{*
   Pointer to the DoublWord type.
*}

type PDoublWord = ^DoublWord;

{*
 Defines the basic element of enc/decryption.
*}

type TBlock = array[0..(BLOCKSIZE - 1)] of Byte;

{*
 Pointer to the type TBlock.
*}

type PBlock  = ^TBlock;


{*
 Defines the 'P box' array. Switch VER120 is used because Delphi4 uses the
 cardinal integer differently to D2/D3.
*}


PArray = array[0..17] of Cardinal;


{*
 Defines the 'S box' array. Switch VER120 is used because Delphi4 uses the
 cardinal integer differently to D2/D3.
*}

SArray = array[0..255] of Cardinal;


{*
 Defines possible modes for TBlowfish.
*}

type TCipherMode = (ECB, CBC, CFB, OFB);

{*
 Defines possible string modes for the En/Decrypt string.
*}

type TStringMode = (smEncode, smNormal);

{*
 Defines context variable for TBlowCore object. Splitting the core of the
 blowfish object out into a separate object allows the compiler to optimize for
 speed, leading to increase in the performance of a factor of nearly 2.
 Blowfish in Delphi runs now at about 98% of the speed of a hand crafted
 assembler implementation, which we have now thrown away, because we don't
 need it.
 P=P box, S=S box1, S2=S box2, S3 S box3, S4=S box4.
*}

type Tblf_Core_ctx = record
     P :            PArray;   // P box
     S1:            SArray;   // S box1
     S2:            SArray;   // S box2
     S3:            SArray;   // S box3
     S4:            SArray;   // S box4
     case Integer of          // Encryption/decryption block buffer
          0: (ByteBuffer: TBlock);
          1: (LongBuffer: array[0..1] of LongInt);
end;




{*
 Defines context variable for TBlowfish non-core components.
 KeyInit shows if the password has been initialised.
 IVInit shows if the IV has been initialised.
 IV is the Initialisation Vector.
 ct is the temporary buffer used in CBC, CFB and OFB modes.
*}

type Tblf_ctx = record
     KeyInit:       Boolean;  // Shows if the password has been initialised
     IVInit:        Boolean;  // Shows if the IV has been initialised
     IV:            TBlock;   // The Initialisation Vector
     ct:            TBlock;   // temporary buffer used in CBC, CFB and OFB modes
     end;

{*
 Defines core engine for Blowfish. Creating as a small object causes Delphi to
 locate code and data in the same area of memory allowing it to optimize the
 memory accessing.
 Although this may seem unnecessary, this leads to a large performace win.
 FPtrL is a pointer to lower 32 bits of data, FPtrR is a pointer to upper 32
 bits of data.
*}

type TBlowCore = class(TObject)
     ctx:          Tblf_Core_ctx;
     FPtrL:        PDoublWord;   //Pointer to Lower 32 bits of Data
     FPtrR:        PDoublWord;   // Pointer to Upper 32 bits of Data
public
     procedure     Blowfish_Core_Block_Encrypt;
     procedure     Blowfish_Core_Block_Decrypt;
end;




{*
 Defines TBlowfish.
*}

type TBlowfish = class(TComponent)

  private

     FBlowCore:    TBlowCore;{Core object}

     ctx:          Tblf_ctx;{context for non-core operations}

     {buffer for larger encryptions}
     FBuffer:      array[0..BUFFERSIZE+BLOCKSIZE] of BYTE; {Local Copy of Data}
     PtrBuffer:    PBlock;
     FCipherMode:  TCipherMode;
     FStringMode:  TStringMode;
     FPassword:    string;
     FIVString:    string;
     FEncodedText: string;
     FText:        string;
     // these routines link to the core block routines of the algorithm
     procedure     Blowfish_Core_Key_Setup(KeyArray: array of Byte; const KeyLength: integer);

     // Internal encryption primitives
     procedure     EncryptBlockMode;
     procedure     DecryptBlockMode;
     procedure     InitArray;
     procedure     EndianEncBlock;
     procedure     EndianDecBlock;



     // Implemnetation primitives
     procedure     CheckKeys;
  public
     // Base64 functions
     function      EncodeString(InputString: string): string;
     function      DecodeString(InputString: string): string;
     constructor   Create(AOwner: TComponent); override;
     destructor    Destroy; override;

     // these calls are used to load the key and the IV
     procedure     InitialiseString(const Key: string);
     procedure     InitialiseByte(const Key: array of byte; Keylength: integer);
     procedure     LoadIVString(const IVString: string);
     procedure     LoadIVByte(const IVByte: array of Byte; IVLength: integer);

     // These calls perform the operation using the mode specified in CipherMode
     procedure     EncBlock (const Input: TBlock; var Output: TBlock);
     procedure     DecBlock (const Input: TBlock; var Output: TBlock);
     procedure     EncBuffer(const Len: integer);
     procedure     DecBuffer(const Len: integer);
     procedure     EncFile  (const InputFileName: string; const OutputFileName: string);
     procedure     DecFile  (const InputFileName: string; const OutputFileName: string);
     procedure     EncStream(const Input: TStream; const Output: TStream);
     procedure     DecStream(const Input: TStream; const Output: TStream);
     procedure     EncString(const Input: string; var Output: string);
     procedure     DecString(const Input: string; var Output: string);

     // this returns the CBC-MAC of the data put through Blowfish
     procedure     CBCMACBlock(var MAC:TBlock);
     procedure     CBCMACString(var MAC: string);

     // Burn clears any sensitive information
     procedure     Burn;

     // returns the version of the component
     function      GetVersion: string;

     // functions for reading and writing the properties
     procedure     SetCipherMode(const Value: TCipherMode);
     function      GetCipherMode: TCipherMode;
     procedure     SetStringMode(const Value: TStringMode);
     function      GetStringMode: TStringMode;
     procedure     SetPassword(const Value: string);
     function      GetPassword: string;
     procedure     SetIVString(const Value: string);
     function      GetIVString: string;
     procedure     SetText(const Value: string);
     function      GetText: string;
     procedure     SetEncodedText(const Value: string);
     function      GetEncodedText: string;
     property      StringMode:   TStringMode read GetStringMode write SetStringMode;
  published
     property      CipherMode:   TCipherMode read GetCipherMode write SetCipherMode;

     property      IVString:     String read GetIVString write SetIVString;
     property      Password:     String read GetPassword write SetPassword;
     property      Text:         string read GetText write SetText;
     property      EncodedText:  string read GetEncodedText write SetEncodedText;
end;

procedure Register;

implementation

uses Windows, Dialogs;

const
     MAXBYTES = 56;          // max number of bytes in the key
     N = 16;                 // Blowfish rounds (default 16)
     RELVER = '1.15';        // Version number
     LIT_COMPNAME            = 'Blowfish';
     LIT_KEY_NOT_SET         = LIT_COMPNAME + ': Key not set';
     LIT_IV_NOT_SET          = LIT_COMPNAME + ': IV not set';
     LIT_KEY_LENGTH          = LIT_COMPNAME + ': Key must be between 1 and 56 bytes';
     LIT_INFILE_NOT_FOUND    = LIT_COMPNAME + ': Input file not found';
     LIT_CBC_NOT_SET         = LIT_COMPNAME + ': Mode must be CBC for CBCMAC';
     LIT_OUTFILE_OPEN_ERROR  = LIT_COMPNAME + ': Could not open output file';
     LIT_OUTFILE_WRITE_ERROR = LIT_COMPNAME + ': Error writing output file';
     LIT_INPUT_LENGTH        = LIT_COMPNAME + ': Input not valid - too short';
     LIT_BASE64CNV           = LIT_COMPNAME + ': Error converting from Base64 - invalid character';

     TempP: PArray = (
     $243f6a88, $85a308d3, $13198a2e, $03707344,
     $a4093822, $299f31d0, $082efa98, $ec4e6c89,
     $452821e6, $38d01377, $be5466cf, $34e90c6c,
     $c0ac29b7, $c97c50dd, $3f84d5b5, $b5470917,
     $9216d5d9, $8979fb1b);

     //Initial Random SubKey boxes, set to Pi
     TempS1: SArray = (
     $d1310ba6, $98dfb5ac, $2ffd72db, $d01adfb7,
     $b8e1afed, $6a267e96, $ba7c9045, $f12c7f99,
     $24a19947, $b3916cf7, $0801f2e2, $858efc16,
     $636920d8, $71574e69, $a458fea3, $f4933d7e,

     $0d95748f, $728eb658, $718bcd58, $82154aee,
     $7b54a41d, $c25a59b5, $9c30d539, $2af26013,
     $c5d1b023, $286085f0, $ca417918, $b8db38ef,
     $8e79dcb0, $603a180e, $6c9e0e8b, $b01e8a3e,

     $d71577c1, $bd314b27, $78af2fda, $55605c60,
     $e65525f3, $aa55ab94, $57489862, $63e81440,
     $55ca396a, $2aab10b6, $b4cc5c34, $1141e8ce,
     $a15486af, $7c72e993, $b3ee1411, $636fbc2a,

     $2ba9c55d, $741831f6, $ce5c3e16, $9b87931e,
     $afd6ba33, $6c24cf5c, $7a325381, $28958677,
     $3b8f4898, $6b4bb9af, $c4bfe81b, $66282193,
     $61d809cc, $fb21a991, $487cac60, $5dec8032,

     $ef845d5d, $e98575b1, $dc262302, $eb651b88,
     $23893e81, $d396acc5, $0f6d6ff3, $83f44239,
     $2e0b4482, $a4842004, $69c8f04a, $9e1f9b5e,
     $21c66842, $f6e96c9a, $670c9c61, $abd388f0,

     $6a51a0d2, $d8542f68, $960fa728, $ab5133a3,
     $6eef0b6c, $137a3be4, $ba3bf050, $7efb2a98,
     $a1f1651d, $39af0176, $66ca593e, $82430e88,
     $8cee8619, $456f9fb4, $7d84a5c3, $3b8b5ebe,

     $e06f75d8, $85c12073, $401a449f, $56c16aa6,
     $4ed3aa62, $363f7706, $1bfedf72, $429b023d,
     $37d0d724, $d00a1248, $db0fead3, $49f1c09b,
     $075372c9, $80991b7b, $25d479d8, $f6e8def7,

     $e3fe501a, $b6794c3b, $976ce0bd, $04c006ba,
     $c1a94fb6, $409f60c4, $5e5c9ec2, $196a2463,
     $68fb6faf, $3e6c53b5, $1339b2eb, $3b52ec6f,
     $6dfc511f, $9b30952c, $cc814544, $af5ebd09,

     $bee3d004, $de334afd, $660f2807, $192e4bb3,
     $c0cba857, $45c8740f, $d20b5f39, $b9d3fbdb,
     $5579c0bd, $1a60320a, $d6a100c6, $402c7279,
     $679f25fe, $fb1fa3cc, $8ea5e9f8, $db3222f8,

     $3c7516df, $fd616b15, $2f501ec8, $ad0552ab,
     $323db5fa, $fd238760, $53317b48, $3e00df82,
     $9e5c57bb, $ca6f8ca0, $1a87562e, $df1769db,
     $d542a8f6, $287effc3, $ac6732c6, $8c4f5573,

     $695b27b0, $bbca58c8, $e1ffa35d, $b8f011a0,
     $10fa3d98, $fd2183b8, $4afcb56c, $2dd1d35b,
     $9a53e479, $b6f84565, $d28e49bc, $4bfb9790,
     $e1ddf2da, $a4cb7e33, $62fb1341, $cee4c6e8,

     $ef20cada, $36774c01, $d07e9efe, $2bf11fb4,
     $95dbda4d, $ae909198, $eaad8e71, $6b93d5a0,
     $d08ed1d0, $afc725e0, $8e3c5b2f, $8e7594b7,
     $8ff6e2fb, $f2122b64, $8888b812, $900df01c,

     $4fad5ea0, $688fc31c, $d1cff191, $b3a8c1ad,
     $2f2f2218, $be0e1777, $ea752dfe, $8b021fa1,
     $e5a0cc0f, $b56f74e8, $18acf3d6, $ce89e299,
     $b4a84fe0, $fd13e0b7, $7cc43b81, $d2ada8d9,

     $165fa266, $80957705, $93cc7314, $211a1477,
     $e6ad2065, $77b5fa86, $c75442f5, $fb9d35cf,
     $ebcdaf0c, $7b3e89a0, $d6411bd3, $ae1e7e49,
     $00250e2d, $2071b35e, $226800bb, $57b8e0af,

     $2464369b, $f009b91e, $5563911d, $59dfa6aa,
     $78c14389, $d95a537f, $207d5ba2, $02e5b9c5,
     $83260376, $6295cfa9, $11c81968, $4e734a41,
     $b3472dca, $7b14a94a, $1b510052, $9a532915,

     $d60f573f, $bc9bc6e4, $2b60a476, $81e67400,
     $08ba6fb5, $571be91f, $f296ec6b, $2a0dd915,
     $b6636521, $e7b9f9b6, $ff34052e, $c5855664,
     $53b02d5d, $a99f8fa1, $08ba4799, $6e85076a);
     //second 256
     TempS2: SArray = (
     $4b7a70e9, $b5b32944, $db75092e, $c4192623,
     $ad6ea6b0, $49a7df7d, $9cee60b8, $8fedb266,
     $ecaa8c71, $699a17ff, $5664526c, $c2b19ee1,
     $193602a5, $75094c29, $a0591340, $e4183a3e,

     $3f54989a, $5b429d65, $6b8fe4d6, $99f73fd6,
     $a1d29c07, $efe830f5, $4d2d38e6, $f0255dc1,
     $4cdd2086, $8470eb26, $6382e9c6, $021ecc5e,
     $09686b3f, $3ebaefc9, $3c971814, $6b6a70a1,

     $687f3584, $52a0e286, $b79c5305, $aa500737,
     $3e07841c, $7fdeae5c, $8e7d44ec, $5716f2b8,
     $b03ada37, $f0500c0d, $f01c1f04, $0200b3ff,
     $ae0cf51a, $3cb574b2, $25837a58, $dc0921bd,

     $d19113f9, $7ca92ff6, $94324773, $22f54701,
     $3ae5e581, $37c2dadc, $c8b57634, $9af3dda7,
     $a9446146, $0fd0030e, $ecc8c73e, $a4751e41,
     $e238cd99, $3bea0e2f, $3280bba1, $183eb331,

     $4e548b38, $4f6db908, $6f420d03, $f60a04bf,
     $2cb81290, $24977c79, $5679b072, $bcaf89af,
     $de9a771f, $d9930810, $b38bae12, $dccf3f2e,
     $5512721f, $2e6b7124, $501adde6, $9f84cd87,

     $7a584718, $7408da17, $bc9f9abc, $e94b7d8c,
     $ec7aec3a, $db851dfa, $63094366, $c464c3d2,
     $ef1c1847, $3215d908, $dd433b37, $24c2ba16,
     $12a14d43, $2a65c451, $50940002, $133ae4dd,

     $71dff89e, $10314e55, $81ac77d6, $5f11199b,
     $043556f1, $d7a3c76b, $3c11183b, $5924a509,
     $f28fe6ed, $97f1fbfa, $9ebabf2c, $1e153c6e,
     $86e34570, $eae96fb1, $860e5e0a, $5a3e2ab3,

     $771fe71c, $4e3d06fa, $2965dcb9, $99e71d0f,
     $803e89d6, $5266c825, $2e4cc978, $9c10b36a,
     $c6150eba, $94e2ea78, $a5fc3c53, $1e0a2df4,
     $f2f74ea7, $361d2b3d, $1939260f, $19c27960,

     $5223a708, $f71312b6, $ebadfe6e, $eac31f66,
     $e3bc4595, $a67bc883, $b17f37d1, $018cff28,
     $c332ddef, $be6c5aa5, $65582185, $68ab9802,
     $eecea50f, $db2f953b, $2aef7dad, $5b6e2f84,

     $1521b628, $29076170, $ecdd4775, $619f1510,
     $13cca830, $eb61bd96, $0334fe1e, $aa0363cf,
     $b5735c90, $4c70a239, $d59e9e0b, $cbaade14,
     $eecc86bc, $60622ca7, $9cab5cab, $b2f3846e,

     $648b1eaf, $19bdf0ca, $a02369b9, $655abb50,
     $40685a32, $3c2ab4b3, $319ee9d5, $c021b8f7,
     $9b540b19, $875fa099, $95f7997e, $623d7da8,
     $f837889a, $97e32d77, $11ed935f, $16681281,

     $0e358829, $c7e61fd6, $96dedfa1, $7858ba99,
     $57f584a5, $1b227263, $9b83c3ff, $1ac24696,
     $cdb30aeb, $532e3054, $8fd948e4, $6dbc3128,
     $58ebf2ef, $34c6ffea, $fe28ed61, $ee7c3c73,

     $5d4a14d9, $e864b7e3, $42105d14, $203e13e0,
     $45eee2b6, $a3aaabea, $db6c4f15, $facb4fd0,
     $c742f442, $ef6abbb5, $654f3b1d, $41cd2105,
     $d81e799e, $86854dc7, $e44b476a, $3d816250,

     $cf62a1f2, $5b8d2646, $fc8883a0, $c1c7b6a3,
     $7f1524c3, $69cb7492, $47848a0b, $5692b285,
     $095bbf00, $ad19489d, $1462b174, $23820e00,
     $58428d2a, $0c55f5ea, $1dadf43e, $233f7061,

     $3372f092, $8d937e41, $d65fecf1, $6c223bdb,
     $7cde3759, $cbee7460, $4085f2a7, $ce77326e,
     $a6078084, $19f8509e, $e8efd855, $61d99735,
     $a969a7aa, $c50c06c2, $5a04abfc, $800bcadc,

     $9e447a2e, $c3453484, $fdd56705, $0e1e9ec9,
     $db73dbd3, $105588cd, $675fda79, $e3674340,
     $c5c43465, $713e38d8, $3d28f89e, $f16dff20,
     $153e21e7, $8fb03d4a, $e6e39f2b, $db83adf7);
     //Third 256
     TempS3: SArray = (
     $e93d5a68, $948140f7, $f64c261c, $94692934,
     $411520f7, $7602d4f7, $bcf46b2e, $d4a20068,
     $d4082471, $3320f46a, $43b7d4b7, $500061af,
     $1e39f62e, $97244546, $14214f74, $bf8b8840,

     $4d95fc1d, $96b591af, $70f4ddd3, $66a02f45,
     $bfbc09ec, $03bd9785, $7fac6dd0, $31cb8504,
     $96eb27b3, $55fd3941, $da2547e6, $abca0a9a,
     $28507825, $530429f4, $0a2c86da, $e9b66dfb,

     $68dc1462, $d7486900, $680ec0a4, $27a18dee,
     $4f3ffea2, $e887ad8c, $b58ce006, $7af4d6b6,
     $aace1e7c, $d3375fec, $ce78a399, $406b2a42,
     $20fe9e35, $d9f385b9, $ee39d7ab, $3b124e8b,

     $1dc9faf7, $4b6d1856, $26a36631, $eae397b2,
     $3a6efa74, $dd5b4332, $6841e7f7, $ca7820fb,
     $fb0af54e, $d8feb397, $454056ac, $ba489527,
     $55533a3a, $20838d87, $fe6ba9b7, $d096954b,

     $55a867bc, $a1159a58, $cca92963, $99e1db33,
     $a62a4a56, $3f3125f9, $5ef47e1c, $9029317c,
     $fdf8e802, $04272f70, $80bb155c, $05282ce3,
     $95c11548, $e4c66d22, $48c1133f, $c70f86dc,

     $07f9c9ee, $41041f0f, $404779a4, $5d886e17,
     $325f51eb, $d59bc0d1, $f2bcc18f, $41113564,
     $257b7834, $602a9c60, $dff8e8a3, $1f636c1b,
     $0e12b4c2, $02e1329e, $af664fd1, $cad18115,

     $6b2395e0, $333e92e1, $3b240b62, $eebeb922,
     $85b2a20e, $e6ba0d99, $de720c8c, $2da2f728,
     $d0127845, $95b794fd, $647d0862, $e7ccf5f0,
     $5449a36f, $877d48fa, $c39dfd27, $f33e8d1e,

     $0a476341, $992eff74, $3a6f6eab, $f4f8fd37,
     $a812dc60, $a1ebddf8, $991be14c, $db6e6b0d,
     $c67b5510, $6d672c37, $2765d43b, $dcd0e804,
     $f1290dc7, $cc00ffa3, $b5390f92, $690fed0b,

     $667b9ffb, $cedb7d9c, $a091cf0b, $d9155ea3,
     $bb132f88, $515bad24, $7b9479bf, $763bd6eb,
     $37392eb3, $cc115979, $8026e297, $f42e312d,
     $6842ada7, $c66a2b3b, $12754ccc, $782ef11c,

     $6a124237, $b79251e7, $06a1bbe6, $4bfb6350,
     $1a6b1018, $11caedfa, $3d25bdd8, $e2e1c3c9,
     $44421659, $0a121386, $d90cec6e, $d5abea2a,
     $64af674e, $da86a85f, $bebfe988, $64e4c3fe,

     $9dbc8057, $f0f7c086, $60787bf8, $6003604d,
     $d1fd8346, $f6381fb0, $7745ae04, $d736fccc,
     $83426b33, $f01eab71, $b0804187, $3c005e5f,
     $77a057be, $bde8ae24, $55464299, $bf582e61,

     $4e58f48f, $f2ddfda2, $f474ef38, $8789bdc2,
     $5366f9c3, $c8b38e74, $b475f255, $46fcd9b9,
     $7aeb2661, $8b1ddf84, $846a0e79, $915f95e2,
     $466e598e, $20b45770, $8cd55591, $c902de4c,

     $b90bace1, $bb8205d0, $11a86248, $7574a99e,
     $b77f19b6, $e0a9dc09, $662d09a1, $c4324633,
     $e85a1f02, $09f0be8c, $4a99a025, $1d6efe10,
     $1ab93d1d, $0ba5a4df, $a186f20f, $2868f169,

     $dcb7da83, $573906fe, $a1e2ce9b, $4fcd7f52,
     $50115e01, $a70683fa, $a002b5c4, $0de6d027,
     $9af88c27, $773f8641, $c3604c06, $61a806b5,
     $f0177a28, $c0f586e0, $006058aa, $30dc7d62,

     $11e69ed7, $2338ea63, $53c2dd94, $c2c21634,
     $bbcbee56, $90bcb6de, $ebfc7da1, $ce591d76,
     $6f05e409, $4b7c0188, $39720a3d, $7c927c24,
     $86e3725f, $724d9db9, $1ac15bb4, $d39eb8fc,

     $ed545578, $08fca5b5, $d83d7cd3, $4dad0fc4,
     $1e50ef5e, $b161e6f8, $a28514d9, $6c51133c,
     $6fd5c7e7, $56e14ec4, $362abfce, $ddc6c837,
     $d79a3234, $92638212, $670efa8e, $406000e0);
     //Fourth 256
     TempS4: SArray = (
     $3a39ce37, $d3faf5cf, $abc27737, $5ac52d1b,
     $5cb0679e, $4fa33742, $d3822740, $99bc9bbe,
     $d5118e9d, $bf0f7315, $d62d1c7e, $c700c47b,
     $b78c1b6b, $21a19045, $b26eb1be, $6a366eb4,

     $5748ab2f, $bc946e79, $c6a376d2, $6549c2c8,
     $530ff8ee, $468dde7d, $d5730a1d, $4cd04dc6,
     $2939bbdb, $a9ba4650, $ac9526e8, $be5ee304,
     $a1fad5f0, $6a2d519a, $63ef8ce2, $9a86ee22,

     $c089c2b8, $43242ef6, $a51e03aa, $9cf2d0a4,
     $83c061ba, $9be96a4d, $8fe51550, $ba645bd6,
     $2826a2f9, $a73a3ae1, $4ba99586, $ef5562e9,
     $c72fefd3, $f752f7da, $3f046f69, $77fa0a59,

     $80e4a915, $87b08601, $9b09e6ad, $3b3ee593,
     $e990fd5a, $9e34d797, $2cf0b7d9, $022b8b51,
     $96d5ac3a, $017da67d, $d1cf3ed6, $7c7d2d28,
     $1f9f25cf, $adf2b89b, $5ad6b472, $5a88f54c,

     $e029ac71, $e019a5e6, $47b0acfd, $ed93fa9b,
     $e8d3c48d, $283b57cc, $f8d56629, $79132e28,
     $785f0191, $ed756055, $f7960e44, $e3d35e8c,
     $15056dd4, $88f46dba, $03a16125, $0564f0bd,

     $c3eb9e15, $3c9057a2, $97271aec, $a93a072a,
     $1b3f6d9b, $1e6321f5, $f59c66fb, $26dcf319,
     $7533d928, $b155fdf5, $03563482, $8aba3cbb,
     $28517711, $c20ad9f8, $abcc5167, $ccad925f,

     $4de81751, $3830dc8e, $379d5862, $9320f991,
     $ea7a90c2, $fb3e7bce, $5121ce64, $774fbe32,
     $a8b6e37e, $c3293d46, $48de5369, $6413e680,
     $a2ae0810, $dd6db224, $69852dfd, $09072166,

     $b39a460a, $6445c0dd, $586cdecf, $1c20c8ae,
     $5bbef7dd, $1b588d40, $ccd2017f, $6bb4e3bb,
     $dda26a7e, $3a59ff45, $3e350a44, $bcb4cdd5,
     $72eacea8, $fa6484bb, $8d6612ae, $bf3c6f47,

     $d29be463, $542f5d9e, $aec2771b, $f64e6370,
     $740e0d8d, $e75b1357, $f8721671, $af537d5d,
     $4040cb08, $4eb4e2cc, $34d2466a, $0115af84,
     $e1b00428, $95983a1d, $06b89fb4, $ce6ea048,

     $6f3f3b82, $3520ab82, $011a1d4b, $277227f8,
     $611560b1, $e7933fdc, $bb3a792b, $344525bd,
     $a08839e1, $51ce794b, $2f32c9b7, $a01fbac9,
     $e01cc87e, $bcc7d1f6, $cf0111c3, $a1e8aac7,

     $1a908749, $d44fbd9a, $d0dadecb, $d50ada38,
     $0339c32a, $c6913667, $8df9317c, $e0b12b4f,
     $f79e59b7, $43f5bb3a, $f2d519ff, $27d9459c,
     $bf97222c, $15e6fc2a, $0f91fc71, $9b941525,

     $fae59361, $ceb69ceb, $c2a86459, $12baa8d1,
     $b6c1075e, $e3056a0c, $10d25065, $cb03a442,
     $e0ec6e0e, $1698db3b, $4c98a0be, $3278e964,
     $9f1f9532, $e0d392df, $d3a0342b, $8971f21e,

     $1b0a7441, $4ba3348c, $c5be7120, $c37632d8,
     $df359f8d, $9b992f2e, $e60b6f47, $0fe3f11d,
     $e54cda54, $1edad891, $ce6279cf, $cd3e7e6f,
     $1618b166, $fd2c1d05, $848fd2c5, $f6fb2299,

     $f523f357, $a6327623, $93a83531, $56cccd02,
     $acf08162, $5a75ebb5, $6e163697, $88d273cc,
     $de966292, $81b949d0, $4c50901b, $71c65614,
     $e6c6c7bd, $327a140a, $45e1d006, $c3f27b9a,

     $c9aa53fd, $62a80f00, $bb25bfe2, $35bdd2f6,
     $71126905, $b2040222, $b6cbcf7c, $cd769c2b,
     $53113ec0, $1640e3d3, $38abbd60, $2547adf0,
     $ba38209c, $f746ce76, $77afa1c5, $20756060,

     $85cbfe4e, $8ae88dd8, $7aaaf9b0, $4cf9aa7e,
     $1948c25c, $02fb8a8c, $01c36ae4, $d6ebe1f9,
     $90d4f869, $a65cdea0, $3f09252d, $c208e69f,
     $b74e6132, $ce77e25b, $578fdfe3, $3ac372e6);

{*******************************************************************************
* Table     : BinToAsc                                                         *
********************************************************************************
* Purpose   : The encode table used by Base64 encoding                         *
*******************************************************************************}
     BinToAsc : Array [0..63] of Char =
          ('+', '-','0','1','2','3','4','5','6','7',
           '8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
           'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d',
           'e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
           't','u','v','w','x','y','z');


{*******************************************************************************
* Procedure : Register                                                         *
********************************************************************************
* Purpose   : Declares the component to the Delhpi IDE (in component mode only)*
********************************************************************************
* Paramters : 'Crypto' : the name of the Tab under which the component should  *
*             appear                                                           *
*             'TBlowfish' The name of the component in the tab. Must match the *
*             declared type name                                               *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure Register;
begin
     RegisterComponents('osf', [TBlowfish]);
end; 


{*******************************************************************************
* Procedure : EncodeString                                                     *
********************************************************************************
* Purpose   : Encodes the binary string into a base64 representation to avoid  *
*             problems with nulls in the encoded string                        *
********************************************************************************
* Paramters : Input - the string to be encoded                                 *
********************************************************************************
* Returns   : the encoded string                                               *
*******************************************************************************}
function TBlowfish.EncodeString(InputString: string): string;
var
     Counter:      integer;
     ReturnString: string;
     b:            Byte;
     i:            integer;
     last:         byte;
     Flush:        Boolean;
     LengthInput:  integer;
begin
     Counter := 0;
     ReturnString := '';
     Flush := False;
     last := 0;

     // deal with flushing the partial byte at the end of the string
     if (Length(InputString) mod 3) <> 0 then
     begin
          InputString := InputString + Chr(0);
          // flush controls the last byte mod 3
          Flush := True;
     end; {if}

     LengthInput := Length(InputString);
     i := 1;
     while (i <= LengthInput) do
     begin
          if i <= LengthInput then
          begin
               b := Ord(InputString[i]);
          end
          else
          begin
               b := 0;
          end; {if}

          case Counter of
          0:
               begin
                    ReturnString := ReturnString + BinToAsc[(b shr 2)];
                    last := b;
               end;
          1:
               begin
                    ReturnString := ReturnString + BinToAsc[((last and $3) shl 4) or ((b and $F0) shr 4) ];
                    last := b;
               end;
          2:
               begin
                    ReturnString := ReturnString + BinToAsc[((last and $F) shl 2) or ((b and $C0) shr 6)];
                    if not (Flush and (i = LengthInput)) then
                    begin
                         ReturnString := ReturnString + BinToAsc[(b and $3F)];
                    end;
                    last := 0;
               end;
          end; {case}

          Inc(Counter);
          if Counter = 3 then
          begin
               Counter := 0;
          end;

          Inc(i);
     end; {while}

     Result := ReturnString;
end; {EncodeString}

{*******************************************************************************
* Procedure : DecodeString                                                     *
********************************************************************************
* Purpose   : Decodes the binary string into a base64 representation to avoid  *
*             problems with nulls in the encoded string                        *
********************************************************************************
* Paramters : Input - the string to be decoded                                 *
********************************************************************************
* Returns   : the decoded string                                               *
*******************************************************************************}
function TBlowfish.DecodeString(InputString: string): string;
     function  DecodeBase64(b: byte): byte;
     {*******************************************************************************
     * Procedure : DecodeBase64                                                     *
     ********************************************************************************
     * Purpose   : Decodes a byte from the Base64 string                            *
     ********************************************************************************
     * Paramters : b - the byte to be decoded                                       *
     ********************************************************************************
     * Returns   : the decoded byte                                                 *
     *******************************************************************************}
     begin
          if (b >= Ord('0')) and (b <= Ord('9')) then
          begin
               Result := b - Ord('0') + 2;
               Exit;
          end;
          if (b >= Ord('A')) and (b <= Ord('Z')) then
          begin
               Result := b - Ord('A') + 12;
               Exit;
          end;
          if (b >= Ord('a')) and (b <= Ord('z')) then
          begin
               Result := b - Ord('a') + 38;
               Exit;
          end;
          if b = Ord('+') then
          begin
               Result := 0;
               Exit;
          end;
          if b = Ord('-') then
          begin
               Result := 1;
               Exit;
          end;

          // Default result if the char is not recognised
          raise EConvertError.Create(LIT_BASE64CNV);
     end; {DecodeBase64}
var
     Counter:      integer;
     ReturnString: string;
     c:            Char;
     last:         byte;
     this:         byte;
     i:            integer;
begin
     Counter := 0;
     ReturnString := '';
     last := 0;

     for i := 1 to Length(InputString) do
     begin
          c := InputString[i];
          case Counter of
          0:
               begin
                    last := DecodeBase64(Ord(c)) shl 2;
               end;
          1:
               begin
                    this := DecodeBase64(Ord(c));
                    ReturnString := ReturnString + Chr((last or (this shr 4)) and $ff);
                    last := this shl 4;
               end;
          2:
               begin
                    this := DecodeBase64(Ord(c));
                    ReturnString := ReturnString + Chr((last or (this shr 2)) and $ff);
                    last := this shl 6;
               end;
          3:
               begin
                    this := DecodeBase64(Ord(c));
                    ReturnString := ReturnString + Chr((last or this) and $ff);
                    last := 0;
               end;
          end; {case}

          Inc(Counter);
          if Counter = 4 then
          begin
               Counter := 0;
          end; {if}
     end; {for}

     Result := ReturnString;
end; {DecodeString}

{*******************************************************************************
* Procedure : GetVersion                                                       *
********************************************************************************
* Purpose   : Returns the internal version number of the component             *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : String - the version number expressed as a string                *
*******************************************************************************}
function TBlowfish.GetVersion;
begin
     // return the version string
     Result := LIT_COMPNAME + ' ' + RELVER;
end; {GetVersion}

{$ifndef COMPONENT}
{*******************************************************************************
* Procedure : SetCipherMode                                                    *
********************************************************************************
* Purpose   : Sets the ciphermode when defined as an object                    *
********************************************************************************
* Paramters : 'Value' : The new cipher mode to be set                          *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.SetCipherMode(const Value: TCipherMode);
begin
     FCipherMode := Value;
end; {SetCipherMode}
{$endif}

{*******************************************************************************
* Procedure : InitialiseString                                                 *
********************************************************************************
* Purpose   : Loads the passphrase into the context block                      *
********************************************************************************
* Paramters : 'Key' - the string which holds the key                           *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.InitialiseString(const Key: string);
var
     KeyArray: array[0..255] of Byte;
     i: integer;
begin
     // check for incorrect length keys
     if (Length(Key) < 1) or (Length(Key) > MAXBYTES) then
     begin
          // we should not use zero length keys
          // catch the error and return with error code
          raise EKeyError.Create(LIT_KEY_LENGTH);
          Exit;
     end; {if Length(Key)}

     // clear the context
     FillChar(ctx.ct, Sizeof(ctx.ct), #0);
     FillChar(FBlowCore.ctx.ByteBuffer, Sizeof(FBlowCore.ctx.ByteBuffer), #0);
     FillChar(FBlowCore.ctx.S1, Sizeof(FBlowCore.ctx.S1), #0);
     FillChar(FBlowCore.ctx.S2, Sizeof(FBlowCore.ctx.S2), #0);
     FillChar(FBlowCore.ctx.S3, Sizeof(FBlowCore.ctx.S3), #0);
     FillChar(FBlowCore.ctx.S3, Sizeof(FBlowCore.ctx.S4), #0);
     FillChar(FBlowCore.ctx.P, Sizeof(FBlowCore.ctx.P), #0);
     FillChar(KeyArray, Sizeof(KeyArray), #0);

     {**************************************************************************
     ************ This section of code implements the 64 bit limit *************
     ************ imposed by the Wassennar agreement. The key is   *************
     ************ limited to 64 bits. Should you be in a country   *************
     ************ where the Wassennar agreement is not in force,   *************
     ************ undefine the WASSENAAR_LIMITED variable.         *************
     **************************************************************************}

     {$ifdef WASSENAAR_LIMITED}
     // turn the key string into a key array
     for i := 1 to Length(Key) do
     begin
          KeyArray[(i-1) mod 8] := Ord(Key[i]);
     end; {for}
     {$else}
     // turn the key string into a key array
     for i := 1 to Length(Key) do
     begin
          KeyArray[i-1] := Ord(Key[i]);
     end; {for}
     {$endif}
     // and perform the initialisation with the concatenated string
     Blowfish_Core_Key_Setup(KeyArray, Length(Key));

     // mark the context as initialised
     ctx.KeyInit := True;
end; {InitialiseString}

{*******************************************************************************
* Procedure : InitialiseByte                                                   *
********************************************************************************
* Purpose   : Loads the passphrase into the context block                      *
********************************************************************************
* Paramters : 'Key' - array of bytes which holds the key                       *
*             'KeyLength' - the number of bytes in the array which are to be   *
*             read to load the key - need not be the same as the length of the *
*             array                                                            *
********************************************************************************
* Returns   : 'OK' if the operation was a success, otherwise an error code     *
*******************************************************************************}
procedure TBlowfish.InitialiseByte(const Key: array of Byte; KeyLength: integer);
var
     KeyArray: array[0..255] of Byte;
     i: integer;
begin
     // check for incorrect length keys
     if (KeyLength < 1) or (KeyLength > MAXBYTES) then
     begin
          // we should not use zero length keys
          // catch the error and return with error code
          raise EKeyError.Create(LIT_KEY_LENGTH);
          Exit;
     end; {if Length(Key)}

     // clear the context
     FillChar(ctx.ct, Sizeof(ctx.ct), #0);
     FillChar(FBlowCore.ctx.ByteBuffer, Sizeof(FBlowCore.ctx.ByteBuffer), #0);
     FillChar(FBlowCore.ctx.S1, Sizeof(FBlowCore.ctx.S1), #0);
     FillChar(FBlowCore.ctx.S2, Sizeof(FBlowCore.ctx.S2), #0);
     FillChar(FBlowCore.ctx.S3, Sizeof(FBlowCore.ctx.S3), #0);
     FillChar(FBlowCore.ctx.S4, Sizeof(FBlowCore.ctx.S4), #0);
     FillChar(FBlowCore.ctx.P, Sizeof(FBlowCore.ctx.P), #0);
     FillChar(KeyArray, Sizeof(KeyArray), #0);

     {**************************************************************************
     ************ This section of code implements the 64 bit limit *************
     ************ imposed by the Wassennar agreement. The key is   *************
     ************ limited to 64 bits. Should you be in a country   *************
     ************ where the Wassennar agreement is not in force,   *************
     ************ undefine the WASSENAAR_LIMITED variable.         *************
     **************************************************************************}

     {$ifdef WASSENAAR_LIMITED}
     // buffer the passed key into the key array to make sure that
     // it is padded with something defined (just in case)
     for i := 0 to KeyLength-1 do
     begin
          KeyArray[i mod 8] := Key[i];
     end; {for}
     {$else}
     // buffer the passed key into the key array to make sure that
     // it is padded with something defined (just in case)
     for i := 0 to KeyLength-1 do
     begin
          KeyArray[i] := Key[i];
     end; {for}
     {$endif}

     // and perform the initialisation with the concatenated string
     Blowfish_Core_Key_Setup(KeyArray, KeyLength);

     // mark the context as initialised
     ctx.KeyInit := True;
end; {InitialiseByte}

{*******************************************************************************
* Procedure : LoadIVString                                                     *
********************************************************************************
* Purpose   : Loads the Initialisation Vector                                  *
*             Note: this is only necessary for modes other than ECB            *
********************************************************************************
* Paramters : 'IVString' - the string which holds the IV to be set             *
********************************************************************************
* Returns   : None - (Null IVs are also valid)                                 *
*******************************************************************************}
procedure TBlowfish.LoadIVString(Const IVString: string);
var
     i: integer;
begin
     // clear the IV in the context
     FillChar(ctx.IV, BLOCKSIZE, #0);

     // wrap the IV string into the 16 bytes of the IV block using xor
     for i := 1 to Length(IVString) do
     begin
          ctx.IV[(i-1) and (BLOCKSIZE - 1)] := ctx.IV[(i-1) and (BLOCKSIZE - 1)] xor Ord(IVString[i]);
     end; {for i}

     // mark the IV as being initialised
     ctx.IVInit := True;
end; {LoadIVString}

{*******************************************************************************
* Procedure : LoadIVByte                                                       *
********************************************************************************
* Purpose   : Loads the Initialisation Vector                                  *
*             Note: this is only necessary for modes other than ECB            *
********************************************************************************
* Paramters : 'IVByte' - the array of bytes which holds the IV to be set       *
********************************************************************************
* Returns   : None - (Null IVs are also valid)                                 *
*******************************************************************************}
procedure TBlowfish.LoadIVByte(const IVByte: array of Byte; IVLength: integer);
var
     i: integer;
begin
     // clear the IV in the context
     FillChar(FBlowCore.ctx.ByteBuffer, BLOCKSIZE, #0);

     // wrap the IV string into the 8 bytes of the IV block using xor
     for i := 1 to IVLength do
     begin
          FBlowCore.ctx.ByteBuffer[(i-1) and (BLOCKSIZE - 1)] := FBlowCore.ctx.ByteBuffer[(i-1) and (BLOCKSIZE - 1)] xor IVByte[i];
     end; {for i}

     // mark the IV as being initialised
     ctx.IVInit := True;
end; {LoadIVByte}

{*******************************************************************************
* Procedure : EncBlock                                                         *
********************************************************************************
* Purpose   : Encrypts the contents of the block usint the key (and possibly   *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the block to be encrypted                               *
*           : 'Output' the encrypted block                                     *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.EncBlock(const Input: TBlock; var Output: TBlock);
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // copy the input to the context blockbuffer
     FBlowCore.ctx.ByteBuffer := Input;

     // perform the encryption on the context
     EncryptBlockMode;

     // copy the context back to the blockbuffer
     Output := FBlowCore.ctx.ByteBuffer;
end; {EncBlock}

{*******************************************************************************
* Procedure : DecBlock                                                         *
********************************************************************************
* Purpose   : Decrypts the contents of the block usint the key (and possibly   *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the encrypted block to be decrypted                     *
*           : 'Output' the decrypted block                                     *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.DecBlock(const Input: TBlock; var Output: TBlock);
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // copy the input to the context blockbuffer
     FBlowCore.ctx.ByteBuffer := Input;

     // perform the decryption
     DecryptBlockMode;

     // copy the context back to the blockbuffer
     Output := FBlowCore.ctx.ByteBuffer;
end; {DecBlock}

{*******************************************************************************
* Procedure : EncBuffer                                                        *
********************************************************************************
* Purpose   : Encrypts the contents of the buffer using the key (and possibly  *
*             the IV) previously set. Does not take care of any padding.       *
********************************************************************************
* Paramters : 'Len' the number of bytes in the buffer                          *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.EncBuffer(const Len: integer);
var
     Index: integer;
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // index is the pointer to the current position in the buffer
     Index := 0;

     // PtrBuffer points to the address of the buffer
     PtrBuffer := @FBuffer;

     // for every block in the buffer
     repeat
          // move one block from the buffer contents into the context
          Move(FBuffer[Index], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

          // encrypt the context
          EncryptBlockMode;

          // move the block back
          Move(FBlowCore.ctx.ByteBuffer, PtrBuffer^[Index], BLOCKSIZE);

          // increment the pointer
          Inc(Index,BLOCKSIZE);
     until Index = Len;
end; {EncBuffer}

{*******************************************************************************
* Procedure : DecBuffer                                                        *
********************************************************************************
* Purpose   : Decrypts the contents of the buffer usint the key (and possibly  *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Len' the number of bytes in the buffer                          *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.DecBuffer(const Len: integer);
var
     Index: integer;
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // index is the pointer to the current position in the buffer
     Index := 0;

     // PtrBuffer points to the address of the buffer
     PtrBuffer := @FBuffer;

     // for every block in the buffer
     repeat
          // move one block from the buffer contents into the context
          Move(FBuffer[Index], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

          // decrypt the context
          DecryptBlockMode;

          // move the block back
          Move(FBlowCore.ctx.ByteBuffer, PtrBuffer^[Index], BLOCKSIZE);

          // increment the pointer
          Inc(Index,BLOCKSIZE);
     until Index = Len;
end; {DecBuffer}

{*******************************************************************************
* Procedure : EncFile                                                          *
********************************************************************************
* Purpose   : Encrypts InputFile to OutputFile using the Key (and possibly     *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'InputFileName' the plaintext file                               *
*             'OutputFileName' the ciphertext file                             *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.EncFile(const InputFileName: string; const OutputFileName: string);
var
     InputFile, OutputFile: File;
     NumWrite, NumRead: integer;
     Pad: integer;
     Index: integer;
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // open the input file
     try
          AssignFile(InputFile, InputFileName);
     except
          // we could not open the input file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_INFILE_NOT_FOUND);
          Exit;
     end;

     // reset the input file
     FileMode := 0;         // error fix v1.14b
     Reset(InputFile, 1);

     // open the output file
     try
          AssignFile(OutputFile, OutputFileName);
     except
          // we could not open the output file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_OUTFILE_OPEN_ERROR);
          Exit;
     end;

     // reset the output file for writing
     Rewrite(OutputFile, 1);

     // this is the main loop of EncryptFile. We read (for performance reasons) a block
     // at a time and encrypt the block. This minimises the accesses to the disk
     repeat
          // Read an input block
          BlockRead(InputFile,FBuffer,BUFFERSIZE, NumRead);

          //Pad the input to a multiple of 64bits(8BYTES) with Nulls at the end of the file
          if EOF(InputFile) then
          begin
               // pad the last block
               // if we have a zero padding, expand this to a full 8 byte block
               Pad := BLOCKSIZE - (NumRead mod BLOCKSIZE);
               Index := Pad;

               // add the pad bytes to the buffer
               while Index <> 0 do
               begin
                    FBuffer[NumRead] := Pad;
                    Inc(NumRead);
                    Dec(Index);
               end; {while Index}
          end; {if EOF}

          // encrypt the buffer
          EncBuffer(NumRead);

          // write the block to the output file
          BlockWrite(OutputFile, FBuffer, NumRead, NumWrite);

          // if NumRead <> NumWrite, it is probable that the disk is full
          if NumRead <> NumWrite then
          begin
               // there was an error writing the output file
               // exit with the error code
               raise EFileError.Create(LIT_OUTFILE_WRITE_ERROR);
               Exit;
          end; {if NumRead <> NumWrite}
     until EOF(InputFile) or (NumWrite <> NumRead); {repeat}

     // close the files
     CloseFile(InputFile);
     CloseFile(OutputFile);
end; {EncFile}

{*******************************************************************************
* Procedure : DecFile                                                          *
********************************************************************************
* Purpose   : Decrypts InputFile to OutputFile using the Key (and possibly     *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'InputFileName' the ciphertext file                              *
*             'OutputFileName' the plaintext file                              *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.DecFile(const InputFileName: string; const OutputFileName: string);
var
     InputFile, OutputFile: File;
     NumWrite, NumRead: integer;
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // open the input file
     try
          AssignFile(InputFile, InputFileName);
     except
          // we could not open the input file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_INFILE_NOT_FOUND);
          Exit;
     end;

     // reset the input file
     FileMode := 0;         // error fix v1.14b
     Reset(InputFile, 1);

     // open the output file
     try
          AssignFile(OutputFile, OutputFileName);
     except
          // we could not open the output file for some reason
          // so exit gracefully with an error code
          raise EFileError.Create(LIT_OUTFILE_OPEN_ERROR);
          Exit;
     end;

     // reset the output file
     Rewrite(OutputFile, 1);

     // this is the main loop of DecryptFile. We read (for performance reasons) a block
     // at a time and encrypt the block. This minimises the accesses to the disk
     repeat
          // Read an input block
          BlockRead(InputFile,FBuffer,BUFFERSIZE, NumRead);

          //Call DecryptBuffer to handle the actual decryption
          DecBuffer(NumRead);

          //Put in OutputFile, trimming out the final padding as necessary
          if EOF(InputFile) then
          begin
               // deal with the case that the file is a multiple of BUFFERLENGTH long
               NumRead := NumRead - FBuffer[NumRead-1];
          end;

          // write the block to the output file
          BlockWrite(OutputFile,FBuffer, NumRead, NumWrite);

          // if NumRead <> NumWrite, it is probable that the disk is full
          if NumRead <> NumWrite then
          begin
               // there was an error writing the output file
               // exit with the error code
               raise EFileError.Create(LIT_OUTFILE_WRITE_ERROR);
               Exit;
          end; {if NumRead <> NumWrite}
     until EOF(InputFile) or (NumWrite <> NumRead);

     // close the files
     CloseFile(InputFile);
     CloseFile(OutputFile);
end; {DecFile}

{*******************************************************************************
* Procedure : EncStream                                                        *
********************************************************************************
* Purpose   : Encrypts the contents of the stream using the key (and possibly  *
*             the IV) previously set. Takes care of padding the stream.        *
********************************************************************************
* Paramters : 'Input'  the stream to be encrypted                              *
*           : 'Output' the encrypted stream                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.EncStream(const Input: TStream; const Output: TStream);
var
     i: integer;
     j: integer;
     k: integer;
     RemainingData: integer;
begin
     // Input.Size contains the length of the stream in bytes and in *not*
     // updated by reading the stream (i.e. it is not a pointer to the position
     // in the stream.
     InitialiseString(Password);
     LoadIVString(IVString);

     RemainingData := Input.Size;

     // reset the stream positions
     Input.Seek(0, soFromBeginning);
     Output.Seek(0, soFromBeginning);

     // check for zero length strings
     if Input.Size = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // deal with the whole BUFFERSIZE sections first
     // get the number of BUFFERSIZE sections to process, and process them
     i := RemainingData div BUFFERSIZE;
     while i > 0 do
     begin
          Input.Read(FBuffer, BUFFERSIZE);
          Dec(RemainingData, BUFFERSIZE);

          EncBuffer(BUFFERSIZE);

          Output.Write(FBuffer, BUFFERSIZE);
          Dec(i);
     end;

     // now deal with the final (incomplete) block of length BUFFERSIZE
     // this must be padded to ensure a sucessful decryption

     // read in the partial block
     Input.Read(FBuffer, RemainingData);

     // get the amount of padding and add it
     i := BLOCKSIZE - (RemainingData mod BLOCKSIZE);

     // and the position to write it to in the buffer
     j := RemainingData;

     // pad to a full block at the end of the input
     k := i;
     while k > 0 do
     begin
          FBuffer[j] := i;
          Dec(k);
          Inc(j);
     end; {while k}

     // encrypt the partial block
     EncBuffer(j);

     // write to the output stream
     Output.Write(FBuffer, j);
end; {EncStream}

{*******************************************************************************
* Procedure : DecStream                                                        *
********************************************************************************
* Purpose   : Decrypts the contents of the stream using the key (and possibly  *
*             the IV) previously set. Unpads the stream.                       *
********************************************************************************
* Paramters : 'Input'  the stream to be decrypted                              *
*           : 'Output' the decrypted stream                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.DecStream(const Input: TStream; const Output: TStream);
var
     i: integer;
     RemainingData: integer;
begin
     // Input.Size contains the length of the stream in bytes and in *not*
     // updated by reading the stream (i.e. it is not a pointer to the position
     // in the stream.
     InitialiseString(Password);
     LoadIVString(IVString);

     RemainingData := Input.Size;

     // reset the stream positions
     Input.Seek(0, soFromBeginning);
     Output.Seek(0, soFromBeginning);

     // check for zero length strings
     if Input.Size = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // deal with the whole BUFFERSIZE sections first
     // get the number of BUFFERSIZE sections to process, and process them
     i := RemainingData div BUFFERSIZE;
     while i > 0 do
     begin
          Input.Read(FBuffer, BUFFERSIZE);
          Dec(RemainingData, BUFFERSIZE);

          DecBuffer(BUFFERSIZE);

          Output.Write(FBuffer, BUFFERSIZE);
          Dec(i);
     end;

     // now deal with the final (incomplete) block of length BUFFERSIZE
     // this must be padded to ensure a sucessful decryption

     // read in the partial block
     Input.Read(FBuffer, RemainingData);

     // decrypt the partial block
     DecBuffer(RemainingData);

     // get the length of the padding
     i := FBuffer[RemainingData-1];

     // write the data excluding the i bytes of padding
     Output.Write(FBuffer, RemainingData-i);
end; {DecStream}

{*******************************************************************************
* Procedure : EncString                                                        *
********************************************************************************
* Purpose   : Encrypts the contents of the string usint the key (and possibly  *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the string to be encrypted                              *
*           : 'Output' the encrypted string                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.EncString(const Input: string; var Output: string);
var
     i: longint;
     j: longint;
     s: string;
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);

     CheckKeys;

     // initialise the output string
     Output := '';

     // check for zero length strings
     if Length(Input) = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // load the input into the buffer
     s := Input;

     // Pad the input string to a multiple of BLOCKSIZE bytes.
     j := Length(s) + 1;
     i := BLOCKSIZE - (Length(s) mod BLOCKSIZE);
     SetLength(s, Length(s)+i);
     SetLength(Output, Length(s));

     // add the pad bytes to the end of the string
     while j <= Length(s) do
     begin
          s[j] := chr(i);
          inc(j);
     end; {while j}

     // initialise the counters
     j := 1;
     i := 1;

     // and step through the string
     while i < length(s) do
     begin
          // copy the next bytes into the context block buffer
          Move(s[i], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);
          Inc(i, BLOCKSIZE);

          // perform the encryption of the context
          EncryptBlockMode;

          // copy the block into the output string
          Move(FBlowCore.ctx.ByteBuffer, Output[j], BLOCKSIZE);
          Inc(j, BLOCKSIZE);
     end; {while j}

     // encode the string if required
     if FStringMode = smEncode then
     begin
          Output := EncodeString(Output);
     end;
end; {EncString}

{*******************************************************************************
* Procedure : DecString                                                        *
********************************************************************************
* Purpose   : Decrypts the contents of the string usint the key (and possibly  *
*             the IV) previously set.                                          *
********************************************************************************
* Paramters : 'Input'  the encrypted string to be decrypted                    *
*           : 'Output' the decrypted string                                    *
********************************************************************************
* Returns   : OK if successful, otherwise error code                           *
*******************************************************************************}
procedure TBlowfish.DecString(const Input: string; var Output: string);
var
     i: longint;
     j: longint;
     s: string;
     InputTemp: string;
begin
     // check that we have a keys and IV
     InitialiseString(Password);
     LoadIVString(IVString);
     
     CheckKeys;

     // initialise the output string
     Output := '';

     // check for zero length strings
     if Length(Input) = 0 then
     begin
          // don't need to do anything
          Exit;
     end;

     // decode the string if required
     if FStringMode = smEncode then
     begin
          InputTemp := DecodeString(Input);
     end
     else
     begin
          InputTemp := Input;
     end;

     // check that the input is long enough
     if Length(InputTemp) < BLOCKSIZE then
     begin
          raise EInputError.Create(LIT_INPUT_LENGTH);
     end; {if Length}

     // initialise the working string
     s := '';

     // preset the length of the �working string
     SetLength(s, Length(InputTemp));

     // initialise the counters
     i := 1;
     j := 1;

     // and step through the string
     while i < (Length(InputTemp)) do
     begin
          // copy the next bytes into the context block buffer
          Move(InputTemp[j], FBlowCore.ctx.ByteBuffer, BLOCKSIZE);
          Inc(j, BLOCKSIZE);

          // perform the decryption of the context
          DecryptBlockMode;

          // copy the block into the output string
          Move(FBlowCore.ctx.ByteBuffer, s[i], BLOCKSIZE);
          Inc(i, BLOCKSIZE);
     end; {while i}

     // Unpad Plain Text string
     // Last byte is number of pad bytes
     i := ord(s[Length(s)]);
     if (i > 0) and (i <= BLOCKSIZE) then
     begin
          Output := Copy(s, 1,Length(s) - i);
     end
     else
     begin
          Output := Copy(s, 1,Length(s) - 1);
     end; {if (i>0) and}
end; {DecString}

{*******************************************************************************
* Procedure : CBCMACBlock                                                      *
********************************************************************************
* Purpose   : Returns the MAC of the data which has passed through the cipher  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The MAC as a TBlock                                              *
*******************************************************************************}
procedure TBlowfish.CBCMACBlock(var MAC: TBlock);
begin
     // pre initialise the MAC
     FillChar(MAC, Sizeof(MAC), #0);

     // check that the formalities are in order
     if FCipherMode <> CBC then
     begin
          // we can only reasonably produce a MAC in CBC mode
          raise EKeyError.Create(LIT_CBC_NOT_SET);
          Exit;
     end; {if}

     // check that we have the key and IV
     CheckKeys;

     MAC := ctx.IV;
end; {CBCMACBlock}

{*******************************************************************************
* Procedure : CBCMACstring                                                     *
********************************************************************************
* Purpose   : Returns the MAC of the data which has passed through the cipher  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : The MAC as a string                                              *
*******************************************************************************}
procedure TBlowfish.CBCMACString(var MAC: String);
var
     MACTemp: TBlock;
     i: integer;
begin
     CBCMACBlock(MACTemp);

     MAC := '';

     for i := 0 to BLOCKSIZE-1 do
     begin
          MAC := MAC + IntToHex(MACTemp[i],2);
     end; {for}
end; {CBCMACString}

{*******************************************************************************
* Procedure : SetCipherMode                                                    *
********************************************************************************
* Purpose   : Sets the internal value of the CipherMode. Used as an interface  *
*             for Object mode and for C++Builder                               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.SetCipherMode(const Value: TCipherMode);
begin
     FCipherMode := Value;
end; {TBlowfish.SetCipherMode}

{*******************************************************************************
* Procedure : SetStringMode                                                    *
********************************************************************************
* Purpose   : Sets the internal value of the StringMode. Used as an interface  *
*             for Object mode and for C++Builder                               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.SetStringMode(const Value: TStringMode);
begin
     FStringMode := Value;
end; {TBlowfish.SetStringMode}

{*******************************************************************************
* Procedure : GetCipherMode                                                    *
********************************************************************************
* Purpose   : Gets the internal value of the CipherMode. Used as an interface  *
*             for Object mode and for C++Builder                               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function TBlowfish.GetCipherMode: TCipherMode;
begin
     Result := FCipherMode;
end; {TBlowfish.GetCipherMode}

{*******************************************************************************
* Procedure : GetStringMode                                                    *
********************************************************************************
* Purpose   : Sets the internal value of the StringMode. Used as an interface  *
*             for Object mode and for C++Builder                               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
function TBlowfish.GetStringMode: TStringMode;
begin
     Result := FStringMode;
end; {TBlowfish.GetStringMode}

procedure TBlowfish.SetPassword(const Value: string);
begin


     FPassword := Value;
end;

function TBlowfish.GetPassword: string;
begin
     if FPassword = '' then
     begin
        FPassword := 'Default Password';
     end;

     Result := FPassword;
end;

procedure TBlowfish.SetIVString(const Value: string);
begin
     FIVString := Value;
end;



function TBlowfish.GetIVString: string;
begin
     if FIVString = '' then
     begin
        FIVString := 'Standard IVString';
     end;

     Result := FIVString;
end;

procedure TBlowfish.SetText(const Value: string);
begin
     FText := Value;

     EncString(Value, FEncodedText);

     // destroy sensitive information
     Burn;
end;

function TBlowfish.GetText: string;
begin
  Result := '' ;
  if FText = '' then exit ;
  Result := FText;
end;

procedure TBlowfish.SetEncodedText(const Value: string);
begin

     FEncodedText := Value;
     if FEncodedText = '' then exit ;
     DecString(Value, FText);

     Burn;
end;

function TBlowfish.GetEncodedText: string;
begin
     Result := FEncodedText;
end;
{*******************************************************************************
******************************** utility routines ******************************
*******************************************************************************}


{*******************************************************************************
* Procedure : Burn                                                             *
********************************************************************************
* Purpose   : Clears the context of any sensitive information                  *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.Burn;
begin
     // reset the whole context
     FillChar(FBlowCore.ctx, SizeOf(FBlowCore.ctx), #0);
     // reset the boolean members
     ctx.KeyInit := False;
     ctx.IVInit := False;
end; {Burn}

{*******************************************************************************
* Procedure : EncryptBlockMode                                                 *
********************************************************************************
* Purpose   : Encrypts the contents of the context buffer, using the           *
*             currently selected encryption mode.                              *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.EncryptBlockMode;
var
     i: integer;
begin
     // set the pointers to the data block
     FBlowCore.FPtrL := @FBlowCore.ctx.Longbuffer[0];
     FBlowCore.FPtrR := @FBlowCore.ctx.Longbuffer[1];

     // perform the operation using the current mode
     case FCipherMode of
     CBC:
          begin
               // xor the input block with the previous IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    FBlowCore.ctx.ByteBuffer[i] := FBlowCore.ctx.ByteBuffer[i] xor ctx.IV[i];
               end; {for i}

               // perform the encryption on the block
               EndianEncBlock;

               // copy the ciphertext to the IV
               Move (FBlowCore.ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
          end; {CBC}
     ECB:
          begin
               // ECB Mode has no preprocessing
               // perform the encryption on the block
               EndianEncBlock;
          end; {ECB}
     CFB:
          begin
               // Encipher the current IV to give the next IV
               Move (FBlowCore.ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the block
               EndianEncBlock;

               Move(FBlowCore.ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
               Move (ctx.ct, FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

               // and xor the plaintext with the IV to get the ciphertext
               for i := 0 to BLOCKSIZE-1 do
               begin
                    FBlowCore.ctx.ByteBuffer[i] := FBlowCore.ctx.ByteBuffer[i] xor ctx.IV[i];
               end; {for i}

               // feed the ciphertext back into the IV
               Move (FBlowCore.ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
          end; {CFB}
     OFB:
          begin
               // encrypt the previous IV to get the new IV
               Move (FBlowCore.ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the block
               EndianEncBlock;

               // move the IV back
               Move (FBlowCore.ctx.ByteBuffer, ctx.IV, BLOCKSIZE);

               // the ciphertext is the plaintext xor IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    FBlowCore.ctx.ByteBuffer[i] := ctx.ct[i] xor ctx.IV[i];
               end; {for i}
          end; {OFB}
     end;
end;

{*******************************************************************************
* Procedure : DecryptBlockMode                                                 *
********************************************************************************
* Purpose   : Decrypts the contents of the context buffer, using the           *
*             currently selected encryption mode.                              *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.DecryptBlockMode;
var
     i: integer;
begin
     // set the pointers to the data block
     FBlowCore.FPtrL := @FBlowCore.ctx.Longbuffer[0];
     FBlowCore.FPtrR := @FBlowCore.ctx.Longbuffer[1];

     // perform the operation using the current mode
     case FCipherMode of
     CBC:
          begin
               // preserve the ciphertext in ct
               Move(FBlowCore.ctx.ByteBuffer, ctx.ct, BLOCKSIZE);

               // perform the decryption on the block
               EndianDecBlock;

               // the plaintext is the ciphertext xor IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    FBlowCore.ctx.ByteBuffer[i] := FBlowCore.ctx.ByteBuffer[i] xor ctx.IV[i];
               end; {for i}

               // copy the ciphertext to the IV
               Move(ctx.ct, ctx.IV, BLOCKSIZE);
          end;
     ECB:
          begin
               // no preprocessing required
               // perform the decryption on the block
               EndianDecBlock;
          end;
     CFB:
          begin
               // Encipher the current IV to give the next IV
               // note that encipher is used
               Move (FBlowCore.ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the IV
               EndianEncBlock;

               Move(FBlowCore.ctx.ByteBuffer, ctx.IV, BLOCKSIZE);
               Move (ctx.ct, FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

               // and xor the plaintext with the IV to get the ciphertext
               for i := 0 to BLOCKSIZE-1 do
               begin
                    FBlowCore.ctx.ByteBuffer[i] := FBlowCore.ctx.ByteBuffer[i] xor ctx.IV[i];
               end;

               // feed the ciphertext back into the IV
               Move (ctx.ct, ctx.IV, BLOCKSIZE);
          end; {CFB}
     OFB:
          begin
               // encrypt the previous IV to get the new IV
               // note that encipher is used
               Move (FBlowCore.ctx.ByteBuffer, ctx.ct, BLOCKSIZE);
               Move (ctx.IV, FBlowCore.ctx.ByteBuffer, BLOCKSIZE);

               // perform the encryption on the IV
               EndianEncBlock;

               // move the IV back
               Move (FBlowCore.ctx.ByteBuffer, ctx.IV, BLOCKSIZE);

               // the plaintext is the ciphertext xor IV
               for i := 0 to BLOCKSIZE-1 do
               begin
                    FBlowCore.ctx.ByteBuffer[i] := ctx.ct[i] xor ctx.IV[i];
               end; {for i}
          end; {OFB}
     end; {case}
end; {DecryptBlockMode}

{*******************************************************************************
* Procedure : CheckKeys                                                        *
********************************************************************************
* Purpose   : Checks that a valid key has been set before an encryption or     *
*             decryption. If the mode is not ECB, check the IV as well.        *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.CheckKeys;
begin
     // check that we have a key
     if not ctx.KeyInit then
     begin
          // if not, we cannot perform the encryption
          // exit with error code
          raise EKeyError.Create(LIT_KEY_NOT_SET);
          Exit;
     end; {if not FBlowCore.ctx.Init}

     // for modes other than ECB we also require an IV
     // check that this has been set if the mode is not ECB
     if FCipherMode <> ECB then
     begin
          // mode is not ECB
          if not ctx.IVInit then
          begin
               // if not, we cannot perform the encryption
               // exit with error code
               raise EKeyError.Create(LIT_IV_NOT_SET);
               Exit;
          end; {if not ctx.IVInit}
     end; {if FCipherMode}
end; {TBlowfish.CheckKeys}


{******************************************************************}
{******************************************************************}
{*** the following functions encapsulate the Blowfish algorithm ***}
{******************************************************************}
{******************************************************************}


{*******************************************************************************
* Procedure : InitArray                                                        *
********************************************************************************
* Purpose   : Loads the context buffers with the constant values of the S      *
*             and P boxes                                                      *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.InitArray;
begin
     // load the P box
     FBlowCore.ctx.P := TempP;

     // load the S boxes
     FBlowCore.ctx.S1 := TempS1;
     FBlowCore.ctx.S2 := TempS2;
     FBlowCore.ctx.S3 := TempS3;
     FBlowCore.ctx.S4 := TempS4;
end;{InitArray}

{*******************************************************************************
* Procedure : EndianEncBlock                                                   *
********************************************************************************
* Purpose   : The context buffer is reorganised (because of the endianness of  *
*             Intel processors) and the inner loop is called                   *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.EndianEncBlock;
var
     TempLong: DoublWord;
begin
     // flip the oder of the bytes
     // we only need to do this because of the endianness of Intel
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;
     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;

     // perform the encryption
     FBlowCore.Blowfish_Core_Block_Encrypt;

     // flip the order of the bytes back
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;

     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;
end;{EndianEncBlock}

{*******************************************************************************
* Procedure : EndianDecBlock                                                   *
********************************************************************************
* Purpose   : The context buffer is reorganised (because of the endianness of  *
*             Intel processors) and the inner loop is called                   *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.EndianDecBlock;
var
     TempLong: DoublWord;
begin
     // flip the oder of the bytes
     // we only need to do this because of the endianness of Intel
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;

     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;

     // perform the decryption
     FBlowCore.Blowfish_Core_Block_Decrypt;

     // flip the order of the bytes back
     TempLong := FBlowCore.FPtrL^;
     FBlowCore.FPtrL^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrL^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrL^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrL^.w.byte0 := TempLong.w.byte3;

     TempLong := FBlowCore.FPtrR^;
     FBlowCore.FPtrR^.w.byte3 := TempLong.w.byte0;
     FBlowCore.FPtrR^.w.byte2 := TempLong.w.byte1;
     FBlowCore.FPtrR^.w.byte1 := TempLong.w.byte2;
     FBlowCore.FPtrR^.w.byte0 := TempLong.w.byte3;
end;{EndianDecBlock}

{*******************************************************************************
* Procedure : Blowfish_Core_Block_Encrypt                                      *
********************************************************************************
* Purpose   : This is the inner loop of TBlowfish. 16 rounds in a Feistel      *
*             network ensure the security of the algorithm                     *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowCore.Blowfish_Core_Block_Encrypt;
var
     Xl: DoublWord;
     Xr: DoublWord;
begin
     // load the right and left halves of the 64 bit value to be encrypted
     // out of the buffer and into two local variables. This is for performance
     Xl := FPtrL^;
     Xr := FPtrR^;

     // perform the encryption
     Xl.LWord := Xl.LWord xor ctx.P[0];

     {round1}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[1];

     {round2}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[2];

     {round3}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[3];

     {round4}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[4];

     {round5}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[5];

     {round6}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[6];

     {round7}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[7];

     {round8}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[8];

     {round9}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[9];

     {round10}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[10];

     {round11}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[11];

     {round12}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[12];

     {round13}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[13];

     {round14}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[14];

     {round15}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[15];

     {round16}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[16];

     Xr.LWord := Xr.LWord xor ctx.P[17];

     // copy the new halves back, and swap
     FPtrL^ := Xr;
     FPtrR^ := Xl;
end;{Blowfish_Core_Block_Encrypt}

{*******************************************************************************
* Procedure : Blowfish_Core_Block_Decrypt                                      *
********************************************************************************
* Purpose   : This is the inner loop of TBlowfish. 16 rounds in a Feistel      *
*             network ensure the security of the algorithm                     *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowCore.Blowfish_Core_Block_Decrypt;
var
     Xl: DoublWord;
     Xr: DoublWord;
begin
     // load the right and left halves of the 64 bit value to be encrypted
     // out of the buffer and into two local variables. This is for performance
     Xl := FPtrL^;
     Xr := FPtrR^;

     // perform the decryption
     Xl.Lword := Xl.Lword xor ctx.P[17];

     {round16}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[16];

     {round15}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[15];

     {round14}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[14];

     {round13}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[13];

     {round12}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[12];

     {round11}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[11];

     {round10}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[10];

     {round9}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[9];

     {round8}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[8];

     {round7}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[7];

     {round6}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[6];

     {round5}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[5];

     {round4}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[4];

     {round3}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[3];

     {round2}
     Xr.LWord := Xr.LWord xor (((ctx.S1[Xl.w.byte0] + ctx.S2[Xl.w.byte1]) xor
                 ctx.S3[Xl.w.byte2]) + ctx.S4[Xl.w.byte3]) xor ctx.P[2];

     {round1}
     Xl.LWord := Xl.LWord xor (((ctx.S1[Xr.w.byte0] + ctx.S2[Xr.w.byte1]) xor
                 ctx.S3[Xr.w.byte2]) + ctx.S4[Xr.w.byte3]) xor ctx.P[1];

     Xr.Lword := Xr.Lword xor ctx.P[0];

     // copy the new halves back, and swap
     FPtrL^ := Xr;
     FPtrR^ := Xl;
end;{Blowfish_Core_Block_Decrypt}

{*******************************************************************************
* Procedure : InitialiseBlowfish                                               *
********************************************************************************
* Purpose   : Performs the key set up of Blowfish. This is a relatively time   *
*             consuming process, but the key set up is one of the best in the  *
*             business                                                         *
********************************************************************************
* Paramters : 'Key' - the key to be loaded into the context                    *
*             'KeyBytes' - the length of the key                               *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TBlowfish.Blowfish_Core_Key_Setup(KeyArray: array of Byte; const KeyLength: integer);
var
     i, j: integer;

     data:  Cardinal;
     datal: Cardinal;
     datar: Cardinal;

begin
     // load the initial values into the context
     InitArray;

     // initialise the counter
     j := 0;

     // wrap the key into the P box
     for i:= 0 to 17 do
     begin
          Data := KeyArray[(j+3) mod KeyLength];
          Data:= Data + (KeyArray[(j+2) mod KeyLength] shl 8);
          Data:= Data + (KeyArray[(j+1) mod KeyLength] shl 16);
          Data:= Data + (KeyArray[j]                   shl 24);
          FBlowCore.ctx.P[i] := FBlowCore.ctx.P[i] xor data;
          j:= (j+4) mod KeyLength;
     end;{for i}

     // initialise the left and right halves of the key helper
     datal := 0;
     FBlowCore.FPtrL := @datal;
     datar := 0;
     FBlowCore.FPtrR := @datar;

     i:= 0;
     while (i < (16 + 2)) do
     begin
          FBlowCore.Blowfish_Core_Block_Encrypt;
          FBlowCore.ctx.P[i] := datal;
          FBlowCore.ctx.P[i + 1] := datar;
          Inc(i, 2);
     end; {while i}

     j:=0;
     // first SBox
     while (j < 256) do
     begin
          FBlowCore.Blowfish_Core_Block_Encrypt;
          FBlowCore.ctx.S1[j] := datal;
          FBlowCore.ctx.S1[j + 1] := datar;
          Inc(j, 2);
     end;{while j}
     j := 0;

     // second SBox
     while (j < 256) do
     begin
          FBlowCore.Blowfish_Core_Block_Encrypt;
          FBlowCore.ctx.S2[j] := datal;
          FBlowCore.ctx.S2[j + 1] := datar;
          Inc(j, 2);
     end;{while j}
     j := 0;

     // third SBox
     while (j < 256) do
     begin
          FBlowCore.Blowfish_Core_Block_Encrypt;
          FBlowCore.ctx.S3[j] := datal;
          FBlowCore.ctx.S3[j + 1] := datar;
          Inc(j, 2);
     end;{while j}
     j := 0;

     // fourth SBox
     while (j < 256) do
     begin
          FBlowCore.Blowfish_Core_Block_Encrypt;
          FBlowCore.ctx.S4[j] := datal;
          FBlowCore.ctx.S4[j + 1] := datar;
          Inc(j, 2);
     end;{while j}
end;{InitialiseBlowfish}

{*******************************************************************************
* Procedure : TBlowfish.Create                                                 *
********************************************************************************
* Purpose   : Creates the core object                                          *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
{$ifdef COMPONENT}
constructor TBlowfish.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
{$else}
constructor TBlowfish.Create;
begin
{$endif}
     FBlowCore := TBlowCore.Create;
end; {TBlowfish.Create}

{*******************************************************************************
* Procedure : TBlowfish.Destroy                                                *
********************************************************************************
* Purpose   : Destorys the core object                                         *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
destructor TBlowfish.Destroy;
begin
     FBLowCore.Free;
     inherited Destroy;
end; {TBlowfish.Destroy}

end.


