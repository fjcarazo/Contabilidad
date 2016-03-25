unit UCheckPlugins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,UPluginsSharedUnit, StdCtrls, Buttons, Menus, ActnList,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTreeView;

type
  TfmCheckPlugins = class(TForm)
    TreeView1: TcxTreeView;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    Activate1: TMenuItem;
    Deactivate1: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Action3: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Action3Execute(Sender: TObject);
  private
    AList : TStringlist ;
     ARegList : TStringlist ;
    LastCount : Integer ;
    haschange : Boolean ;
    function DllHasFunction(Aname: String;var AEditAddItemToDocPlugin : TFormPluginRecord): Boolean;
    { Private declarations }
  public
    procedure Check(MustShow : Boolean = False);
    procedure HandelList(Trial : Boolean) ;


    { Public declarations }
  end;

var
  fmCheckPlugins: TfmCheckPlugins;

implementation

uses UDMTCCoreLink;

{$R *.dfm}

{ TfmCheckPlugins }

function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := CompareStr(Uppercase(List[Index1]),
                                UpperCase(List[Index2]));
end;


procedure TfmCheckPlugins.Check(MustShow : Boolean = False);
begin

 if  FileExists(TDMTCCoreLink.GetLocalBaseDir + 'pluginsload.txt') then

   begin
     AList.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir + 'pluginsload.txt');
   end;
   LastCount := AList.Count  ;
   haschange := False ;

   HandelList(True) ;
   if (LastCount <> AList.Count) or MustShow  then
     begin
     HandelList(False);
     ShowModal ;
     end;
end;

procedure TfmCheckPlugins.FormCreate(Sender: TObject);
begin
  AList := TStringList.Create ;
  ARegList:= TStringList.Create ;
  self.Caption := DMTCCoreLink.GetTextLang(3418);
  Action1.Caption := DMTCCoreLink.GetTextLang(3420);
  Action2.Caption := DMTCCoreLink.GetTextLang(3419);
end;

procedure TfmCheckPlugins.FormDestroy(Sender: TObject);
begin
 AList.free ;
 ARegList.free ;
end;


Function TfmCheckPlugins.DllHasFunction(Aname : String;var AEditAddItemToDocPlugin : TFormPluginRecord ) : Boolean ;
 var
 Ins: HINST;
 DllName : String ;

 a4MenuPlugin : TOSFMenuPlugin ;

 APosPlugin : TOSFPosPlugin ;
 aControlerPlugin : TOSFLoginControlerPlugin ;
 APinPlugin : TOSFPinPlugin ;
 
begin
 DllName :=ExtractFileDir(Application.ExeName) + '\plug_ins\'+Aname;
 if LoadedPluginList.IndexOf(DllName) = -1 then
   begin
    Ins := LoadLibrary(PChar(DllName));
    LoadedPluginList.AddObject(DllName,TObject(Ins)) ;
   end else
   begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(DllName)]);
   end;

 if Ins = 0 then
  begin
   // raise Exception.Create('Error loading DLL from ' + DllName);
   Exit ;
  end;

  try
   @a4MenuPlugin := GetProcAddress(Ins, TCPLUGINSRoutineName);
   result := @a4MenuPlugin <> nil ;
   @AEditAddItemToDocPlugin.aOSFGetPluginInfo := GetProcAddress(Ins, OSFGetPluginInfoName);
   result := result and (@AEditAddItemToDocPlugin.aOSFGetPluginInfo <> nil) ;
   AEditAddItemToDocPlugin.aInst := ins ;
  except
   result := false ;
  end;

end;

procedure TfmCheckPlugins.HandelList(Trial : Boolean);

Var
  ItemCaption,
  PlugIns_Path :String;
  PlugInsItem,PlugInsItemParent ,
  NewMenuItem,FoundNode   :TTreeNode;
  F            :TSearchRec;
  Bool  : Integer ;
  AddPluginList,GuidList : TStringlist ;
  AddNamesList : TStringlist ;
  i,y ,x,GroupTrn,PluginTrn : Integer ;
  ReturnString : Array [0..1025] of char ;
  APChar : PChar ;
  AEditAddItemToDocPlugin : TFormPluginRecord ;
begin
  TreeView1.items.Clear ;
  ARegList.clear ;
  FillChar(ReturnString,SizeOF(ReturnString),#0);

  AddPluginList := TStringlist.create ;
  GuidList := TStringlist.create ;
  AddNamesList := TStringlist.create ;
  try
  try
  PlugIns_Path:=ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim;
  Bool := FindFirst(PlugIns_Path+'*.' + PluginsDLLName,faAnyFile,F);
  if Bool=0 then
  begin



  While Bool = 0 do
  begin
    ItemCaption := ChangeFileExt(F.Name,'');
    if trial then
    begin
      AddPluginList.AddObject(ItemCaption+   '\' + F.Name,nil)
    end else
    begin
    if  DllHasFunction(F.Name,AEditAddItemToDocPlugin ) then
      begin
      if Assigned(AEditAddItemToDocPlugin.aOSFGetPluginInfo) then
        begin
           APChar := ReturnString ;
           AEditAddItemToDocPlugin.aOSFGetPluginInfo(PluginTrn,GroupTrn,APChar);
           AEditAddItemToDocPlugin.aGuid := copy(Trim(ReturnString),1,50);

           if PluginTrn <> 0 then
           ItemCaption := DMTCCoreLink.GetTextLangNoAmp(PluginTrn) + ' ' +  ChangeFileExt(F.Name,'') +   '\' + F.Name else
           ItemCaption := ItemCaption +  '\' + F.Name;
           ItemCaption := DMTCCoreLink.GetTextLangNoAmp(GroupTrn) + '\' + ItemCaption ;
           AddPluginList.AddObject(ItemCaption,Tobject(AEditAddItemToDocPlugin.aInst));
           if DMTCCoreLink.IsRegistered(Trim(ReturnString)) then
              ARegList.Add(F.Name);

        end;
      end ;
    end;
    Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
     FindClose(f);
  end;

 PlugIns_Path:=ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim;
  Bool := FindFirst(PlugIns_Path+'*.exe' ,faAnyFile,F);
  if Bool=0 then
  begin



  While Bool = 0 do
  begin
      ItemCaption := ChangeFileExt(F.Name,'');
      ItemCaption := ItemCaption +  '\' + F.Name;
      ItemCaption := DMTCCoreLink.GetTextLangNoAmp(1905) + '\' + ItemCaption ;
      AddPluginList.AddObject(ItemCaption,Tobject(AEditAddItemToDocPlugin.aInst))  ;
      Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
     FindClose(f);
  end;

  AddPluginList.CustomSort(StringListCompareStrings) ;
  PlugInsItem := TreeView1.Items.AddChild(nil,'Root');

  for i := 0 to AddPluginList.Count -1 do
     begin
           AddNamesList.Text := StringReplace(AddPluginList[i],'\',#13+#10,[rfReplaceAll]);
           PlugInsItemParent := PlugInsItem ;
           for x := 0 to AddNamesList.Count -2 do
           begin
            FoundNode := nil ;
            for y := 0 to PlugInsItemParent.Count -1 do
              begin
               if PlugInsItemParent.Item[y].Text = AddNamesList[x] then
                  FoundNode :=  PlugInsItemParent.Item[y] ;
              end;

            if  FoundNode <> nil then
            PlugInsItemParent := FoundNode
            else
              begin
              NewMenuItem:=TreeView1.Items.AddChild(PlugInsItemParent,AddNamesList[x]);
              PlugInsItemParent :=  NewMenuItem ;

              if x = AddNamesList.Count -2 then
                begin
                  PlugInsItemParent := PlugInsItem ;
                //   NewMenuItem.Text :=  AddNamesList[x+1] + '  ' + NewMenuItem.Text ;

                  if AList.Values[AddNamesList[x+1]] = '' then
                    if UpperCase(AddNamesList[x+1]) = UpperCase('DYNADBREG.' + PluginsDLLName)   then
                    AList.Values[AddNamesList[x+1]] := 'True'
                    else
                    AList.Values[AddNamesList[x+1]] := 'False' ;
                   if AList.Values[AddNamesList[x+1]] = 'False' then
                  NewMenuItem.ImageIndex := 13 else
                  NewMenuItem.ImageIndex := 14 ;

                  NewMenuItem.Data :=  TObject(AList.IndexOfName(AddNamesList[x+1])) ;
                  NewMenuItem.SelectedIndex := NewMenuItem.ImageIndex ;
                end;
              end;
           end;
     end;

   except
      // dont do annything on except
   end;
   if not Trial then
    begin
      if LastCount <> AList.Count then
        begin
          for i := 0 to TreeView1.Items.Count -1 do
            if  Integer(TreeView1.Items[i].Data) = AList.Count -1 then
                begin
                 TreeView1.Items[i].MakeVisible ;
                 TreeView1.Items[i].Focused := True ;
                end;
        end else
      PlugInsItem.Expand(True);
    end;
   finally
     AddPluginList.free ;
     GuidList.free ;
     AddNamesList.free ;
   end;
end;

procedure TfmCheckPlugins.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrok ;
end;

procedure TfmCheckPlugins.Action2Execute(Sender: TObject);
var
 i ,x: Integer ;
begin
 if TreeView1.Selected = nil then exit ;
  haschange := True ;
 if TreeView1.Selected.HasChildren then
    begin
     for i := 0 to TreeView1.Selected.Count-1 do
       begin
          if TreeView1.Selected.Item[i].HasChildren then
            begin
            for x := 0 to TreeView1.Selected.Item[i].Count -1 do
             begin
               AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].item[x].data)] := 'True';
               TreeView1.Selected.Item[i].item[x].ImageIndex := 14 ;
               TreeView1.Selected.Item[i].item[x].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
             end;
            end else
            begin
             AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].data)] := 'True';
             TreeView1.Selected.Item[i].ImageIndex := 14 ;
             TreeView1.Selected.Item[i].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
           end;
       end;
     exit ;
    end;


  AList.ValueFromIndex[Integer(TreeView1.Selected.data)] := 'True';
  TreeView1.Selected.ImageIndex := 14 ;
  TreeView1.Selected.SelectedIndex := TreeView1.Selected.ImageIndex  ;

end;

procedure TfmCheckPlugins.Action3Execute(Sender: TObject);
var
 i , x: Integer ;
begin
 if TreeView1.Selected = nil then exit ;
  haschange := True ;
 if TreeView1.Selected.HasChildren then
    begin
     for i := 0 to TreeView1.Selected.Count-1 do
       begin
          if TreeView1.Selected.Item[i].HasChildren then
            begin
              for x := 0 to TreeView1.Selected.Item[i].Count -1 do
                 begin
                  if ARegList.IndexOf(AList.Names[Integer(TreeView1.Selected.Item[i].data)]) <> -1 then
                   begin

                   AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].item[x].data)] := 'True';
                   TreeView1.Selected.Item[i].item[x].ImageIndex := 14 ;
                   TreeView1.Selected.Item[i].item[x].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
                   end else
                    begin

                   AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].item[x].data)] := 'False';
                   TreeView1.Selected.Item[i].item[x].ImageIndex := 13 ;
                   TreeView1.Selected.Item[i].item[x].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
                   end
                 end;

            end else
            begin
            if ARegList.IndexOf(AList.Names[Integer(TreeView1.Selected.Item[i].data)]) <> -1 then
             begin
              AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].data)] := 'True';
              TreeView1.Selected.Item[i].ImageIndex := 14 ;
             TreeView1.Selected.Item[i].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
             end else
             begin
              AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].data)] := 'False';
              TreeView1.Selected.Item[i].ImageIndex := 13 ;
             TreeView1.Selected.Item[i].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
             end ;
          end;
       end;

    end;


end;

procedure TfmCheckPlugins.Action1Execute(Sender: TObject);
var
 i , x: Integer ;
begin
 if TreeView1.Selected = nil then exit ;
  haschange := True ;
 if TreeView1.Selected.HasChildren then
    begin
     for i := 0 to TreeView1.Selected.Count-1 do
       begin
          if TreeView1.Selected.Item[i].HasChildren then
            begin
              for x := 0 to TreeView1.Selected.Item[i].Count -1 do
                 begin
                   AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].item[x].data)] := 'False';
                   TreeView1.Selected.Item[i].item[x].ImageIndex := 13 ;
                   TreeView1.Selected.Item[i].item[x].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;

                 end;
                
            end else
            begin
            AList.ValueFromIndex[Integer(TreeView1.Selected.Item[i].data)] := 'False';
            TreeView1.Selected.Item[i].ImageIndex := 13 ;
            TreeView1.Selected.Item[i].SelectedIndex := TreeView1.Selected.Item[i].ImageIndex  ;
          end;
       end;
     exit ;
    end;


  AList.ValueFromIndex[Integer(TreeView1.Selected.data)] := 'False';
  TreeView1.Selected.ImageIndex := 13 ;

  TreeView1.Selected.SelectedIndex := TreeView1.Selected.ImageIndex  ;
 
end;

procedure TfmCheckPlugins.Panel1Click(Sender: TObject);
begin
 if TreeView1.Selected = nil then exit ;
 if TreeView1.Selected.HasChildren then exit ;

  AList.ValueFromIndex[Integer(TreeView1.Selected.data)] := 'False';
  TreeView1.Selected.ImageIndex := 13 ;
  TreeView1.Selected.SelectedIndex := TreeView1.Selected.ImageIndex  ;
end;

procedure TfmCheckPlugins.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);

begin
  if (LastCount <> AList.Count) or haschange then
    begin
        try
         AList.SaveToFile(TDMTCCoreLink.GetLocalBaseDir + 'pluginsload.txt');
        except

        end;
    end;
end;

end.
