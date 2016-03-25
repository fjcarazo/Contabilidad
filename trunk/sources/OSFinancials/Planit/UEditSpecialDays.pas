unit UEditSpecialDays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB,   DBAccess , Uni,
  StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls, MemDS;

type
  TfmEditSpecialDays = class(TForm)
    ZQEvents: TuniQuery;
    ZUSQLEvents: TUniUpdateSql;
    ZQEventsWEVENTSPECIALDAY_ID: TIntegerField;
    ZQEventsWTYPEID: TIntegerField;
    ZQEventsWRESOURCEID: TIntegerField;
    ZQEventsWCOLOR: TIntegerField;
    ZQEventsWPRIORITY: TIntegerField;
    ZQEventsDSTARTDATETIME: TDateTimeField;
    ZQEventsDENDDATETIME: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Monfrom: TDateTimePicker;
    monto: TDateTimePicker;
    TueFrom: TDateTimePicker;
    TueTo: TDateTimePicker;
    WenFrom: TDateTimePicker;
    WenTo: TDateTimePicker;
    ThuFrom: TDateTimePicker;
    ThuTo: TDateTimePicker;
    FriFrom: TDateTimePicker;
    FriTo: TDateTimePicker;
    SatFrom: TDateTimePicker;
    SatTo: TDateTimePicker;
    SunFrom: TDateTimePicker;
    Sunto: TDateTimePicker;
    ZQUserDate: TuniQuery;
    ZUSQLUserDate: TUniUpdateSql;
    ZQGenDate: TuniQuery;
    ZUSQLGenDate: TUniUpdateSql;
    DSGenDate: TDataSource;
    dsUserDate: TDataSource;
    ColorDialog1: TColorDialog;
    ZQUserDateWEVENTSPECIALDAY_ID: TIntegerField;
    ZQUserDateWTYPEID: TIntegerField;
    ZQUserDateWRESOURCEID: TIntegerField;
    ZQUserDateWCOLOR: TIntegerField;
    ZQUserDateWPRIORITY: TIntegerField;
    ZQUserDateDSTARTDATETIME: TDateTimeField;
    ZQUserDateDENDDATETIME: TDateTimeField;
    ZQGenDateWEVENTSPECIALDAY_ID: TIntegerField;
    ZQGenDateWTYPEID: TIntegerField;
    ZQGenDateWRESOURCEID: TIntegerField;
    ZQGenDateWCOLOR: TIntegerField;
    ZQGenDateWPRIORITY: TIntegerField;
    ZQGenDateDSTARTDATETIME: TDateTimeField;
    ZQGenDateDENDDATETIME: TDateTimeField;
    Bsave: TButton;
    ETextMon: TEdit;
    Button3: TButton;
    ZQEventsSDESCRIPTION: TStringField;
    ZQUserDateSDESCRIPTION: TStringField;
    ZQGenDateSDESCRIPTION: TStringField;
    PageControl1: TPageControl;
    tsUserDates: TTabSheet;
    tsGeneralDates: TTabSheet;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Label8: TLabel;
    ETextTue: TEdit;
    Button4: TButton;
    ETextWed: TEdit;
    Button5: TButton;
    ETextThu: TEdit;
    Button6: TButton;
    ETextFri: TEdit;
    Button7: TButton;
    ETextSat: TEdit;
    Button8: TButton;
    ETextSun: TEdit;
    Button9: TButton;
    EColorMon: TEdit;
    EColorTue: TEdit;
    EColorWed: TEdit;
    EColorThu: TEdit;
    EColorFri: TEdit;
    EColorSat: TEdit;
    EColorSun: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ZQGenDateAfterInsert(DataSet: TDataSet);
    procedure BsaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQEventsAfterInsert(DataSet: TDataSet);
    procedure ZQUserDateAfterInsert(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init(ResourceId : Integer ) ;
    { Public declarations }
  end;

var
  fmEditSpecialDays: TfmEditSpecialDays;

implementation

uses UDMTCCoreLink, DateUtils, UOSFVisuals;

{$R *.dfm}

procedure TfmEditSpecialDays.Button1Click(Sender: TObject);
begin
 if ZQUserDate.IsEmpty then
   exit ;
 ZQUserDate.edit ;
 ColorDialog1.Color := ZQUserDateWCOLOR.AsInteger ;
 if ColorDialog1.Execute then
    ZQUserDateWCOLOR.AsInteger :=  ColorDialog1.Color;
 ZQUserDate.Post ;    
end;

procedure TfmEditSpecialDays.Button2Click(Sender: TObject);
begin
 if ZQGenDate.IsEmpty then
   exit ;
 ZQGenDate.edit ;
 ColorDialog1.Color := ZQGenDateWCOLOR.AsInteger ;
 if ColorDialog1.Execute then
    ZQGenDateWCOLOR.AsInteger :=  ColorDialog1.Color;
 ZQGenDate.Post ;    
end;

procedure TfmEditSpecialDays.Init(ResourceId: Integer);
begin
 ZQGenDate.close ;
 ZQGenDate.Open ;
 ZQUserDate.close ;
 ZQEvents.close ;

 ZQUserDate.params[0].AsInteger := ResourceId ;
 ZQEvents.params[0].AsInteger := ResourceId ;

 ZQUserDate.open ;
 ZQEvents.open ;

 if ZQEvents.IsEmpty then
    begin
      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,1,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,1,17,0,0,0) ;
      ZQEvents.Post ;

      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,2,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,2,17,0,0,0) ;
      ZQEvents.Post ;

      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,3,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,3,17,0,0,0) ;
      ZQEvents.Post ;

      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,4,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,4,17,0,0,0) ;
      ZQEvents.Post ;

      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,5,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,5,17,0,0,0) ;
      ZQEvents.Post ;

      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,6,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,6,17,0,0,0) ;
      ZQEvents.Post ;

      ZQEvents.insert ;
      ZQEventsDSTARTDATETIME.AsDateTime := EncodeDateTime(2008,12,7,07,0,0,0) ;
      ZQEventsDENDDATETIME.AsDateTime := EncodeDateTime(2008,12,7,17,0,0,0) ;
      ZQEvents.Post ;
    end;

 ZQEvents.First ;
 while not ZQEvents.Eof do
   begin
        case DayOfWeek(ZQEventsDSTARTDATETIME.AsDateTime) of
        2 : begin
              Monfrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              monto.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorMon.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextMon.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
        3 : begin
              TueFrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              TueTo.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorTue.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextTue.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
        4 : begin
              WenFrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              WenTo.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorWed.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextWed.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
        5 : begin
              ThuFrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              ThuTo.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorThu.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextThu.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
        6 : begin
              FriFrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              FriTo.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorFri.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextFri.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
        7 : begin
              SatFrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              SatTo.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorSat.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextSat.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
        1 : begin
              SunFrom.DateTime := ZQEventsDSTARTDATETIME.AsDateTime ;
              Sunto.DateTime := ZQEventsDENDDATETIME.AsDateTime ;
              EColorSun.Text := IntToStr(ZQEventsWCOLOR.AsInteger) ;
              ETextSun.Text := ZQEventsSDESCRIPTION.AsString ;
            end;
       end;
      ZQEvents.Next ;
   end;
end;

procedure TfmEditSpecialDays.ZQGenDateAfterInsert(DataSet: TDataSet);
begin
  ZQGenDateWEVENTSPECIALDAY_ID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_EVENTSPECIALDAYS_ID') ;
  ZQGenDateWTYPEID.AsInteger := 2 ;
end;

procedure TfmEditSpecialDays.BsaveClick(Sender: TObject);
begin
   ZQEvents.first ;
   while not ZQEvents.Eof do
       begin
         ZQEvents.edit ;
         case DayOfWeek(ZQEventsDSTARTDATETIME.AsDateTime) of
                2 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := Monfrom.DateTime;
                      ZQEventsDENDDATETIME.AsDateTime :=   monto.DateTime;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorMon.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextMon.Text  ;

                    end;
                3 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := TueFrom.DateTime  ;
                      ZQEventsDENDDATETIME.AsDateTime :=   TueTo.DateTime  ;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorTue.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextTue.Text  ;
                    end;
                4 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := WenFrom.DateTime  ;
                      ZQEventsDENDDATETIME.AsDateTime :=   WenTo.DateTime  ;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorWed.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextWed.Text  ;
                    end;
                5 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := ThuFrom.DateTime ;
                      ZQEventsDENDDATETIME.AsDateTime :=   ThuTo.DateTime  ;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorThu.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextThu.Text  ;
                    end;
                6 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := FriFrom.DateTime  ;
                      ZQEventsDENDDATETIME.AsDateTime :=   FriTo.DateTime  ;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorFri.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextFri.Text  ;
                    end;
                7 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := SatFrom.DateTime  ;
                      ZQEventsDENDDATETIME.AsDateTime :=   SatTo.DateTime  ;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorSat.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextSat.Text  ;
                    end;
                1 : begin
                      ZQEventsDSTARTDATETIME.AsDateTime := SunFrom.DateTime ;
                      ZQEventsDENDDATETIME.AsDateTime :=   Sunto.DateTime  ;
                      ZQEventsWCOLOR.AsInteger :=  StrToIntDef(EColorSun.Text,0) ;
                      ZQEventsSDESCRIPTION.AsString :=   ETextSun.Text  ;
                    end;
          end;

         ZQEventsWPRIORITY.AsInteger := 0 ;
         ZQEvents.Post ;
         ZQEvents.Next ;
       end;
   close ;    
end;


procedure TfmEditSpecialDays.FormCreate(Sender: TObject);
begin
  uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);
  uosfvisuals.ChangeDBNavigatorIcons(DBNavigator2);
  DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TfmEditSpecialDays.ZQEventsAfterInsert(DataSet: TDataSet);
begin
   ZQEventsWEVENTSPECIALDAY_ID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_EVENTSPECIALDAYS_ID') ;
  ZQEventsWTYPEID.AsInteger := 1 ;
  ZQEventsWRESOURCEID.AsInteger := ZQEvents.params[0].AsInteger ;
end;

procedure TfmEditSpecialDays.ZQUserDateAfterInsert(DataSet: TDataSet);
begin
 ZQUserDateWEVENTSPECIALDAY_ID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_EVENTSPECIALDAYS_ID') ;
 ZQUserDateWTYPEID.AsInteger := 3 ;
 ZQUserDateWRESOURCEID.AsInteger := ZQUserDate.params[0].AsInteger ;
end;

procedure TfmEditSpecialDays.Button3Click(Sender: TObject);
begin

 ColorDialog1.Color := StrToIntDef(EColorMon.Text,0);
 if ColorDialog1.Execute then
    EColorMon.Text :=  IntToStr(ColorDialog1.Color);
end;

procedure TfmEditSpecialDays.Button4Click(Sender: TObject);
begin
 ColorDialog1.Color := StrToIntDef(EColorTue.Text,0);
 if ColorDialog1.Execute then
    EColorTue.Text :=  IntToStr(ColorDialog1.Color);
end;

procedure TfmEditSpecialDays.Button5Click(Sender: TObject);
begin
 ColorDialog1.Color := StrToIntDef(EColorWed.Text,0);
 if ColorDialog1.Execute then
    EColorWed.Text :=  IntToStr(ColorDialog1.Color);
end;

procedure TfmEditSpecialDays.Button6Click(Sender: TObject);
begin
 ColorDialog1.Color := StrToIntDef(EColorThu.Text,0);
 if ColorDialog1.Execute then
    EColorThu.Text :=  IntToStr(ColorDialog1.Color);
end;

procedure TfmEditSpecialDays.Button7Click(Sender: TObject);
begin
 ColorDialog1.Color := StrToIntDef(EColorFri.Text,0);
 if ColorDialog1.Execute then
    EColorFri.Text :=  IntToStr(ColorDialog1.Color);
end;

procedure TfmEditSpecialDays.Button8Click(Sender: TObject);
begin
 ColorDialog1.Color := StrToIntDef(EColorSat.Text,0);
 if ColorDialog1.Execute then
    EColorSat.Text :=  IntToStr(ColorDialog1.Color);
end;

procedure TfmEditSpecialDays.Button9Click(Sender: TObject);
begin
 ColorDialog1.Color := StrToIntDef(EColorSun.Text,0);
 if ColorDialog1.Execute then
    EColorSun.Text :=  IntToStr(ColorDialog1.Color);
end;

end.
