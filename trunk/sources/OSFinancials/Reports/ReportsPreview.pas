(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ReportsPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, printers,
  ExtCtrls, StdCtrls,qrprntr,quickrpt, Buttons, ComCtrls, Spin, ToolWin,
  ImgList;

type
  // To have a custom preview be used as the default preview,
  // you first define an interface class.  You will provide two
  // functions for this class, Show, and ShowModal.

  TQRMDIPreviewInterface = class(TQRPreviewInterface)
  public
    function Show(AQRPrinter : TQRPrinter) : TWinControl; override;
    function ShowModal(AQRPrinter : TQRPrinter): TWinControl; override;
  end;

  // We need the ParentReport property from TQRCompositeWinControl.  As of
  // the 3.0.4 release, this property is protected.  We create a descendant
  // class and that will give us access to the property
  TQRPatch = class(TQRCompositeWinControl)
  end;

  TfrmReportsPreview = class(TForm)
    QRPreview1: TQRPreview;
    StatusBar: TStatusBar;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    BtnFirst: TToolButton;
    btnPrevPage: TToolButton;
    btnNextPage: TToolButton;
    BtnLast: TToolButton;
    BtnClose: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    BtnPrint: TToolButton;
    BtnSave: TToolButton;
    ImageList1: TImageList;
    btnReRun: TToolButton;
    pnPage: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
    Label1: TLabel;
    SpinEdit: TSpinEdit;
    ProgressBar: TProgressBar;
    procedure btnPrevPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QRPreview1PageAvailable(Sender: TObject; PageNum: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure QRPreview1ProgressUpdate(Sender: TObject; Progress: Integer);
    procedure BtnPrintClick(Sender: TObject);
    procedure SpinEditChange(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure BtnsaveClick(Sender: TObject);
    procedure BtnEMailClick(Sender: TObject);
    procedure btnReRunClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    FQRPrinter : TQRPrinter;
    procedure Init;
    procedure UpdateButtons;
    procedure SetMyWindow;
   
  public
    { Public declarations }
    pQuickreport : TQuickRep;
    bPleaseInit : Boolean;
    bCanPrint: boolean;
    sStatus,
    sTitle : string;
    Procedure ShowDraft(BShow:Boolean);
    constructor CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
    property QRPrinter : TQRPrinter read FQRPrinter write FQRPrinter;
  end;

var
  frmReportsPreview: TfrmReportsPreview;
  PrintPreviewImage : Boolean=False;
  CanPrint: boolean= True;
implementation

uses qrselect, GlobalFunctions, LanguageChoice, Database,
  SendEmailReport, Main, TcVariables, DosTextReports, DatabaseAccess;

{$R *.DFM}

// Now define the functions for the interface class.

function TQRMDIPreviewInterface.Show(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TfrmReportsPreview.CreatePreview(Application, AQRPrinter);

  // You can set options for your preview here
  TfrmReportsPreview(Result).bCanPrint := CanPrint;

  TfrmReportsPreview(Result).Show;
end;

function TQRMDIPreviewInterface.ShowModal(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TfrmReportsPreview.CreatePreview(Application, AQRPrinter);
  // You can set options for your preview here
  TfrmReportsPreview(Result).bCanPrint := CanPrint;

  TfrmReportsPreview(Result).ShowModal;
end;

constructor TfrmReportsPreview.CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
begin
  inherited Create(AOwner);
  QRPrinter := aQRPrinter;
  // Connect the preview component to the report's qrprinter object

  QRPreview1.QRPrinter := aQRPrinter;

  if (QRPrinter <> nil) and (QRPrinter.Title <> '') then
    Caption := QRPrinter.Title;
end;

procedure TfrmReportsPreview.UpdateButtons;
begin
  with QRPreview1 do
  begin
    btnPrevPage.Enabled := PageNumber > 1;
    btnNextPage.Enabled := PageNumber < QRPreview1.QRPrinter.PageCount;
    btnFirst.Enabled:=btnPrevPage.Enabled;
    btnLast.Enabled:=btnNextPage.Enabled;
  end;
  StatusBar.Panels[0].Text := sStatus;
//  StatusBar.Panels[1].Text := 'Page ' + IntToStr(QRPreview1.PageNumber) + ' of ' +
//    IntToStr(QRPreview1.QRPrinter.PageCount);
  Edit1.Text := IntToStr(QRPreview1.PageNumber);
  Label3.Caption := ' '+gettextlang(3005){of}+' '+IntToStr(QRPreview1.QRPrinter.PageCount);
end;

procedure TfrmReportsPreview.btnPrevPageClick(Sender: TObject);
begin
  Application.ProcessMessages;
  with QRPreview1 do
    if PageNumber > 1 then
      PageNumber := PageNumber - 1;
  UpdateButtons;
end;

procedure TfrmReportsPreview.btnNextPageClick(Sender: TObject);
begin
  Application.ProcessMessages;

  with QRPreview1 do
    if PageNumber < QRPreview1.QRPrinter.PageCount then
      PageNumber := PageNumber + 1;
  UpdateButtons;
end;

procedure TfrmReportsPreview.btnCloseClick(Sender: TObject);
begin
  OptionsClose:=True;
  Close;
end;

procedure TfrmReportsPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReportID:=0;
  QRPrinter.ClosePreview(Self);
  Action := caFree;
end;

procedure TfrmReportsPreview.SetMyWindow;
var
  wp: TWindowPlacement;
  Rec: TRect;
begin
  // Get the client area of the desktop so we can force the preview
  // to use all of the available space.  This keeps the user from
  // minizing the form.
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Rec, 0);
  wp.length := sizeof(wp);
  GetWindowPlacement(handle, @wp);
  wp.rcNormalposition := rec;
  setwindowplacement(handle, @wp);
  
end;

procedure TfrmReportsPreview.FormShow(Sender: TObject);
begin
  OptionsClose := True;
  Screen.Cursor := crDefault;
  bPleaseInit := True;
  if (ReportID=10) AND DocDraft then
     ShowDraft(True);
    btnPrint.Caption:= GettextLang(52); //Print 52
    btnSave.Caption:=GettextLang(726);//Save 726
    btnFirst.Caption:=GettextLang(727); //First 727
    btnPrevPage.caption:=GettextLang(728);//Previous 728
    btnNextPage.caption:=GettextLang(729);//Next 729
    btnLast.caption:=GettextLang(730);//Last 730
    btnClose.Caption:=GettextLang(169);//Close 169
    Label1.caption:=GettextLang(731)+' % :';//Zoom 731
    btnReRun.caption:=GettextLang(1029);//Re-Run
end;

procedure TfrmReportsPreview.Init;
var
  OffSet: integer;
begin
  if bPleaseInit then
  begin
    { Force the preview to come up in the zoom setting that we want}
//    QRPreview1.ZoomToFit;
    if  DefZoom<>0 then
      QRPreview1.Zoom := DefZoom;
    SpinEdit.Value:=QRPreview1.Zoom;
    { If the caller reports want to disable printing, then it will set}
    { the following boolean to false }
    if not bCanPrint then
    begin
    end;
    UpdateButtons;

    bPleaseInit := False;
  end;
end;

procedure TfrmReportsPreview.QRPreview1PageAvailable(Sender: TObject;
  PageNum: Integer);
var
  sTitle: string;
begin
  Init;

  sTitle := QRPreview1.QRPrinter.Title;
  if sTitle = '' then
    sTitle := 'Untitled report';
  if QRPreview1.QRPrinter.PageCount = 0 then begin
    OSFMessageDlg(GetTextLang(747){'No Data to Print'},mtinformation,[mbOk],0);
    btnCloseClick(Sender);
    exit;
  end;
  if PageNum = 1 then
    Caption := sTitle + ' - 1 page'
  else
    Caption := sTitle + ' - ' + IntToStr(PageNum) + ' pages';

  case QRPreview1.QRPrinter.Status of
    mpReady: sStatus := 'Ready';
    mpBusy: sStatus := 'Busy';
    mpFinished:
    begin
     Statusbar.Panels[4].Text:=Format('Page Width:%d Height:%d', [QRPreview1.QRPrinter.PaperWidth,QRPreview1.QRPrinter.PaperLength]);
     sStatus := 'Finished';
    end;
  end;
  UpdateButtons;

end;

procedure TfrmReportsPreview.FormCreate(Sender: TObject);
begin
  { We can disable the print functionality at runtime }
  Inherited;
  bCanPrint := True;
  // Put the progress bar on the statusbar
  ProgressBar.Parent := StatusBar;
  PnPage.Parent := StatusBar;
  PnPage.BevelOuter:=bvNone;
  PnPage.BevelInner :=BvNone;
  // Get the client area of the desktop
  SetMyWindow;
  //if dmDatabase.ZSQLMonitor1.Active then
  //  FormStyle := fsNormal ;
end;

procedure TfrmReportsPreview.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
  Exec, Windir : array[0..255] of Ansichar;
begin
  // Let the user navigate through the preview by the keyboard
  if ssShift in Shift then begin
    case Key of
      vk_Down  : With QRPreview1.VertScrollBar do
                   Position := Position + trunc(Range / 10);
      vk_Up    : With QRPreview1.VertScrollBar do
                   Position := Position - trunc(Range / 10);
      vk_Left  : With QRPreview1.HorzScrollBar do
                   Position := Position - trunc(Range / 10);
      vk_Right : With QRPreview1.HorzScrollBar do
                   Position := Position + trunc(Range / 10);
    end;
    if Key in [vk_Down,vk_Up,vk_Left, vk_Right] then
    Key:=0;
  end;
  if Key=VK_F4 then
  begin
    getwindowsdirectoryA(Windir, 255);
    StrPCopy(Exec, StrPas(Windir) + '\Calc.exe ');
    WinExec(Exec, 1);
    Key:=0;
  end;
  case Key of
    13:if edit1.Focused then
               begin
                 Key:=0;
                 with QRPreview1 do
                  if StrToIntDef(Edit1.Text,0) in [1..QRPreview1.QRPrinter.PageCount] then
                      PageNumber := StrToIntDef(Edit1.Text,0);
                 UpdateButtons;     
               end;
    VK_Next :begin
               btnNextPageClick(Self);
               Key:=0;
             end;
    VK_Prior: begin
                btnPrevPageClick(Self);
                Key:=0;
               end;
    VK_Home: begin
               QRPreview1.PageNumber := 1;
               Application.ProcessMessages;
               UpdateButtons;
               Key:=0;
             end;
    VK_End : begin
               QRPreview1.PageNumber := QRPreview1.QRPrinter.PageCount;
               Application.ProcessMessages;
               UpdateButtons;
               Key:=0;
             end;
    VK_Escape : Begin
                 btnCloseClick(Sender);
                  Key:=0;
               end;
   end;
end;



procedure TfrmReportsPreview.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  aRect: TRect;
begin
  if Panel = StatusBar.Panels[3] then begin
    aRect := Rect;
    InflateRect(aRect, 1, 1);
    ProgressBar.BoundsRect := aRect;
  end;
  if Panel = StatusBar.Panels[2] then begin
    aRect := Rect;
    //InflateRect(aRect, 4, 4);
    PnPage.BoundsRect := aRect;
    Edit1.Height:=PnPage.Height-1;
  end;
end;

procedure TfrmReportsPreview.QRPreview1ProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
  ProgressBar.Position := Progress;
  if (Progress = 0) or (Progress >= 100) then
    ProgressBar.Position := 0;
  ProgressBar.Visible := ProgressBar.Position<>0;
end;

procedure TfrmReportsPreview.BtnPrintClick(Sender: TObject);
var
  SrcFileName, DestFileName, CopyFileName: string;
  i: integer;
  RepeatPrint: boolean;
  CopyList : TStringList;
begin
 self.FormStyle := fsNormal ;
  // When you have a QRP file, you can't use
  // the printersetup dialog.  In this case
  // we use a simple dialog to allow the user
  // to select the printer and set the page range

  // This dialog is very simple, you can pick the printer
  // the range of pages.  You could easily add other features
  // like prompting for the number copies.
  with TfrmReportsPrint.Create(application) do
  begin
    SelQRPrinter := QRPrinter;
    SelPrinterIndex := qrprinter.printerindex;
    Current := QRPreview1.PageNumber;
    ShowModal;
    ShowDraft((ReportID=10) AND DocDraft);
    if ModalResult = mrOk then
    begin
      if (ReportID=10) AND DocDraft then
        PrintDocTotext80('',dmDatabase.tblDocHeaderWDocID.Value,50)
      else  
       TCustomquickrep(QRPrinter.ParentReport).Print;
    end;
  end;
end;

procedure TfrmReportsPreview.SpinEditChange(Sender: TObject);

begin
  ProgressBar.Max := 5;
  Timer1.tag := 6 ;
  Timer1.Enabled := false ;
  Timer1.Enabled := true ;
end;

procedure TfrmReportsPreview.BtnFirstClick(Sender: TObject);
begin
  Application.ProcessMessages;
  with QRPreview1 do
  if QRPreview1.QRPrinter.PageCount>0 then PageNumber := 1;
  UpdateButtons;
end;

procedure TfrmReportsPreview.BtnLastClick(Sender: TObject);
begin
  Application.ProcessMessages;
  with QRPreview1 do
  if QRPreview1.QRPrinter.PageCount>0 then PageNumber := QRPreview1.QRPrinter.PageCount;
  UpdateButtons;
end;

procedure TfrmReportsPreview.BtnsaveClick(Sender: TObject);
begin
 self.FormStyle := fsNormal ;
  PrintReportProcess(2,(QRPreview1.QRPrinter.Master as TQuickRep),'1');
end;

procedure TfrmReportsPreview.BtnEMailClick(Sender: TObject);
begin
//  PrintReportProcess(3,(QRPreview1.QRPrinter.Master as TQuickRep),'1');
//  fmSendEmailReport.NbrAddDocAtt:=1;
//  qrprinter.Save(ExtractFilePath(Application.Exename)+'Report1.Doc');
//  fmSendEmailReport.CallEmail;
end;

procedure TfrmReportsPreview.btnReRunClick(Sender: TObject);
begin
  OptionsClose:=False;
  Close;
end;

procedure TfrmReportsPreview.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  BEGIN
    Key := #0; {// kill the beep //}
  END;
end;
Procedure TfrmReportsPreview.ShowDraft(BShow:Boolean);
begin
  if BShow then
    StatusBar.Panels[1].Text := 'Text Mode'
  else
    StatusBar.Panels[1].Text := '';
end;



procedure TfrmReportsPreview.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false ;
 Timer1.tag := Timer1.tag - 1 ;
 ProgressBar.Position := Timer1.tag ;
 if Timer1.tag <= 0 then
 begin
    Application.ProcessMessages;
    if Str2Int(SpinEdit.Text)>30 then
      begin
       QRPreview1.Zoom:=Str2Int(SpinEdit.Text)  ;
       QRPreview1.Repaint ;
      end;
    ProgressBar.Max:=100;  
 end;
 if Timer1.tag <> 0 then
  Timer1.Enabled := true ;

end;

procedure TfrmReportsPreview.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  SpinEdit.Value := SpinEdit.Value + 3 ;
  SpinEditChange(self);
end;

procedure TfrmReportsPreview.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  SpinEdit.Value := SpinEdit.Value - 3 ;
  SpinEditChange(self);
end;

end.

