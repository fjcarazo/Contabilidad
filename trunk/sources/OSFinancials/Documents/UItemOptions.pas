unit UItemOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB,  
   DBAccess , Uni, ExtCtrls, DBCtrls, Grids, DBGrids,
  StdCtrls, Buttons, Menus,UPluginsSharedUnit, MemDS;

type
  TItemOptions = class(TForm)
    PageControl1: TPageControl;
    Options: TTabSheet;
    Details: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ZItemsOptions: TuniTable;
    ZItemsOptionsWITEMOPTIONID: TIntegerField;
    ZItemsOptionsSDESCRIPTION: TStringField;
    dsItemsOptions: TDataSource;
    ZQITEMOPTIONSVALUES: TuniQuery;
    ZUSQLITEMOPTIONSVALUES: TUniUpdateSql;
    ZQITEMOPTIONSVALUESWITEMOPTIONVALUEID: TIntegerField;
    ZQITEMOPTIONSVALUESWITEMOPTIONID: TIntegerField;
    ZQITEMOPTIONSVALUESSDESCRIPTION: TStringField;
    dsOptionsValues: TDataSource;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    ZQITEMOPTIONSVALUESFEXTRAAMOUNT: TFloatField;
    PMOptions: TPopupMenu;
    Extrafields1: TMenuItem;
    PageControl2: TPageControl;
    tsOptionDetail: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Label1: TLabel;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ZItemsOptionsAfterScroll(DataSet: TDataSet);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZQITEMOPTIONSVALUESAfterInsert(DataSet: TDataSet);
    procedure ZItemsOptionsAfterInsert(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
  private
    procedure LoadPluginsGroups;
    procedure PluginPopupClick(Sender: TObject);
    { Private declarations }
  public
    APluginList : TStringlist ;
    APluginsFormsList : TStringlist ;
    AFormPluginRecordArray : array [0..9] of TFormPluginRecord ;
    procedure ShowTab(AIndex : Integer) ;
    { Public declarations }
  end;

var
  ItemOptions: TItemOptions;

implementation

uses UDMTCCoreLink, Math, UOSFVisuals;

{$R *.dfm}

{ TItemOptions }

procedure TItemOptions.ShowTab(AIndex: Integer);
var
 i : Integer ;
begin
 for i := 0 to PageControl1.PageCount -1 do
   begin
        PageControl1.Pages[i].TabVisible := false ;
        if i = AIndex then
           PageControl1.ActivePageIndex := i ;

   end;
end;

procedure  TItemOptions.LoadPluginsGroups;
var
 ArrayImageIndex : Array [0..9] of integer ;
 procedure Init;
    var
     i  :  Integer ;
     AForm: TForm ;

    begin
      for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) and (@AFormPluginRecordArray[i].aMessageGetDisplayText <> nil) then

          begin

             AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'');
             AFormPluginRecordArray[i].aForm := AForm ;
             APluginsFormsList.AddObject(aform.Name,AForm);
          end;
    end;

var
 i , IncArr,Ins : Integer ;
  ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
  IncArr := 0 ;
  IsEnable := false ;
  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 9 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToGroupsRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('GROUPS',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
              end;
             if IsEnable then
               begin


               inc(IncArr) ;
               end else
            begin
              @AFormPluginRecordArray[IncArr].aLoadFormPlugin := nil ;
              @AFormPluginRecordArray[IncArr].aMessageFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := nil ;
              @AFormPluginRecordArray[IncArr].aPluginEnabled   := nil ;
            end;
        end;
    end;
 init ;
end;

procedure TItemOptions.PluginPopupClick(Sender: TObject);
var
 AMessage : String ;
begin
 if PageControl1.ActivePageIndex = 0 then
     AMessage :='REINIT=OPTIO'
    else
    AMessage :='REINIT=OPTID'  ;

       AFormPluginRecordArray[(Sender as tcomponent).tag].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));




 if PageControl1.ActivePageIndex = 0 then
     AMessage := 'CONTEXT=' + ZItemsOptionsWITEMOPTIONID.AsString    else
    AMessage := 'CONTEXT=' + ZQITEMOPTIONSVALUESWITEMOPTIONVALUEID.AsString ;


 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
end;

procedure TItemOptions.FormCreate(Sender: TObject);
var
 i , ImageIndex : Integer ;

 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
 APluginList := TStringlist.create ;
 APluginsFormsList := TStringlist.create ;
 LoadPluginsGroups ;

  // add context
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
      begin
         if  @AFormPluginRecordArray[i].aContextmenuEnabled <> nil then
           if AFormPluginRecordArray[i].aForm <> nil then
            begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[i].aContextmenuEnabled('OPTIONS',APChar,ImageIndex);
                 if APChar <> '' then
                 begin
                 if Extrafields1.FindComponent(APChar) = nil then
                   begin
                     Extrafields1.Add(TMenuItem.Create(Extrafields1));
                     Extrafields1.Items[Extrafields1.Count-1].Name :=  APChar ;
                     Extrafields1.Items[Extrafields1.Count-1].Caption :=  TForm(AFormPluginRecordArray[i].aForm).Caption ;
                     Extrafields1.Items[Extrafields1.Count-1].Tag := i ;
                      Extrafields1.Items[Extrafields1.Count-1].OnClick := PluginPopupClick ;
                   end;
                 end;
            end;
      end;                                     



 ShowTab(0);
 DMTCCoreLink.AssignConnectionToChilds(self);
 ZItemsOptions.Open ;
 uosfvisuals.ChangeDBNavigatorIcons(DBNavigator2);
 uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);
end;

procedure TItemOptions.DBGrid1DblClick(Sender: TObject);
begin
 if ZItemsOptions.State <> dsbrowse then
     ZItemsOptions.post ;

 ShowTab(1);
end;

procedure TItemOptions.ZItemsOptionsAfterScroll(DataSet: TDataSet);
begin
 ZQITEMOPTIONSVALUES.close ;
 ZQITEMOPTIONSVALUES.Params[0].AsInteger := ZItemsOptionsWITEMOPTIONID.AsInteger ;
 ZQITEMOPTIONSVALUES.open ;
end;

procedure TItemOptions.BtnOkClick(Sender: TObject);
begin
If (ZQITEMOPTIONSVALUES.State in [dsedit,dsinsert]) then
   begin
      ZQITEMOPTIONSVALUES.post ;
   end;
  if ZQITEMOPTIONSVALUES.UpdatesPending then
     begin
        ZQITEMOPTIONSVALUES.ApplyUpdates ;
     end;
   ShowTab(0);
end;

procedure TItemOptions.BtnCancelClick(Sender: TObject);
begin
If (ZQITEMOPTIONSVALUES.State in [dsedit,dsinsert]) then
   begin
      ZQITEMOPTIONSVALUES.Cancel ;
   end;
  if ZQITEMOPTIONSVALUES.UpdatesPending then
     begin
        ZQITEMOPTIONSVALUES.CancelUpdates ;
     end;
   ShowTab(0);
end;

procedure TItemOptions.FormShow(Sender: TObject);
begin
  self.Caption := DMTCCoreLink.GetTextLang(3155);

  DBGrid1.Columns[0].Title.Caption := DMTCCoreLink.GetTextLang(1706);
  DBGrid1.Columns[1].Title.Caption := DMTCCoreLink.GetTextLang(1708);
  DBGrid1.Hint := DMTCCoreLink.GetTextLang(3156);
  DBGrid2.Columns[0].Title.Caption := DMTCCoreLink.GetTextLang(1708);
  DBGrid2.Columns[1].Title.Caption := DMTCCoreLink.GetTextLang(3150);
  ShowTab(0);
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);//Btn Cancel
 BtnOk.Caption := DMTCCoreLink.GetTextLang(167);//Btn Ok
end;

procedure TItemOptions.ZQITEMOPTIONSVALUESAfterInsert(DataSet: TDataSet);
begin
 ZQITEMOPTIONSVALUESWITEMOPTIONVALUEID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_ITEMOPTIONVALUEID');
 ZQITEMOPTIONSVALUESWITEMOPTIONID.AsInteger := ZItemsOptionsWITEMOPTIONID.AsInteger ;
end;

procedure TItemOptions.ZItemsOptionsAfterInsert(DataSet: TDataSet);
begin
 ZItemsOptionsWITEMOPTIONID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_ITEMOPTIONID');
end;

procedure TItemOptions.FormDestroy(Sender: TObject);
var
  i : Integer ;
begin
 if ZItemsOptions.State <> dsbrowse then
     ZItemsOptions.post ;

 



  for i := 0 to APluginsFormsList.Count -1 do
    begin
       AFormPluginRecordArray[i].aUnLoadFormPlugin(TForm(APluginsFormsList.Objects[i]));
    end;
 APluginList.free ;
 APluginsFormsList.free ;
end;


end.
