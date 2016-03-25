unit UPosDocitem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids,
  ExtCtrls, DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni,
  ZConnection,shellapi, MemDS;

type
  TFPosDocItem = class(TForm)
    PBotom: TPanel;
    BClose: TBitBtn;
    ZQSelectie: TuniQuery;
    ZUSQLSelectie: TUniUpdateSql;
    DataSource1: TDataSource;
    ZQSelectieWDOCID: TIntegerField;
    ZQSelectieWSOURCETYPEID: TIntegerField;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ZQSelectieSEXTERNALID: TStringField;
    cbPosType: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
 
    STYPE : String ;
    WLinkID : Integer ;
    procedure HandelMessage(Amessage : String );
    procedure OpenQuery ;
    
    { Public declarations }
  end;



var
  FPosDocItem: TFPosDocItem;

implementation

uses Math, UDMTCCoreLink,  OSFGeneralRoutines;

{$R *.dfm}




procedure TFPosDocItem.OpenQuery;
begin
   ZQSelectie.close ;
   ZQSelectie.Params[0].Asinteger := WLinkID ;
   ZQSelectie.open ;
   
end;

procedure TFPosDocItem.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(self);

end;

procedure TFPosDocItem.HandelMessage(Amessage: String);
var
 OldId : Integer ;
begin
if Parent <> nil then
 begin
  PBotom.Align := alnone ;
  PBotom.Visible := false ;
 end;


 Amessage := StringReplace(Amessage,#13#10,'',[rfreplaceAll]);
  if Pos('CANCEL',Amessage) = 1 then
     begin
       if ZQSelectie.UpdatesPending then
           ZQSelectie.CancelUpdates ;
       // do cancel (remember cashedupdates

     end;
  if Pos('NEW',Amessage) = 1 then
     begin
        WLinkID := 0 ;
         ComboBox1.ItemIndex := 0 ;

         OpenQuery ;
     end;
  if Pos('POST',Amessage) = 1 then
     begin
     OldId :=   StrToIntDef(ZQSelectieWSOURCETYPEID.AsString,-1)  ;


    WLinkID := StrToIntDef(copy(Amessage,6,length(Amessage)),0) ;
    OpenQuery ;
    if ZQSelectie.IsEmpty then exit ;
     if OldId <> StrToIntDef(ZQSelectieWSOURCETYPEID.AsString,-1) then
        begin
          exit ;
        end;
   ZQSelectie.Edit ;
   ZQSelectieSEXTERNALID.AsString := '' ;
    case ComboBox1.ItemIndex of
    0,-1 : ZQSelectieWSOURCETYPEID.AsInteger := 0 ;
    1 : begin
        ZQSelectieWSOURCETYPEID.AsInteger := 2 ;
         ZQSelectieSEXTERNALID.AsInteger := cbPosType.ItemIndex +1 ;
        end;
    2 : begin
         ZQSelectieWSOURCETYPEID.AsInteger := 3 ;
         ZQSelectieSEXTERNALID.AsInteger := cbPosType.ItemIndex +1 ;
        end;
    3 : begin
         ZQSelectieWSOURCETYPEID.AsInteger := 4 ;
         ZQSelectieSEXTERNALID.AsInteger := cbPosType.ItemIndex +1 ;
        end;
    end;

    ZQSelectie.Post ;


     {   if ZQSelectie.IsEmpty then
        begin
          ZQSelectie.Insert ;                  6
          ZQSelectieWSTOCKID.AsInteger := WLinkID ;
          ZQSelectie.Post ;
        end;  }

     // end;
    //    ZQFiles.First ;
    //    while not ZQFiles.Eof do
    //      begin
    //         if ZQFilesWREFID.AsInteger <> WLinkID then
    //           begin
    //             ZQFiles.Edit ;
    //             ZQFilesWREFID.AsInteger := WLinkID ;
    //             ZQFiles.post ;
    //           end;
    //        ZQFiles.next ;
    //      end;
        try
         if ZQSelectie.UpdatesPending then
           ZQSelectie.ApplyUpdates ;
        except
        on e:Exception do
          begin
             if ZQSelectie.UpdatesPending then
                ZQSelectie.CancelUpdates ;
             Raise Exception.create(e.message);
          end;
        end;
     end;
  if Pos('DELETE',Amessage) = 1 then
     begin

     end;
  if Pos('COPY',Amessage) = 1 then
     begin
        // No action
     end;
  if Pos('EDIT',Amessage) = 1 then
     begin
        WLinkID := StrToIntDef(copy(Amessage,6,length(Amessage)),0) ;
       // refreshPicklist ;
       OpenQuery ;
       case StrToIntDef(ZQSelectieWSOURCETYPEID.AsString,0) of
       2 :  ComboBox1.ItemIndex := 1 ;
       3 :  ComboBox1.ItemIndex := 2 ;
       4 :  ComboBox1.ItemIndex := 3 ;
       else
        ComboBox1.ItemIndex := 0 ;

       end;
       if StrToIntDef(ZQSelectieSEXTERNALID.AsString ,0) = 1 then
            cbPosType.ItemIndex := 0 else
            cbPosType.ItemIndex := 1 ;


     end;
end;


procedure TFPosDocItem.FormShow(Sender: TObject);
begin
if Parent = nil then
 begin

 end else
 begin
 PBotom.Align := alnone ;
 PBotom.Visible := false ;
 self.ParentColor := true;
 end;


end;


end.
