(*
  Id: registration.pas,v 1 2008/02/25 15:11:34 Domé Giuliano

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
unit Uregistration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst, DB, DBClient, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Grids, DBGrids;

type
  TFOnlineRegistration = class(TForm)
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EPostalcode: TEdit;
    EAddress: TEdit;
    ELastname: TEdit;
    EFirstname: TEdit;
    RBGender: TRadioGroup;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ECity: TEdit;
    ECompanyname: TEdit;
    EVat: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    EUsername: TEdit;
    EEmailaddress: TEdit;
    EPhonenumber: TEdit;
    EFaxnumber: TEdit;
    Label12: TLabel;
    ESkypename: TEdit;
    Label13: TLabel;
    GroupBox4: TGroupBox;
    RBNewsletter: TCheckListBox;
    EPassword: TEdit;
    EPasswordConfirm: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label20: TLabel;
    CBState: TComboBox;
    CBCountry: TComboBox;
    CBConsultant: TComboBox;
    CBReferral: TComboBox;
    HTTPRequest: TIdHTTP;
    DSCountries: TClientDataSet;
    DSConsultants: TClientDataSet;
    DSSources: TClientDataSet;
    DSStates: TClientDataSet;
    Serial: TEdit;
    PWencrypted: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    EWebsiteURL: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Memo1: TMemo;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LoadCountries(Sender: TObject);
    procedure LoadStates(Sender: TObject);
    procedure LoadConsultants(Sender: TObject);
    procedure LoadSources(Sender: TObject);
    procedure CBCountryChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure HTTPRequestRedirect(Sender: TObject; var dest: String;
      var NumRedirect: Integer; var Handled: Boolean;
      var VMethod: TIdHTTPMethod);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SaveData ;
    { Public declarations }
  end;

var
  FOnlineRegistration: TFOnlineRegistration;

implementation

uses janStrings,wcrypt2;

{$R *.dfm}

function MD5(const Value: string): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7F] of Byte;
  dwHashLen: dWord;
  i: Integer;
begin
  dwHashLen := 16;
  if (Value = '') then
  begin
    Result := 'd41d8cd98f00b204e9800998ecf8427e';
    exit;
  end
  else
    Result := '';

  {get context for crypt default provider}
  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    {create hash-object MD5}
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      {get hash from password}
      if CryptHashData(hHash, @Value[1], Length(Value), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen-1 do
            Result := Result + IntToHex(bHash[i], 2);
        end;
      end;
      {destroy hash-object}
      CryptDestroyHash(hHash);
    end;
    {release the context for crypt default provider}
    CryptReleaseContext(hCryptProvider, 0);
  end;

  Result := AnsiLowerCase(Result);
end;

procedure TFOnlineRegistration.FormDestroy(Sender: TObject);
begin
  SaveData ;
end;

procedure TFOnlineRegistration.FormShow(Sender: TObject);
var
 AList : TStringlist ;
begin

if FileExists(ExtractFilePath(Application.ExeName) + 'countries.xml') then
   DSCountries.LoadFromFile(ExtractFilePath(Application.ExeName) + 'countries.xml');
 LoadCountries(nil);

if FileExists(ExtractFilePath(Application.ExeName) + 'states.xml') then
   DSStates.LoadFromFile(ExtractFilePath(Application.ExeName) + 'states.xml');
 LoadStates(nil);

 if FileExists(ExtractFilePath(Application.ExeName) + 'consultants.xml') then
   DSConsultants.LoadFromFile(ExtractFilePath(Application.ExeName) + 'consultants.xml');
 LoadConsultants(nil);

if FileExists(ExtractFilePath(Application.ExeName) + 'sources.xml') then
   DSSources.LoadFromFile(ExtractFilePath(Application.ExeName) + 'sources.xml');
 LoadSources(nil);

 if FileExists(ExtractFilePath(Application.ExeName) +  'Registration.ini') then
   begin
     AList := TStringlist.create ;
      try
         AList.LoadFromFile(ExtractFilePath(Application.ExeName) +  'Registration.ini');
         RBGender.ItemIndex := StrToIntDef(AList.Values['RBGender'],-1) ;
         EFirstname.Text := AList.Values['EFirstname'] ;
         ELastname.Text := AList.Values['ELastname'] ;
         EAddress.Text := AList.Values['EAddress'] ;
         EPostalcode.Text := AList.Values['EPostalcode'] ;
         ECity.Text := AList.Values['ECity'] ;
         CBCountry.ItemIndex := CBCountry.Items.IndexOfObject(TObject(StrToIntDef(AList.Values['CBCountry'],-1))) ;
         CBCountryChange(self);
         CBState.ItemIndex := CBState.Items.IndexOfObject(TObject(StrToIntDef(AList.Values['CBState'],-1))) ;
         ECompanyname.Text := AList.Values['ECompanyname'] ;
         EWebsiteURL.Text := AList.Values['EWebsiteURL'] ;
         EVat.Text := AList.Values['EVat'] ;
         EUsername.Text := AList.Values['EUsername'] ;
         EEmailaddress.Text := AList.Values['EEmailaddress'] ;
         EPhonenumber.Text := AList.Values['EPhonenumber'] ;
         EFaxnumber.Text := AList.Values['EFaxnumber'] ;
         ESkypename.Text := AList.Values['ESkypename'] ;
         CBConsultant.ItemIndex := CBConsultant.Items.IndexOfObject(TObject(StrToIntDef(AList.Values['CBConsultant'],-1))) ;
         CBReferral.ItemIndex := CBReferral.Items.IndexOfObject(Tobject(StrToIntDef(AList.Values['CBReferral'],-1))) ;
         RBNewsletter.checked[0] := StrToBoolDef(AList.Values['RBNewsletter0'],true);
         RBNewsletter.checked[1] := StrToBoolDef(AList.Values['RBNewsletter1'],true);
         RBNewsletter.checked[2] := StrToBoolDef(AList.Values['RBNewsletter2'],true);
         RBNewsletter.ItemIndex := StrToIntDef(AList.Values['RBNewsletter'],-1) ;
         EPassword.Text := AList.Values['EPassword'] ;
         EPasswordConfirm.Text := AList.Values['EPasswordConfirm'] ;
         if EPassword.Text <> EPasswordConfirm.Text then
           Showmessage('Passwords dont match!');

         // doorgaan Etc

      finally
        AList.free ;
      end;
   end;
end;

procedure TFOnlineRegistration.SaveData;
var
 AList : TStringlist ;
begin
     AList := TStringlist.create ;
      try
         AList.Values['RBGender'] := IntToStr(RBGender.ItemIndex);
         AList.Values['EFirstname'] := EFirstname.Text ;
         AList.Values['ELastname'] := ELastname.Text ;
         AList.Values['EAddress'] := EAddress.Text ;
         AList.Values['EPostalcode'] := EPostalcode.Text ;
         AList.Values['ECity'] := ECity.Text ;
         if CBState.ItemIndex <> -1 then
         AList.Values['CBState'] :=  IntToStr(Integer(CBState.items.Objects[CBState.ItemIndex])) ;
         if CBCountry.ItemIndex <> -1 then
         AList.Values['CBCountry'] :=  IntToStr(Integer(CBCountry.items.Objects[CBCountry.ItemIndex])) ;
         AList.Values['ECompanyname'] := ECompanyname.Text ;
         AList.Values['EWebsiteURL'] := EWebsiteURL.Text ;
         AList.Values['EVat'] := EVat.Text ;
         AList.Values['EUsername'] := EUsername.Text ;
         AList.Values['EEmailaddress'] := EEmailaddress.Text ;
         AList.Values['EPhonenumber'] := EPhonenumber.Text ;
         AList.Values['EFaxnumber'] := EFaxnumber.Text ;
         AList.Values['ESkypename'] := ESkypename.Text ;
         if CBConsultant.ItemIndex <> -1 then
         AList.Values['CBConsultant'] := IntToStr(Integer(CBConsultant.items.Objects[CBConsultant.ItemIndex])) ;
         if CBReferral.ItemIndex <> -1 then
         AList.Values['CBReferral'] :=  IntToStr(Integer(CBReferral.items.Objects[CBReferral.ItemIndex])) ;
         AList.Values['RBNewsletter0'] := BoolToStr(RBNewsletter.Checked[0]);
         AList.Values['RBNewsletter1'] := BoolToStr(RBNewsletter.Checked[1]);
         AList.Values['RBNewsletter2'] := BoolToStr(RBNewsletter.Checked[2]);
         AList.Values['EPassword'] := EPassword.Text ;
         if EPassword.Text <> EPasswordConfirm.Text then
           begin
           Epassword.SetFocus ;
           Epassword.selstart := 0 ;
           Epassword.sellength := 100 ;
           raise Exception.Create ('Passwords dont match!');
           end;

         // doorgaan Etc
         AList.SaveToFile(ExtractFilePath(Application.ExeName) +  'Registration.ini');
      finally
        AList.free ;
      end;
end;

procedure TFOnlineRegistration.LoadCountries(Sender: TObject);
var
  AXml : String ;
begin
  try
    AXml := HTTPRequest.Get('http://www.test.cdgo/registration.php?getcountries=1');
    if AXml <> '' then
      DSCountries.XMLData := AXml ;
    DSCountries.SaveToFile(ExtractFilePath(Application.ExeName) + 'countries.xml',dfXMLUTF8);
  except

  end;
  DSCountries.first ;
  CBCountry.Clear ;
  while not DSCountries.Eof do
    begin
      CBCountry.items.AddObject(DSCountries.fieldByName('countries_name').AsString,TObject(DSCountries.fieldByName('countries_id').AsInteger));
      DSCountries.next ;
    end;
end;

procedure TFOnlineRegistration.LoadStates(Sender: TObject);
var
  AXml : String ;
begin
  try
    AXml := HTTPRequest.Get('http://www.test.cdgo.nl/registration.php?getstates=1');
    if AXml <> '' then
      DSStates.XMLData := AXml ;
    DSStates.SaveToFile(ExtractFilePath(Application.ExeName) + 'states.xml',dfXMLUTF8);
  except

  end;

end;

procedure TFOnlineRegistration.LoadConsultants(Sender: TObject);
var
  AXml : String ;
begin
  try
    AXml := HTTPRequest.Get('http://www.test.cdgo.nl/registration.php?getconsultants=1');
    if AXml <> '' then
      DSConsultants.XMLData := AXml ;
    DSConsultants.SaveToFile(ExtractFilePath(Application.ExeName) + 'consultants.xml',dfXMLUTF8);
  except

  end;
  DSConsultants.first ;
  CBConsultant.Clear ;
  while not DSConsultants.Eof do
    begin
      CBConsultant.items.AddObject(DSConsultants.fieldByName('consultants_name').AsString,TObject(DSConsultants.fieldByName('consultants_id').AsInteger));
      DSConsultants.next ;
    end;
end;

procedure TFOnlineRegistration.LoadSources(Sender: TObject);
var
  AXml : String ;
begin
  try
    AXml := HTTPRequest.Get('http://www.test.cdgo.nl/registration.php?getsources=1');
    if AXml <> '' then
      DSSources.XMLData := AXml ;
    DSSources.SaveToFile(ExtractFilePath(Application.ExeName) + 'sources.xml',dfXMLUTF8);
  except

  end;
  DSSources.first ;
  CBReferral.Clear ;
  while not DSSources.Eof do
    begin
      CBReferral.items.AddObject(DSSources.fieldByName('sources_name').AsString,TObject(DSSources.fieldByName('sources_id').AsInteger));
      DSSources.next ;
    end;
end;


procedure TFOnlineRegistration.CBCountryChange(Sender: TObject);
begin
  CBState.Clear ;
  if CBCountry.ItemIndex = -1 then exit ;

  DSStates.Filtered := false ;
  DSStates.Filter := 'zone_country_id=' + IntToStr(Integer(CBCountry.Items.Objects[CBCountry.ItemIndex]));
  DSStates.Filtered := true ;
  DSStates.first ;
  while not DSStates.Eof do
    begin
      CBState.items.AddObject(DSStates.fieldByName('zone_name').AsString,TObject(DSStates.fieldByName('zone_id').AsInteger));
      DSStates.next ;
    end;
end;

procedure TFOnlineRegistration.Button1Click(Sender: TObject);
var
  AXml,ARegString : String ;
begin

         if EPassword.Text <> EPasswordConfirm.Text then
           begin
           Epassword.SetFocus ;
           Epassword.selstart := 0 ;
           Epassword.sellength := 100 ;
           raise Exception.Create ('Passwords dont match!');
           end;


   if RBGender.ItemIndex = 0 then ARegString := RBGender.Name +'=m' else ARegString := RBGender.Name +'=f'  ;
  ARegString := ARegString +'&' + EFirstname.Name +'='+  URLEncode(EFirstname.text) ;
  ARegString := ARegString +'&' + ELastname.Name +'='+ URLEncode(ELastname.text) ;
  ARegString := ARegString +'&' + EAddress.Name +'='+ URLEncode(EAddress.text) ;
  ARegString := ARegString +'&' + EPostalcode.Name +'='+ URLEncode(EPostalcode.text) ;
  ARegString := ARegString +'&' + ECity.Name +'='+ URLEncode(ECity.text) ;
  ARegString := ARegString +'&' + CBState.Name +'='+ URLEncode(IntToStr(Integer(CBState.items.Objects[CBState.ItemIndex]))) ;
  ARegString := ARegString +'&' + CBCountry.Name +'='+ URLEncode(IntToStr(Integer(CBCountry.items.Objects[CBCountry.ItemIndex]))) ;
  ARegString := ARegString +'&' + ECompanyname.Name +'='+ URLEncode(ECompanyname.text) ;
  ARegString := ARegString +'&' + EWebsiteURL.Name +'='+ URLEncode(EWebsiteURL.text) ;
  ARegString := ARegString +'&' + EVat.Name +'='+ URLEncode(EVat.text) ;
  ARegString := ARegString +'&' + EUsername.Name +'='+ URLEncode(EUsername.text) ;
  ARegString := ARegString +'&' + EEmailaddress.Name +'='+ URLEncode(EEmailaddress.text) ;
  ARegString := ARegString +'&' + EPhonenumber.Name +'='+ URLEncode(EPhonenumber.text) ;
  ARegString := ARegString +'&' + EFaxnumber.Name +'='+ URLEncode(EFaxnumber.text) ;
  ARegString := ARegString +'&' + ESkypename.Name +'='+ URLEncode(ESkypename.text) ;
  ARegString := ARegString +'&' + CBConsultant.Name +'='+ URLEncode(IntToStr(Integer(CBConsultant.items.Objects[CBConsultant.ItemIndex]))) ;
  ARegString := ARegString +'&' + CBReferral.Name +'='+ URLEncode(IntToStr(Integer(CBReferral.items.Objects[CBReferral.ItemIndex]))) ;
   if URLEncode(BoolToStr(RBNewsletter.Checked[0])) = '0' then ARegString := ARegString +'&' + RBNewsletter.Name +'0=0' else ARegString := ARegString +'&' + RBNewsletter.Name +'0=1' ;
   if URLEncode(BoolToStr(RBNewsletter.Checked[1])) = '0' then ARegString := ARegString +'&' + RBNewsletter.Name +'1=0' else ARegString := ARegString +'&' + RBNewsletter.Name +'1=1' ;
   if URLEncode(BoolToStr(RBNewsletter.Checked[2])) = '0' then ARegString := ARegString +'&' + RBNewsletter.Name +'2=0' else ARegString := ARegString +'&' + RBNewsletter.Name +'2=1' ;
//  ARegString := ARegString +'&' + RBNewsletter.Name +'0='+ URLEncode(BoolToStr(RBNewsletter.Checked[0])) ;
//  ARegString := ARegString +'&' + RBNewsletter.Name +'1='+ URLEncode(BoolToStr(RBNewsletter.Checked[1])) ;
//  ARegString := ARegString +'&' + RBNewsletter.Name +'2='+ URLEncode(BoolToStr(RBNewsletter.Checked[2])) ;
  ARegString := ARegString +'&' + EPassword.Name +'='+ (md5('41'+ EPassword.Text) +':41') ;
  memo1.Lines.add(ARegString) ;
  try
    AXml := HTTPRequest.Get('http://www.test.cdgo.nl/registration.php?'+ARegString);
    Serial.text := AXml ;
  except
    showmessage('Error not online');

  ARegString := ARegString +'&' + 'Serial=' + AXml ;

  try
//    AXml := HTTPRequest.Get('http://www.test.cdgo.nl/registration2.php?'+ARegString);
  memo1.Lines.add(ARegString) ;
  except
    showmessage('Error not online');

    end;
  end;
end;

procedure TFOnlineRegistration.HTTPRequestRedirect(Sender: TObject; var dest: String;
  var NumRedirect: Integer; var Handled: Boolean;
  var VMethod: TIdHTTPMethod);
begin
 memo1.Lines.add(dest);
end;

procedure TFOnlineRegistration.Button2Click(Sender: TObject);
begin
   Memo1.lines.add(md5('41'+ EPassword.Text) +':41');
end;

end.
