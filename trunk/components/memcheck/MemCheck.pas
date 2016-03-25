//===========================================================================//
// Autor: Jean Marc Eber & Vincent Mahon, Société Générale, INFI/SGOP/R&D
// Module: MemCheck
// Description: The ultimate memory troubles hunter.
//===========================================================================//

(* ------------------------------------------------------------------------------
2009-05-27: "Vadim V.Lopushansky" <pult@ukr.net>, Kyiv, Ukraine.
 Added some features:
   - added support RAD Studio 2009, 2010
   - fixed: AV: CallerOfReallocMem when compiled with optimization $O+
   - fixed: AV: LeakTrackingGetMem, LeakTrackingFreeMem.
   - fixed: At processing a log the flags BlocksToShow and "at absence of memory leaks"  are taken into account
   - fixed: Transition to a line of a code where occurs outflow of memory is made with check of work of the
            program from under a debugger ( look: IsDebugged ).
   - fixed: look UnMemChk: AV after call OldMemoryManager.FreeMem(LastBlock) when LastBlock<>nil and MemCheckActive=True
            look Unit_FInit: forced restore of "old memory manager"
   - checked/tested calculation of the addresses on Delphi 5 ... RAD Studio 2010
   - reimplementation: InitializeOnce
   - changed procedute ChangeFinalizationsOrder to function
   - added DoFinalizeOnce for destroying unit allocated resources
   - added class filter (look MemCheckIgnoredClassAdd and IgnoreTrace flag in TMemoryBlockHeader)
   - added use external jcl dll "JclDbgMapOfAddr.dll" (look USE_JEDI_DLL). Is recommended for usage as default option.
   - added autodetect DELPHI_70_MODE or DELPHI_71_MODE (look: _compiler_delphi_71)
   - added: Fast and stable quit from application (exe only)
   - remove: Math unit
   - alternative implementation finalization units (look: HOOK_ALT, NewFinalizeUnits)
   - added: additional dynamic initialization MemCheck by startup parameters (look: MemCheckInitByParamStr).
     examples:
      >run <app_name.exe> [/MemCheck_Parameter]

        MemCheck_Parameter:

        MemCheck100 or /MemCheck - leak chek for objects only
        MemCheck010 - leak chek for GetMem only
        MemCheck001 - leak chek for GetMem and ReallocMem only
        MemCheck111 - leak chek full

        MemCheck=000 - ignore all
        MemCheck=010 - leak chek for GetMem only
        MemCheck=001 - leak chek for GetMem and ReallocMem only
        MemCheck=111 - leak chek full
   - added demo application (pMemCheck.dpr; pMemCheck.res; IOTextDevices.pas; uMemCheck.pas; uMemCheck.dfm)

TODO: !!! **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *****
        - look: ALT_TRACKING_REALLOKMEM
        - $DENYPACKAGEUNIT
          need test with usage from package

TODO: !!! **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *****
        - AV finalization
        FastMM compatible -> MemCheck module for itself must use separate memory manager (? VirtualAlAlloc)
              FastMM on finalization is set system or bad mem manager.
              But memcheck is allocated memory by FasMM -> AV
TODO: !!! **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *****
        - CallerIsNewInstance not work when usage FastObj.pas

 **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** ****

--------------------------------------------------------------------------------*)

(*
MemCheck: the ultimate memory troubles hunter
Created by: Jean Marc Eber & Vincent Mahon, Société Générale, INFI/SGOP/R&D

Version 2.76.1  -> Also update OutputFileHeader when changing the version #
Revision 06.08.2008

Contact...
  --
  http://v.mahon.free.fr/pro/freeware/memcheck
      Vincent.Mahon@free.fr
  --
  https://launchpad.net/memcheck
      http://bazaar.launchpad.net/~denisgolovan/memcheck/main/files/2
      Denis Golovan at denis_golovan@mail.ru or denisgolovan@yandex.ru
  --
  http://code.google.com/p/delphi-memcheck/
      http://code.google.com/p/delphi-memcheck/downloads/list
      "Vadim V.Lopushansky" <pult@ukr.net>
  --
  Version 2.77 (Delphi 5 ... RAD Studio 2010)
  --
Mail address:
  Tour Société Générale
  Sgib/Sgop/R&D
  92987 Paris - La Défense cedex
  France

Copyrights...
The authors grant you the right to modify/change the source code as long as the original authors are mentionned.
Please let us know if you make any improvements, so that we can keep an up to date version. We also welcome
all comments, preferably by email.

Portions of this file (all the code dealing with TD32 debug information) where derived from the following work, with permission.
Reuse of this code in a commercial application is not permitted. The portions are identified by a copyright notice.
> DumpFB.C Borland 32-bit Turbo Debugger dumper (FB09 & FB0A)
> Clive Turvey, Electronics Engineer, July 1998
> Copyright (C) Tenth Planet Software Intl., Clive Turvey 1998. All rights reserved.
> Clive Turvey <clive@tbcnet.com> http://www.tbcnet.com/~clive/vcomwinp.html

Disclaimer...
You use MemCheck at your own risks. This means that you cannot hold the authors or Société Générale to be
responsible for any software\hardware problems you may encounter while using this module.

General information...
MemCheck replaces Delphi's memory manager with a home made one. This one logs information each time memory is
allocated, reallocated or freed. When the program ends, information about memory problems is provided in a log file
and exceptions are raised at problematic points.

Basic use...
Set the MemCheckLogFileName option. Call MemChk when you want to start the memory monitoring. Nothing else to do !
When your program terminates and the finalization is executed, MemCheck will report the problems. This is the
behaviour you'll obtain if you change no option in MemCheck.

Features...
- List of memory spaces not deallocated, and raising of EMemoryLeak exception at the exact place in the source code
- Call stack at allocation time. User chooses to see or not to see this call stack at run time (using ShowCallStack),
  when a EMemoryLeak is raised.
- Tracking of virtual method calls after object's destruction (we change the VMT of objects when they are destroyed)
- Tracking of method calls on an interface while the object attached to the interface has been destroyed
- Checking of writes beyond end of allocated blocks (we put a marker at the end of a block on allocation)
- Fill freed block with a byte (this allows for example to set fields of classes to Nil, or buffers to $FF, or whatever)
- Detect writes in deallocated blocks (we do this by not really deallocating block, and checking them on end - this
  can be time consuming)
- Statistics collection about objects allocation (how many objects of a given class are created ?)
- Time stamps can be indicated and will appear in the output

Options and parameters...
- You can specify the log files names (MemCheckLogFileName)
- It is possible to tell MemCheck that you are instanciating an object in a special way - See doc for
  CheckForceAllocatedType
- Clients can specify the depth of the call stack they want to store (StoredCallStackDepth)

Warnings...
- MemCheck is based on a lot of low-level hacks. Some parts of it will not work on other versions of Delphi
without being revisited (as soon as System has been recompiled, MemCheck is very likely to behave strangely,
because for example the address of InitContext will be bad).
- Some debugging tools exploit the map file to return source location information. We chose not to do that, because
we think the way MemCheck raises exceptions at the good places is better. It is still possible to use "find error"
in Delphi.
- Memcheck is not able to report accurate call stack information about a leak of a class which does not redefine
its constructor. For example, if an instance of TStringList is never deallocated, the call stack MemCheck will
report is not very complete. However, the leak is correctly reported by MemCheck.

A word about uses...
Since leaks are reported on end of execution (finalization of this unit), we need as many finalizations to occur
before memcheck's, so that if some memory is freed in these finalizations, it is not erroneously reported as leak. In order to
finalize MemCheck as late as possible, we use a trick to change the order of the list of finalizations.
Other memory managing products which are available (found easily on the internet) do not have this
problem because they just rely on putting the unit first in the DPR; but this is not safe without a build all.
In MemCheck we absolutely need to use two units: SysUtils and Windows.
Then, I decided in MemCheck 2.54 to use the unit Classes because I think it will lead to much simpler code.
We also use two units which we can use without risk since they dont have a finalization: SyncObjs.
An analysis of the uses clauses of these five units shows that in fact MemCheck uses indirectly the following units:
Classes, Typinfo, Consts, Variants, VaRUtils, SysUtils, ActiveX, Messages, SysConst, Windows, SyncObjs, System, SysInit and Types.
Of these, only Classes, Variants, System and SysUtils have a finalization section. I checked and it is not possible to have a leak
reported by MemCheck which is not correct because the memory would have been freed by one of these finalizations.
In the procedure ChangeFinalizationsOrder I make sure that only these four units are finalized after MemCheck (I could have decided for
the fifteen, but this would be more work, and I know it is useless).
*)

unit MemCheck;
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
// compiler options:
//
{$A+,H+,B-,J+,R-}
{.$ALIGN ON}
{.$ALIGN 8}
{.$MINENUMSIZE 4}
{$MINENUMSIZE 1}

{$DENYPACKAGEUNIT} // todo: test

//disable debug info generation for this unit
//this way integrated debugger does not enter memcheck every time allocation happens
{$D-,L-}

{$IFDEF _MEMCHECK_DEBUG_}
  {$D+,L+,O-,R+} // developer debuging
  {$DEFINE DEBUG}
{$ENDIF}

//test options
{.$O+}
{.$D+,L+,O-,R+}
//test.

// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
// Hook options:
//
{$UNDEF HOOK_ALT}
{$DEFINE HOOK_ALT} { Optional: alternative implementation finalization units. Is recommended for usage. }
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
// "JEDI CODE LIBRARY" (JCL) options:
//
{$UNDEF USE_JEDI}
{$UNDEF USE_JEDI_JCL}
{$UNDEF USE_JEDI_DLL}

{$DEFINE USE_JEDI} { Optional } // Is recommended for usage. Need external "JclDbgMapOfAddr.dll".

{$IFDEF USE_JEDI}
// Usage "JEDI CODE LIBRARY" (JCL) for reading map file information.
// Need compile project with linker option "map file detailed information".
// And not need linker option "Include TD32 debug info".
  {$DEFINE USE_JEDI_DLL} // { Optional } // Is recommended for usage. Need external "JclDbgMapOfAddr.dll".
  {$IFNDEF USE_JEDI_DLL}
    {$DEFINE USE_JEDI_JCL} // Only fo old JCL version (1.96). Not recommended for usage.
  {$ENDIF}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
// VCL options:
//
{$UNDEF USE_VCL}
{$IFNDEF HOOK_ALT}
  {$IFDEF BDS}
    {$DEFINE USE_VCL}  { Optional }
    {$IFDEF HOOK_ALT}
      {$UNDEF USE_VCL} { Optional }
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$UNDEF D3_UP}  // Delphi 3
{$UNDEF D4_UP}  // Delphi 4
{$UNDEF D5_UP}  // Delphi 5
{$UNDEF D6_UP}  // Delphi 6
{$UNDEF D7_UP}  // Delphi 7
{$UNDEF D8_UP}  // Delphi 8
{$UNDEF D9_UP}  // BDS 2005
{$UNDEF D10_UP} // BDS 2006
{$UNDEF D11_UP} // RAD Studio 2007
{$UNDEF D12_UP} // RAD Studio 2009
{$UNDEF D13_UP} // RAD Studio 2010
{$UNDEF D14_UP} // RAD Studio 2011
{$UNDEF BDS}
{$UNDEF _INLINE_}
{$UNDEF _UNICODE_}
// ---
{$IFNDEF LINUX}
  {$IFNDEF CLR}
    {$DEFINE MSWINDOWS}
  {$ENDIF}
{$ENDIF}
// ---
{$IFNDEF VER80}
  {$IFNDEF VER90}
    {$IFNDEF VER93}
      {$DEFINE D3_UP} { Delphi 3.0 or higher }
      {$IFNDEF VER110}
        {$DEFINE D4_UP} { Delphi 4.0 or higher }
        {$IFNDEF VER120}
          {$DEFINE D5_UP}
          {$IFNDEF VER130}
            {$DEFINE D6_UP}   { Delphi 6.0 or higher }
            {$IFNDEF VER140}
              {$DEFINE D7_UP}   { Delphi 7.0 or higher }
              {$IFNDEF VER150}
                {$DEFINE D9_UP}   { BDS 2005 (9) or higher }
                {$IFNDEF VER170}
                  {$DEFINE D10_UP}   { BDS 2006 (10) or higher }
                  {$IFDEF VER185}
                    {$DEFINE D11_UP}   { RAD Studio 2007 (11) or higher }
                  {$ELSE}
                    {$IFNDEF VER180}
                       {$DEFINE D12_UP}   { RAD Studio 2009 (12) or higher }
                       {$IFNDEF VER200}
                          {$DEFINE D13_UP}   { RAD Studio 2010 (13) or higher }
                         // {$IFNDEF VER210}
                          //   {$DEFINE D14_UP}   { RAD Studio 2010 (13) or higher }
                         // {$ENDIF}
                       {$ENDIF}
                    {$ENDIF}
                  {$ENDIF}
                {$ENDIF}
              {$ENDIF}
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$IFNDEF D5_UP}
  ERROR: UNSUPPORTED COMPILER VERSION
{$ENDIF}
{$IFDEF D14_UP}
  {$MESSAGE FATAL 'UNSUPPORTED COMPILER VERSION!'}
  ERROR: UNSUPPORTED COMPILER VERSION
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$IFDEF D9_UP}
  {$DEFINE BDS}
{$ENDIF}
// ---
{$IFDEF D9_UP}
  {$DEFINE _INLINE_} { Optional }
{$ENDIF}
// ---
{$IFDEF D12_UP}
  {$IFDEF UNICODE}
    {$DEFINE _UNICODE_}
  {$ENDIF}
{$ENDIF}
// ---
{$UNDEF D7_ONLY}
{$IFNDEF BDS}{$IFDEF D7_UP}
  {$DEFINE D7_ONLY}
{$ENDIF}{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$IFDEF D6_UP}
  {$WARN SYMBOL_PLATFORM OFF}    // Suppress .Net warnings
  {$WARN SYMBOL_DEPRECATED OFF}
  {$WARN UNIT_PLATFORM OFF}      // NOT certified for Kylix
  {$WARN UNIT_DEPRECATED OFF}    // NOT certified for Kylix
  {$WRITEABLECONST ON}
{$ENDIF}
// ---
{$IFDEF D7_UP}
  {$WARN UNSAFE_CAST OFF} // Suppress .Net warnings
  {$WARN UNSAFE_TYPE OFF} // Suppress .Net warnings
  {$WARN UNSAFE_CODE OFF} // Suppress .Net warnings
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$IFDEF D12_UP}
  {$IFDEF _UNICODE_}
    {$IFDEF USE_JEDI_JCL} // not supported old version jedi
      {$UNDEF USE_JEDI_JCL}
      {$DEFINE USE_JEDI_DLL}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

interface

const
 {***************************************************}
 {***}  MemCheckVersion = '2.77.0 [2009-05-28]'; {***}
 {***************************************************}

procedure MemChk;
{Activates MemCheck and resets the allocated blocks stack.
Warning: the old stack is lost ! - It is the client's duty to commit the
releasable blocks by calling CommitReleases(AllocatedBlocks)}

procedure UnMemChk;
{sets back the memory manager that was installed before MemChk was called
If MemCheck is not active, this does not matter. The default delphi memory manager is set.
You should be very careful about calling this routine and know exactly what it does (see the FAQ on the web site)}

procedure CommitReleases;
{really releases the blocks}

procedure AddTimeStampInformation(const i: string);
{Logs the given information as associated with the current time stamp
Requires that MemCheck is active}

procedure LogSevereExceptions(const WithVersionInfo: string);
{Activates the exception logger}

function MemoryBlockCorrupted(p: Pointer): Boolean;
{Is the given block bad ?
P is a block you may for example have created with GetMem, or P can be an object.
Bad means you have written beyond the block's allocated space or the memory for this object was freed.
If P was allocated before MemCheck was launched, we return False}

function BlockAllocationAddress(p: Pointer): Pointer;
{The address at which P was allocated
If MemCheck was not running when P was allocated (ie we do not find our magic number), we return $00000000}

function IsMemCheckActive: Boolean;
{Is MemCheck currently running ?
ie, is the current memory manager memcheck's ?}

function TextualDebugInfoForAddress(const TheAddress: Cardinal): string; {$ifdef _inline_}inline;{$endif}
function TextualDebugInfoForAddressEx(const TheAddress: Cardinal; var bIsDebugInfo: Boolean): string;

var
  MemCheckLogFileName: string = ''; //The file memcheck will log information to
  DeallocateFreedMemoryWhenBlockBiggerThan: Integer = 0;
  {should blocks be really deallocated when FreeMem is called ? If you want all blocks to be deallocated, set this
  constant to 0. If you want blocks to be never deallocated, set the cstte to MaxInt. When blocks are not deallocated,
  MemCheck can give information about when the second deallocation occured}

  ShowLogFileWhenUseful: Boolean = True;

const
  StoredCallStackDepth = 26; // TMemoryBlockHeader: (StoredCallStackDepth + 1) * 4 mod 8 = 4
  // StoredCallStackDepth: 2 ... 26, 28, 30, 32, 34, 36, 38 ... 52 ... 64 ... 96 ... 128 ...
  {Size of the call stack we store when GetMem is called, must be an EVEN number}
  {+}
  AllowNotepadErrorInfo = False; // allow show errors log file in Notepad
  SkipNullDebugInfo = {$IFNDEF USE_JEDI}False{$ELSE}False{$ENDIF}; { Optional }
  MemCheckShowFinalizationInfo = {$IFNDEF _MEMCHECK_DEBUG_}{$IFDEF DEBUG}True{$ELSE}False{$ENDIF}{$ELSE}True{$ENDIF}; { Optional }
  ReallocMemRestoreLeakTransaction = True;
  MemCheckInitByParamStr = True; // define filter (BlocksToShow)
  { Examples:
    >run <app_name.exe> [/MemCheck_Parameter]

      MemCheck_Parameter:

      MemCheck=000 - ignore all
      MemCheck=100 - leak chek for Object only
      MemCheck=010 - leak chek for GetMem only
      MemCheck=001 - leak chek for GetMem and ReallocMem only
      MemCheck=111 - leak chek full

      or

      MemCheck    - leak chek full
      MemCheck111 - leak chek full
      MemCheck100 - leak chek for Object only
      MemCheck010 - leak chek for GetMem only
      MemCheck001 - leak chek for GetMem and ReallocMem only
  }
  {+.}

type
  TCallStack = array[0..StoredCallStackDepth] of Pointer;

procedure FillCallStack(var St: TCallStack; const NbLevelsToExclude: Integer);
//Fills St with the call stack

function CallStackTextualRepresentation(const S: TCallStack; const LineHeader: string): string;
//Will contain CR/LFs

{+}
procedure MemCheckIgnoredClassAdd(AClassInfo: TClass);
procedure MemCheckIgnoredClassRemove(AClassInfo: TClass);
function MemCheckIsIgnoredClass(AClassInfo: TClass): Boolean;

function MemCheckInit(const sLevels: string): Boolean;
function MemCheckInitByFilter(ClassFilter, UserFilter, ReallocedUserFilter: Boolean): Boolean;

function MemCheckNewTransaction: Integer;
function MemCheckGetTransactionLeaks(LeakTransaction: Cardinal; const OutputFile: Text;
  bRaiseLeakFirstAddress, bRaiseLeakAllAddresses, bCheckWipedBlocks, bHideLeaks: Boolean): Boolean; overload;

function IsDebugged: Boolean;
procedure OutputDebugString(const S: string); {$ifdef _inline_}inline;{$endif}

{+.}

implementation

uses
  Windows, {Windows has no finalization, so is OK to use with no care}
  Classes,
  SyncObjs,
{$IFDEF USE_JEDI_JCL}JclDebug, {$ENDIF}
{$IFDEF D6_UP}Variants, {$ENDIF}
{$IFDEF USE_VCL}
  {$IFDEF D6_UP}
    Forms,
  {$ENDIF}
{$ENDIF USE_VCL}
  SysUtils; {Because of this uses, SysUtils must be finalized after MemCheck - Which is necessary anyway because SysUtils calls DoneExceptions in its finalization}

type
  TKindOfMemory = (MClass, MUser, MReallocedUser);
  TBlocksToShow = array[TKindOfMemory] of Boolean;
  {MClass means the block carries an object
  MUser means the block is a buffer of unknown type (in fact we just know this is not an object)
  MReallocedUser means this block was reallocated}

const
  NoDebugInfo = '(?)'; //'(no debug info)';
  MemCheckLogFileNameSuffix = '_MemCheck.log';

  (**************** MEMCHECK OPTIONS ********************)
  DanglingInterfacesVerified = False;
  {When an object is destroyed, should we fill the interface VMT with a special value which
  will allow tracking of calls to this interface after the object was destroyed - This incompatible with CheckWipedBlocksOnTermination, so you have to choose}

  WipeOutMemoryOnFreeMem = True;
  {This is about what is done on memory freeing:
  - for objects, this option replaces the VMT with a special one which will raise exceptions if a virtual method is called
  - for other memory kinds, this will fill the memory space with the char below}
  CharToUseToWipeOut: Char = #0;
  //I choose #0 because this makes objet fields Nil, which is easier to debug. Tell me if you have a better idea !

  CheckWipedBlocksOnTermination = True and WipeOutMemoryOnFreeMem and not (DanglingInterfacesVerified);
  {When iterating on the blocks (in OutputAllocatedBlocks), we check for every block which has been deallocated that it is still
  filled with CharToUseToWipeOut.
  Warning: this is VERY time-consuming
  This is meaningful only when the blocks are wiped out on free mem
  This is incompatible with dangling interfaces checking}
  DoNotCheckWipedBlocksBiggerThan = 4000;

  CollectStatsAboutObjectAllocation = False;
  {Every time FreeMem is called for allocationg an object, this will register information about the class instanciated:
  class name, number of instances, allocated space for one instance
  Note: this has to be done on FreeMem because when GetMem is called, the VMT is not installed yet and we can not know
  this is an object}

  KeepMaxMemoryUsage = CollectStatsAboutObjectAllocation;
  {Will report the biggest memory usage during the execution}

  ComputeMemoryUsageStats = False;
  {Outputs the memory usage along the life of the execution. This output can be easily graphed, in excel for example}
  MemoryUsageStatsStep = 5;
  {Meaningful only when ComputeMemoryUsageStats
  When this is set to 5, we collect information for the stats every 5 call to GetMem, unless size is bigger than StatCollectionForce}
  StatCollectionForce = 1000;

  // (MClass, MUser, MReallocedUser);
  BlocksToShow: TBlocksToShow = ({MClass=}True, {MUser=}True, {MReallocedUser=}True);
  {eg if BlocksToShow[MClass] is True, the blocks allocated for class instances will be shown}

  CheckHeapStatus = False;
  // Checks that the heap has not been corrupted since last call to the memory manager
  // Warning: VERY time-consuming

  IdentifyObjectFields = False;
  IdentifyFieldsOfObjectsConformantTo: TClass = TObject;

  MaxLeak = 1000;
  {This option tells to MemCheck not to display more than a certain quantity of leaks, so that the finalization
  phase does not take too long}

  UseDebugInfos = True;
  //Should use the debug informations which are in the executable ?

  RaiseExceptionsOnEnd = True;
  //Should we use exceptions to show memory leak information ?

  {+}
  NoLogWhenZeroNoLeaks = True; { Optional }
  {+.}

  NotepadApp = 'notepad';
  //The application launched to show the log file

   (**************** END OF MEMCHECK OPTIONS ********************)

var
  ShowCallStack: Boolean;
  {When we show an allocated block, should we show the call stack that went to the allocation ? Set to false
  before each block. The usual way to use this is calling Evaluate/Modify just after an EMemoryLeak was raised}

const
  MaxListSize = MaxInt div 16 - 1;

type
  PObjectsArray = ^TObjectsArray;
  TObjectsArray = array[0..MaxListSize] of TObject;

  PStringsArray = ^TStringsArray;
  TStringsArray = array[0..99999999] of string;
  {Used to simulate string lists}

  PIntegersArray = ^TIntegersArray;
  TIntegersArray = array[0..99999999] of Integer;
  {Used to simulate lists of integer}

var
  TimeStamps: PStringsArray = nil;
  {Allows associating a string of information with a time stamp}
  TimeStampsCount: Integer = 0;
  {Number of time stamps in the array}
  TimeStampsAllocated: Integer = 0;
  {Number of positions available in the array}

const
  DeallocateInstancesConformingTo = False;
  InstancesConformingToForDeallocation: TClass = TObject;
  {used only when BlocksToShow[MClass] is True - eg If InstancesConformingTo = TList, only blocks allocated for instances
  of TList and its heirs will be shown}

  InstancesConformingToForReporting: TClass = TObject;
  {used only when BlocksToShow[MClass] is True - eg If InstancesConformingTo = TList, only blocks allocated for instances
  of TList and its heirs will be shown}

  MaxNbSupportedVMTEntries = 200;
  {Don't change this number, its a Hack! jm}

type
  PMemoryBlockHeader = ^TMemoryBlockHeader;
  TMemoryBlockHeader = packed record
    {
    This is the header we put in front of a memory block
    For each memory allocation, we allocate "size requested + header size + footer size" because we keep information inside the memory zone.
    Therefore, the address returned by GetMem is: [the address we get from OldMemoryManager.GetMem] + HeaderSize.

    . DestructionAdress: an identifier telling if the bloc is active or not (when FreeMem is called we do not really free the mem).
      Nil when the block has not been freed yet; otherwise, contains the address of the caller of the destruction. This will be useful
      for reporting errors such as "this memory has already been freed, at address XXX".
    . PreceedingBlock: link of the linked list of allocated blocs
    . NextBlock: link of the linked list of allocated blocs
    . KindOfBlock: is the data an object or unknown kind of data (such as a buffer)
    . VMT: the classtype of the object
    . CallerAddress: an array containing the call stack at allocation time
    . AllocatedSize: the size allocated for the user (size requested by the user)
    . MagicNumber: an integer we use to recognize a block which was allocated using our own allocator
    }
    //                                       // SizeOf , Summa
    DestructionAdress: Pointer;              // 4      , 4
    PreceedingBlock: Pointer;                // 4      , 8
    NextBlock: Pointer;                      // 4      , 12
    KindOfBlock: TKindOfMemory;              // 1      , 13   // need option: {$MINENUMSIZE 1}
    {+}
    // IgnoreTrace - mark block memory to ignore leak information
    IgnoreTrace: Byte;                       // 1      , 14
    // LeakTransaction - fragmentation reports of leaks
    LeakTransaction: Cardinal;               // 4      , 18
    {+.}
    VMT: TClass;                             // 4      , 22
    CallerAddress: TCallStack;               // 108    , 130
    // AllocatedSize: this is an integer because the parameter of GetMem is an integer
    AllocatedSize: Integer;                  // 4      , 134
    // LastTimeStamp: -1 means no time stamp
    LastTimeStamp: Integer;                  // 4      , 138
    // NotUsed: use for align TMemoryBlockHeader to 8: SizeOf(TMemoryBlockHeader) in MemCheck should be a multiple of 8
    NotUsed: array [0..1] of Byte;           // 2      , 140
    MagicNumber: Cardinal;                   // 4      , 144
  end;

  {+}
  // Check: SizeOf(TMemoryBlockHeader) in MemCheck should be a multiple of 8
  TCheck_SizeOf_TMemoryBlockHeader_mod8 = array [SizeOf(TMemoryBlockHeader) mod 8 .. 0] of Byte;
  {+.}

  PMemoryBlockFooter = ^TMemoryBlockFooter;
  TMemoryBlockFooter = Cardinal;
  {This is the end-of-bloc marker we use to check that the user did not write beyond the allowed space}

  EMemoryLeak = class(Exception);
  EStackUnwinding = class(EMemoryLeak);
  EBadInstance = class(Exception);
  {This exception is raised when a virtual method is called on an object which has been freed}
  EFreedBlockDamaged = class(Exception);
  EInterfaceFreedInstance = class(Exception);
  {This exception is raised when a method is called on an interface whom object has been freed}

  VMTTable = array[0..MaxNbSupportedVMTEntries] of Pointer;
  pVMTTable = ^VMTTable;
  TMyVMT = record
    A: array[0..19] of Byte;
    B: VMTTable;
  end;

  ReleasedInstance = class
    procedure RaiseExcept;
    procedure InterfaceError; stdcall;
    procedure Error; virtual;
  end;

  TFieldInfo = class
    OwnerClass: TClass;
    FieldIndex: Integer;

    constructor Create(const TheOwnerClass: TClass; const TheFieldIndex: Integer);
  end;

const
  {+}
  //SizeOf_TMemoryBlockHeader = (SizeOf(TMemoryBlockHeader) + 7) div 8 * 8; // Align SizeOf(TMemoryBlockHeader) to 8
  SizeOf_TMemoryBlockHeader = SizeOf(TMemoryBlockHeader);
  {+.}
  EndOfBlock: Cardinal = $FFFFFFFA;
  Magic: Cardinal = $FFFFFFFF;

var
  FreedInstance: PAnsiChar;
  BadObjectVMT: TMyVMT;
  BadInterfaceVMT: VMTTable;
  GIndex: Integer;

  LastBlock: PMemoryBlockHeader;

  MemCheckActive: Boolean = False;
  {Is MemCheck currently running ?
  ie, is the current memory manager memcheck's ?}
  MemCheckInitialized: Integer = -1;
  {Has InitializeOnce been called ?
  This variable should ONLY be used by InitializeOnce and the finalization}

   {*** arrays for stats ***}
  AllocatedObjectsClasses: array of TClass;
  NbClasses: Integer = 0;

  AllocatedInstances: PIntegersArray = nil; {instances counter}
  AllocStatsCount: Integer = 0;
  StatsArraysAllocatedPos: Integer = 0;
  {This is used to display some statistics about objects allocated. Each time an object is allocated, we look if its
  class name appears in this list. If it does, we increment the counter of class' instances for this class;
  if it does not appear, we had it with a counter set to one.}

  MemoryUsageStats: PIntegersArray = nil; {instances counter}
  MemoryUsageStatsCount: Integer = 0;
  MemoryUsageStatsAllocatedPos: Integer = 0;
  MemoryUsageStatsLoop: Integer = -1;

  SevereExceptionsLogFile: Text;
  {This is the log file for exceptions}

  OutOfMemory: EOutOfMemory;
  // Because when we have to raise this, we do not want to have to instanciate it (as there is no memory available)

  HeapCorrupted: Exception;

  NotDestroyedFields: PIntegersArray = nil;
  NotDestroyedFieldsInfos: PObjectsArray = nil;
  NotDestroyedFieldsCount: Integer = 0;
  NotDestroyedFieldsAllocatedSpace: Integer = 0;

  LastHeapStatus: THeapStatus;

  MaxMemoryUsage: Integer = 0;
  // see KeepMaxMemoryUsage

type
  TMemoryManagerRec = {$IFDEF D10_UP}TMemoryManagerEx{$ELSE}TMemoryManager{$ENDIF};
var
  OldMemoryManager: TMemoryManagerRec;

//Set by the MemChk routine

type
  TIntegerBinaryTree = class
  protected
    fValue: Cardinal;
    fBigger: TIntegerBinaryTree;
    fSmaller: TIntegerBinaryTree;

    class function StoredValue(const Address: Cardinal): Cardinal;
    constructor _Create(const Address: Cardinal);
    function _Has(const Address: Cardinal): Boolean;
    procedure _Add(const Address: Cardinal);
    procedure _Remove(const Address: Cardinal);

  public
    function Has(const Address: Cardinal): Boolean;
    procedure Add(const Address: Cardinal);
    procedure Remove(const Address: Cardinal);

    property Value: Cardinal read fValue;
  end;

  PCardinal = ^Cardinal;

var
  CurrentlyAllocatedBlocksTree: TIntegerBinaryTree;

type
  TAddressToLine = class
  public
    Address: Cardinal;
    Line: Cardinal;

    constructor Create(const AAddress, ALine: Cardinal);
  end;

  PAddressesArray = ^TAddressesArray;
  TAddressesArray = array[0..MaxListSize] of TAddressToLine;

  TUnitDebugInfos = class
  public
    Name: string;
    Addresses: array of TAddressToLine;

    constructor Create(const AName: string; const NbLines: Cardinal);

    function LineNumWhichContainsAddress(const Address: Cardinal): Cardinal;
    function LineWhichContainsAddress(const Address: Cardinal): string;
  end;

  TRoutineDebugInfos = class
  public
    Name: string;
    StartAddress: Cardinal;
    EndAddress: Cardinal;

    constructor Create(const AName: string; const AStartAddress: Cardinal; const ALength: Cardinal);
  end;

var
  Routines: array of TRoutineDebugInfos;
  RoutinesCount: Integer;
  Units: array of TUnitDebugInfos;
  UnitsCount: Integer;
  OutputFileHeader: string = 'MemCheck version ' + MemCheckVersion + #13#10;
  HeapStatusSynchro: TSynchroObject;

{+}
{$IFNDEF D6_UP}
const
  sLineBreak = AnsiString(#13#10);
{$ENDIF}

{$IFDEF USE_JEDI}

{$IFDEF USE_JEDI_DLL}
const
  JclDbgMapOfAddr = 'JclDbgMapOfAddr.dll';

type
  TGetDbgInfoByAddrW = function (const Addr: Pointer; var WFile, WModule, WProc: WideString; var ALine: Integer): Boolean;
  PGetDbgInfoByAddrW = ^TGetDbgInfoByAddrW;

function GetDbgInfoByAddrWNone(const Addr: Pointer; var WFile, WModule, WProc: WideString; var ALine: Integer): Boolean;
begin
  Result := False;
end;

function GetDbgInfoByAddrWFirst(const Addr: Pointer; var WFile, WModule, WProc: WideString; var ALine: Integer): Boolean; forward;

var
  GetDbgInfoByAddrW: TGetDbgInfoByAddrW = GetDbgInfoByAddrWFirst;
  GetDbgInfoByAddrWDynamic: TGetDbgInfoByAddrW;

function GetDbgInfoByAddrWSafe(const Addr: Pointer; var WFile, WModule, WProc: WideString; var ALine: Integer): Boolean;
begin
  try
    Result := GetDbgInfoByAddrWDynamic(Addr, WFile, WModule, WProc, ALine);
  except
    GetDbgInfoByAddrW := GetDbgInfoByAddrWNone;
    Result := False;
  end;
end;

function GetDbgInfoByAddrWFirst(const Addr: Pointer; var WFile, WModule, WProc: WideString; var ALine: Integer): Boolean;
var
  H: Integer;
  P: Pointer;
begin
  Result := False;
  GetDbgInfoByAddrW := GetDbgInfoByAddrWNone;
  H := LoadLibrary(JclDbgMapOfAddr);
  if H <> 0 then
  begin
    P := GetProcAddress(H, 'GetMapOfAddrW');
    if P <> nil then
    begin
      @GetDbgInfoByAddrWDynamic := PGetDbgInfoByAddrW(p);
      @GetDbgInfoByAddrW := @GetDbgInfoByAddrWSafe;
      Result := GetDbgInfoByAddrW(Addr, WFile, WModule, WProc, ALine);
    end;
  end;
end;

function GetDbgInfoByAddrS(const Addr: Pointer; var AFile, AModule, AProc: string; var ALine: Integer): Boolean;
var
  WFile, WModule, WProc: WideString;
begin
  Result := GetDbgInfoByAddrW(Addr, WFile, WModule, WProc, ALine);
  if Result then
  begin
    AFile := WFile;
    AModule := WModule;
    AProc := WProc;
  end;
end;
{$ELSE ~USE_JEDI_DLL}
function GetDbgInfoByAddrS(const Addr: Pointer; var AFile, AModule, AProc: string; var ALine: Integer): Boolean;
begin
  ALine := 0;
  try
    Result := JclDebug.MapOfAddr(Addr, AFile, AModule, AProc, ALine);
  except
    Result := False;
  end;
  if not Result then
  begin
    AFile := '';
    AModule := '';
    AProc := '';
  end;
end;
{$ENDIF USE_JEDI_DLL}
{$ELSE ~USE_JEDI}
function GetDbgInfoByAddrS(const Addr: Pointer; var AFile, AModule, AProc: string; var ALine: Integer): Boolean; forward;
{$ENDIF USE_JEDI}

{+.}

function BlockAllocationAddress(p: Pointer): Pointer;
var
  Block: PMemoryBlockHeader;
begin
  Block := PMemoryBlockHeader(PAnsiChar(p) - SizeOf_TMemoryBlockHeader);
  if Block.MagicNumber = Magic then
    Result := Block.CallerAddress[0]
  else
    Result := nil;
end;

procedure UpdateLastHeapStatus;
begin
  LastHeapStatus := GetHeapStatus;
end;

function HeapStatusesDifferent(const Old, New: THeapStatus): Boolean;
begin
  Result :=
    (Old.TotalAddrSpace <> New.TotalAddrSpace) or
    (Old.TotalUncommitted <> New.TotalUncommitted) or
    (Old.TotalCommitted <> New.TotalCommitted) or
    (Old.TotalAllocated <> New.TotalAllocated) or
    (Old.TotalFree <> New.TotalFree) or
    (Old.FreeSmall <> New.FreeSmall) or
    (Old.FreeBig <> New.FreeBig) or
    (Old.Unused <> New.Unused) or
    (Old.Overhead <> New.Overhead) or
    (Old.HeapErrorCode <> New.HeapErrorCode) or
    (New.TotalUncommitted + New.TotalCommitted <> New.TotalAddrSpace) or
    (New.Unused + New.FreeBig + New.FreeSmall <> New.TotalFree)
end;

class function TIntegerBinaryTree.StoredValue(const Address: Cardinal): Cardinal;
begin
  Result := Address shl 16;
  Result := Result or (Address shr 16);
  Result := Result xor $AAAAAAAA;
end;

constructor TIntegerBinaryTree._Create(const Address: Cardinal);
begin //We do not call inherited Create for optimization
  fValue := Address
end;

function TIntegerBinaryTree.Has(const Address: Cardinal): Boolean;
begin
  Result := _Has(StoredValue(Address));
end;

procedure TIntegerBinaryTree.Add(const Address: Cardinal);
begin
  _Add(StoredValue(Address));
end;

procedure TIntegerBinaryTree.Remove(const Address: Cardinal);
begin
  _Remove(StoredValue(Address));
end;

function TIntegerBinaryTree._Has(const Address: Cardinal): Boolean;
begin
  if fValue = Address then
    Result := True
  else if (Address > fValue) and (fBigger <> nil) then
    Result := fBigger._Has(Address)
  else if (Address < fValue) and (fSmaller <> nil) then
    Result := fSmaller._Has(Address)
  else
    Result := False
end;

procedure TIntegerBinaryTree._Add(const Address: Cardinal);
begin
  Assert(Address <> fValue, 'TIntegerBinaryTree._Add: already in !');

  if (Address > fValue) then
  begin
    if fBigger <> nil then
      fBigger._Add(Address)
    else
      fBigger := TIntegerBinaryTree._Create(Address)
  end
  else
  begin
    if fSmaller <> nil then
      fSmaller._Add(Address)
    else
      fSmaller := TIntegerBinaryTree._Create(Address)
  end
end;

procedure TIntegerBinaryTree._Remove(const Address: Cardinal);
var
  Owner, Node: TIntegerBinaryTree;
  NodeIsOwnersBigger: Boolean;
  Middle, MiddleOwner: TIntegerBinaryTree;
begin
  Owner := nil;
  Node := CurrentlyAllocatedBlocksTree;

  while (Node <> nil) and (Node.fValue <> Address) do
  begin
    Owner := Node;

    if Address > Node.Value then
      Node := Node.fBigger
    else
      Node := Node.fSmaller
  end;

  Assert(Node <> nil, 'TIntegerBinaryTree._Remove: not in');

  NodeIsOwnersBigger := Node = Owner.fBigger;

  if Node.fBigger = nil then
  begin
    if NodeIsOwnersBigger then
      Owner.fBigger := Node.fSmaller
    else
      Owner.fSmaller := Node.fSmaller;
  end
  else if Node.fSmaller = nil then
  begin
    if NodeIsOwnersBigger then
      Owner.fBigger := Node.fBigger
    else
      Owner.fSmaller := Node.fBigger;
  end
  else
  begin
    Middle := Node.fSmaller;
    MiddleOwner := Node;

    while Middle.fBigger <> nil do
    begin
      MiddleOwner := Middle;
      Middle := Middle.fBigger;
    end;

    if Middle = Node.fSmaller then
    begin
      if NodeIsOwnersBigger then
        Owner.fBigger := Middle
      else
        Owner.fSmaller := Middle;

      Middle.fBigger := Node.fBigger
    end
    else
    begin
      MiddleOwner.fBigger := Middle.fSmaller;

      Middle.fSmaller := Node.fSmaller;
      Middle.fBigger := Node.fBigger;

      if NodeIsOwnersBigger then
        Owner.fBigger := Middle
      else
        Owner.fSmaller := Middle
    end;
  end;

  Node.Destroy;
end;

constructor TFieldInfo.Create(const TheOwnerClass: TClass; const TheFieldIndex: Integer);
begin
  inherited Create;

  OwnerClass := TheOwnerClass;
  FieldIndex := TheFieldIndex;
end;

const
  TObjectVirtualMethodNames: array[1..8] of string = ('SafeCallException', 'AfterConstruction',
    'BeforeDestruction', 'Dispatch', 'DefaultHandler', 'NewInstance', 'FreeInstance', 'Destroy');
  AddressOfNewInstance: Pointer = @TObject.NewInstance;
  AddressOfTObjectCreate: Pointer = @TObject.Create;

var
  CallerIsNewInstanceDetected: Integer = -1;
  {$IFDEF D7_ONLY}
  _compiler_delphi_71: Boolean = True;
  {$ENDIF}

function CallerOfCaller: Pointer; //with stack frames !
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  mov eax, [EBP]
  cmp eax, ebp
  jb @@EndOfStack
  mov eax, [eax + 4]
  sub eax, 4
  ret
  @@EndOfStack:
  mov eax, $FFFF
end;

function Caller: Pointer; //with stack frame !
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  mov eax, [ebp + 4]
  sub eax, 4
  ret
  @@EndOfStack:
  mov eax, $FFFF
end;

function CallerOfGetMem: Pointer; //System._GetMem has no stack frame
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  {$IFDEF BDS}
    // BDS 2005, 2006; RAD Studio 2007, 2009
    mov eax, [ebp + 8]
  {$ELSE}
    {$IFDEF D7_UP}
  cmp _compiler_delphi_71, 0
  je @D70
  // Delphi 7.1
  mov eax, [ebp + 16]
  jmp @D7F
  @D70:
    // Delphi 7.0
  mov eax, [ebp + 12]
  @D7F:
    {$ELSE}
      {$IFDEF D6_UP}
  // Delphi 6
  mov eax, [ebp + 12]
      {$ELSE}
  // Delphi 5
  mov eax, [ebp + 8]
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  ret
  @@EndOfStack:
  mov eax, $FFFF
end;

{+}

function CallerOfReallocMem({ebp:}Caller: Cardinal): Pointer; //System._ReallocMem has no stack frame
begin
  if Caller <> 0 then
    Result := Pointer(PCardinal(Caller+12)^-4)
  else // this can happen when there are no stack frames
    Result := Pointer($FFFF);
end;

//function CallerOfReallocMem: Pointer; //System._ReallocMem has no stack frame
//asm
//  cmp ebp, 0  //this can happen when there are no stack frames
//  je @@EndOfStack
//  mov eax, [EBP + 12] // Debug: Pointer(PInteger(ebp+12)^-4)
//  sub eax, 4
//  ret
//  @@EndOfStack:
//  mov eax, $FFFF
//end;

{+.}

{$IFNDEF D6_UP}

function CallerIsNewAnsiString: Boolean; //NewAnsiString has no stack frame
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@no
  mov eax, [ebp + 8]
  sub eax, 13
  cmp eax, offset System.@NewAnsiString
  je @@yes
  @@no:
  mov eax, 0
  ret
  @@yes:
  mov eax, 1
end;
{$ENDIF}

function CallerIsNewInstance: Boolean; //TObject.NewInstance has no stack frame
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@no
  {$IFDEF BDS}
    {$IFDEF D10_UP}
  // BDS 2006; RAD Studio 2007, 2009
  mov eax, [ebp + 8]
  sub eax, 15 // = PInteger(ebp+8)^-Integer(AddressOfNewInstance)
    {$ELSE}
  // BDS 2005
  mov eax, [ebp + 12]
  sub eax, 15 // = PInteger(ebp+12)^-Integer(AddressOfNewInstance)
    {$ENDIF}
  {$ELSE}
    {$IFDEF D7_UP}
  cmp _compiler_delphi_71, 0
  je @D70
  // Delphi 7.1
  mov eax, [ebp + 16]
  sub eax, 15 // = PInteger(ebp+16)^-Integer(AddressOfNewInstance)
  jmp @D7F
  @D70:
  // Delphi 7.0
  mov eax, [ebp + 12]
  sub eax, 15 // = PInteger(ebp+12)^-Integer(AddressOfNewInstance)
  @D7F:
    {$ELSE}
      {$IFDEF D6_UP}
  // Delphi 6
  mov eax, [ebp + 12]
  sub eax, 15 // = PInteger(ebp+12)^-Integer(AddressOfNewInstance)
      {$ELSE}
  // Delphi 5
  mov eax, [ebp + 8]
  sub eax, 9 // = PInteger(ebp+8)^-Integer(AddressOfNewInstance)
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  cmp eax, AddressOfNewInstance
  je @@yes
  @@no:
  mov eax, 0
  ret
  @@yes:
  mov eax, 1
end;

{$IFDEF D6_UP}

function ltfm_CallerOfFreeInstance: Pointer;
  //Tells the address of the caller of FreeInstance from LeakTrackingFreeMem
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  mov eax, [EBP + 28]
  sub eax, 4
  ret
  @@EndOfStack:
  mov eax, $FFFF
end;

function ltfm_CallerOf_FreeMem: Pointer;
  //Tells the address of the caller of System._FreeMem from LeakTrackingFreeMem
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  mov eax, [EBP + 12]
  sub eax, 4
  ret
  @@EndOfStack:
  mov eax, $FFFF
end;

function ltgmCallerOfGetMemIsTObjectCreate: Boolean;
  //Tells if the guy who called GetMem is TObject.Create
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  {$IFDEF BDS}
  // BDS 2005, 2006; RAD Studio 2007, 2009
  mov eax, [ebp + 32]
  {$ELSE}
    {$IFDEF D7_UP}
  cmp _compiler_delphi_71, 0
  je @D70
  // Delphi 7.1
  mov eax, [ebp + 36]
  jmp @D7F
  @D70:
  // Delphi 7.0
  mov eax, [ebp + 40]
  @D7F:
    {$ELSE}
  // Delphi 5, 6
  mov eax, [ebp + 40]
    {$ENDIF}
  {$ENDIF}
  sub eax, 12
  cmp eax, AddressOfTObjectCreate
  jne @@no
  mov eax, 1
  ret
  @@no:
  @@EndOfStack:
  mov eax, 0
end;

function ltgmCallerOfTObjectCreate: Pointer;
  //Tells who called TObject.Create
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@EndOfStack
  {$IFDEF BDS}
  // BDS 2005, 2006; RAD Studio 2007, 2009
  mov eax, [EBP + 52]
  {$ELSE}
    {$IFDEF D7_UP}
  cmp _compiler_delphi_71, 0
  je @D70
  // Delphi 7.1
  mov eax, [EBP + 56]
  jmp @D7F
  @D70:
  // Delphi 7.0
  mov eax, [EBP + 60]
  @D7F:
    {$ELSE}
  // Delphi 5, 6
  mov eax, [EBP + 60]
    {$ENDIF}
  {$ENDIF}
  ret
  @@EndOfStack:
  mov eax, $FFFF
end;

function ltgmCallerIsNewAnsiString: Boolean;
  //Tells if the guy who called GetMem is NewAnsiString
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@no
  {$IFDEF BDS}
    // BDS 2005, 2006; RAD Studio 2007, 2009
    mov eax, [EBP + 8] // Debug: PInteger(ebp+8)^
  {$ELSE}
    {$IFDEF D7_UP}
  cmp _compiler_delphi_71, 0
  je @D70
  // Delphi 7.1
  mov eax, [EBP + 12]
  jmp @D7F
  @D70:
  // Delphi 7.0
  mov eax, [EBP + 16]
  @D7F:
    {$ELSE}
  // Delphi 5, 6
  mov eax, [EBP + 16]
    {$ENDIF}
  {$ENDIF}
  sub eax, 17
  cmp eax, offset System.@NewAnsiString
  je @@yes
  @@no:
  mov eax, 0
  ret
  @@yes:
  mov eax, 1
end;

function CallerIsDynamicArrayAllocation: Boolean;
asm
  cmp ebp, 0  //this can happen when there are no stack frames
  je @@no
  mov eax, [EBP + 12]
  {$IFDEF BDS}
    // BDS 2005, 2006; RAD Studio 2007, 2009
    add eax, 205
  {$ELSE}
    {$IFDEF D7_UP}
  cmp _compiler_delphi_71, 0
  je @D70
  // Delphi 7.1
  add eax, 204
  jmp @D7F
  @D70:
  // Delphi 7.0
  add eax, 216
  @D7F:
    {$ELSE}
  // Delphi 5, 6
  add eax, 216
    {$ENDIF}
  {$ENDIF}
  cmp eax, offset System.@DynArraySetLength
  je @@yes
  @@no:
  mov eax, 0
  ret
  @@yes:
  mov eax, 1
end;
{$ENDIF D6_UP}

procedure ReleasedInstance.RaiseExcept;
var
  Block: PMemoryBlockHeader;
  t: TMemoryBlockHeader;
  i: Integer;
  FeedBackStr: string;
begin
  Block := PMemoryBlockHeader((PAnsiChar(Self) - SizeOf_TMemoryBlockHeader));
  t := Block^;
  try
    i := MaxNbSupportedVMTEntries - GIndex + 1;
    if i in [1..8] then
      FeedBackStr := 'Call ' + TObjectVirtualMethodNames[i]
    else
      FeedBackStr := 'Call ' + IntToStr(i) + '° virtual method';
    FeedBackStr := FeedBackStr + ' on a FREED instance of ' + t.VMT.ClassName + ' (destroyed at ' +
      TextualDebugInfoForAddress(Cardinal(t.DestructionAdress)) + ' - had been created at ' +
      TextualDebugInfoForAddress(Cardinal(t.CallerAddress[0])) + ')';
    raise EBadInstance.Create(FeedBackStr)at Caller;
  except
    on EBadInstance do
      ;
  end;
  if ShowCallStack then
    for i := 1 to StoredCallStackDepth do
      if Integer(t.CallerAddress[i]) > 0 then
      try
        raise EStackUnwinding.Create('Unwinding level ' + Chr(Ord('0') + i))at t.CallerAddress[i]
      except
        on EStackUnwinding do
          ;
      end;
  ShowCallStack := False;
end;

function InterfaceErrorCaller: Pointer;
{Returns EBP + 16, which is OK only for InterfaceError !
It would be nice to make this routine local to InterfaceError, but I do not know hot to
implement it in this case - VM}
asm
    cmp ebp, 0  //this can happen when there are no stack frames
    je @@EndOfStack
    mov  eax,[EBP+16];
    sub  eax, 5
    ret
    @@EndOfStack:
    mov eax, $FFFF
end;

procedure ReleasedInstance.InterfaceError;
begin
  try
    OutputFileHeader := OutputFileHeader + #13#10'Exception: Calling an interface method on an freed Pascal instance @ '
      + TextualDebugInfoForAddress(Cardinal(InterfaceErrorCaller)) + #13#10;
    raise EInterfaceFreedInstance.Create('Calling an interface method on an freed Pascal instance')at
      InterfaceErrorCaller
  except
    on EInterfaceFreedInstance do
      ;
  end;
end;

procedure ReleasedInstance.Error;
{Don't change this, its a Hack! jm}
asm
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);Inc(GIndex);
    JMP ReleasedInstance.RaiseExcept;
end;

function MemoryBlockDump(Block: PMemoryBlockHeader): string;
const
  MaxDump = 80;
var
  i, Count: Integer;
  S: string[MaxDump];
begin
  Count := Block.AllocatedSize;

  if Count > MaxDump then
    Count := MaxDump;

  Byte(S[0]) := Count;
  Move((PAnsiChar(Block) + SizeOf_TMemoryBlockHeader)^, S[1], Count);

  for i := 1 to Length(S) do
    if S[i] = #0 then
      S[i] := '.'
    else if S[i] < ' ' then
      S[i] := '?';

  Result := string('  Dump: [' + S + ']');
end;

function DumpMemory(P: Pointer; iSize: LongInt = 4): string;
var
  i: Integer;
  B: Byte;
begin
  Result := '';
  if iSize = 0 then
    Exit;
  i := 1;
  Result := '$ | ';
  while iSize > 0 do
  begin
    B := PByte(P)^;
    Result := Result + IntToHex(B, 2);
    if (i mod 8) = 0 then
      Result := Result + ' | '
    else if (i mod 4) = 0 then
      Result := Result + ' ';
    if (i mod 16) = 0 then
      Result := Result + sLineBreak + '$ | ';
    Inc(Integer(P));
    inc(i);
    dec(iSize);
  end;
end;

procedure FillCallStack(var St: TCallStack; const NbLevelsToExclude: Integer);
  {Works only with stack frames - Without, St contains correct info, but is not as deep as it should
  I just don't know a general rule for walking the stack when they are not there}
var
  StackStart: Pointer;
  StackMax: Pointer; //the stack can never go beyond - http://msdn.microsoft.com/library/periodic/period96/S2CE.htm
  CurrentFrame: Pointer;
  Count, SkipCount: Integer;
  CurAddr: Pointer;
begin
  FillChar(St, SizeOf(St), 0);
  asm
    mov EAX, FS:[4]
    mov StackMax, EAX

    mov StackStart, EBP
  end;
  CurrentFrame := StackStart;
  Count := 0;
  SkipCount := 0;
  while (LongInt(CurrentFrame) >= LongInt(StackStart)) and (LongInt(CurrentFrame) < LongInt(StackMax))
    and (Count <= StoredCallStackDepth) do
  begin
    if SkipCount >= NbLevelsToExclude then
    begin
      CurAddr := Pointer(PInteger(LongInt(CurrentFrame) + 4)^ - 4);
      St[Count] := CurAddr;
      Count := Count + 1;
    end;

    CurrentFrame := Pointer(PInteger(CurrentFrame)^);
    SkipCount := SkipCount + 1;
  end;
end;

procedure AddAllocatedObjectsClass(const C: TClass);
begin
  if NbClasses >= Length(AllocatedObjectsClasses) then
  begin
    MemCheckActive := False;
    try
      SetLength(AllocatedObjectsClasses, NbClasses * 2);
    finally
      MemCheckActive := True;
    end;
  end;

  AllocatedObjectsClasses[NbClasses] := C;
  NbClasses := NbClasses + 1;
end;

procedure CollectNewInstanceOfClassForStats(const TheClass: TClass);
var
  i: Integer;
begin
  i := 0;
  while (i < AllocStatsCount) and (AllocatedObjectsClasses[i] <> TheClass) do
    i := i + 1;

  if i = AllocStatsCount then
  begin
    if AllocStatsCount = StatsArraysAllocatedPos then
    begin
      if StatsArraysAllocatedPos = 0 then
        StatsArraysAllocatedPos := 10;
      StatsArraysAllocatedPos := StatsArraysAllocatedPos * 2;
      MemCheckActive := False;
      try
        ReAllocMem(AllocatedInstances, StatsArraysAllocatedPos * SizeOf(Integer));
      finally
        MemCheckActive := True;
      end;
    end;

    AddAllocatedObjectsClass(TheClass);
    AllocatedInstances[AllocStatsCount] := 1;
    AllocStatsCount := AllocStatsCount + 1;
  end
  else
    AllocatedInstances[i] := AllocatedInstances[i] + 1;
end;

var
  LinkedListSynchro: TSynchroObject;

procedure AddBlockAtEndOfLinkedList(const B: PMemoryBlockHeader);
begin
  LinkedListSynchro.Acquire;
  PMemoryBlockHeader(B).PreceedingBlock := LastBlock;
  PMemoryBlockHeader(B).NextBlock := nil;
  if LastBlock <> nil then
    LastBlock.NextBlock := B;
  LastBlock := B;
  LinkedListSynchro.Release;
end;

procedure RemoveBlockFromLinkedList(const B: PMemoryBlockHeader);
begin
  LinkedListSynchro.Acquire;
  if B.NextBlock <> nil then
    PMemoryBlockHeader(B.NextBlock).PreceedingBlock := B.PreceedingBlock;
  if B.PreceedingBlock <> nil then
    PMemoryBlockHeader(B.PreceedingBlock).NextBlock := B.NextBlock;
  if LastBlock = B then
    LastBlock := B.PreceedingBlock;
  LinkedListSynchro.Release;
end;

{+}
type
  TSortedList = class(TList)
  protected
    function InternalFindItem(AClassInfo: Integer; var Index: Integer): Boolean;
  end;

function TSortedList.InternalFindItem(AClassInfo: Integer; var Index: Integer): Boolean;
var
  L, H, i, C: Integer;
begin
  Result := False;
  L := 0;
  H := Count - 1;
  while L <= H do
  begin
    i := (L + H) shr 1;
    C := Integer(List^[i]);
    if C < AClassInfo then
      L := i + 1
    else
    begin
      H := i - 1;
      if C = AClassInfo then
      begin
        Result := True;
        L := i;
      end;
    end;
  end;
  Index := L;
end;

var
  vIgnoredClassList: TSortedList;

procedure MemCheckIgnoredClassAdd(AClassInfo: TClass);
var
  C, Index: Integer;
begin
  if vIgnoredClassList = nil then
    vIgnoredClassList := TSortedList.Create;
  C := Integer(AClassInfo);
  with vIgnoredClassList do
  begin
    if not InternalFindItem(C, Index) then
      Insert(Index, Pointer(C));
  end;
end;

procedure MemCheckIgnoredClassRemove(AClassInfo: TClass);
var
  C, Index: Integer;
begin
  if vIgnoredClassList = nil then
    Exit;
  C := Integer(AClassInfo);
  with vIgnoredClassList do
    if InternalFindItem(C, Index) then
      Delete(Index);
end;

function MemCheckIsIgnoredClass(AClassInfo: TClass): Boolean;
var
  Index: Integer;
begin
  if vIgnoredClassList <> nil then
    Result := vIgnoredClassList.InternalFindItem(Integer(AClassInfo), Index)
  else
    Result := False;
end;
{+.}

{
var
  TLeakInitObject_NewInstance: Boolean;

type
  TLeakInitObject = class
  public
    class function NewInstance: TObject; override;
  end;

class function TLeakInitObject.NewInstance: TObject;
begin
  TLeakInitObject_NewInstance := True;
  Result := inherited NewInstance;
  TLeakInitObject_NewInstance := False;
end;
{}

function LeakTrackingGetMemInit(Size: Integer): Pointer;
var
  DX_EBP: DWORD;
begin
  Result := OldMemoryManager.GetMem(Size);

  if (CallerIsNewInstanceDetected >= 0) {or (not TLeakInitObject_NewInstance)} then
    Exit;
  CallerIsNewInstanceDetected := 0;

  // magic code for "Delphi Release Library"
  asm
    mov DX_EBP, ebp
  end;

  {$IFDEF D7_ONLY}
  _compiler_delphi_71 := True;
  {$ENDIF}

  if not CallerIsNewInstance then
  begin
    {$IFDEF D7_ONLY}
    _compiler_delphi_71 := False;
    if CallerIsNewInstance then
    begin
      CallerIsNewInstanceDetected := 1;
     {$IFDEF DEBUG}
      OutputDebugString('MemCheck: DELPHI_70_MODE');
      {$ENDIF}
    end;
    {$ENDIF}
  end
  else
    CallerIsNewInstanceDetected := 1;
end;

var
  MemCheck_LeakTransaction: Cardinal = 0;

function LeakTrackingGetMem(Size: Integer): Pointer;
var
  vClassInfo: TClass;
  Block: PMemoryBlockHeader;
begin
  if not MemCheckActive then
  begin
    Result := OldMemoryManager.GetMem(Size);
    Exit;
  end;
{$IFDEF D6_UP}
  if ltgmCallerIsNewAnsiString or CallerIsDynamicArrayAllocation then
{$ELSE}
  if CallerIsNewAnsiString then
{$ENDIF}
  //We do not log memory allocations for reference counted strings. This would take time and some leaks would be reported     uselessly. However, if you want to know about this, you can just uncomment this part
  //Same for dynamic arrays in Delphi 6 & 7
  begin
    Result := OldMemoryManager.GetMem(Size);
    if Result = nil then
      raise OutOfMemory;
  end
  else
  begin
    if {+}(CallerIsNewInstanceDetected > 0) and {+.} CallerIsNewInstance then
    begin
      vClassInfo := nil;
      {$IFDEF BDS} // BDS 2005 Up:
      asm
        mov vClassInfo, ebx // Debug: TClass(ebx)
      end;
      {$ELSE}
      {+}
      asm
        {$IFDEF D6_UP}
          {$IFDEF D7_UP}
        cmp _compiler_delphi_71, 0
        je @D70
        // Delphi 7.1
        mov eax, [ebp+12]
        mov vClassInfo, eax // Debug: D7: TClass(PPointer(ebp+12)^)
        jmp @D7F
        @D70:
        // Delphi 7.0
        mov vClassInfo, ebx // Debug: D7: TClass(ebx)
        @D7F:
          {$ELSE}
        mov eax, [ebp+8]
        mov vClassInfo, eax // Debug: D6: TClass(PPointer(ebp+8)^)
          {$ENDIF}
        {$ELSE}
        mov eax, [ebp+12]
        mov vClassInfo, eax // Debug: D5: TClass(PPointer(ebp+12)^)
        {$ENDIF}
      end;
      {$ENDIF}
      {+.}
      Result := OldMemoryManager.GetMem(Size + SizeOf_TMemoryBlockHeader);
      {+}
      FillChar(Result^, (Size + (SizeOf_TMemoryBlockHeader)), 0);
      {+.}
      if Result = nil then
        raise OutOfMemory;

      {+}
      Block := PMemoryBlockHeader(Result);

      Block.KindOfBlock := MClass;
      if not MemCheckIsIgnoredClass(vClassInfo) then
        Block.IgnoreTrace := 0
      else
        Block.IgnoreTrace := 1;
      {+.}

      if (StoredCallStackDepth > 0) {+} and (Block.IgnoreTrace = 0) {+.} then
      begin
        {$IFDEF D6_UP}
        if ltgmCallerOfGetMemIsTObjectCreate then
        begin
          FillCallStack(Block.CallerAddress, 1);
          Block.CallerAddress[0] := ltgmCallerOfTObjectCreate;
        end
        else
        {$ENDIF}
          FillCallStack(Block.CallerAddress, 2);
      end
    end
    else { if not CallerIsNewInstance then }
    begin //Neither an object nor a string, this is a MUser
      Result := OldMemoryManager.GetMem(Size + SizeOf_TMemoryBlockHeader + SizeOf(TMemoryBlockFooter));
      if Result = nil then
        raise OutOfMemory;
      Block := PMemoryBlockHeader(Result);
      Block.KindOfBlock := MUser;
      {+}
      Block.IgnoreTrace := 0;
      {+.}
      if StoredCallStackDepth > 0 then
        FillCallStack(Block.CallerAddress, 1);
      Block.CallerAddress[0] := CallerOfGetMem;
      PMemoryBlockFooter(PAnsiChar(Result) + SizeOf_TMemoryBlockHeader + Size)^ := EndOfBlock;
    end;
    AddBlockAtEndOfLinkedList(Result);
    {+}
    Block.LeakTransaction := MemCheck_LeakTransaction;
    {+.}
    Block.LastTimeStamp := TimeStampsCount - 1;
    Block.DestructionAdress := nil;
    Block.AllocatedSize := Size;
    Block.MagicNumber := Magic;
    if IdentifyObjectFields then
    begin
      MemCheckActive := False;
      try
        CurrentlyAllocatedBlocksTree.Add(Integer(Result));
      finally
        MemCheckActive := True;
      end;
    end;
    Inc(Integer(Result), SizeOf_TMemoryBlockHeader);
    if ComputeMemoryUsageStats then
    begin
      MemoryUsageStatsLoop := MemoryUsageStatsLoop + 1;
      if MemoryUsageStatsLoop = MemoryUsageStatsStep then
        MemoryUsageStatsLoop := 0;
      if (MemoryUsageStatsLoop = 0) or (Size > StatCollectionForce) then
      begin
        if MemoryUsageStatsCount = MemoryUsageStatsAllocatedPos then
        begin
          if MemoryUsageStatsAllocatedPos = 0 then
            MemoryUsageStatsAllocatedPos := 10;
          MemoryUsageStatsAllocatedPos := MemoryUsageStatsAllocatedPos * 2;
          MemCheckActive := False;
          try
            ReAllocMem(MemoryUsageStats, MemoryUsageStatsAllocatedPos * SizeOf(Integer));
          finally
            MemCheckActive := True;
          end;
        end;
        MemoryUsageStats[MemoryUsageStatsCount] := AllocMemSize;
        MemoryUsageStatsCount := MemoryUsageStatsCount + 1;
      end;
    end;
    if KeepMaxMemoryUsage and (AllocMemSize > MaxMemoryUsage) then
      MaxMemoryUsage := AllocMemSize;
  end;
end;

function HeapCheckingGetMem(Size: Integer): Pointer;
begin
  if not MemCheckActive then
  begin
    Result := OldMemoryManager.GetMem(Size);
    Exit;
  end;
  HeapStatusSynchro.Acquire;
  Result := nil; //Note: I don't understand right now why I get a warning if I suppress this line
  try
    if HeapStatusesDifferent(LastHeapStatus, GetHeapStatus) then
      raise HeapCorrupted;
    Result := OldMemoryManager.GetMem(Size);
    UpdateLastHeapStatus;
  finally
    HeapStatusSynchro.Release;
  end;
end;

function MemoryBlockFreed(Block: PMemoryBlockHeader): Boolean;
begin
  Result := Block.DestructionAdress <> nil;
end;

function MemoryBlockOverwritten(Block: PMemoryBlockHeader): Boolean;
begin
  if (Block.KindOfBlock = MClass) then
    Result := False //We don't put a footer for objects - This could be done if interesting
  else
    Result := PMemoryBlockFooter(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader + Block.AllocatedSize)^ <> EndOfBlock;
end;

function MemCheckBlockCorrupted(Block: PMemoryBlockHeader): Boolean;
begin
  Result := MemoryBlockFreed(Block) or MemoryBlockOverwritten(Block);
end;

function MemoryBlockCorrupted(p: Pointer): Boolean;
var
  Block: PMemoryBlockHeader;
begin
  if PCardinal(PAnsiChar(p) - 4)^ = Magic then
  begin
    Block := PMemoryBlockHeader(PAnsiChar(p) - SizeOf_TMemoryBlockHeader);
    Result := MemCheckBlockCorrupted(Block);
  end
  else
    Result := False
end;

procedure ReplaceInterfacesWithBadInterface(AClass: TClass; Instance: Pointer);
{copied and modified from System.Pas: replaces all INTERFACES in Pascal Objects
with a reference to our dummy INTERFACE VMT}
asm
        PUSH  EBX
        PUSH  ESI
        PUSH  EDI
        MOV  EBX,EAX
        MOV  EAX,EDX
        MOV  EDX,ESP
    @@0:  MOV  ECX,[EBX].vmtIntfTable
        TEST  ECX,ECX
        JE    @@1
        PUSH  ECX
    @@1:  MOV  EBX,[EBX].vmtParent
        TEST  EBX,EBX
        JE    @@2
        MOV  EBX,[EBX]
        JMP  @@0
    @@2:  CMP  ESP,EDX
        JE    @@5
    @@3:  POP  EBX
        MOV  ECX,[EBX].TInterfaceTable.EntryCount
        ADD  EBX,4
    @@4:  LEA  ESI, BadInterfaceVMT // mettre dans ESI l'adresse du début de MyInterfaceVMT: correct ?????
        MOV  EDI,[EBX].TInterfaceEntry.IOffset
        MOV  [EAX+EDI],ESI
        ADD  EBX,TYPE TInterfaceEntry
        DEC  ECX
        JNE  @@4
        CMP  ESP,EDX
        JNE  @@3
    @@5:  POP  EDI
        POP  ESI
        POP  EBX
end;

function FindMem(Base, ToFind: Pointer; Nb: Integer): Integer;
// Base = instance, Nb = nombre de bloc (HORS VMT!)
asm
      // eax=base; edx=Tofind; ecx=Nb
      @loop:
      cmp [eax+ecx*4], edx
      je @found
      dec ecx
      jne  @loop

      @found:
      mov eax,ecx
end;

procedure AddFieldInfo(const FieldAddress: Pointer; const OwnerClass: TClass; const FieldPos: Integer);
begin
  MemCheckActive := False;
  try
    if NotDestroyedFieldsCount = NotDestroyedFieldsAllocatedSpace then
    begin
      if NotDestroyedFieldsAllocatedSpace = 0 then
        NotDestroyedFieldsAllocatedSpace := 10;
      NotDestroyedFieldsAllocatedSpace := NotDestroyedFieldsAllocatedSpace * 2;
      ReAllocMem(NotDestroyedFields, NotDestroyedFieldsAllocatedSpace * SizeOf(Integer));
      ReAllocMem(NotDestroyedFieldsInfos, NotDestroyedFieldsAllocatedSpace * SizeOf(Integer));
    end;

    NotDestroyedFields[NotDestroyedFieldsCount] := Integer(FieldAddress);
    NotDestroyedFieldsInfos[NotDestroyedFieldsCount] := TFieldInfo.Create(OwnerClass, FieldPos);
    NotDestroyedFieldsCount := NotDestroyedFieldsCount + 1;
  finally
    MemCheckActive := True;
  end;
end;

function LeakTrackingFreeMem(p: Pointer): Integer;
var
  Block: PMemoryBlockHeader;
  i: Integer;
  MemCheckActiveSave: Boolean;
begin
  //if not MemCheckActive then
  //begin
  //  Result := OldMemoryManager.FreeMem(p);
  //  Exit;
  //end;
  if PCardinal(PAnsiChar(p) - 4)^ = Magic then
  {we recognize a block we marked}
  begin
    Block := PMemoryBlockHeader(PAnsiChar(p) - SizeOf_TMemoryBlockHeader);

    if CollectStatsAboutObjectAllocation and (Block.KindOfBlock = MClass) then
      CollectNewInstanceOfClassForStats(TObject(p).ClassType);

    if IdentifyObjectFields then
    begin
      if (Block.KindOfBlock = MClass) and
        (TObject(p).InheritsFrom(IdentifyFieldsOfObjectsConformantTo)) then
      begin
        for i := 1 to (Block.AllocatedSize div 4) - 1 do
          if (PInteger(PAnsiChar(p) + i * 4)^ > SizeOf_TMemoryBlockHeader) and
            CurrentlyAllocatedBlocksTree.Has(PInteger(PAnsiChar(p) + i * 4)^ - SizeOf_TMemoryBlockHeader) then
          begin
            AddFieldInfo(Pointer(PInteger(PAnsiChar(p) + i * 4)^ - SizeOf_TMemoryBlockHeader), TObject(p).ClassType, i);
          end;
      end;
      asm // Remove compiler warning
        mov MemCheckActiveSave, 0
      end;
      MemCheckActiveSave := MemCheckActive;
      MemCheckActive := False;
      try
        if not MemoryBlockFreed(Block) then
        begin
          Assert(CurrentlyAllocatedBlocksTree.Has(Integer(Block)), 'freemem: block not among allocated ones');
          CurrentlyAllocatedBlocksTree.Remove(Integer(Block));
        end;
      finally
        MemCheckActive := MemCheckActiveSave;
      end;
    end;

    if MemoryBlockFreed(Block) then
    begin
      try
        OutputFileHeader := OutputFileHeader + #13#10'Exception: second release of block attempt, allocated at ' +
          TextualDebugInfoForAddress(Cardinal(Block.CallerAddress[0])) + ' - Already freed at ' +
          TextualDebugInfoForAddress(Cardinal(Block.DestructionAdress)) + #13#10;
        raise EMemoryLeak.Create('second release of block attempt, already freed') at Block.DestructionAdress;
      except
        on EMemoryLeak do
          ;
      end;

      if ShowCallStack then
        for i := 1 to StoredCallStackDepth do
          if Integer(Block.CallerAddress[i]) > 0 then
          try
            raise EStackUnwinding.Create('Unwinding level ' + Chr(Ord('0') + i))at Block.CallerAddress[i]
          except
            on EStackUnwinding do
              ;
          end;

      ShowCallStack := False;
    end
    else
    begin
      if MemoryBlockOverwritten(Block) then
      begin
        try
          OutputFileHeader := OutputFileHeader +
            #13#10'Exception: memory damaged beyond block allocated space, allocated at ' +
            TextualDebugInfoForAddress(Cardinal(BlockAllocationAddress(p))) + #13#10;
          raise EMemoryLeak.Create('memory damaged beyond block allocated space, allocated at ' +
            TextualDebugInfoForAddress(Cardinal(BlockAllocationAddress(p))))at CallerOfCaller;
        except
          on EMemoryLeak do
            ;
        end;
      end;

      if (Block.AllocatedSize > DeallocateFreedMemoryWhenBlockBiggerThan) or
        (DeallocateInstancesConformingTo and (Block.KindOfBlock = MClass) and
        (TObject(p) is InstancesConformingToForDeallocation)) then
      begin {we really deallocate the block}
        RemoveBlockFromLinkedList(Block);
        OldMemoryManager.FreeMem(Block);
      end
      else
      begin //Normal case, not an error
{$IFDEF D6_UP}
        if Block.KindOfBlock = MClass then
          Block.DestructionAdress := ltfm_CallerOfFreeInstance
        else
          Block.DestructionAdress := ltfm_CallerOf_FreeMem;
{$ELSE}
        Block.DestructionAdress := CallerOfCaller;
{$ENDIF}

        if WipeOutMemoryOnFreeMem then
          if Block.KindOfBlock = MClass then
          begin
            Block.VMT := TObject(p).ClassType;
            FillChar((PAnsiChar(p) + 4)^, Block.AllocatedSize - 4, CharToUseToWipeOut);
            PInteger(p)^ := Integer(FreedInstance);
            if DanglingInterfacesVerified then
              ReplaceInterfacesWithBadInterface(Block.VMT, TObject(p))
          end
          else
            FillChar(p^, Block.AllocatedSize, CharToUseToWipeOut);
      end;
    end;

    Result := 0;
  end
  else
    Result := OldMemoryManager.FreeMem(p);
end;

function HeapCheckingFreeMem(p: Pointer): Integer;
begin
  if HeapStatusesDifferent(LastHeapStatus, GetHeapStatus) then
    raise HeapCorrupted;

  Result := OldMemoryManager.FreeMem(p);

  UpdateLastHeapStatus;
end;

{$UNDEF ALT_TRACKING_REALLOKMEM}
{.$DEFINE ALT_TRACKING_REALLOKMEM} { Optional } // todo: Not work when no stack frames. ???????????????

{$IFDEF ALT_TRACKING_REALLOKMEM}
function LeakTrackingReallocMemCaller(p: Pointer; Size: Integer; Caller: Cardinal): Pointer;
{$ELSE}
  {$UNDEF _OPTIMIZATION_}
  {$IFOPT O+}
    {$DEFINE _OPTIMIZATION_}
    {$O-} // required for calculation Caller (ebp)
  {$ENDIF}
function LeakTrackingReallocMem(p: Pointer; Size: Integer): Pointer;
{$ENDIF}
var
  Block: PMemoryBlockHeader;
  {$IFNDEF ALT_TRACKING_REALLOKMEM}
  Caller: Cardinal;
  {$ENDIF}
begin
  if PCardinal(PAnsiChar(p) - 4)^ = Magic then
  begin
    GetMem(Result, Size);
    {+}
    if MemCheckActive then
    {+.}
    begin
      Block := PMemoryBlockHeader(PAnsiChar(Result) - SizeOf_TMemoryBlockHeader);
      if StoredCallStackDepth > 0 then
        FillCallStack(Block.CallerAddress, 1);
      {$IFNDEF ALT_TRACKING_REALLOKMEM}
      asm
        mov Caller, ebp // required disabled code optimization $O- for it procedure
      end;
      {$ENDIF}
      Block.CallerAddress[0] := CallerOfReallocMem(Caller);
      Block.KindOfBlock := MReallocedUser;
      {+} // restore fields: LeakTransaction, IgnoreTrace
      if ReallocMemRestoreLeakTransaction then
      with PMemoryBlockHeader(PAnsiChar(p) - SizeOf_TMemoryBlockHeader)^ do
      begin // Works in context of the LeakTransaction of the old block p
        Block.LeakTransaction := LeakTransaction;
        Block.IgnoreTrace := IgnoreTrace;
      end;
      {+.}
      if Size > PMemoryBlockHeader(PAnsiChar(p) - SizeOf_TMemoryBlockHeader).AllocatedSize then
        Move(p^, Result^, PMemoryBlockHeader(PAnsiChar(p) - SizeOf_TMemoryBlockHeader).AllocatedSize)
      else
        Move(p^, Result^, Size);
    end
    {+}
    else
      Move(p^, Result^, Size);
    {+.}
    LeakTrackingFreeMem(p);
  end
  else
    Result := OldMemoryManager.ReAllocMem(p, Size);
end;

{$IFDEF ALT_TRACKING_REALLOKMEM}
function LeakTrackingReallocMem(p: Pointer; Size: Integer): Pointer; assembler;
asm
  push ecx
  mov ecx, esp  // PPointer(esp+8)^
  //sub ecx, 4    // PPointer(ecx)^
  call LeakTrackingReallocMemCaller
  pop ecx
end;
{$ELSE}
  {$IFDEF _OPTIMIZATION_)
    {$O+}
  {$ENDIF}
{$ENDIF}

function HeapCheckingReallocMem(p: Pointer; Size: Integer): Pointer;
begin
  if HeapStatusesDifferent(LastHeapStatus, GetHeapStatus) then
    raise HeapCorrupted;

  Result := OldMemoryManager.ReAllocMem(p, Size);

  UpdateLastHeapStatus;
end;

procedure UnMemChk;
begin
  {+}
  if MemCheckActive then
  {+.}
  begin
    {+}
    if LastBlock = nil then // Fix: AV after call OldMemoryManager.FreeMem(LastBlock)
      SetMemoryManager(OldMemoryManager);
    {+.}
    MemCheckActive := False;
  end;
end;

function IsMemFilledWithChar(p: Pointer; n: Integer; C: Char): Boolean;
  //is the memory at P made of C on N bytes ?
asm
  //EAX: P - EDX: N - CL: C
  @loop:
  cmp   [eax+edx-1],cl
  jne   @diff
  dec   edx
  jne   @loop
  mov   eax,1
  ret
  @diff:
  xor   eax,eax
end;

{+}

function IsDebugged: Boolean;
{$IFDEF MSWINDOWS}
var
  IsDebuggerPresent: function: Boolean; stdcall;
  KernelHandle: THandle;
  p: Pointer;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  KernelHandle := GetModuleHandle(kernel32);
  @IsDebuggerPresent := GetProcAddress(KernelHandle, 'IsDebuggerPresent');
  if Assigned(IsDebuggerPresent) then // Win98+/NT4+ only
    Result := IsDebuggerPresent
  else
  begin // Win9x uses thunk pointer outside the module when under a debugger
    p := GetProcAddress(KernelHandle, 'GetProcAddress');
    Result := (DWord(p) < KernelHandle);
  end;
  {$ELSE}
  Result := False;
  {$ENDIF}
end;

procedure OutputDebugString(const S: string);
begin
  Windows.OutputDebugString(PChar(S));
end;
{+.}

procedure GoThroughAllocatedBlocks;
{traverses the allocated blocks list and for each one, raises exceptions showing the memory leaks}
var
  Block: PMemoryBlockHeader;
  i: Integer;
  S: string; // ShortString;
  SMsg: string;
  vIsDebugInfo: Boolean;
begin
  if RaiseExceptionsOnEnd and IsDebugged then
  begin
    UnMemChk;
    Block := LastBlock; //note: no thread safety issue here
    ShowCallStack := False; {for first block}
    while Block <> nil do
    begin
      {+}
      if BlocksToShow[Block.KindOfBlock] and (Block.IgnoreTrace = 0) then
      {+.}
      begin
        if not MemoryBlockFreed(Block) then
        begin {this is a leak}
          case Block.KindOfBlock of
            MClass:
              S := TObject(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader).ClassName;
            MUser:
              S := 'User';
            MReallocedUser:
              S := 'Realloc';
          end;

          if (BlocksToShow[Block.KindOfBlock]) and ((Block.KindOfBlock <> MClass) or
            (TObject(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader) is InstancesConformingToForReporting)) then
          try
            SMsg := TextualDebugInfoForAddressEx(Cardinal(Block.CallerAddress[0]), vIsDebugInfo);
            if vIsDebugInfo or IsDebugged then
              raise EMemoryLeak.Create(S + ' allocated at ' + SMsg) at Block.CallerAddress[0];
          except
            on EMemoryLeak do
              ;
          end;

          if ShowCallStack then
            for i := 1 to StoredCallStackDepth do
              if Integer(Block.CallerAddress[i]) > 0 then
              try
                raise EStackUnwinding.Create(S + ' unwinding level ' + Chr(Ord('0') + i))at Block.CallerAddress[i]
              except
                on EStackUnwinding do
                  ;
              end;

          ShowCallStack := False;
        end {Block.DestructionAdress = Nil}
        else if CheckWipedBlocksOnTermination and (Block.AllocatedSize > 5)
          and (Block.AllocatedSize <= DoNotCheckWipedBlocksBiggerThan) and (not
          IsMemFilledWithChar(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader + 4, Block.AllocatedSize - 5,
          CharToUseToWipeOut)) then
        begin {this is not a leak}
          try
            raise EFreedBlockDamaged.Create('Destroyed block damaged - Block allocated at ' +
              TextualDebugInfoForAddress(Cardinal(Block.CallerAddress[0])) + ' - destroyed at ' +
              TextualDebugInfoForAddress(Cardinal(Block.DestructionAdress)))at Block.CallerAddress[0]
          except
            on EFreedBlockDamaged do
              ;
          end;
        end;
      end; //of: if ...

      Block := Block.PreceedingBlock;
    end; //of: while Block <> nil
  end;
end;

{$IFNDEF D6_UP}
type
  PInitContext = ^TInitContext;
  TInitContext = record
    OuterContext:   PInitContext;     { saved InitContext   }
    ExcFrame:       Pointer; //PExcFrame;        { bottom exc handler  }
    InitTable:      PackageInfo;      { unit init info      }
    InitCount:      Integer;          { how far we got      }
    Module:         PLibModule;       { ptr to module desc  }
    DLLSaveEBP:     Pointer;          { saved regs for DLLs }
    DLLSaveEBX:     Pointer;          { saved regs for DLLs }
    DLLSaveESI:     Pointer;          { saved regs for DLLs }
    DLLSaveEDI:     Pointer;          { saved regs for DLLs }
    DLLInitState:   Byte;
    ExitProcessTLS: procedure;        { Shutdown for TLS    }
  end;
{$ENDIF}

function IsValidBlockAddr(Addr: Pointer; Size: DWord): Boolean;
begin
  Result := Assigned(Addr) and (FindHInstance(Pointer(Addr)) <> 0) and
    (not IsBadReadPtr(Pointer(Addr), Size));
end;

type
  PJumpInstruction = ^TJumpInstruction;
  TJumpInstruction = packed record
    case Byte of
      1: (
        Code: Byte; // jump instruction ($FF)
        Offset: DWord; // jump offset
        UnUsed: Byte;
        );
      2: (
        DW1: DWord;
        DW2: DWord;
        );
  end;
  {$IFNDEF D6_UP}
  PPointer = ^Pointer;
  {$ENDIF}
  PPPointer = ^PPointer;

function GetNativeAddr(Ptr: Pointer): Pointer;
begin
  if IsValidBlockAddr(Ptr, SizeOf(TJumpInstruction)) then
  begin
    Result := Ptr;
    if Assigned(Result) and
      (PJumpInstruction(Result)^.Code = $FF) and // long jmp to package_address_5b
      (PJumpInstruction(Integer(Result) + 6)^.Code = $8B) and // mov
      (PJumpInstruction(Integer(Result) + 7)^.Code = $C0) {// eax,eax} then
      Result := PPPointer(Integer(Result) + 2)^^;
  end
  else
    Result := nil;
end;

function DoIsDelphiProc(MSrc: Pointer): Boolean;
begin
  try
    Result :=
    //
    // push ebp        // $55 (85)
    // mov  ebp, esp   // $8B (139), $EC (236)
    //
    ( (Byte(PAnsiChar(MSrc)[0])   = $55) and
      (Byte((PAnsiChar(MSrc)[1])) = $8B) and
      (Byte((PAnsiChar(MSrc)[2])) = $EC) )
    or
    //
    // push ebx        // $53 (83)
    // mov  ebx, eax   // $8B (139), $D8 (216)
    //
    ( (Byte(PAnsiChar(MSrc)[0])   = $53) and
      (Byte((PAnsiChar(MSrc)[1])) = $8B) and
      (Byte((PAnsiChar(MSrc)[2])) = $D8) )
    ;

    if not Result then
    begin
      Result := (MSrc = @TObject.Free) or ( {IsPackage and} (MSrc = GetNativeAddr(@TObject.Free)) );
    end;

  except
    Result := False;
  end;
end;

function IsDelphiProc(MSrc: Pointer): Boolean;
var
  MSrcNative: Pointer;
begin
  Result := False;
  if (MSrc = nil) or (not IsValidBlockAddr(MSrc, SizeOf(Pointer))) then
    Exit;
  try
    MSrcNative := GetNativeAddr(MSrc);
    if (MSrc = MSrcNative) or IsValidBlockAddr(MSrcNative, SizeOf(Pointer)) then
      Result := DoIsDelphiProc(MSrcNative);
  except
  end;
end;

{$IFDEF HOOK_ALT}
var
  IsHookAlt: Boolean;
  InitContext: PInitContext;
  gSystem_FInit, gMemCheck_FInit: Pointer;

const
  PageRWFlag = {$IFDEF LINUX}PROT_READ or PROT_WRITE{$ELSE}PAGE_READWRITE{$ENDIF};

function JumpFromCode(MSrc, MDest: Pointer; SaveJump: PJumpInstruction; CheckDelphiProc: Boolean): Boolean;
var
  SaveFlagSrc: DWord;
  MSrcNative: Pointer;
begin
  Result := False;
  if Assigned(SaveJump) then
    FillChar(SaveJump^, SizeOf(TJumpInstruction), 0);
  if (MSrc = nil) or (MSrc = MDest) or (not IsValidBlockAddr(MSrc, 3)) then
    Exit;
  MSrcNative := GetNativeAddr(MSrc);
  if (MSrcNative = MDest) or ( (MSrc <> MSrcNative) and (not IsValidBlockAddr(MSrcNative, 3))) then
    Exit;

  if CheckDelphiProc then
  begin
    if not DoIsDelphiProc(MSrcNative) then
      Exit;
  end;

  if VirtualProtect(MSrcNative, SizeOf(TJumpInstruction), PageRWFlag, @SaveFlagSrc) then
  try
    if Assigned(SaveJump) then
      SaveJump^ := PJumpInstruction(MSrcNative)^;
    with PJumpInstruction(MSrcNative)^ do
    begin
      Code := $E9; // JMP SIZE = 5b
      Offset := Integer(MDest) - Integer(MSrcNative) - 5;
    end;
    Result := True;
  finally
    VirtualProtect(MSrcNative, SizeOf(TJumpInstruction), SaveFlagSrc, @SaveFlagSrc);
{$IFDEF LINUX}
{$ELSE}
    FlushInstructionCache(GetCurrentProcess, MSrcNative, SizeOf(TJumpInstruction));
{$ENDIF}
  end;
end;

type
  TProc = procedure;

procedure NewFinalizeUnits;
var
  i, Count: Integer;
  Table: PUnitEntryTable;
  P: Pointer;
  bAllowFinalizationInfo: Boolean;

  procedure PrintFinalizationInfo(P: Pointer; Error: Boolean);
  var
    _file, _module, _proc: string;
    _line: Integer;
    bMapOfAddr: Boolean;
    S: string;
  begin
    try
      if bAllowFinalizationInfo then
      begin
        bMapOfAddr := GetDbgInfoByAddrS(P, _file, _module, _proc, _line);
        if bMapOfAddr then
        begin
          if _line > 0 then
            S := Format('($%p) %s:%s:%d', [P, _module, _proc, _line])
          else
            S := Format('($%p) %s:%s', [P, _module, _proc]);
        end
        else
          S := Format('($%p)', [P]);
      end
      else
        S := Format('($%p)', [P]);
      if Error then
        S := 'ERROR (finalization): ' + S
      else
        S := 'finalization: ' + S;
      OutputDebugString(S);
    except
      //OutputDebugString('MemCheck (error: print finalization): at address $' + IntToHex(Integer(P), 8));
    end;
  end;

  //{$IFDEF LINUX}
  //procedure CallProc(Proc: Pointer; GOT: Cardinal);
  //asm
  //        PUSH    EBX
  //        MOV     EBX,EDX
  //        ADD     EAX,EBX
  //        CALL    EAX
  //        POP     EBX
  //end;
  //{$ENDIF}

  procedure exec_ptr(P: Pointer; ShowError: Boolean);
  begin
    if MemCheckShowFinalizationInfo then
      PrintFinalizationInfo(P, False);
    try
      //{$IFNDEF LINUX}
      TProc(P)();
      //{$ELSE LINUX}
      //CallProc(P, InitContext.Module^.GOT);
      //{$ENDIF}
    except
      if ShowError then
        PrintFinalizationInfo(P, True);
    end;
  end;

begin
  if MemCheckShowFinalizationInfo then
    OutputDebugString('MemCheck (Finalization units):');
  if InitContext.InitTable = nil then
    Exit;

{$IFDEF LINUX}
  Inc(Cardinal(Table), InitContext.Module^.GOT);
{$ENDIF}
  Count := InitContext.InitCount;
  if Count > 0 then
  begin
    {$IFNDEF USE_JEDI_JCL}
    bAllowFinalizationInfo := True;
    {$ELSE}
    bAllowFinalizationInfo := False; // Need detect call Finalization of JclDebug.pas
    {$ENDIF}
    Table := InitContext.InitTable^.UnitInfo;
    for i := Count - 1 downto 1 do
    begin
      P := {$IFNDEF D6_UP}@{$ENDIF}Table^[i].FInit;
      if Assigned(P) then
      begin
        if P <> gMemCheck_FInit then
        begin
          if P = gSystem_FInit then
          begin
            exec_ptr(gMemCheck_FInit, {ShowError:}bAllowFinalizationInfo);
            {$IFNDEF USE_JEDI_DLL}
            bAllowFinalizationInfo := False;
            {$ENDIF}
            exec_ptr(P, {ShowError:}False);
            {$IFDEF USE_JEDI_DLL}
            bAllowFinalizationInfo := False;
            {$ENDIF}
          end
          else
            exec_ptr(P, {ShowError:}bAllowFinalizationInfo);
        end;
      end;
      InitContext.InitCount := i;
    end;
    // quick close exe application
    if (not IsLibrary) then
     TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessID), 0);
    // RTL Finalization
    P := {$IFNDEF D6_UP}@{$ENDIF}Table^[0].FInit;
    try
      // not allow call other function (format, string operation, ...)
      //{$IFNDEF LINUX}
      TProc(P)();
      //{$ELSE LINUX}
      //CallProc(P, InitContext.Module^.GOT);
      //{$ENDIF}
    except
    end;
    InitContext.InitCount := 0;
  end;
  // quick close exe application
  //if (not IsLibrary) then
  // TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessID), 0);
end;

procedure NewMemCheckFin;
begin
  if not IsHookAlt then
    TProc(gSystem_FInit)();
end;

procedure NewSystemFin;
begin
  if IsHookAlt then
    TProc(gMemCheck_FInit)();
  TProc(gSystem_FInit)();
  // quick close exe application
  if (not IsLibrary) then
    TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessID), 0);
end;

{$ENDIF HOOK_ALT}

function GetStubAddress(AStub: Pointer; OffsetE8: Integer = 0): Pointer;
var
  B: Byte;
begin
  Result := nil;
  if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
    Exit;
  if OffsetE8 > 0 then
  begin
    Inc(Integer(AStub), OffsetE8);
    if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
      Exit;
  end;
  B := PByte(AStub)^; // Debug: IntToHex(PByte(Cardinal(AStub)+0)^, 2)
  if B = Byte($E8) then // Debug: PPointer(ebp-4)^; Byte(PPointer(eax)^)=$e8
  begin
    Inc(Integer(AStub));
    Result := Pointer(Integer(AStub) + SizeOf(Pointer) + PInteger(AStub)^);
  end;
end;

function GetStubAddressProc(AStub: Pointer; OffsetE8: Integer = 0): Pointer;
begin
  Result := nil;
  if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
    Exit;
  if OffsetE8 > 0 then
  begin
    Inc(Integer(AStub), OffsetE8);
    if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
      Exit;
  end;
  // -
  // - if PByte(AStub)^ = Byte($E8) then // Debug: PPointer(ebp-4)^; Byte(PPointer(eax)^)=$e8
  // -
  begin
    Inc(Integer(AStub));
    Result := Pointer(Integer(AStub) + SizeOf(Pointer) + PInteger(AStub)^);
    // +
    if not IsDelphiProc(Result) then
      Result := nil;
    // +
  end;
end;

function GetStubAddressEx(AStub: Pointer; Offsets: array of Integer): Pointer;
var
  i: Integer;
begin
  Result := nil;
  i := High(Offsets);
  if i >= 0 then
  begin
    AStub := GetStubAddress(AStub, Offsets[0]);
    if AStub = nil then
      Exit;
    AStub := GetNativeAddr(AStub);
    if AStub = nil then
      Exit;
    for i := 1 to i do
    begin
      AStub := GetStubAddress(AStub, Offsets[i]);
      if AStub = nil then
        Exit;
    end;
  end;
  Result := AStub;
end;

function GetPtrAddress(AStub: Pointer; OffsetE8: Integer = 0): Pointer;
begin
  Result := nil;
  if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
    Exit;
  if OffsetE8 > 0 then
  begin
    Inc(Integer(AStub), OffsetE8);
    if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
      Exit;
  end;
  AStub := Pointer(AStub^);
  if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
    Exit;
  Result := AStub;
end;

function GetStubCall(BaseAddr: Pointer; iSize: Cardinal;
  ResultLo: Pointer = nil;
  ResultHi: Pointer = nil;
  SearchCallLo: Pointer = nil;
  SearchCallHi: Pointer = nil;
  IsDelphiCode: Boolean = True
  ): Pointer;
var
  i: Cardinal;
  b: byte;
  IsDelphiSearchCall: Boolean;
begin
  Result := nil;
  if (BaseAddr = nil) or (iSize < SizeOf(Pointer)) then
    Exit;
  // prepare parameters
  BaseAddr := GetNativeAddr(BaseAddr);
  if not IsValidBlockAddr(BaseAddr, iSize) then
  begin
    {
    if (iSize = SizeOf(Pointer)) or (not IsValidBlockAddr(BaseAddr, SizeOf(Pointer))) then
      Exit;
    // calculate iSize:
    i := iSize;
    iSize := 0;
    for i := i-1 downto 1 do
    begin
      Result := Pointer(Cardinal(BaseAddr)+i);
      if IsValidBlockAddr(Result, SizeOf(Pointer)) then
      begin
        iSize := i;
        Break;
      end;
    end;
    Result := nil;
    if iSize = 0 then
    {}
    Exit;
  end;
  if Assigned(ResultLo) then
    ResultLo := GetNativeAddr(ResultLo);
  if Assigned(ResultHi) then
    ResultHi := GetNativeAddr(ResultHi);
  if Assigned(ResultLo) and Assigned(ResultHi) then
  begin
    if Cardinal(ResultHi) < Cardinal(ResultLo) then
      Exit;
  end;
  Dec(iSize, SizeOf(Pointer)-1);

  // seek to call SearchCallLo
  if Assigned(SearchCallLo) then
  begin
    IsDelphiSearchCall := IsDelphiProc(SearchCallLo);
    for i := 0 to iSize do
    begin
      Result := Pointer(Cardinal(BaseAddr)+i);
      b := PByte(Result)^;
      if (b = Byte($E8)) then // call
      begin
        Inc(Integer(Result));
        Result := Pointer(Integer(Result) + SizeOf(Pointer) + PInteger(Result)^);
        if Assigned(Result) and (Result = SearchCallLo) and (
            (IsDelphiSearchCall and IsDelphiProc(Result))
            or (not IsDelphiSearchCall and IsValidBlockAddr(Result, SizeOf(Pointer)))
          ) then
        begin
          Result := Pointer(Cardinal(BaseAddr)+i);
          Dec(iSize, i);
          if iSize = 0 then
          begin
            Result := nil;
            Exit;
          end;
          Break;
        end;
      end;
      Result := nil;
    end;
    if Result = nil then
      Exit;
    BaseAddr := Result;
  end;

  // seek to call SearchCallHi
  if Assigned(SearchCallHi) and (SearchCallLo = nil) then
  begin
    IsDelphiSearchCall := IsDelphiProc(SearchCallHi);
    for i := 0 to iSize do
    begin
      Result := Pointer(Cardinal(BaseAddr)+i);
      b := PByte(Result)^;
      if (b = Byte($E8)) then // call
      begin
        Inc(Integer(Result));
        Result := Pointer(Integer(Result) + SizeOf(Pointer) + PInteger(Result)^);
        if Assigned(Result) and (Result = SearchCallHi) and (
            (IsDelphiSearchCall and IsDelphiProc(Result))
            or (not IsDelphiSearchCall and IsValidBlockAddr(Result, SizeOf(Pointer)))
          ) then
        begin
          Result := Pointer(Cardinal(BaseAddr)+i);
          iSize := i;
          if iSize = 0 then
          begin
            Result := nil;
            Exit;
          end;
          Break;
        end;
      end;
      Result := nil;
    end;
    if Result = nil then
      Exit;
    //if Assigned(Result) then
    begin
      //Result := nil;
      // search call delphi proc ( push ebp; mov ebp, esp )
      for i := iSize downto 0 do
      begin
        Result := Pointer(Cardinal(BaseAddr)+i);
        b := PByte(Result)^;
        if (b = Byte($E8)) then // call
        begin
          Inc(Integer(Result));
          Result := Pointer(Integer(Result) + SizeOf(Pointer) + PInteger(Result)^);
          if Assigned(Result) and IsValidBlockAddr(Result, SizeOf(Pointer)) then
          begin
            if (not IsDelphiCode) or IsDelphiProc(Result) then
            begin
              if (ResultLo = nil) and (ResultHi = nil) then
                Exit;
              if (Assigned(ResultLo) and (Cardinal(Result) < Cardinal(ResultLo))) then
                Continue;
              if (Assigned(ResultHi) and (Cardinal(Result) > Cardinal(ResultHi))) then
                Continue;
              Exit; // Result founded
            end;
          end;
        end;
      end;
      Result := nil;
      Exit;
    end; // of: if Assigned(Result)
  end;

  // search call delphi proc ( push ebp; mov ebp, esp )
  IsDelphiSearchCall := Assigned(SearchCallHi) and IsDelphiProc(SearchCallHi);
  for i := 0 to iSize do
  begin
    Result := Pointer(Cardinal(BaseAddr)+i);
    b := PByte(Result)^;
    if (b = Byte($E8)) then // call
    begin
      Inc(Integer(Result));
      Result := Pointer(Integer(Result) + SizeOf(Pointer) + PInteger(Result)^);
      if Assigned(Result) and IsValidBlockAddr(Result, SizeOf(Pointer)) then
      begin
        // check searc limitation on call SearchCallHi
        if Assigned(SearchCallHi) and (Result = SearchCallHi) and (
            (not IsDelphiSearchCall) or IsDelphiProc(Result)
          ) then
        begin
          Result := nil;
          Exit;
        end;
        if (not IsDelphiCode) or IsDelphiProc(Result) then
        begin
          if (ResultLo = nil) and (ResultHi = nil) then
            Exit;
          if (Assigned(ResultLo) and (Cardinal(Result) < Cardinal(ResultLo))) then
            Continue;
          if (Assigned(ResultHi) and (Cardinal(Result) > Cardinal(ResultHi))) then
            Continue;
          Exit; // Result founded
        end;
      end;
    end;
  end;
  Result := nil;
end;

procedure StubHalt0;
begin
  System.Halt;
end;

procedure dummy; forward;

function ChangeFinalizationsOrder: Boolean;
  //Changes the order in which finalizations will occur. The five last units to be finalized must be MemCheck, Classes, Variants, SysUtils and System (in this order)
  //Warning: this routine is likely to need to be rewritten when upgrading Delphi
type
  PPackageUnitEntry = ^PackageUnitEntry;
var
  UnitsInfo: PackageInfo;
    //This variable will contain the same thing as System.InitContext.InitTable^.UnitInfo, which is unfortunately not public, and changes between versions of Delphi
  NewUnitsInfoOrder: TList; //of PPackageUnitEntry
  i: Integer;
  CurrentUnitInfo: PackageUnitEntry;
  CurrentUnitInfoCopy: PPackageUnitEntry;
  ProcessHandle: THandle;
  BytesWritten: Cardinal;
{$IFDEF BDS} // BDS 2005 Up
  pCurrentUnitInfoFInit: Pointer;
  System_Fin, SysUtils_Fin, Variants_Fin, Classes_Fin: Pointer;
  {$IFDEF USE_VCL}
  Forms_Fin: Pointer;
  {$ENDIF}
{$ELSE}
  pCurrentUnitInfoInit: Pointer;
  //MemCheck_Init: Pointer;
{$ENDIF}
  MemCheck_Fin: Pointer;
  DummyToFinalizationOffset: Integer;
{$IFDEF HOOK_ALT}
  Proc: PPointer;
  Halt0: Pointer; // System.pas: _Halt0
  {$IFDEF BDS}
  pCurrentUnitInfoInit: Pointer;
  {$ENDIF}
{$ELSE}
  InitContext: PInitContext;
{$ENDIF}
begin
  Result := False;
  try
    {$IFDEF DEBUG}
    OutputDebugString('MemCheck (version): ' + MemCheckVersion);
    {$ENDIF}

    {$IFDEF BDS}
    asm
      mov eax, offset System.Finalization
      mov System_Fin, eax

      mov eax, offset Sysutils.Finalization
      mov SysUtils_Fin, eax

      mov eax, offset Variants.Finalization
      mov Variants_Fin, eax

      mov eax, offset Classes.Finalization
      mov Classes_Fin, eax

      {$IFDEF USE_VCL}
      mov eax, offset Forms.Finalization
      mov Forms_Fin, eax
      {$ENDIF}
    end;
    {$ENDIF}

    {$IFDEF HOOK_ALT}

    //
    // InitContext:
    //
    // Delphi 5: Pointer(Integer(PPointer(@PAnsiChar(@_Halt0)[8])^)-$24)
    // Delphi 7: PPointer(@PAnsiChar(@_Halt0)[5])^
    //
    Proc := GetNativeAddr(GetStubAddress(@StubHalt0));
    //test: TProc(Proc);
    if Proc = nil then
      Exit;
    Halt0 := Proc;
    {$IFDEF D6_UP}
    i := 5;  // Delphi 6, 7; BDS 2005, 2006; RAD Studio 2007, 2009, 2010
    InitContext := GetPtrAddress(Proc, i); // InitContext := PPointer(@PAnsiChar(Proc)[5])^;
      {$IFNDEF BDS}
    if InitContext = nil then
    begin // Delphi 7: Release System.pas
      i := 6;  // Delphi 7
      InitContext := GetPtrAddress(Proc, i); // InitContext := PPointer(@PAnsiChar(Proc)[6])^;
    end;
      {$ENDIF}
    {$ELSE}
    // Delphi 5: Release System.pas
    i := 5;
    InitContext := GetPtrAddress(Proc, i); // InitContext := PPointer(@PAnsiChar(Proc)[5])^;
    if InitContext = nil then
    begin
      // Delphi 5: Debug System.pas
      i := 8; // Delphi 5: InitContext == Pointer(Integer(PPointer(@PAnsiChar(Proc)[8])^)-$24)
      InitContext := GetPtrAddress(Proc, i);
      if Assigned(InitContext) then
      begin
        InitContext := Pointer(Integer(InitContext)-$24);
        if not IsValidBlockAddr(InitContext, SizeOf(Pointer)) then
          InitContext := nil;
      end;
    end;
    {$ENDIF D6_UP}
    if InitContext = nil then
      Exit;
    UnitsInfo := InitContext.InitTable;

    {$ELSE ~HOOK_ALT}

    InitContext := nil;
    UnitsInfo := nil;
    try
      //
      // i == @System.InitContext - @System.AllocMemSize
      //
      asm
        mov i, 0 // remove compiler warning
      end;
      {$IFDEF D10_UP}
        {$IFDEF D12_UP}
          {$IFDEF D13_UP}
      // RAD Studio 2010:
      i := 8724;
      InitContext := PInitContext(PAnsiChar(GetNativeAddr(@AllocMemSize)) + i);
      if IsValidBlockAddr(InitContext, SizeOf(Pointer)) then
        UnitsInfo := InitContext.InitTable;
      if (InitContext = nil) or (UnitsInfo = nil) then
        i := 12816; // 8724 + 4092
          {$ELSE}
      // RAD Studio 2009:
      i := 8724;
          {$ENDIF}
        {$ELSE}
      // BDS 2006; RAD Studio 2007:
      i := 8728;
        {$ENDIF}
      {$ELSE}
        {$IFDEF D7_UP}
      // Delphi 7, BDS 2005:
      i := 128;
        {$ELSE}
      // Delphi 5, 6:
      i := 124;
        {$ENDIF}
      {$ENDIF}
      if i <> 0 then
      begin
        InitContext := PInitContext(PAnsiChar(GetNativeAddr(@AllocMemSize)) + i);
        if IsValidBlockAddr(InitContext, SizeOf(Pointer)) then
          UnitsInfo := InitContext.InitTable;
      end;
    except
      Exit;
    end;
    if (InitContext = nil) or (UnitsInfo = nil) then
      Exit;

      {$IFDEF HOOK_ALT}
      Halt0 := GetNativeAddr(GetStubAddress(@StubHalt0));
      {$ENDIF}
    {$ENDIF HOOK_ALT}

    if not IsValidBlockAddr(UnitsInfo, SizeOf(Pointer)) then
      Exit;

    //seeking memcheck unit finalization (tired of all those offsets :))
    DummyToFinalizationOffset := MaxInt;
    MemCheck_Fin := nil; // @MemCheck.Finalization
    for i := 0 to UnitsInfo.UnitCount - 1 do
    begin
      CurrentUnitInfo := UnitsInfo.UnitInfo^[i];
      if Abs(Int64({$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit) - Int64(@dummy)) <= DummyToFinalizationOffset then
      begin
        MemCheck_Fin := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit;
        DummyToFinalizationOffset := Abs(Int64({$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit) - Int64(@dummy));
      end;
    end;

    {$IFDEF HOOK_ALT} // hook: System.pas: procedure FinalizeUnits;
      gMemCheck_FInit := MemCheck_Fin;
      {$IFDEF BDS}
      gSystem_FInit := System_Fin;
      {$ELSE}
      for i := 0 to UnitsInfo.UnitCount - 1 do
      begin
        CurrentUnitInfo := UnitsInfo.UnitInfo^[i];
        pCurrentUnitInfoInit := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.Init;
        if pCurrentUnitInfoInit = @System.System then
        begin
          gSystem_FInit := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit;
          Break;
        end;
        //else if pCurrentUnitInfoInit = MemCheck_Init then
        //  MemCheck_FInit := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit;
      end;
      {$ENDIF}

      if Assigned(InitContext) and Assigned(gSystem_FInit) and Assigned(gMemCheck_FInit) then
      try
        //
        // calculate FinalizeUnits address @FinalizeUnits
        //

        //test: Halt0 := GetNativeAddr(GetStubAddress(@StubHalt0)); if Halt0 = nil then Exit;
        //test: TProc(Halt0)();

        {$IFDEF D12_UP}
        Proc := GetNativeAddr(@TObject.Free);
        {$ELSE}
        Proc := nil;
        {$ENDIF}

        Proc := GetStubCall(Halt0, {Size Code of _Halt0:}200,
          {low address limit}@TObject.FieldAddress,
          {high address limit}Pointer(Cardinal(Halt0)-300),
          {start search on call} Proc,
          {stop search on call} GetNativeAddr(@UnregisterModule),
          {IsDelphiCode}True
          );

        //test: if Proc = nil then WriteLn('Dump: _Halt0: {'#10, DumpMemory(Halt0, 131), '}.');
        //test: if Assigned(Proc) then TProc(Proc)();

        (*
        if Proc = nil then
        begin

          //
          // i == offset of call FinalizeUnits from @_Halt0
          //

          {$IFDEF BDS}
            {$IFDEF D12_UP}
          //
          // RAD Studio 2009, 2010: // Debug: PCardinal(@(PAnsiChar(Halt0)[157]))^
          //
          // RAD Studio 2010: dcc32.exe compiler version: 14.0.3417.21151
          // RAD Studio 2009: dcc32.exe compiler version: 12.0.3370.20184, 12.0.3420.21218
          i := $9D; // RAD Studio 2009: // Debug: PCardinal(@(PAnsiChar(Halt0)[157]))^
          Proc := GetNativeAddr(GetStubAddress(Halt0, i));
          //{$IFDEF _MEMCHECK_DEBUG_}
          //if Proc <> nil then
          //  OutputDebugString('MemCheck (compiler version): 12.0.3370.20184');
          //{$ENDIF}
          {$IFNDEF D13_UP}
          if Proc = nil then
          begin
          // RAD Studio 2009: dcc32.exe compiler version: 12.0.3370.20184, 12.0.3420.21218
            i := $73;
            Proc := GetNativeAddr(GetStubAddress(Halt0, i));
            //{$IFDEF _MEMCHECK_DEBUG_}
            //if Proc <> nil then
            //  OutputDebugString('MemCheck (compiler version): 12.0.3210.17555');
            //{$ENDIF}
          end;
          {$ENDIF}
          i := -1;
          // debug: if Proc = nil then WriteLn(DumpMemory(Halt0, 301));
          // test:  if Proc <> nil then TProc(Proc)();
            {$ELSE}
          i := $56; // BDS 2005, 2006; RAD Studio 2007
            {$ENDIF}
          {$ELSE}
            {$IFDEF D6_UP}
          i := $59; // Delphi 6, 7
            {$ELSE}
          i := $8F;  // Delphi 5: Release System.pas (FInitUnits)
          //Proc := GetStubAddressEx(@StubHalt0, [0, i]);
          Proc := GetNativeAddr(GetStubAddress(Halt0, i));
          if Proc = nil then
            i := $9C // Delphi 5: Debug System.pas (FInitUnits)
          else
            i := -1;
            {$ENDIF}
          {$ENDIF}
          //test: TProc(Halt0)();
          if i >= 0 then
            //Proc := GetStubAddressEx(@StubHalt0, [0, i]);
            Proc := GetNativeAddr(GetStubAddress(Halt0, i)); // Debug: PCardinal(@(PAnsiChar(Halt0)[i]))^; PByte(@(PAnsiChar(Halt0)[i]))^=$E8

          //test: if Proc <> nil then TProc(Proc);
          //test: TProc(Halt0)();
        end; // of: if Proc = nil
        //*)

        if Assigned(Proc) then
        begin
          if JumpFromCode(Proc, @NewFinalizeUnits, nil, {CheckDelphiProc:}True) then
          begin
            IsHookAlt := True;
            {$IFDEF DEBUG}
            OutputDebugString('MemCheck (finalization): Hooked FinalizeUnits');
            {$ENDIF}
            Result := True;
            Exit;
          end;
        end;

        ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, True, GetCurrentProcessId);
        GetMem(CurrentUnitInfoCopy, SizeOf(PackageUnitEntry));
        for i := UnitsInfo.UnitCount - 1 downto 0 do
        begin
          CurrentUnitInfo := UnitsInfo.UnitInfo^[i];
          pCurrentUnitInfoInit := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit;
          if pCurrentUnitInfoInit = gSystem_FInit then
          begin
            CurrentUnitInfoCopy^ := CurrentUnitInfo;
            CurrentUnitInfoCopy.FInit := @NewSystemFin;
            WriteProcessMemory(ProcessHandle, PPackageUnitEntry(PAnsiChar(@UnitsInfo^.UnitInfo^[0]) + i * SizeOf(PackageUnitEntry)),
              CurrentUnitInfoCopy, SizeOf(PackageUnitEntry), BytesWritten);
            //
            IsHookAlt := True;
            FreeMem(CurrentUnitInfoCopy);
            CloseHandle(ProcessHandle);
            {$IFDEF DEBUG}
            OutputDebugString('MemCheck (finalization): Hooked System.Finalization');
            {$ENDIF}
            Result := True;
            Exit;
          end
          else if pCurrentUnitInfoInit = gMemCheck_FInit then
          begin
            CurrentUnitInfoCopy^ := CurrentUnitInfo;
            CurrentUnitInfoCopy.FInit := @NewMemCheckFin;
            WriteProcessMemory(ProcessHandle, PPackageUnitEntry(PAnsiChar(@UnitsInfo^.UnitInfo^[0]) + i * SizeOf(PackageUnitEntry)),
              CurrentUnitInfoCopy, SizeOf(PackageUnitEntry), BytesWritten);
          end;
        end;
        FreeMem(CurrentUnitInfoCopy);
        CloseHandle(ProcessHandle);

      except
        OutputDebugString('MemCheck (ERROR): hook FinalizeUnits'); // memory access error
      end;
    {$ENDIF HOOK_ALT}

    NewUnitsInfoOrder := TList.Create;
    NewUnitsInfoOrder.Capacity := UnitsInfo.UnitCount + 11;
    for i := 0 to 10 do
      NewUnitsInfoOrder.Add(nil);

    for i := 0 to UnitsInfo.UnitCount - 1 do
    begin
      CurrentUnitInfo := UnitsInfo.UnitInfo^[i];
      GetMem(CurrentUnitInfoCopy, SizeOf(PackageUnitEntry));
      CurrentUnitInfoCopy^ := CurrentUnitInfo;
      {$IFDEF BDS}
        pCurrentUnitInfoFInit := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit;

        if pCurrentUnitInfoFInit = System_Fin then
          NewUnitsInfoOrder.Insert(0, CurrentUnitInfoCopy)
        else if pCurrentUnitInfoFInit = SysUtils_Fin then
          NewUnitsInfoOrder.Insert(2, CurrentUnitInfoCopy)
        else if pCurrentUnitInfoFInit = Variants_Fin then
          NewUnitsInfoOrder.Insert(3, CurrentUnitInfoCopy)
        else if pCurrentUnitInfoFInit = Classes_Fin then
          NewUnitsInfoOrder.Insert(4, CurrentUnitInfoCopy)
        {$IFDEF USE_VCL}
        else if pCurrentUnitInfoFInit = Forms_Fin then
          NewUnitsInfoOrder.Insert(5, CurrentUnitInfoCopy)
        {$ENDIF}
        else if pCurrentUnitInfoFInit = MemCheck_Fin then
          NewUnitsInfoOrder.Insert(1, CurrentUnitInfoCopy)
        else
          NewUnitsInfoOrder.Add(CurrentUnitInfoCopy);
      {$ELSE ~BDS}
        pCurrentUnitInfoInit := {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.Init;

        if pCurrentUnitInfoInit = @System.System then
          NewUnitsInfoOrder.Insert(0, CurrentUnitInfoCopy)
        else if pCurrentUnitInfoInit = @SysUtils.SysUtils then
          NewUnitsInfoOrder.Insert(1, CurrentUnitInfoCopy)
        {$IFDEF D6_UP}
        else if pCurrentUnitInfoInit = @Variants.Variants then
          NewUnitsInfoOrder.Insert(2, CurrentUnitInfoCopy)
        {$ENDIF}
        //else if pCurrentUnitInfoInit = MemCheck_Init then
        //  NewUnitsInfoOrder.Insert(4, CurrentUnitInfoCopy)
        else if {$IFNDEF D6_UP}@{$ENDIF}CurrentUnitInfo.FInit = MemCheck_Fin then
          NewUnitsInfoOrder.Insert(4, CurrentUnitInfoCopy)
        else
          NewUnitsInfoOrder.Add(CurrentUnitInfoCopy);
       {$ENDIF  BDS}
    end;
    // remove nil pointers
    repeat until NewUnitsInfoOrder.Remove(nil) < 0;

    ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, True, GetCurrentProcessId);
    for i := 0 to NewUnitsInfoOrder.Count - 1 do
    begin
      WriteProcessMemory(ProcessHandle, Pointer(PAnsiChar(@UnitsInfo^.UnitInfo^[0]) + i * SizeOf(PackageUnitEntry)),
        NewUnitsInfoOrder[i], SizeOf(PackageUnitEntry), BytesWritten);
      FreeMem(NewUnitsInfoOrder[i]);
    end;
    CloseHandle(ProcessHandle);
    NewUnitsInfoOrder.Destroy;
    {$IFDEF DEBUG}
    OutputDebugString('MemCheck (finalization): Changed finalizations order');
    {$ENDIF}
    Result := True;
  except
  end;
end;

function UnitWhichContainsAddress(const Address: Cardinal): TUnitDebugInfos;
var
  Start, Finish, Pivot: Integer;
begin
  Start := 0;
  Finish := UnitsCount - 1;
  Result := nil;

  while Start <= Finish do
  begin
    Pivot := Start + (Finish - Start) div 2;

    if TUnitDebugInfos(Units[Pivot]).Addresses[0].Address > Address then
      Finish := Pivot - 1
    else if TUnitDebugInfos(Units[Pivot]).Addresses[
      Length(TUnitDebugInfos(Units[Pivot]).Addresses) - 1].Address < Address then
    begin
      Start := Pivot + 1;
    end
    else
    begin
      Result := Units[Pivot];
      Start := Finish + 1;
    end;
  end;
end;

function RoutineWhichContainsAddress(const Address: Cardinal): string;
var
  Start, Finish, Pivot, iStart, iFinish: Integer;
begin
  Start := 0;
  Result := NoDebugInfo;
  Finish := RoutinesCount - 1;
  while Start <= Finish do
  begin
    Pivot := Start + (Finish - Start) div 2;
    if TRoutineDebugInfos(Routines[Pivot]).StartAddress > Address then
      Finish := Pivot - 1
    else if TRoutineDebugInfos(Routines[Pivot]).EndAddress < Address then
      Start := Pivot + 1
    else
    begin
      {+}
      //Result := ' Routine ' + TRoutineDebugInfos(Routines[Pivot]).Name;
      Result := TRoutineDebugInfos(Routines[Pivot]).Name;
      iFinish := Length(Result);
      if (iFinish > 0) then
      begin
        if (Result[1]='@') then
        begin
          iStart := 2;
          while (iStart <= iFinish) and (Result[iStart] = '@') do
            Inc(iStart);
          Result := Copy(Result, iStart, iFinish - iStart + 1);
        end;
        Result := StringReplace(Result, '@', '.', [rfReplaceAll]);
      end;
      {+.}
      Start := Finish + 1;
    end;
  end;
end;

type
  TExceptionProc = procedure(Exc: TObject; Addr: Pointer);

var
  InitialExceptionProc: TExceptionProc;
  VersionInfo: string;

procedure MyExceptProc(Exc: TObject; Addr: Pointer);
var
  S: TCallStack;
begin
  WriteLn(SevereExceptionsLogFile, '');
  WriteLn(SevereExceptionsLogFile, '********* Severe exception detected - ' + DateTimeToStr(Now) + ' *********');
  WriteLn(SevereExceptionsLogFile, VersionInfo);
  WriteLn(SevereExceptionsLogFile, 'Exception code: ' + Exc.ClassName);
  WriteLn(SevereExceptionsLogFile, 'Exception address: ' + TextualDebugInfoForAddress(Cardinal(Addr)));
  WriteLn(SevereExceptionsLogFile, #13#10'Call stack (oldest call at bottom):');
  FillCallStack(S, 0);
  WriteLn(SevereExceptionsLogFile, CallStackTextualRepresentation(S, ''));
  WriteLn(SevereExceptionsLogFile, '*****************************************************************');
  WriteLn(SevereExceptionsLogFile, '');
  InitialExceptionProc(Exc, Addr);
  //The closing of the file is done in the finalization
end;

procedure LogSevereExceptions(const WithVersionInfo: string);
const
  FileNameBufSize = 1000;
var
  LogFileName: string;
begin
  if ExceptProc <> @MyExceptProc then
  begin {not installed yet ?}
    try
      SetLength(LogFileName, FileNameBufSize);
      GetModuleFileName(0, PChar(LogFileName), FileNameBufSize);
      LogFileName := Copy(LogFileName, 1, Pos('.', LogFileName)) + 'log';

      AssignFile(SevereExceptionsLogFile, LogFileName);

      if FileExists(LogFileName) then
        Append(SevereExceptionsLogFile)
      else
        Rewrite(SevereExceptionsLogFile);
    except
    end;

    InitialExceptionProc := ExceptProc;
    ExceptProc := @MyExceptProc;
    VersionInfo := WithVersionInfo;
  end;
end;

function IsMemCheckActive: Boolean;
begin
  Result := MemCheckActive;
end;

constructor TUnitDebugInfos.Create(const AName: string; const NbLines: Cardinal);
begin
  Name := AName;

  SetLength(Addresses, NbLines);
end;

constructor TRoutineDebugInfos.Create(const AName: string; const AStartAddress: Cardinal; const ALength: Cardinal);
begin
  Name := AName;
  StartAddress := AStartAddress;
  EndAddress := StartAddress + ALength - 1;
end;

constructor TAddressToLine.Create(const AAddress, ALine: Cardinal);
begin
  Address := AAddress;
  Line := ALine
end;

function TUnitDebugInfos.LineNumWhichContainsAddress(const Address: Cardinal): Cardinal;
var
  Start, Finish, Pivot: Cardinal;
begin
  Result := 0;
  if Addresses[0].Address <= Address then
  begin
    Start := 0;
    Finish := Length(Addresses) - 1;

    while Start < Finish - 1 do
    begin
      Pivot := Start + (Finish - Start) div 2;

      if Addresses[Pivot].Address = Address then
      begin
        Start := Pivot;
        Finish := Start
      end
      else if Addresses[Pivot].Address > Address then
        Finish := Pivot
      else
        Start := Pivot
    end;

    Result := Addresses[Start].Line;
  end;
end;

function TUnitDebugInfos.LineWhichContainsAddress(const Address: Cardinal): string;
var
  Line: Cardinal;
begin
  Line := LineNumWhichContainsAddress(Address);
  if Line <= 0 then
    Result := ''
  else
  begin
    Result := ' Line ' + IntToStr(Line);
  end;
end;

type
  SRCMODHDR = packed record
    _cFile: Word;
    _cSeg: Word;
    _baseSrcFile: array[0..MaxListSize] of Integer;
  end;

  SRCFILE = packed record
    _cSeg: Word;
    _nName: Integer;
    _baseSrcLn: array[0..MaxListSize] of Integer;
  end;

  SRCLN = packed record
    _Seg: Word;
    _cPair: Word;
    _Offset: array[0..MaxListSize] of Integer;
  end;

  PSRCMODHDR = ^SRCMODHDR;
  PSRCFILE = ^SRCFILE;
  PSRCLN = ^SRCLN;

  TArrayOfByte = array[0..MaxListSize] of Byte;
  TArrayOfWord = array[0..MaxListSize] of Word;
  PArrayOfByte = ^TArrayOfByte;
  PArrayOfWord = ^TArrayOfWord;
  PArrayOfPointer = ^TArrayOfPointer;
  TArrayOfPointer = array[0..MaxListSize] of PArrayOfByte;

function max(v1, v2: Integer): Integer; {$ifdef _inline_}inline;{$endif}
begin
  if v1 > v2 then
    Result := v1
  else
    Result := v2;
end;

function min(v1, v2: Integer): Integer; {$ifdef _inline_}inline;{$endif}
begin
  if v1 < v2 then
    Result := v1
  else
    Result := v2;
end;

procedure AddRoutine(const Name: string; const Start, Len: Cardinal); overload;
begin
  if Length(Routines) <= RoutinesCount then
    SetLength(Routines, Max(RoutinesCount * 2, 1000));

  Routines[RoutinesCount] := TRoutineDebugInfos.Create(Name, Start, Len);
  RoutinesCount := RoutinesCount + 1;
end;

procedure AddUnit(const u: TUnitDebugInfos);
begin
  if Length(Units) <= UnitsCount then
    SetLength(Units, Max(UnitsCount * 2, 1000));

  Units[UnitsCount] := u;
  UnitsCount := UnitsCount + 1;
end;

function NameTbl2Str(P: Pointer): string; {$ifdef _inline_}inline;{$endif}
begin
  //todo: PAnsiChar or PUTF8Char or PChar. ????????????????
  Result := string(AnsiString(PAnsiChar(P)));
end;

procedure DumpSymbols(NameTbl: PArrayOfPointer; sstptr: PArrayOfByte; Size: Integer);
//Copyright (C) Tenth Planet Software Intl., Clive Turvey 1998. All rights reserved. - Reused & modified by SG with permission
var
  Len, sym: Integer;
  S: string;
begin
  while Size > 0 do
  begin
    Len := PWord(@sstptr^[0])^;
    sym := PWord(@sstptr^[2])^;

    Inc(Len, 2);

    if ((sym = $205) or (sym = $204)) and (PInteger(@sstptr^[40])^ > 0) then
    begin
      S := NameTbl2Str(NameTbl^[PInteger(@sstptr^[40])^ - 1]);
      AddRoutine(S, PInteger(@sstptr^[28])^, PInteger(@sstptr^[16])^);
    end;

    if (Len = 2) then
      Size := 0
    else
    begin
      sstptr := PArrayOfByte(@sstptr^[Len]);
      Dec(Size, Len);
    end;
  end;
end;

procedure DumpLines(NameTbl: PArrayOfPointer; sstptr: PArrayOfByte; Size: Integer);
//Copyright (C) Tenth Planet Software Intl., Clive Turvey 1998. All rights reserved. - Reused & modified by SG with permission
var
  SRCMODHDR: PSRCMODHDR;
  i: Word;
  SRCFILE: PSRCFILE;
  SRCLN: PSRCLN;
  k: Word;
  CurrentUnit: TUnitDebugInfos;
  S: string;
begin
  if Size > 0 then
  begin
    SRCMODHDR := PSRCMODHDR(sstptr);

    for i := 0 to Pred(SRCMODHDR^._cFile) do
    begin
      SRCFILE := PSRCFILE(@sstptr^[SRCMODHDR^._baseSrcFile[i]]);

      if SRCFILE^._nName > 0 then
            //note: I assume that the code is always in segment #1. If this is not the case, Houston !  - VM
      begin
        SRCLN := PSRCLN(@sstptr^[SRCFILE^._baseSrcLn[0]]);
        S := NameTbl2Str(NameTbl^[SRCFILE^._nName - 1]);
        CurrentUnit := TUnitDebugInfos.Create(ExtractFileName(S), SRCLN^._cPair);
        AddUnit(CurrentUnit);

        for k := 0 to Pred(SRCLN^._cPair) do
          CurrentUnit.Addresses[k] := TAddressToLine.Create(Integer(PArrayOfPointer(@SRCLN^._Offset[0])^[k]),
            Integer(PArrayOfWord(@SRCLN^._Offset[SRCLN^._cPair])^[k]));
      end;
    end;
  end;
end;

procedure GetProjectInfos;
//Copyright (C) Tenth Planet Software Intl., Clive Turvey 1998. All rights reserved. - Reused & modified by SG with permission
var
  AHeader: packed record
    Signature: array[0..3] of AnsiChar;
    AnInteger: Integer;
  end;
  k: Integer;
  j: Word;
  lfodir: Integer;
  SstFrameSize: Integer;
  SstFrameElem: PArrayOfByte;
  ssttype, sstsize, sstbase: Integer;
  X, Y, Z: Integer;
  sstbuf: PArrayOfByte;
  OldFileMode: Integer;
  AFileOfByte: file of Byte;
  Names: PArrayOfByte;
  NameTbl: PArrayOfPointer;
  SstFrame: PArrayOfByte;
  ifabase: Integer;
  cdir, cbdirentry: Word;
  FileName: string;
begin
  RoutinesCount := 0;
  UnitsCount := 0;
  OldFileMode := FileMode;
  FileMode := 0;
  k := max(MAX_PATH, 4096);
  SetLength(FileName, k + 1);
  SetLength(FileName, GetModuleFileName(HInstance, PChar(FileName), k));
  AssignFile(AFileOfByte, FileName);
  Reset(AFileOfByte);
  Names := nil;
  NameTbl := nil;
  Seek(AFileOfByte, FileSize(AFileOfByte) - SizeOf(AHeader));
  BlockRead(AFileOfByte, AHeader, SizeOf(AHeader));
  if (AHeader.Signature = 'FB09') or (AHeader.Signature = 'FB0A') then
  begin
    ifabase := FilePos(AFileOfByte) - AHeader.AnInteger;
    Seek(AFileOfByte, ifabase);
    BlockRead(AFileOfByte, AHeader, SizeOf(AHeader));
    if (AHeader.Signature = 'FB09') or (AHeader.Signature = 'FB0A') then
    begin
      lfodir := ifabase + AHeader.AnInteger;
      if lfodir >= ifabase then
      begin
        Seek(AFileOfByte, lfodir);
        BlockRead(AFileOfByte, j, SizeOf(Word));
        BlockRead(AFileOfByte, cbdirentry, SizeOf(Word));
        BlockRead(AFileOfByte, cdir, SizeOf(Word));
        Seek(AFileOfByte, lfodir + j);
        SstFrameSize := cdir * cbdirentry;
        GetMem(SstFrame, SstFrameSize);
        BlockRead(AFileOfByte, SstFrame^, SstFrameSize);
        for k := 0 to Pred(cdir) do
        begin
          SstFrameElem := PArrayOfByte(@SstFrame^[k * cbdirentry]);
          ssttype := PWord(@SstFrameElem^[0])^;
          if (ssttype = $0130) then
          begin
            sstbase := ifabase + PInteger(@SstFrameElem^[4])^;
            sstsize := PInteger(@SstFrameElem^[8])^;
            GetMem(Names, sstsize);
            Seek(AFileOfByte, sstbase);
            BlockRead(AFileOfByte, Names^, sstsize);
            Y := PInteger(@Names^[0])^;
            GetMem(NameTbl, SizeOf(Pointer) * Y);
            Z := 4;
            for X := 0 to Pred(Y) do
            begin
              NameTbl^[X] := PArrayOfByte(@Names^[Z + 1]); // Debug: PansiChar(NameTbl^[X])
              Z := Z + Names^[Z] + 2;
            end;
          end;
        end;
        for k := 0 to Pred(cdir) do
        begin
          SstFrameElem := PArrayOfByte(@SstFrame^[k * cbdirentry]);
          ssttype := PWord(@SstFrameElem^[0])^;
          sstbase := ifabase + PInteger(@SstFrameElem^[4])^;
          sstsize := PInteger(@SstFrameElem^[8])^;
          GetMem(sstbuf, sstsize);
          Seek(AFileOfByte, sstbase);
          BlockRead(AFileOfByte, sstbuf^, sstsize);
          if (ssttype = $0125) then
            DumpSymbols(NameTbl, PArrayOfByte(@sstbuf^[4]), sstsize - 4);
          if (ssttype = $0127) then
            DumpLines(NameTbl, sstbuf, sstsize);
          FreeMem(sstbuf);
        end;
        FreeMem(Names);
        FreeMem(NameTbl);
        FreeMem(SstFrame);
      end;
    end;
  end;
  CloseFile(AFileOfByte);
  FileMode := OldFileMode;
end;

procedure SetDispl; forward;

procedure DoFinalizeOnce;
begin
  try
    if CheckHeapStatus and (HeapStatusSynchro <> nil) then
    begin
      HeapStatusSynchro.Destroy;
      HeapStatusSynchro := nil;
    end;
    if LinkedListSynchro <> nil then
    begin
      LinkedListSynchro.Destroy;
      LinkedListSynchro := nil;
    end;
    if TimeStamps <> nil then
    begin
      FreeMem(TimeStamps);
      TimeStamps := nil;
      TimeStampsCount := 0;
      TimeStampsAllocated := 0;
    end;
    if AllocatedInstances <> nil then
    begin
      FreeMem(AllocatedInstances);
      AllocatedInstances := nil;
    end;
    if CollectStatsAboutObjectAllocation then
      SetLength(AllocatedObjectsClasses, 0);
    if IdentifyObjectFields and (CurrentlyAllocatedBlocksTree <> nil) then
    begin
      CurrentlyAllocatedBlocksTree.Destroy;
      CurrentlyAllocatedBlocksTree := nil;
    end;
    if HeapCorrupted <> nil then
    begin
      HeapCorrupted.Destroy;
      HeapCorrupted := nil;
    end;
    if OutOfMemory <> nil then
    begin
      OutOfMemory.Destroy;
      OutOfMemory := nil;
    end;
  except
  end;
end;

procedure DoInitializeOnce;
var
  i: Integer;
begin
  MemCheckInitialized := 0;
  try
    GetMemoryManager(OldMemoryManager);

    SetDispl;
    OutOfMemory := EOutOfMemory.Create('Memcheck is not able to allocate memory, due to system resource lack');
    HeapCorrupted := Exception.Create('Heap corrupted');
    //if not ChangeFinalizationsOrder then
    //  Exit;
    GIndex := 0;
    LastBlock := nil;

    for i := 0 to MaxNbSupportedVMTEntries do
    begin
      BadObjectVMT.B[i] := PAnsiChar(@ReleasedInstance.Error) + 6 * i;
      BadInterfaceVMT[i] := PAnsiChar(@ReleasedInstance.InterfaceError);
    end;

    FreedInstance := PAnsiChar(ReleasedInstance) + vmtMethodTable;
    Move(FreedInstance^, BadObjectVMT.A, 20);
    FreedInstance := PAnsiChar(@BadObjectVMT.B[8]);

    if IdentifyObjectFields then
      CurrentlyAllocatedBlocksTree := TIntegerBinaryTree.Create;
    if CollectStatsAboutObjectAllocation then
      SetLength(AllocatedObjectsClasses, 100);

    {$IFNDEF USE_JEDI}
    GetProjectInfos;
    {$ENDIF}

    LinkedListSynchro := TCriticalSection.Create;

    if CheckHeapStatus then
      HeapStatusSynchro := TSynchroObject.Create;

    if not ChangeFinalizationsOrder then
    begin
      {$IFDEF _MEMCHECK_DEBUG_}
      try
        raise Exception.Create('Need check implementation "ChangeFinalizationsOrder" for your compiler version');
      except
      end;
      {$ENDIF}
      {$IFDEF DEBUG}
      OutputDebugString('MemCheck (ERROR): Need check implementation "ChangeFinalizationsOrder" for your compiler version');
      {$ENDIF}
      DoFinalizeOnce;
      Exit;
    end;

    {+} // check redirect (packages)
    AddressOfNewInstance := GetNativeAddr(AddressOfNewInstance);
    AddressOfTObjectCreate := GetNativeAddr(AddressOfTObjectCreate);
    {+.}

    MemCheckInitialized := 1;
  except
    {$IFDEF DEBUG}
    OutputDebugString('MemCheck (ERROR): DoInitializeOnce'); // need check GetProjectInfos for new compiler version
    {$ENDIF}
    DoFinalizeOnce;
  end;
end;

function InitializeOnce: Boolean; {$ifdef _inline_}inline;{$endif}
begin
  if MemCheckInitialized < 0 then {once mechanism}
    DoInitializeOnce;
  Result := MemCheckInitialized > 0;
end;

function CallStacksEqual(const CS1, CS2: TCallStack): Boolean;
var
  i: Integer;
begin
  Result := True;
  i := 0;
  while (Result) and (i <= StoredCallStackDepth) do
  begin
    Result := Result and (CS1[i] = CS2[i]);
    i := i + 1;
  end;
end;

type
  TLeak = class
  public
    fID: Integer;

    fBlock: PMemoryBlockHeader;
    fOccurences: Integer;

    fWasFieldOfAnotherObject: Boolean;
    fOwnerClassName: string;
    fOtherFieldIndex: Integer;
    fOtherIsDestroyed: Boolean;

    constructor Create(ABlock: PMemoryBlockHeader);
    function IsEqual(const Other: TLeak): Boolean;
    procedure AddOccurence;
    property Occurences: Integer read fOccurences;
    property Block: PMemoryBlockHeader read fBlock;
    property WasFieldOfAnotherObject: Boolean read fWasFieldOfAnotherObject;
    property OtherObjectClassName: string read fOwnerClassName;
    property OtherFieldIndex: Integer read fOtherFieldIndex;
    property OtherIsDestroyed: Boolean read fOtherIsDestroyed;
    procedure OutputToFile(const f: Text);
    procedure OutputOneLineToFile(const f: Text);
    function TotalSize: Integer;
  end;

  TLeakList = class
  public
    fItems: array of TLeak;
    fCapacity: Integer;
    fCount: Integer;

    procedure Add(const L: TLeak);
    constructor Create;
    function Item(const i: Integer): TLeak;
    property Count: Integer read fCount;
  end;

  TBlockList = class
  public
    fItems: array of PMemoryBlockHeader;
    fCapacity: Integer;
    fCount: Integer;

    procedure Add(const B: PMemoryBlockHeader);
    constructor Create;
    function Item(const i: Integer): PMemoryBlockHeader;
    property Count: Integer read fCount;
  end;

constructor TLeak.Create(ABlock: PMemoryBlockHeader);
begin
  inherited Create;

  fBlock := ABlock;
  fOccurences := 1;
end;

procedure TLeak.OutputToFile(const f: Text);
begin
  {+}
  if not BlocksToShow[Block.KindOfBlock] then
    Exit;
  {+.}

  Write(f, 'Leak #', fID, ' ');

  case Block.KindOfBlock of
    MClass:
      WriteLn(f, 'Instance of ', TObject(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader).ClassName);
    MUser:
      WriteLn(f, 'User allocated memory (GetMem)');
    MReallocedUser:
      WriteLn(f, 'Reallocated memory (ReallocMem)');
  end;

  WriteLn(f, #9'Size: ', Block.AllocatedSize);
  if fOccurences > 1 then
    WriteLn(f, #9, fOccurences, ' Occurences')
  else
    WriteLn(f, #9, fOccurences, ' Occurence');

  if fWasFieldOfAnotherObject then
  begin
    Write(f, #9'Was field #', fOtherFieldIndex, ' of an instance of ', fOwnerClassName);

    if fOtherIsDestroyed then
      WriteLn(f, ' (destroyed)')
    else
      WriteLn(f, ' (not destroyed)');
  end;

  WriteLn(f, CallStackTextualRepresentation(Block.CallerAddress, #9));
end;

function TLeak.TotalSize: Integer;
begin
  Result := 0;
  if Assigned(fBlock) then
    Result := fOccurences * fBlock^.AllocatedSize;
end;

procedure TLeak.OutputOneLineToFile(const f: Text);
begin
  {+}
  if not BlocksToShow[Block.KindOfBlock] then
    Exit;
  {+.}
  case Block.KindOfBlock of
    MClass:
      Write(f, '* Instance of ', TObject(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader).ClassName);
    MUser:
      Write(f, '* User allocated memory (GetMem)');
    MReallocedUser:
      Write(f, '* Reallocated memory (ReallocMem)');
  end;

  Write(f, ' (Leak #', fID, ') ');

  WriteLn(f, 'Size: ', Block.AllocatedSize);
end;

function TLeak.IsEqual(const Other: TLeak): Boolean;
begin
  Result := (fBlock.KindOfBlock = Other.Block.KindOfBlock) and (fBlock.AllocatedSize = Other.Block.AllocatedSize);

  if fBlock.KindOfBlock = MClass then
    Result := Result and (TObject(PAnsiChar(fBlock) + SizeOf_TMemoryBlockHeader).ClassName = TObject(PAnsiChar(Other.Block) +
      SizeOf_TMemoryBlockHeader).ClassName);

  Result := Result and (WasFieldOfAnotherObject = Other.WasFieldOfAnotherObject);

  if WasFieldOfAnotherObject then
    Result := Result and (OtherObjectClassName = Other.OtherObjectClassName) and (OtherFieldIndex =
      Other.OtherFieldIndex) and (OtherIsDestroyed = Other.OtherIsDestroyed);

  Result := Result and CallStacksEqual(fBlock.CallerAddress, Other.Block.CallerAddress)
end;

procedure TLeak.AddOccurence;
begin
  fOccurences := fOccurences + 1;
end;

procedure TLeakList.Add(const L: TLeak);
begin
  if Count = fCapacity then
  begin
    fCapacity := fCapacity * 2;
    SetLength(fItems, fCapacity);
  end;

  fItems[fCount] := L;
  fCount := fCount + 1;
end;

constructor TLeakList.Create;
begin
  inherited Create;

  fCapacity := 10;
  fCount := 0;
  SetLength(fItems, fCapacity);
end;

function TLeakList.Item(const i: Integer): TLeak;
begin
  Assert((i >= 0) and (i < fCount), Format('TLeakList.Item: out of bounds (%d)', [i]));

  Result := fItems[i]
end;

procedure TBlockList.Add(const B: PMemoryBlockHeader);
begin
  if Count = fCapacity then
  begin
    fCapacity := fCapacity * 2;
    SetLength(fItems, fCapacity);
  end;

  fItems[fCount] := B;
  fCount := fCount + 1;
end;

constructor TBlockList.Create;
begin
  inherited Create;

  fCapacity := 10;
  fCount := 0;
  SetLength(fItems, fCapacity);
end;

function TBlockList.Item(const i: Integer): PMemoryBlockHeader;
begin
  Assert((i >= 0) and (i < fCount), 'TBlockList.Item: out of bounds');

  Result := fItems[i]
end;

procedure GetLeaks(const LeaksList, ChronogicalInfo: TLeakList; const MaxNumberOfLeaks: Integer;
  var StoppedDueToMaxLeak: Boolean; LeakTransaction: Cardinal = 0);
var
  Block: PMemoryBlockHeader;
  CurrentLeak: TLeak;
  i: Integer;
  NewLeak: Boolean;
begin
  StoppedDueToMaxLeak := False;
  Block := LastBlock;
  while (Block <> nil) and (LeaksList.Count < MaxNumberOfLeaks) do
  begin
    if (not MemoryBlockFreed(Block))
      {+}
      and BlocksToShow[Block.KindOfBlock]
      and (Block.IgnoreTrace = 0)
      and ( (LeakTransaction = 0) or (Block.LeakTransaction = LeakTransaction) )
      {+.}
    then
    begin {this is a leak}
      CurrentLeak := TLeak.Create(Block);

      if IdentifyObjectFields then
        for i := 0 to NotDestroyedFieldsCount - 1 do
          if Pointer(NotDestroyedFields[i]) = Block then
          begin
            CurrentLeak.fWasFieldOfAnotherObject := True;
            CurrentLeak.fOwnerClassName := TFieldInfo(NotDestroyedFieldsInfos[i]).OwnerClass.ClassName;
            CurrentLeak.fOtherFieldIndex := TFieldInfo(NotDestroyedFieldsInfos[i]).FieldIndex;
            CurrentLeak.fOtherIsDestroyed := True;
          end;

      //A future improvement: identify fields of not destroyed objects

      NewLeak := True;
      i := 0;
      while i < LeaksList.Count do
      begin
        if LeaksList.Item(i).IsEqual(CurrentLeak) then
        begin
          CurrentLeak.Destroy;
          CurrentLeak := LeaksList.Item(i);
          CurrentLeak.AddOccurence;
          i := LeaksList.Count;
          NewLeak := False;
        end;

        i := i + 1;
      end;

      if NewLeak then
      begin
        CurrentLeak.fID := LeaksList.Count;
        LeaksList.Add(CurrentLeak);
      end;

      ChronogicalInfo.Add(CurrentLeak);
    end;

    Block := Block.PreceedingBlock;
  end;

  if LeaksList.Count = MaxNumberOfLeaks then
    StoppedDueToMaxLeak := True;
end;

procedure GetBadBlocks(const B: TBlockList; const MaxNumberOfBlocks, MaxBlockSize: Integer;
  var StoppedDueToMaxBlock: Boolean; LeakTransaction: Cardinal = 0);
var
  Block: PMemoryBlockHeader;
begin
  StoppedDueToMaxBlock := False;
  Block := LastBlock;
  while (Block <> nil) and (B.Count < MaxNumberOfBlocks) do
  begin
    if MemoryBlockFreed(Block) and (Block.AllocatedSize > 5) and (Block.AllocatedSize <= MaxBlockSize)
      {+}
      and BlocksToShow[Block.KindOfBlock]
      and (Block.IgnoreTrace = 0)
      and ( (LeakTransaction = 0) or (Block.LeakTransaction = LeakTransaction) )
      {+.}
      and (not IsMemFilledWithChar(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader + 4, Block.AllocatedSize - 5, CharToUseToWipeOut))
    then
      B.Add(Block);

    Block := Block.PreceedingBlock;
  end;

  if B.Count = MaxNumberOfBlocks then
    StoppedDueToMaxBlock := True;
end;

function SortTLeaks(Item1, Item2: Pointer): Integer;
begin
   // sort descending
  Result := TLeak(Item2).TotalSize - TLeak(Item1).TotalSize;
end;

procedure OutputAllCollectedInformation;
var
  OutputFile: Text;
  LeaksList: TLeakList; //Contains all instances of TLeak
  ChronogicalInfo: TLeakList; //Contains one ore more instance of each TLeak
  StoppedDueToMax, bIsLeaks: Boolean;
  TotalLeak: Integer;
  i, j: Integer;
  LastDisplayedTimeStamp: Integer;
  BadBlocks: TBlockList;
  vObj: TObject;
  TopLeakRefs: TList;
  MinIdx: Integer;
begin
  //Initalize:
  if not InitializeOnce then
    Exit;
  UnMemChk;
  {+}

  if FileExists(MemCheckLogFileName + '.$$$') then
  begin
    SetFileAttributes(PChar(MemCheckLogFileName + '.$$$'), FILE_ATTRIBUTE_NORMAL);
    DeleteFile(MemCheckLogFileName + '.$$$');
  end;
  if FileExists(MemCheckLogFileName) then
  begin
    SetFileAttributes(PChar(MemCheckLogFileName), FILE_ATTRIBUTE_NORMAL);
    DeleteFile(MemCheckLogFileName);
  end;

  if NoLogWhenZeroNoLeaks
    and (not (BlocksToShow[MClass] or BlocksToShow[MUser] or BlocksToShow[MReallocedUser])) then
    Exit;
  {+.}

  //bIsLeaks := False;
  asm
    mov bIsLeaks, 0 // Remove  oompiler warning
  end;

  //We collect the list of allocated blocks
  try
    TopLeakRefs := nil;
    LeaksList := nil;
    ChronogicalInfo := nil;
    try
      //Prepare the output file:
      {$I-}
      if (IOResult <> 0) then
        ; //Clears the internal IO error flag
      AssignFile(OutputFile, MemCheckLogFileName + '.$$$');
      if IOResult <> 0 then
        Exit;
      Rewrite(OutputFile);
      if IOResult <> 0 then
        Exit;
      //Prepare the output file.

      //Improve the header
      WriteLn(OutputFile, OutputFileHeader);
      WriteLn(OutputFile, 'Date: ' + FormatDateTime('yyyy-mm-dd, hh:nn:ss:zzz'#13#10, Now));

      // get leaks
      ChronogicalInfo := TLeakList.Create;
      LeaksList := TLeakList.Create;
      GetLeaks(LeaksList, ChronogicalInfo, MaxLeak, StoppedDueToMax);

      // top 10 leaks
      if LeaksList.Count > 0 then
      begin
        TopLeakRefs := TList.Create;
        j := Min(9, LeaksList.Count - 1);
        for i := 0 to j do
          TopLeakRefs.Add(LeaksList.Item(i));

        for i := j + 1 to LeaksList.Count - 1 do
        begin
          MinIdx := 0;
          for j := 0 to TopLeakRefs.Count - 1 do
          begin
            if TLeak(TopLeakRefs[j]).TotalSize < TLeak(TopLeakRefs[MinIdx]).TotalSize then
              MinIdx := j;
          end; //for

          if LeaksList.Item(i).TotalSize > TLeak(TopLeakRefs[MinIdx]).TotalSize then
            TopLeakRefs[MinIdx] := LeaksList.Item(i);
        end; //for

        TopLeakRefs.Sort(SortTLeaks);

        WriteLn(OutputFile, 'TOP 10 Leaks: begin');
        for i := 0 to TopLeakRefs.Count - 1 do
          TLeak(TopLeakRefs[i]).OutputToFile(OutputFile);
        WriteLn(OutputFile, 'TOP 10 Leaks: end'#13#10);

        TopLeakRefs.Free;
        TopLeakRefs := nil;

        if NoLogWhenZeroNoLeaks then
          bIsLeaks := True;
      end;
      // calc total leak
      TotalLeak := 0;
      for i := 0 to ChronogicalInfo.Count - 1 do
          TotalLeak := TotalLeak + ChronogicalInfo.Item(i).Block.AllocatedSize;

      {+}{
      if NoLogWhenZeroNoLeaks and (TotalLeak = 0) and (not (BlocksToShow[MUser] or BlocksToShow[MReallocedUser])) then
      begin
        SetFileAttributes(PChar(MemCheckLogFileName), FILE_ATTRIBUTE_NORMAL);
        DeleteFile(MemCheckLogFileName);
        Exit;
      end;
      {+.}

      //Improve the header TotalLeak
      if TotalLeak > 0 then
      begin
        if StoppedDueToMax then
          WriteLn(OutputFile, 'Total leak not accurate due to MaxLeak constant reached, but at least ',
            TotalLeak, ' bytes'#13#10)
        else
          WriteLn(OutputFile, 'Total leak: ', TotalLeak, ' bytes'#13#10);

        if NoLogWhenZeroNoLeaks then
          bIsLeaks := True;
      end;

      //We output the memory leaks
      if LeaksList.Count > 0 then
      begin
        WriteLn(OutputFile, #13#10'*** MEMCHK: Blocks STILL allocated ***'#13#10);
        for i := 0 to LeaksList.Count - 1 do
          LeaksList.Item(i).OutputToFile(OutputFile);
        WriteLn(OutputFile, '*** MEMCHK: End of allocated blocks ***'#13#10);
      end;

      //We give chronological info
      if ChronogicalInfo.Count > 0 then
      begin
        WriteLn(OutputFile, #13#10'*** MEMCHK: Chronological leak information ***'#13#10);
        if TimeStampsCount > 0 then
          WriteLn(OutputFile, '  Time stamp: "', TimeStamps[0], '"');
        LastDisplayedTimeStamp := 0;
        for i := ChronogicalInfo.Count - 1 downto 0 do
        begin
          if (TimeStampsCount > 0) and (ChronogicalInfo.Item(i).Block.LastTimeStamp > LastDisplayedTimeStamp) then
          begin
            for j := LastDisplayedTimeStamp + 1 to ChronogicalInfo.Item(i).Block.LastTimeStamp do
              WriteLn(OutputFile, '  Time stamp: "', TimeStamps[j], '"');
            LastDisplayedTimeStamp := ChronogicalInfo.Item(i).Block.LastTimeStamp;
          end;
          ChronogicalInfo.Item(i).OutputOneLineToFile(OutputFile);
        end;
        for j := LastDisplayedTimeStamp + 1 to TimeStampsCount - 1 do
          WriteLn(OutputFile, '  Time stamp: "', TimeStamps[j], '"');
        WriteLn(OutputFile, #13#10'*** MEMCHK: End of chronological leak information ***'#13#10);
        //bIsLeaks := True;
      end;

      //Output the allocation stats if necessary
      if CollectStatsAboutObjectAllocation and ((TotalLeak > 0) or (AllocStatsCount > 0)) then
      begin
        WriteLn(OutputFile, #13#10'*** MEMCHK: Allocation stats ***'#13#10);
        if TotalLeak > 0 then
          WriteLn(OutputFile, #9'The information is not accurate since there are memory leaks'#13#10);
        if AllocStatsCount > 0 then
        begin
          WriteLn(OutputFile, #9'Nb instances'#9'Instance size'#9'ClassName');
          for i := 0 to AllocStatsCount - 1 do
          begin
            WriteLn(OutputFile, #9, AllocatedInstances[i], #9#9, AllocatedObjectsClasses[i].InstanceSize,
              #9#9, AllocatedObjectsClasses[i].ClassName);
          end;
          //bIsLeaks := True;
        end;
        WriteLn(OutputFile, #13#10'*** MEMCHK: End of allocation stats ***'#13#10);
      end;

      if ComputeMemoryUsageStats and (MemoryUsageStatsCount > 0) then
      begin
        WriteLn(OutputFile, #13#10'*** MEMCHK: Memory usage stats ***'#13#10);
        for i := 0 to MemoryUsageStatsCount - 1 do
          WriteLn(OutputFile, #9, MemoryUsageStats[i]);
        WriteLn(OutputFile, #13#10'*** MEMCHK: End of memory usage stats ***'#13#10);
      end;
      if KeepMaxMemoryUsage then
      begin
        WriteLn(OutputFile, #13#10'*** Biggest memory usage was: ', MaxMemoryUsage, ' ***' +
          #13#10#13#10#13#10);
      end;

     //Get and output the damaged blocks if necessary
      BadBlocks := TBlockList.Create;
      if CheckWipedBlocksOnTermination then
      begin
        GetBadBlocks(BadBlocks, MaxLeak, DoNotCheckWipedBlocksBiggerThan, StoppedDueToMax);
        if BadBlocks.Count > 0 then
        begin
          WriteLn(OutputFile, #13#10'*** MEMCHK: Blocks written to after destruction ***'#13#10);
          if StoppedDueToMax then
            WriteLn(OutputFile,
              #9'Number of bad blocks not accurate  due to MaxLeak constant reached, but at least ',
              BadBlocks.Count, #13#10)
          else
            WriteLn(OutputFile, #9'Bad blocks count: ', BadBlocks.Count, #13#10);

          for i := 0 to BadBlocks.Count - 1 do
          begin
            {+}
            if BadBlocks.Item(i).IgnoreTrace = 0 then
              Continue;
            {+.}
            WriteLn(OutputFile, #9'* Destroyed block damaged');
            WriteLn(OutputFile, #9#9'Call stack at allocation time:');
            Write(OutputFile, CallStackTextualRepresentation(BadBlocks.Item(i).CallerAddress, #9#9#9));
            WriteLn(OutputFile, #9#9'Destroyed at: ',
              TextualDebugInfoForAddress(Cardinal(BadBlocks.Item(i).DestructionAdress)));
          end;

          WriteLn(OutputFile, #13#10'*** MEMCHK: End of blocks written to after destruction ***'#13#10);

          if NoLogWhenZeroNoLeaks then
            bIsLeaks := True;
        end;
      end;
      BadBlocks.Destroy;

     //Save and display the output file
      Close(OutputFile);
      if FileExists(MemCheckLogFileName) then
      begin
        SetFileAttributes(PChar(MemCheckLogFileName), FILE_ATTRIBUTE_NORMAL);
        DeleteFile(MemCheckLogFileName);
      end;

      if bIsLeaks or (not NoLogWhenZeroNoLeaks) then
        Rename(OutputFile, MemCheckLogFileName);

      if {+} AllowNotepadErrorInfo and {+.} ShowLogFileWhenUseful and (LeaksList.Count > 0) or
        CollectStatsAboutObjectAllocation or ComputeMemoryUsageStats or KeepMaxMemoryUsage then
        WinExec(PAnsiChar(AnsiString(NotepadApp + ' ' + MemCheckLogFileName)), SW_SHOW);

    finally
      Close(OutputFile);
      if FileExists(MemCheckLogFileName + '.$$$') then
        DeleteFile(MemCheckLogFileName + '.$$$');
      if TopLeakRefs <> nil then
        TopLeakRefs.Free;
      //Release the memory
      if LeaksList <> nil then
      begin
        for i := LeaksList.Count - 1 downto 0 do
        begin
          vObj := LeaksList.Item(i);
          LeaksList.fItems[i] := nil;
          if vObj <> nil then
            vObj.Destroy;
        end;
        LeaksList.Destroy;
      end;
      if ChronogicalInfo <> nil then
        ChronogicalInfo.Destroy;
    end;
  except
    //on e: Exception do
    //  OutputDebugString('ERROR(MemCheck: OutputAllCollectedInformation): ' + e.Message);
  end;
end;

procedure AddTimeStampInformation(const i: string);
begin
  if not InitializeOnce then
    Exit;

  if TimeStampsCount = TimeStampsAllocated then
  begin
    if TimeStampsAllocated = 0 then
      TimeStampsAllocated := 10;
    TimeStampsAllocated := TimeStampsAllocated * 2;

    MemCheckActive := False;
    try
      ReAllocMem(TimeStamps, TimeStampsAllocated * SizeOf(WideString));
      ZeroMemory(Pointer(Integer(TimeStamps) + TimeStampsCount * SizeOf(WideString)),
        (TimeStampsAllocated - TimeStampsCount) * SizeOf(WideString));
    finally
      MemCheckActive := True;
    end;
  end;

  TimeStamps[TimeStampsCount] := i + ' (Time stamp: ' + IntToStr(TimeStampsCount) + ')';
  TimeStampsCount := TimeStampsCount + 1;
end;

procedure MemChk;
var
  NewMemoryManager: TMemoryManagerRec;

  procedure FillMemoryManagerRec(var AMemoryManager: TMemoryManagerRec);
  begin
    AMemoryManager := OldMemoryManager;
    (*
    {$IFDEF D10_UP}
    {Extended (optional) functionality.}
    with AMemoryManager do
    begin
      AllocMem := OldMemoryManager.AllocMem;
      RegisterExpectedMemoryLeak := OldMemoryManager.RegisterExpectedMemoryLeak;
      UnregisterExpectedMemoryLeak := OldMemoryManager.UnregisterExpectedMemoryLeak;
    end;
    {$ENDIF}
    //*)
  end;

  procedure do_detect_compiler;
  begin
    FillMemoryManagerRec(NewMemoryManager);
    with NewMemoryManager do
    begin
      GetMem := LeakTrackingGetMemInit;
    end;
    SetMemoryManager(NewMemoryManager);
    with TObject{TLeakInitObject}.Create do
      Free;
    SetMemoryManager(OldMemoryManager);
    {$IFDEF DEBUG}
    if CallerIsNewInstanceDetected <= 0 then // TODO: when usage FastObj.pas
      OutputDebugString('MemCheck (ERROR): cannot detect of call NewInstance');
    {$ENDIF}
  end;

begin
  {+}
  (*
  //Assert(SizeOf(TMemoryBlockHeader) mod 8 = 0, 'SizeOf(TMemoryBlockHeader) in MemCheck should be a multiple of 8');
  {$IFDEF DEBUG}
  if (SizeOf(TMemoryBlockHeader) mod 8) <> 0 then
  begin
    OutputDebugString('MemCheck (ERROR): SizeOf(TMemoryBlockHeader) in MemCheck should be a multiple of 8;'
      + ' SizeOf(TMemoryBlockHeader) = ' + IntToStr(SizeOf(TMemoryBlockHeader)));
    Exit;
  end;
  {$ENDIF}
  //*)
  {+.}

  if not MemCheckActive then
  begin
    if not InitializeOnce then
      Exit;

    {+}
    if CallerIsNewInstanceDetected < 0 then
      do_detect_compiler;
// TODO: not work CallerIsNewInstance when hooked TObject.NewInstance. Need calculate AddressOfNewInstance. AddressOfNewInstance := detect jump from code ...
    //if CallerIsNewInstanceDetected <= 0 then
    //  Exit;
    {+.}

    if CheckHeapStatus then
    begin
      FillMemoryManagerRec(NewMemoryManager);
      with NewMemoryManager do
      begin
        GetMem := HeapCheckingGetMem;
        FreeMem := HeapCheckingFreeMem;
        ReAllocMem := HeapCheckingReallocMem;
      end;
      SetMemoryManager(NewMemoryManager);
      UpdateLastHeapStatus;
    end
    else
    begin
      FillMemoryManagerRec(NewMemoryManager);
      with NewMemoryManager do
      begin
        GetMem := LeakTrackingGetMem;
        FreeMem := LeakTrackingFreeMem;
        ReAllocMem := LeakTrackingReallocMem;
      end;
      SetMemoryManager(NewMemoryManager);
    end;
    MemCheckActive := True;
  end;
end;

procedure CommitReleases;
var
  Block, BlockToFree, Previous: PMemoryBlockHeader;
begin
  if not InitializeOnce then
    Exit;

  Block := LastBlock;
  Previous := nil;

  while Block <> nil do
  begin
    BlockToFree := Block;
    Block := Block.PreceedingBlock;

    if MemoryBlockFreed(BlockToFree) then
    begin
      if LastBlock = BlockToFree then
        LastBlock := Block;

      if Previous <> nil then
        Previous.PreceedingBlock := Block;

      OldMemoryManager.FreeMem(BlockToFree);
    end
    else
      Previous := BlockToFree;
  end;
end;

function CallStackTextualRepresentation(const S: TCallStack; const LineHeader: string): string;
var
  i: Integer;
  sDI: string;
begin
  i := 0;
  Result := '';
  while (i <= StoredCallStackDepth) and (S[i] <> nil) do
  begin
    sDI := TextualDebugInfoForAddress(Cardinal(S[i]));
    if (sDI <> '') then
      Result := Result + LineHeader + 'call stack - ' + IntToStr(i) + ' : ' + sDI + #13#10;
    i := i + 1;
  end;
end;

var
  Displ: Cardinal;
  {Displ is the displacement of the code in the executable file. The code in SetDispl was written by Juan Vidal Pich}

procedure SetDispl;
var
  NTHeader: PImageFileHeader;
  NTOptHeader: PImageOptionalHeader;
begin
  //-> If you have a compilation error in this routine and you are compiling with delphi 4, I'd say that you did not install the Delphi update pack 3
  NTHeader := PImageFileHeader(Cardinal(PImageDosHeader(HInstance)._lfanew) + HInstance + 4);
  { SizeOf(IMAGE_NT_SIGNATURE) = 4 }
  NTOptHeader := PImageOptionalHeader(Cardinal(NTHeader) + IMAGE_SIZEOF_FILE_HEADER);
  Displ := HInstance + NTOptHeader.BaseOfCode;
  //Result := HInstance + PImageNtHeaders(LongInt(HInstance)+PImageDosHeader(HInstance)^._lfanew)^.OptionalHeader.BaseOfCode;
end;

function CardinalToHexa(i: Cardinal): string;
const
  HexChars: array[0..15] of Char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
var
  j: Integer;
begin
  Result := '';
  for j := 1 to 8 do
  begin
    Result := HexChars[i and $0F] + Result;
    i := i shr 4;
  end;
end;

{+}

{$IFNDEF USE_JEDI}
function GetDbgInfoByAddrS(const Addr: Pointer; var AFile, AModule, AProc: string; var ALine: Integer): Boolean;
var
  TheAddress, AddressInDebugInfos: Cardinal;
  u: TUnitDebugInfos;
begin
  Result := False;
  AFile := '';
  AModule := '';
  AProc := '';
  ALine := 0;
  if not InitializeOnce then
    Exit;
  TheAddress := Cardinal(Addr);
  if UseDebugInfos and (TheAddress > Displ) then
  begin
    AddressInDebugInfos := TheAddress - Displ;
    u := UnitWhichContainsAddress(AddressInDebugInfos);
    if u <> nil then
    begin
      Result := True;
      AModule := u.Name;
      AProc := RoutineWhichContainsAddress(AddressInDebugInfos);
      ALine := u.LineNumWhichContainsAddress(AddressInDebugInfos)
    end
  end;
end;
{$ENDIF}

function TextualDebugInfoForAddressEx(const TheAddress: Cardinal; var bIsDebugInfo: Boolean): string;
var
  _file, _module, _proc: string;
  _line: Integer;
  bMapOfAddr: Boolean;
begin
  bIsDebugInfo := False;
  _line := 0;
  _file := '';
  bMapOfAddr := GetDbgInfoByAddrS(Pointer(TheAddress), _file, _module, _proc, _line);
  if bMapOfAddr then
  begin
    Result := Format('($%p) %s:%s', [Pointer(TheAddress), _module, _proc]);
    if _line > 0 then
      Result := Result + ':' + IntToStr(_line);
    {$IFDEF USE_JEDI}
    if _file <> '' then
      Result := Result + ' (' + _file + ')'
    else
      Result := Result + NoDebugInfo;
    {$ENDIF}
  end
  else if not SkipNullDebugInfo then
    Result := Format('($%p) %s', [Pointer(TheAddress), NoDebugInfo])
  else
    Result := '';
  bIsDebugInfo := _line > 0;
end;

function TextualDebugInfoForAddress(const TheAddress: Cardinal): string;
var
  bIsDebugInfo: Boolean;
begin
  Result := TextualDebugInfoForAddressEx(TheAddress, bIsDebugInfo);
end;

function IsCharsInString(const sChars, S: string): Boolean; //{$ifdef _inline_}inline;{$endif}
var
  i: Integer;
begin
  Result := False;
  i := Length(sChars);
  if i > 0 then
  begin
    for i := 1 to i do
    begin
      if Pos(sChars[i], S) <= 0 then
        Exit;
    end;
    Result := True;
  end;
end;

function GetFilterFromParameters(var pBlocksToShow: TBlocksToShow; const sLevels: string): Boolean;
var
  i: Integer;
  sParam: string;
  iPos, iLenParam: Integer;
const
  cParMin = '/memcheck';
  iLenMin = Length(cParMin);
begin
  Result := False;
  if sLevels = '' then
  begin
    for i := 1 to ParamCount do
    begin
      sParam := LowerCase(ParamStr(i));
      iPos := Pos(cParMin, sParam);
      if iPos = 1 then
      begin
        iLenParam := Length(sParam);
        if iLenParam > iLenMin then
        begin
          sParam := sParam + '000';
          sParam := Copy(sParam, iLenMin + 1, 3);
          if (sParam = '000') or not IsCharsInString(sParam, '01') then
            Exit;
          pBlocksToShow[MClass] := sParam[1] = '1';
          pBlocksToShow[MUser] := sParam[2] = '1';
          pBlocksToShow[MReallocedUser] := sParam[3] = '1';
        end
        else
        begin
          pBlocksToShow[MClass] := True;
          pBlocksToShow[MUser] := True;
          pBlocksToShow[MReallocedUser] := True;
        end;
        Result := True;
        Break;
      end;
    end;
  end
  else if sLevels <> #0 then
  begin
    sParam := Copy(Trim(sLevels) + '000', 1, 3);
    if (sParam = '000') or not IsCharsInString(sParam, '01') then
      Exit;
    pBlocksToShow[MClass] := sParam[1] = '1';
    pBlocksToShow[MUser] := sParam[2] = '1';
    pBlocksToShow[MReallocedUser] := sParam[3] = '1';
    Result := True;
  end;
end;

const
  cCmdLineSwitchChars = ['/','-'];

function FxtFindCmdLineSwitchValue(const Switch: string; out SwitchValue: string;
  IgnoreCase: Boolean = True; const Chars: TSysCharSet = cCmdLineSwitchChars): Boolean;
{
 examples:
   /SwitchName=Value
   -SwitchName=Value
   SwitchName=Value
}
var
  i, iPos, iStartPos: Integer;
  S: string;
  vSwitchName: string;
  bIsEmptyChars: Boolean;
begin
  if (ParamCount > 0) and (Switch <> '') then
  begin
    bIsEmptyChars := Chars = [];
    if not bIsEmptyChars then
      iStartPos := 3
    else
      iStartPos := 2;
    if IgnoreCase then
      vSwitchName := AnsiLowerCase(Switch)
    else
      vSwitchName := Switch;
    for i := 1 to ParamCount do
    begin
      S := ParamStr(i);
      if (Length(S) > iStartPos) and (bIsEmptyChars or (AnsiChar(S[1]) in Chars)) then
      begin
        if IgnoreCase then
          S := AnsiLowerCase(S);
        if Chars = [] then
          S := Copy(S, 1, Length(S));
        iPos := Pos('=', S);
        if iPos >= iStartPos then
        begin
          if Trim(Copy(S, iStartPos - 1, iPos - iStartPos + 1)) = vSwitchName then
          begin
            SwitchValue := Copy(ParamStr(i), iPos + 1, Length(S) - iPos);
            Result := True;
            Exit;
          end;
        end;
      end;
    end;
  end;
  SwitchValue := #0;
  Result := False;
end;

function FxtGetCmdLineSwitchValue(const Switch: string; IgnoreCase: Boolean = True;
  const Chars: TSysCharSet = cCmdLineSwitchChars): string;
begin
  FxtFindCmdLineSwitchValue(Switch, Result, IgnoreCase, Chars);
end;

procedure ParseParamsAndInit(const sLevels: string = ''; bParseCmdLine: Boolean = False);
var
  vBlocksToShow: TBlocksToShow;
begin
  if ( bParseCmdLine and GetFilterFromParameters(vBlocksToShow, FxtGetCmdLineSwitchValue('MemCheck')) )
    or GetFilterFromParameters(vBlocksToShow, sLevels) then
  begin
    BlocksToShow := vBlocksToShow;
    if (MemCheckInitialized < 0) and FileExists(MemCheckLogFileName) then
    begin
      SetFileAttributes(PChar(MemCheckLogFileName), FILE_ATTRIBUTE_NORMAL);
      DeleteFile(MemCheckLogFileName);
    end;
    MemChk;
  end;
end;

function GetLocalComputerUserName: string;
var
  iLength: DWord;
begin
  Result := '';
  iLength := 0;
  GetUserName(nil, iLength);
  if iLength > 0 then
  begin
    SetLength(Result, iLength);
    GetUserName(PChar(Result), iLength);
    Result := StrPas(PChar(Result));
  end;
end;

function MemCheckInit(const sLevels: string): Boolean;
begin
  if not MemCheckActive then
    ParseParamsAndInit(sLevels, False);
  Result := MemCheckActive;
end;

function MemCheckInitByFilter(ClassFilter, UserFilter, ReallocedUserFilter: Boolean): Boolean;
begin
  if (ClassFilter or UserFilter or ReallocedUserFilter) then
  begin
    BlocksToShow[MClass] := ClassFilter;
    BlocksToShow[MUser] := UserFilter;
    BlocksToShow[MReallocedUser] := ReallocedUserFilter;
    if (MemCheckInitialized <0) and FileExists(MemCheckLogFileName) then
    begin
      SetFileAttributes(PChar(MemCheckLogFileName), FILE_ATTRIBUTE_NORMAL);
      DeleteFile(MemCheckLogFileName);
    end;
    if not MemCheckActive then
      MemChk;
  end
  else
  begin
    if MemCheckActive then
      UnMemChk;
    BlocksToShow[MClass] := False;
    BlocksToShow[MUser] := False;
    BlocksToShow[MReallocedUser] := False;
  end;
  Result := MemCheckActive;
end;

function MemCheckNewTransaction: Integer;
begin
  if MemCheck_LeakTransaction < Cardinal(-1) then // == $FFFFFFFF
    inc(MemCheck_LeakTransaction)
  else
    MemCheck_LeakTransaction := 1;
  Result := MemCheck_LeakTransaction;
end;

function MemCheckGetTransactionLeaks(LeakTransaction: Cardinal; const OutputFile: Text;
  bRaiseLeakFirstAddress, bRaiseLeakAllAddresses, bCheckWipedBlocks, bHideLeaks: Boolean): Boolean;
var
  MemCheckActiveSave: Boolean;
  ptrLeak: Pointer;

  procedure LGoThroughAllocatedBlocks;
  {traverses the allocated blocks list and for each one, raises exceptions showing the memory leaks}
  var
    Block: PMemoryBlockHeader;
    S: string; // ShortString;
    SMsg: string;
    vIsDebugInfo: Boolean;
    vRaiseLeakFirstAddress: Boolean;
  begin
    vRaiseLeakFirstAddress := bRaiseLeakFirstAddress;
    Block := LastBlock; //note: no thread safety issue here
    while Block <> nil do
    begin
      if BlocksToShow[Block.KindOfBlock] and (Block.IgnoreTrace = 0) and (Block.LeakTransaction = LeakTransaction) then
      begin
        if not MemoryBlockFreed(Block) then
        begin
          if ptrLeak = nil then
            ptrLeak := Block.CallerAddress[0];
          if bRaiseLeakAllAddresses or vRaiseLeakFirstAddress then
          begin
            if vRaiseLeakFirstAddress then
              vRaiseLeakFirstAddress := False;
            case Block.KindOfBlock of
              MClass:
                S := TObject(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader).ClassName;
              MUser:
                S := 'User';
              MReallocedUser:
                S := 'Realloc';
            end;
            if (BlocksToShow[Block.KindOfBlock]) and ((Block.KindOfBlock <> MClass) or
              (TObject(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader) is InstancesConformingToForReporting)) then
            try
              SMsg := TextualDebugInfoForAddressEx(Cardinal(Block.CallerAddress[0]), vIsDebugInfo);
              if vIsDebugInfo or IsDebugged then
                raise EMemoryLeak.Create(S + ' allocated at ' + SMsg) at Block.CallerAddress[0];
            except
              on e: EMemoryLeak do
              begin
                if not IsDebugged then
                begin
                  //SysUtils.ShowException(e, Block.CallerAddress[0]);
                  Windows.MessageBox(0, PChar(e.Message), PChar(nil), MB_OK + MB_ICONSTOP);
                end;
              end;
            end;
          end
          else
            Exit;
        end {Block.DestructionAdress = Nil}
        else if bCheckWipedBlocks and (Block.AllocatedSize > 5)
          and (Block.AllocatedSize <= DoNotCheckWipedBlocksBiggerThan) and (not
          IsMemFilledWithChar(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader + 4, Block.AllocatedSize - 5,
          CharToUseToWipeOut)) then
        begin {this is not a leak}
          if ptrLeak = nil then
            ptrLeak := Block.CallerAddress[0];
          if bRaiseLeakAllAddresses or vRaiseLeakFirstAddress then
          begin
            if vRaiseLeakFirstAddress then
              vRaiseLeakFirstAddress := False;
            try
              raise EFreedBlockDamaged.Create('Destroyed block damaged - Block allocated at ' +
                TextualDebugInfoForAddress(Cardinal(Block.CallerAddress[0])) + ' - destroyed at ' +
                TextualDebugInfoForAddress(Cardinal(Block.DestructionAdress)))at Block.CallerAddress[0]
            except
              on EFreedBlockDamaged do
                ;
            end;
          end
          else
            Exit;
        end;

      end; //of: if ...
      Block := Block.PreceedingBlock;
    end; //of: while Block <> nil
  end;

  procedure LOutputAllCollectedInformation;
  var
    LeaksList: TLeakList; // Contains all instances of TLeak
    ChronogicalInfo: TLeakList; // Contains one ore more instance of each TLeak
    StoppedDueToMax: Boolean;
    TotalLeak: Integer;
    i, j: Integer;
    LastDisplayedTimeStamp: Integer;
    BadBlocks: TBlockList;
    vObj: TObject;
    TopLeakRefs: TList;
    MinIdx: Integer;
  begin
    if not (BlocksToShow[MClass] or BlocksToShow[MUser] or BlocksToShow[MReallocedUser]) then
      Exit;
    //We collect the list of allocated blocks
    try
      TopLeakRefs := nil;
      LeaksList := nil;
      ChronogicalInfo := nil;
      BadBlocks := nil;
      try
        //Improve the header
        WriteLn(OutputFile, OutputFileHeader);
        WriteLn(OutputFile, 'Date: ' + FormatDateTime('yyyy-mm-dd, hh:nn:ss:zzz'#13#10, Now));

        // get leaks
        ChronogicalInfo := TLeakList.Create;
        LeaksList := TLeakList.Create;
        GetLeaks(LeaksList, ChronogicalInfo, MaxLeak, StoppedDueToMax, LeakTransaction);

        // top 10 leaks
        if LeaksList.Count > 0 then
        begin
          TopLeakRefs := TList.Create;
          j := Min(9, LeaksList.Count - 1);
          for i := 0 to j do
            TopLeakRefs.Add(LeaksList.Item(i));

          for i := j + 1 to LeaksList.Count - 1 do
          begin
            MinIdx := 0;
            for j := 0 to TopLeakRefs.Count - 1 do
            begin
              if TLeak(TopLeakRefs[j]).TotalSize < TLeak(TopLeakRefs[MinIdx]).TotalSize then
                MinIdx := j;
            end; //for
            if LeaksList.Item(i).TotalSize > TLeak(TopLeakRefs[MinIdx]).TotalSize then
              TopLeakRefs[MinIdx] := LeaksList.Item(i);
          end; //for

          TopLeakRefs.Sort(SortTLeaks);

          WriteLn(OutputFile, 'TOP 10 Leaks: begin');
          for i := 0 to TopLeakRefs.Count - 1 do
            TLeak(TopLeakRefs[i]).OutputToFile(OutputFile);
          WriteLn(OutputFile, 'TOP 10 Leaks: end'#13#10);

          TopLeakRefs.Destroy;
          TopLeakRefs := nil;
        end;

        // calc total leak
        TotalLeak := 0;
        for i := 0 to ChronogicalInfo.Count - 1 do
          TotalLeak := TotalLeak + ChronogicalInfo.Item(i).Block.AllocatedSize;

        //Improve the header TotalLeak
        if TotalLeak > 0 then
        begin
          if StoppedDueToMax then
            WriteLn(OutputFile, 'Total leak not accurate due to MaxLeak constant reached, but at least ',
              TotalLeak, ' bytes'#13#10)
           else
            WriteLn(OutputFile, 'Total leak: ', TotalLeak, ' bytes'#13#10);
        end;
        //We output the memory leaks
        if LeaksList.Count > 0 then
        begin
          WriteLn(OutputFile, #13#10'*** MEMCHK: Blocks STILL allocated ***'#13#10);
          for i := 0 to LeaksList.Count - 1 do
            LeaksList.Item(i).OutputToFile(OutputFile);
          WriteLn(OutputFile, '*** MEMCHK: End of allocated blocks ***'#13#10);
        end;
        //We give chronological info
        if ChronogicalInfo.Count > 0 then
        begin
          WriteLn(OutputFile, #13#10'*** MEMCHK: Chronological leak information ***'#13#10);
          if TimeStampsCount > 0 then
            WriteLn(OutputFile, '  Time stamp: "', TimeStamps[0], '"');
          LastDisplayedTimeStamp := 0;
          for i := ChronogicalInfo.Count - 1 downto 0 do
          begin
            if (TimeStampsCount > 0) and (ChronogicalInfo.Item(i).Block.LastTimeStamp > LastDisplayedTimeStamp) then
            begin
              for j := LastDisplayedTimeStamp + 1 to ChronogicalInfo.Item(i).Block.LastTimeStamp do
                WriteLn(OutputFile, '  Time stamp: "', TimeStamps[j], '"');
              LastDisplayedTimeStamp := ChronogicalInfo.Item(i).Block.LastTimeStamp;
            end;
            ChronogicalInfo.Item(i).OutputOneLineToFile(OutputFile);
          end;
          for j := LastDisplayedTimeStamp + 1 to TimeStampsCount - 1 do
            WriteLn(OutputFile, '  Time stamp: "', TimeStamps[j], '"');
          WriteLn(OutputFile, #13#10'*** MEMCHK: End of chronological leak information ***'#13#10);
        end;

        //Output the allocation stats if necessary
        if CollectStatsAboutObjectAllocation and (AllocStatsCount > 0) then
        begin
          WriteLn(OutputFile, #13#10'*** MEMCHK: Allocation stats ***'#13#10);
          if TotalLeak > 0 then
            WriteLn(OutputFile, #9'The information is not accurate since there are memory leaks'#13#10);
          WriteLn(OutputFile, #9'Nb instances'#9'Instance size'#9'ClassName');
          for i := 0 to AllocStatsCount - 1 do
            WriteLn(OutputFile, #9, AllocatedInstances[i], #9#9, AllocatedObjectsClasses[i].InstanceSize,
              #9#9, AllocatedObjectsClasses[i].ClassName);
          WriteLn(OutputFile, #13#10'*** MEMCHK: End of allocation stats ***'#13#10);
        end;

        if ComputeMemoryUsageStats and (MemoryUsageStatsCount > 0) then
        begin
          WriteLn(OutputFile, #13#10'*** MEMCHK: Memory usage stats ***'#13#10);
          for i := 0 to MemoryUsageStatsCount - 1 do
            WriteLn(OutputFile, #9, MemoryUsageStats[i]);
          WriteLn(OutputFile, #13#10'*** MEMCHK: End of memory usage stats ***'#13#10);
        end;
        if KeepMaxMemoryUsage then
          WriteLn(OutputFile, #13#10'*** Biggest memory usage was: ', MaxMemoryUsage, ' ***' +
            #13#10#13#10#13#10);

        //Get and output the damaged blocks if necessary

        if bCheckWipedBlocks then
        begin
          BadBlocks := TBlockList.Create;
          GetBadBlocks(BadBlocks, MaxLeak, DoNotCheckWipedBlocksBiggerThan, StoppedDueToMax, LeakTransaction);
          if BadBlocks.Count > 0 then
          begin
            WriteLn(OutputFile, #13#10'*** MEMCHK: Blocks written to after destruction ***'#13#10);
            if StoppedDueToMax then
              WriteLn(OutputFile,
                #9'Number of bad blocks not accurate  due to MaxLeak constant reached, but at least ',
                BadBlocks.Count, #13#10)
            else
              WriteLn(OutputFile, #9'Bad blocks count: ', BadBlocks.Count, #13#10);

            {+}
            //if ptrLeak = nil then
            //  ptrLeak := BadBlocks.Item(0).CallerAddress[0];
            {+.}

            for i := 0 to BadBlocks.Count - 1 do
            begin
              {+}
              if BadBlocks.Item(i).IgnoreTrace = 0 then
                Continue;
              {+.}
              WriteLn(OutputFile, #9'* Destroyed block damaged');
              WriteLn(OutputFile, #9#9'Call stack at allocation time:');
              Write(OutputFile, CallStackTextualRepresentation(BadBlocks.Item(i).CallerAddress, #9#9#9));
              WriteLn(OutputFile, #9#9'Destroyed at: ',
                TextualDebugInfoForAddress(Cardinal(BadBlocks.Item(i).DestructionAdress)));

            end;
            WriteLn(OutputFile, #13#10'*** MEMCHK: End of blocks written to after destruction ***'#13#10);
          end;
        end;

      finally
        if TopLeakRefs <> nil then
          TopLeakRefs.Destroy;
        //Release the memory
        if LeaksList <> nil then
        begin
          for i := LeaksList.Count - 1 downto 0 do
          begin
            vObj := LeaksList.Item(i);
            LeaksList.fItems[i] := nil;
            if vObj <> nil then
              vObj.Destroy;
          end;
          LeaksList.Destroy;
        end;
        if ChronogicalInfo <> nil then
          ChronogicalInfo.Destroy;
        if BadBlocks <> nil then
          BadBlocks.Destroy;
      end;
    except
      //on e: Exception do
      //  OutputDebugString('ERROR(MemCheck: LOutputAllCollectedInformation): ' + e.Message);
    end;
  end;

  procedure LHideLeaks;
  var
    Block: PMemoryBlockHeader;
  begin
    Block := LastBlock; //note: no thread safety issue here
    while Block <> nil do
    begin
      if BlocksToShow[Block.KindOfBlock] and (Block.IgnoreTrace = 0) and (Block.LeakTransaction = LeakTransaction) then
      begin
        if not MemoryBlockFreed(Block) then
        begin {this is a leak}
          Block.IgnoreTrace := 1;
        end {Block.DestructionAdress = Nil}
        else if bCheckWipedBlocks and (Block.AllocatedSize > 5)
          and (Block.AllocatedSize <= DoNotCheckWipedBlocksBiggerThan) and (not
          IsMemFilledWithChar(PAnsiChar(Block) + SizeOf_TMemoryBlockHeader + 4, Block.AllocatedSize - 5,
          CharToUseToWipeOut)) then
        begin {this is not a leak}
          Block.IgnoreTrace := 1;
        end;
      end; //of: if ...

      Block := Block.PreceedingBlock;
    end; //of: while Block <> nil
  end;

begin
  Result := False;
  if LeakTransaction = 0 then
    Exit;
  ptrLeak := nil;
  MemCheckActiveSave := MemCheckActive;
  MemCheckActive := False;
  try
    LGoThroughAllocatedBlocks;
    if (ptrLeak = nil) and bRaiseLeakAllAddresses then
      Exit;
    LOutputAllCollectedInformation;
    Result := Assigned(ptrLeak);
    if Result and bHideLeaks then
      LHideLeaks();
  finally
    MemCheckActive := MemCheckActiveSave;
  end;
end;

procedure Unit_Init;
begin
  MemCheckLogFileName := ChangeFileExt(ParamStr(0), // MemCheckLogFileNameSuffix);
    '.' + GetLocalComputerUserName + '.MemCheck.log');
  if MemCheckInitByParamStr then
    ParseParamsAndInit('', True);
end;

procedure Unit_FInit;
begin
  if ExceptProc = @MyExceptProc then
    {Exception logger installed}
    Close(SevereExceptionsLogFile);
  {+}
  if vIgnoredClassList <> nil then
  begin
    vIgnoredClassList.Destroy;
    vIgnoredClassList := nil;
  end;
  {+.}
  if MemCheckInitialized >= 0 then
  begin
    try
      if MemCheckInitialized > 0 then
      begin
        if MemCheckActive then
        begin
          UnMemChk;
          OutputAllCollectedInformation;
          GoThroughAllocatedBlocks;
        end;
        {+}
        // forced restore of "old memory manager"
        {$IFDEF DEBUG}
        if (LastBlock <> nil) then
          OutputDebugString('MemCheck (finalization): Not all memory was FREED ! AV possible.');
        {$ENDIF}
        SetMemoryManager(OldMemoryManager);
        {+.}
      end;
      DoFinalizeOnce;
      if MemCheckInitialized > 0 then
      begin
        MemCheckLogFileName := MemCheckLogFileName + '.$$$';
        if FileExists(MemCheckLogFileName) then
        begin
          SetFileAttributes(PChar(MemCheckLogFileName), FILE_ATTRIBUTE_NORMAL);
          DeleteFile(MemCheckLogFileName);
        end;
      end;
    finally
      {+}
      // quick close exe application
      if (MemCheckInitialized > 0) and {$IFDEF HOOK_ALT}(not IsHookAlt) and {$ENDIF} (not IsLibrary) then
        TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessID), 0);
      {+.}
    end;
  end;
end;
{+.}

procedure dummy; assembler;
{This procedure is never called. It is used for computing the address of MemCheck's finalization.
Hence, it MUST be just before the finalization and be empty. If you want to change that, you'll have
to change the way memcheck's finalization is seeked}
asm
  //Denis. Patch for BDS - function need to have something, otherwise it is thrown by linker
  ret
end;

initialization
  Unit_Init;
finalization
  Unit_FInit;
end.
