{*********************************************************}
{*              VPCONTACTEDITDLG.PAS 1.03                *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Visual PlanIt                              *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (C) 2002        *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I Vp.INC}

unit VpContactTCEditDlg;

interface

uses
  Windows, Messages, SysUtils,
  {$IFDEF VERSION6} Variants, {$ENDIF}
  Classes, Graphics, Controls, Forms, Dialogs, VpData, ExtCtrls, StdCtrls,
  VpException, VpMisc, VpBase, VpSR, VpDlg, VpBaseDS, ComCtrls,VpSRVars,
  VpEdPop, VpDateEdit;

type
  { forward declarations }
  TVpContactTCEditDialog = class;

  TContactTCEditForm = class(TForm)
    tsContacts: TPageControl;
    tabMain: TTabSheet;
    NameLbl: TLabel;
    AddrLbl: TLabel;
    CityLbl: TLabel;
    StateLbl: TLabel;
    ZipLbl: TLabel;
    CountryLbl: TLabel;
    PositionLbl: TLabel;
    TitleLbl: TLabel;
    CompanyLbl: TLabel;
    NameEdit: TEdit;
    AddressEdit: TEdit;
    CityEdit: TEdit;
    StateEdit: TEdit;
    ZipCodeEdit: TEdit;
    PositionEdit: TEdit;
    TitleEdit: TEdit;
    CompanyEdit: TEdit;
    cboxCategory: TComboBox;
    cboxCountry: TComboBox;
    cboxState: TComboBox;
    edtCountry: TEdit;
    tabContact: TTabSheet;
    tabCustom: TTabSheet;
    pnlBottom: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    tabNotes: TTabSheet;
    NoteEdit: TMemo;
    CustomLbl1: TLabel;
    CustomLbl2: TLabel;
    CustomLbl3: TLabel;
    CustomLbl4: TLabel;
    Custom1Edit: TEdit;
    Custom2Edit: TEdit;
    Custom3Edit: TEdit;
    Custom4Edit: TEdit;
    cboxPhoneLbl4: TComboBox;
    Phone4Edit: TEdit;
    Phone3Edit: TEdit;
    Phone2Edit: TEdit;
    Phone1Edit: TEdit;
    cboxPhoneLbl5: TComboBox;
    Phone5Edit: TEdit;
    EMailLbl: TLabel;
    EMailEdit: TEdit;
    CategoryLbl: TLabel;
    LTelephone1: TLabel;
    LFax: TLabel;
    LTelephone2: TLabel;
    LastNameEdit: TEdit;
    LLAstname: TLabel;
    Freefield1: TLabel;
    EFreeField1: TEdit;
    EFreeField2: TEdit;
    Label4: TLabel;
    EFreeField3: TEdit;
    Label5: TLabel;
    EFreeField4: TEdit;
    Label6: TLabel;
    EFreeField5: TEdit;
    Label7: TLabel;
    EFreeField6: TEdit;
    Label8: TLabel;
    EFreeField7: TEdit;
    Label9: TLabel;
    EFreeField8: TEdit;
    Label10: TLabel;
    EFreeField9: TEdit;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EBirthDay: TVpDateEdit;
    ESpecialDay: TVpDateEdit;
    cbGender: TComboBox;
    Label12: TLabel;
    EFreeField10: TEdit;
    tsFreefields: TTabSheet;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ItemChanged(Sender: TObject);
    procedure cboxCountryChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsContactsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetCaptions;
    procedure DisplayCurrentCountry;
    procedure ResizeControls;
  public
    Resource    : TVpResource;
    Contact     : TVpContact;
    ReturnCode  : TVpEditorReturnCode;
    ControlLink : TVpControlLink;
    procedure PopulateSelf;
    procedure DePopulateSelf;
    procedure ArrangeControls;
  end;

  TVpContactTCEditDialog = class(TVpBaseDialog)
  private
    FOnContactAdd: TNotifyEvent;
    procedure SetOnContactAdd(const Value: TNotifyEvent);
  protected {private}
    ceEditDlg         : TContactTCEditForm;
    ceResource        : TVpResource;
  public
    ceContact         : TVpContact;
    function Execute(Contact: TVpContact): Boolean; reintroduce;
    function AddNewContact: Boolean;
  published
    {properties}
    property ControlLink;
    property DataStore;
    property Placement;
    property OnContactAdd : TNotifyEvent  read FOnContactAdd write SetOnContactAdd;
  end;

implementation
{$R *.dfm}

uses
  VpConst,databaseAccess, UDMTCCoreLink;

{== Utility functions ===================================}

function Max(const a, b : Integer) : Integer;
begin
  if a >= b then
    Result := a
  else
    Result := b;
end;

{== TEditForm ===========================================}

procedure TContactTCEditForm.FormCreate(Sender: TObject);
begin
  ReturnCode := rtAbandon;
  SetCaptions;
end;
{=====}

procedure TContactTCEditForm.SetCaptions;
begin
  OkBtn.Caption := RSOKBtn;
  CancelBtn.Caption := RSCancelBtn;
  NameLbl.Caption := RSNameLbl;
  TitleLbl.Caption := RSTitleLbl;
  AddrLbl.Caption := RSAddressLbl;
  CityLbl.Caption := RSCityLbl;
  StateLbl.Caption := RSStateLbl;
  ZipLbl.Caption := RSZipCodeLbl;
  CountryLbl.Caption := RSCountryLbl;
  CompanyLbl.Caption := RSCompanyLbl;
  PositionLbl.Caption := RSPositionLbl;
  CategoryLbl.Caption := RSCategoryLbl;
  EmailLbl.Caption := RSEmail;
  CustomLbl1.Caption := RSCustom1;
  CustomLbl2.Caption := RSCustom2;
  CustomLbl3.Caption := RSCustom3;
  CustomLbl4.Caption := RSCustom4;
  LTelephone1.Caption := RSPhone1;
  LTelephone2.Caption := RSPhone2;
  LFax.Caption := RSFax;
end;
{=====}

procedure TContactTCEditForm.OKBtnClick(Sender: TObject);
begin
  ReturnCode := rtCommit;
  Close;
end;
{=====}

procedure TContactTCEditForm.CancelBtnClick(Sender: TObject);
begin
  ReturnCode := rtAbandon;
  Close;
end;
{=====}

procedure TContactTCEditForm.DePopulateSelf;
begin
 // ParseName(Contact, NameEdit.Text);
  Contact.LastName := LastNameEdit.Text ;
  Contact.FirstName := NameEdit.Text ;

  Contact.Address := AddressEdit.Text;
  Contact.City := CityEdit.Text;
  if cboxState.Visible then
    Contact.State := cboxState.Text
  else
    Contact.State := StateEdit.Text;
  Contact.Zip := ZipCodeEdit.Text;
  Contact.Position := PositionEdit.Text;
  Contact.Title := TitleEdit.Text;
  Contact.EMail := EMailEdit.Text;
  Contact.Company := CompanyEdit.Text;
  Contact.Phone1 := Phone1Edit.Text;
  Contact.Phone2 := Phone2Edit.Text;
  Contact.Phone3 := Phone3Edit.Text;
  Contact.Phone4 := Phone4Edit.Text;
  Contact.Phone5 := Phone5Edit.Text;
  if cboxCountry.Visible then
    Contact.Country := cboxCountry.Text
  else
    Contact.Country := edtCountry.Text;
  Contact.Note := NoteEdit.Text;
  Contact.Category := cboxCategory.ItemIndex;
  Contact.Custom1 := Custom1Edit.Text;
  Contact.Custom2 := Custom2Edit.Text;
  Contact.Custom3 := Custom3Edit.Text;
  Contact.Custom4 := Custom4Edit.Text;

  Contact.PhoneType1 := 4 ; //cboxPhoneLbl1.ItemIndex;
  Contact.PhoneType2 := 8 ; // cboxPhoneLbl2.ItemIndex;
  Contact.PhoneType3 := 13 ;  //cboxPhoneLbl3.ItemIndex;
  Contact.PhoneType4 := cboxPhoneLbl4.ItemIndex;
  Contact.PhoneType5 := cboxPhoneLbl5.ItemIndex;

  Contact.Category := cboxCategory.ItemIndex;

  Contact.BirthDate := EBirthDay.Date ;
  Contact.Anniversary := ESpecialDay.Date  ;
  case cbGender.ItemIndex of
  -1,0 : Contact.Gender := '' ;
  1 : Contact.Gender := 'M' ;
  2 : Contact.Gender := 'F' ;
  end ; // end case


 Contact.UserField0 :=  EFreeField1.Text  ;
 Contact.UserField1 :=  EFreeField2.Text  ;
 Contact.UserField2 :=  EFreeField3.Text  ;
 Contact.UserField3 :=  EFreeField4.Text  ;
 Contact.UserField4 :=  EFreeField5.Text  ;
 Contact.UserField5 :=  EFreeField6.Text   ;
 Contact.UserField6 :=  EFreeField7.Text  ;
 Contact.UserField7 :=  EFreeField8.Text  ;
 Contact.UserField8 :=  EFreeField9.Text  ;
 Contact.UserField9 :=  EFreeField10.Text ;
end;
{=====}

procedure TContactTCEditForm.PopulateSelf;
var
  CurCountry : Integer;
  i          : TVpPhoneType;
  j          : TVpCategoryType;

begin
   //NameEdit.Text := AssembleName(Contact);
   NameEdit.Text := Contact.FirstName ;
   LastNameEdit.Text := Contact.LastName ;


  AddressEdit.Text := Contact.Address;
  CityEdit.Text := Contact.City;
  ZipCodeEdit.Text := Contact.Zip;
  PositionEdit.Text := Contact.Position;
  TitleEdit.Text := Contact.Title;
  EMailEdit.Text := Contact.EMail;
  CompanyEdit.Text := Contact.Company;
  Phone1Edit.Text := Contact.Phone1;
  Phone2Edit.Text := Contact.Phone2;
  Phone3Edit.Text := Contact.Phone3;
  Phone4Edit.Text := Contact.Phone4;
  Phone5Edit.Text := Contact.Phone5;
  NoteEdit.Text := Contact.Note;
  cboxCategory.ItemIndex := Contact.Category;
  Custom1Edit.Text := Contact.Custom1;
  Custom2Edit.Text := Contact.Custom2;
  Custom3Edit.Text := Contact.Custom3;
  Custom4Edit.Text := Contact.Custom4;
  cboxCountry.Text := Contact.Country;
  edtCountry.Text := Contact.Country;
  if (Contact.Country = '') and (Assigned (ControlLink)) then begin
    if ControlLink.DefaultCountry <> '' then begin
      cboxCountry.Text := ControlLink.DefaultCountry;
      edtCountry.Text := ControlLink.DefaultCountry;
    end else begin
      CurCountry := ControlLink.Localization.GetCurrentCountry;
      if CurCountry >= 0 then begin
        cboxCountry.Text := ControlLink.Localization.Countries.Items[CurCountry].Name;
        edtCountry.Text := ControlLink.Localization.Countries.Items[CurCountry].Name;
      end;
    end;
  end;
  StateEdit.Text := Contact.State;
  cboxState.Text := Contact.State;


  for i := Low (TVpPhoneType) to High (TVpPhoneType) do begin
   // cboxPhoneLbl1.Items.Add (PhoneLabel (i));
   // cboxPhoneLbl2.Items.Add (PhoneLabel (i));
   // cboxPhoneLbl3.Items.Add (PhoneLabel (i));
    cboxPhoneLbl4.Items.Add (PhoneLabel (i));
    cboxPhoneLbl5.Items.Add (PhoneLabel (i));
  end;
 // cboxPhoneLbl1.ItemIndex := Contact.PhoneType1;
 // cboxPhoneLbl2.ItemIndex := Contact.PhoneType2;
 // cboxPhoneLbl3.ItemIndex := Contact.PhoneType3;
  cboxPhoneLbl4.ItemIndex := Contact.PhoneType4;
  cboxPhoneLbl5.ItemIndex := Contact.PhoneType5;

  for j := Low (TVpCategoryType) to High (TVpCategoryType) do
    cboxCategory.Items.Add (CategoryLabel (j));
  cboxCategory.ItemIndex := Contact.Category;

  EBirthDay.Date := Contact.BirthDate ;
  ESpecialDay.Date := Contact.Anniversary ;
  if Contact.Gender = 'M' then
    cbGender.ItemIndex := 1 else
  if Contact.Gender = 'F' then
  cbGender.ItemIndex := 2 else
  cbGender.ItemIndex := 0 ;
  EFreeField1.Text := Contact.UserField0 ;
  EFreeField2.Text := Contact.UserField1 ;
  EFreeField3.Text := Contact.UserField2 ;
  EFreeField4.Text := Contact.UserField3 ;
  EFreeField5.Text := Contact.UserField4 ;
  EFreeField6.Text := Contact.UserField5 ;
  EFreeField7.Text := Contact.UserField6 ;
  EFreeField8.Text := Contact.UserField7 ;
  EFreeField9.Text := Contact.UserField8 ;
  EFreeField10.Text := Contact.UserField9 ;  
  DisplayCurrentCountry;
end;
{=====}

procedure TContactTCEditForm.ItemChanged(Sender: TObject);
begin
  Contact.Changed := true;

  { if there is a comma in the nameedit, then it is assumed that the name is  }
  { formatted as last, first. Since the comma & space aren't actually part of }
  { the name, we need to allow two extra characters in the namefield's width. }
  if Pos(',', NameEdit.Text) > 0 then
    NameEdit.MaxLength := 102
  else
    NameEdit.MaxLength := 100;
end;
{=====}

procedure TContactTCEditForm.ArrangeControls;
begin
  edtCountry.Left := cboxCountry.Left;
  StateEdit.Left := cboxState.Left;

  if (not Assigned (ControlLink)) or
     (ControlLink.Localization.Countries.Count = 0) then begin
    edtCountry.Visible := True;
    CountryLbl.FocusControl := edtCountry;
    cboxCountry.Visible := False;
    StateEdit.Visible := True;
    StateLbl.FocusControl := StateEdit;
    cboxState.Visible := False;
  end
  else begin
    ControlLink.Localization.CountriesToTStrings (cboxCountry.Items);
    CountryLbl.FocusControl := cboxCountry;
    cboxCountry.Visible := True;
    edtCountry.Visible := False;
    StateLbl.FocusControl := cboxState;
    cboxState.Visible := True;
    StateEdit.Visible := False;
  end;
  tsContacts.ActivePage := tabMain;
end;
{=====}

procedure TContactTCEditForm.ResizeControls;

  function GetLabelWidth (ALabel : TLabel) : Integer;
  var
    OldFont : TFont;
    
  begin
    OldFont := TFont.Create;
    try
      OldFont.Assign (Canvas.Font);
      try
        Canvas.Font.Assign (ALabel.Font);
        Result := Canvas.TextWidth (ALabel.Caption);
      finally
        Canvas.Font.Assign (OldFont);
      end;
    finally
      OldFont.Free;
    end;
  end;
  
const
  ComboArrowWidth  = 32;
  FieldVertSep     = 25;
  FormRightBorder  = 20;
  MinFormWidth     = 265;
  FormHeightOffset = 103;
  MinFormHeight    = 250;
  TopField         = 4;

type
  TLabelArray = array[0..9] of TLabel;

var
  Labels : TLabelArray;
  LargestLabel : Integer;
  WidestField  : Integer;
  i            : Integer;
  j            : Integer;
  OldFont      : TFont;
  FieldTop     : Integer;

begin
  { Note: The resizing algorithm is dependent upon the labels having their
    FocusControl property set to the corresponding edit field or combobox. }

  Labels[0] := NameLbl;
  Labels[1] := TitleLbl;
  Labels[2] := AddrLbl;
  Labels[3] := CityLbl;
  Labels[4] := StateLbl;
  Labels[5] := ZipLbl;
  Labels[6] := CountryLbl;
  Labels[7] := CompanyLbl;
  Labels[8] := PositionLbl;
  Labels[9] := CategoryLbl;

  LargestLabel := 0;
  for i := Low(Labels) to High(Labels) do
    LargestLabel := Max(LargestLabel, GetLabelWidth(Labels[i]));

  { Determine height of label based upon whether large or small fonts are
    in effect. }
  for i := Low(Labels) to High(Labels) do begin
    Labels[i].Width := LargestLabel;
    Labels[i].FocusControl.Left := NameLbl.Left + LargestLabel + 4;
  end;

  if cboxCountry.Visible then begin
    WidestField := 0;
    OldFont := TFont.Create;
    try
      Canvas.Font.Assign (cboxCountry.Font);
      try
      for j := 0 to cboxCountry.Items.Count - 1 do begin
        i := Canvas.TextWidth (cboxCountry.Items[j]);
        if i > WidestField then
          WidestField := i;
      end;
      WidestField := WidestField + ComboArrowWidth;
      cboxCountry.Width := WidestField;
      finally
        Canvas.Font.Assign (OldFont);
      end;
    finally
      OldFont.Free;
    end;
    if (cboxCountry.Left + cboxCountry.Width + FormRightBorder > MinFormWidth) and
       (not cboxState.Visible) then
      Width := cboxCountry.Left + cboxCountry.Width + FormRightBorder
    else
      Width := MinFormWidth;
  end;

  if cboxState.Visible then begin
    WidestField := 0;
    OldFont := TFont.Create;
    try
      Canvas.Font.Assign (cboxCountry.Font);
      try
        for j := 0 to cboxState.Items.Count - 1 do begin
          i := Canvas.TextWidth (cboxState.Items[j]);
          if i > WidestField then
            WidestField := i;
        end;
        WidestField := WidestField + ComboArrowWidth;
        cboxState.Width := WidestField;
      finally
        Canvas.Font.Assign (OldFont);
      end;
    finally
      OldFont.Free;
    end;
    if (cboxState.Left + cboxState.Width + FormRightBorder > MinFormWidth) and
       (not cboxCountry.Visible) then
      Width := cboxState.Left + cboxState.Width + FormRightBorder
    else
      Width := MinFormWidth;
  end;

  if (cboxState.Visible) and (cboxCountry.Visible) then begin
    FieldTop := cboxCountry.Left + cboxCountry.Width + FormRightBorder;
    if cboxState.Left + cboxState.Width + FormRightBorder > FieldTop then
      FieldTop := cboxState.Left + cboxState.Width + FormRightBorder;
    if (FieldTop > MinFormWidth) then
      Width := FieldTop
    else
      Width := MinFormWidth;
  end;

  { Vertically arrange the fields. }
  FieldTop := TopField;
  for i := Low(Labels) to High(Labels) do
    if Labels[i].Visible then begin
      Labels[i].FocusControl.Top := FieldTop;
      Labels[i].Top := FieldTop + 2;
      inc(FieldTop, FieldVertSep);
    end;

  if FieldTop + FormHeightOffset > MinFormHeight then
    Height := FieldTop + FormHeightOffset
  else
    Height := MinFormHeight;
end;
{=====}

procedure TContactTCEditForm.DisplayCurrentCountry;
var
  Idx : Integer;

begin
  if not Assigned (ControlLink) then
    Exit;

  Idx := ControlLink.Localization.CountryNameToIndex (cboxCountry.Text);
  if Idx > -1 then begin
    ControlLink.Localization.StatesToTStrings (Idx, cboxState.Items);

    if ControlLink.Localization.Countries.Items[Idx].Address1Visible then begin
      AddrLbl.Visible := True;
      AddressEdit.Visible := True;
      if ControlLink.Localization.Countries.Items[Idx].Address1Caption <> '' then
        AddrLbl.Caption := ControlLink.Localization.Countries.Items[Idx].Address1Caption
      else
        AddrLbl.Caption := 'Address: ';
    end else begin
      AddrLbl.Visible := False;
      AddressEdit.Visible := False;
    end;

    if ControlLink.Localization.Countries.Items[Idx].CityVisible then begin
      CityLbl.Visible := True;
      CityEdit.Visible := True;
      if ControlLink.Localization.Countries.Items[Idx].CityCaption <> '' then
        CityLbl.Caption := ControlLink.Localization.Countries.Items[Idx].CityCaption
      else
        CityLbl.Caption := 'City: ';
    end else begin
      CityLbl.Visible := False;
      CityEdit.Visible := False;
    end;

    if ControlLink.Localization.Countries.Items[Idx].StatesVisible then begin
      StateLbl.Visible := True;
      if ControlLink.Localization.Countries.Items[Idx].States.Count > 0 then begin
        StateLbl.FocusControl := cboxState;
        cboxState.Visible := True;
        StateEdit.Visible := False;
      end else begin
        StateLbl.FocusControl := StateEdit;
        StateEdit.Visible := True;
        cboxState.Visible := False;
        StateEdit.Left := cboxState.Left;
      end;
      if ControlLink.Localization.Countries.Items[Idx].StateCaption <> '' then
        StateLbl.Caption := ControlLink.Localization.Countries.Items[Idx].StateCaption
      else
        StateLbl.Caption := 'State: ';
    end else begin
      StateLbl.Visible := False;
      StateEdit.Visible := False;
      cboxState.Visible := False;
    end;

    if ControlLink.Localization.Countries.Items[Idx].ZipVisible then begin
      ZipLbl.Visible := True;
      ZipCodeEdit.Visible := True;
      if ControlLink.Localization.Countries.Items[Idx].ZipCaption <> '' then
        ZipLbl.Caption := ControlLink.Localization.Countries.Items[Idx].ZipCaption
      else
        ZipLbl.Caption := 'Zip Code: ';
    end else begin
      ZipLbl.Visible := False;
      ZipCodeEdit.Visible := False;
    end;

  end else begin
    cboxState.Items.Clear;

  end;
  ResizeControls;
end;
{=====}

procedure TContactTCEditForm.cboxCountryChange(Sender: TObject);
begin
  StateEdit.Text := '';
  cboxState.Text := '';
  DisplayCurrentCountry;
end;
{=====}


{ TVpContactEditDialog }

function TVpContactTCEditDialog.Execute(Contact: TVpContact): Boolean;
var
  EditForm: TContactTCEditForm;
begin
  ceContact := Contact;
  Result := false;
  Application.CreateForm(TContactTCEditForm, EditForm);
  try
    DoFormPlacement(EditForm);
    SetFormCaption(EditForm, Contact.FullName, RSDlgContactEdit);
    EditForm.Contact := ceContact;
    EditForm.Resource := DataStore.Resource;
    EditForm.ControlLink := ControlLink;
    EditForm.ArrangeControls;
    EditForm.PopulateSelf;
    EditForm.ShowModal;
    if EditForm.ReturnCode = rtCommit then begin
      EditForm.DePopulateSelf;
      Result := true;
    end;
  finally
    EditForm.Release;
  end;

  if Result then begin
    ceContact.Changed := true;
    DataStore.PostContacts;
    DataStore.NotifyDependents;
  end;
end;
{=====}

function TVpContactTCEditDialog.AddNewContact: Boolean;
begin
  result := false;
  if DataStore <> nil then begin
    if DataStore.Resource = nil then
      Exit;
    ceContact := DataStore.Resource.Contacts.AddContact(
      DataStore.GetNextID(ContactsTableName));
    if ceContact <> nil then
      begin
      if assigned(OnContactAdd) then OnContactAdd(self);
      Result := Execute(ceContact);
      if Result then
        DataStore.PostContacts
      else
        FreeAndNil(ceContact);
    end;
  end;
end;
{=====}

procedure TContactTCEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin
    ReturnCode := rtAbandon;
    Close;
  end;
end;
{=====}

procedure TContactTCEditForm.tsContactsChange(Sender: TObject);
begin
  if Visible then
    if tsContacts.ActivePage = tabMain then
      NameEdit.SetFocus
    else if tsContacts.ActivePage = tabContact then
      Phone1Edit.SetFocus
    else if tsContacts.ActivePage = tabCustom then
      Custom1Edit.SetFocus
    else if tsContacts.ActivePage = tabNotes then
      NoteEdit.SetFocus;
end;
{=====}

procedure TContactTCEditForm.FormShow(Sender: TObject);
begin
  tabMain.Caption := gettextlang(2890);
  tabContact.Caption := gettextlang(2891);
  tabNotes.Caption := gettextlang(2892);
  NameLbl.Caption := gettextlang(3029);
  LLAstname.Caption := gettextlang(2047);
 // Label12 // initials
  NoteEdit.MaxLength := DMTCCoreLink.GetFieldLength('CONTACTS','NOTE') ;

  if tsContacts.ActivePage = tabMain then
    NameEdit.SetFocus;
  self.Width := 550 ;
end;
{=====}

procedure TVpContactTCEditDialog.SetOnContactAdd(
  const Value: TNotifyEvent);
begin
  FOnContactAdd := Value;
end;

end.

  
