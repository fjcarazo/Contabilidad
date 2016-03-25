unit UPOSSHARED;

interface

Uses Controls,Windows,SysUtils,Classes,ComCtrls,ExtCtrls,buttons,graphics;

Const
  MyAlphaStringLow = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ./?=+' ;
 // MyAlphaStringHigh = 'abcdefghijklmnopqrstuvwxyz/?=+' ;
  MyDigetString = '0123456789-';
type

  TABCBar = class (TPageScroller)
  private
    FOnBtnClick: TNotifyEvent;
    procedure SetOnBtnClick(const Value: TNotifyEvent);
    procedure OnIntBtnClick (Sender : TObject ) ;
     public

      fType : Integer ;
      APanel : TPanel ;
      lastChar : Char ;
      TakeOutSet : String ;
      property OnBtnClick : TNotifyEvent  read FOnBtnClick write SetOnBtnClick;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Init(Aparent :TWinControl;aType:Integer);

  end;
implementation

uses UDMTCCoreLink;


{ TABCBar }

constructor TABCBar.Create(AOwner: TComponent);

begin
  inherited;
   

end;

destructor TABCBar.Destroy;
begin

  inherited;
end;

procedure TABCBar.Init(Aparent: TWinControl; aType: Integer);
var
 i, NewLeft,NewTop  : Integer ;
 ASpeedButton : TSpeedButton ;
 CheckString : String ;
 procedure DoSpeedButton ;
 begin
   ASpeedButton := TSpeedButton.Create(self) ;
   ASpeedButton.Parent := APanel ;
   ASpeedButton.Top := NewTop ;
   ASpeedButton.Left := NewLeft ;
   ASpeedButton.Flat := true ;
   NewLeft := NewLeft + trunc(28 * glScaleByPerc)   ;
   ASpeedButton.Width := trunc(26 * glScaleByPerc);
   ASpeedButton.Height := trunc(26 * glScaleByPerc);
   ASpeedButton.OnClick := OnIntBtnClick;
   if (NewLeft + trunc(28 * glScaleByPerc) )  > APanel.Width then
     begin
      NewTop := NewTop + ASpeedButton.Height + 5 ;
      NewLeft := 0 ;
     end;
 end;
begin
  fType := aType ; 
  if Assigned(APanel) then APanel.Free ;

  APanel := TPanel.Create(self);
  APanel.Top := 0 ;

  Orientation := soVertical ;

  NewLeft  := 0 ;
  NewTop  := 0 ;
  APanel.TabStop := false ;
  APanel.Parent := Aparent ;
  Self.Parent := Aparent ;
  Self.Control := APanel ;
  CheckString := '' ;
  DoSpeedButton  ;
  ASpeedButton.Caption := '@' ;
    
  if atype = 0 then
  begin
    CheckString := MyAlphaStringLow + ThousandSeparator ;
   end;
 CheckString := CheckString + MyDigetString + DecimalSeparator ;
  For i := 1 to Length(CheckString) do
     begin
      if pos(CheckString[i],TakeOutSet) = 0 then
        begin
        DoSpeedButton  ;
        ASpeedButton.Flat := False ;
        ASpeedButton.Caption := CheckString[i] ;
        end else
        begin
        DoSpeedButton  ;
        ASpeedButton.Flat := true ;

        ASpeedButton.Caption := CheckString[i] ;
        end;

     end;

  DoSpeedButton  ;
  ASpeedButton.Caption := '«' ;

  DoSpeedButton  ;
  ASpeedButton.Caption := '~' ;



  ButtonSize := trunc( 10 * glScaleByPerc)  ;
  APanel.Width := NewLeft ;
  APanel.Height := NewTop + trunc( 25 * glScaleByPerc) + 5;
end;
procedure TABCBar.OnIntBtnClick(Sender: TObject);
begin
 if copy((sender as TSpeedbutton).Caption,1,1)  <> '' then
 lastChar := (sender as TSpeedbutton).Caption[1];
 if Assigned(FOnbtnClick) then
    FOnbtnClick(Sender);
end;

procedure TABCBar.SetOnBtnClick(const Value: TNotifyEvent);
begin
  FOnBtnClick := Value;
end;

end.
