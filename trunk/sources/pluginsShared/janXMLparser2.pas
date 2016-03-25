unit janXMLParser2;

interface

uses
  DateUtils,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,janXPathTokenizer, Math,janstrings,db;



const
  delimiters=['+','-','*','/',' ','(',')','=','>','<'];
  numberchars=['0'..'9','.'];
  identchars=['a'..'z','A'..'Z','0'..'9','.','_'];


type
  TjanXMLNode2=class;
  TjanXMLParser2 = class ;
  TVariableEvent=procedure(sender:Tobject;const VariableName:string;var VariableValue:variant;var handled:boolean) of object;
  TXELEvent=procedure(sender:TObject;node:TjanXMLNode2;const Act:string) of object;
  TjanXSLSort=record
    pattern:string;
    SortAscending:boolean;
    SortNumeric:boolean;
  end;


  TjanXMLNodeList2=class(TList)
  protected
  public
  {TList descendant that frees the referenced objects.}
    procedure Clear;override;
    {Clears list and frees referenced objects}
    destructor destroy; override;
    {Clears before destroy}
  end;

  TjanXPathParserList2=class(TStringList)
  public
  {TStringList descendant that frees the referenced objects.}
    procedure Clear;override;
    {Clears list and frees referenced objects}
    destructor destroy; override;
    {Clears before destroy}
  end;

  TjanXPathExpression2=class;


  TjanXPathParser2=class;



  TjanXMLAttribute2=class(TObject)
  private
    Fvalue: string;
    Fname: string;
    procedure Setname(const Value: string);
    procedure Setvalue(const Value: string);
  public
  {XML Attribute object}
    property name:string read Fname write Setname;
    {Holds the name of the attribute.}
    property value:string read Fvalue write Setvalue;
    {Holds the string value of the attribute}
    function cloneAttribute:TjanXMLAttribute2;
    {Returns a copy of the attribute object.}
  end;


  TjanXPathParser2=class(TObject)
  private
    Fpattern: string;
    FXPath:TjanXPathExpression2;
    FCurrentNode: TjanXMLNode2;
    procedure Setpattern(const Value: string);
    procedure SetCurrentNode(const Value: TjanXMLNode2);
  public
  {Helper object to handle QXML expressions to select nodes.}
    constructor Create;
    {Creates XPath expression object}
    destructor  destroy; override;
    {Destroys XPath expression object}
    procedure selectNodes(node:TjanXMLNode2;nodelist:TList;single:boolean=false);
    {Creates a list of recursive child nodes of a given node and test each node against the given QXML expression.
     Matching nodes are added to nodelist.}
    function testNode(node:TjanXMLNode2):boolean;
    {Tests if a single node matches the pattern}
    property pattern:string read Fpattern write Setpattern;
    {Determines the QXML query expression.}
    property XPath:TjanXPathExpression2 read FXPath;
    {The expression parser and evaluator.}
    property CurrentNode:TjanXMLNode2 read FCurrentNode write SetCurrentNode;
    {Determines the node that is used when evaluating the expression.}
  end;


  TjanXMLNode2=class(TObject)
  private
    Fname:string;
    Fnamespace:string;
    Ftext:string;
    FCDATA:boolean;
    FParser:TjanXMLParser2;
    FParentNode:TjanXMLNode2;
    FNodes:TjanXMLNodeList2;
    FAttributes:TjanXMLNodeList2;
//    Fscan:integer;
    procedure Settext(const Value: string);
    procedure Setname(const Value: string);
    function getAttribute(index: variant): string;
    procedure setAttribute(index: variant; const Value: string);
    function getAttributeCount: integer;
    function Getattributename(index: integer): string;
    procedure SetParentNode(const Value: TjanXMLNode2);
    function GetID: string;
    procedure SetID(const Value: string);
    function xelSwitch(anode:TjanXMLNode2;parser:TjanXMLParser2):boolean;
  protected
  public
    {The basic object of janXML}
    constructor create;
    destructor  destroy; override;
    property parentNode:TjanXMLNode2 read FParentNode write SetParentNode;
    {Refers to the parent node.}
    property name:string read Fname write Setname;
    {Indicates the name of the node.}
    property namespace:string read Fnamespace;
    {Indicates the namespace of the node. This property is readonly and implicitly set via the name property.}
    property CDATA:boolean read FCDATA;
    {Indicates if the node text is character data containing > or <. This property is readonly and implicitly set via the text property.}
    property text:string read Ftext write Settext;
    {Holds the text value of the node.}
    property attribute[index:variant]: string read getAttribute write setAttribute;default;
    {Provides indexed access to attributes of the node.
    This is the default property of TjanXMLNode2, so you can use anode['price']}
    property attributecount:integer read getAttributeCount;
    {Indicates the number of attrbutes.}
    property attributename[index:integer]:string read Getattributename;
    {Provides indexed access to the attribute names.}
    property nodes:TjanXMLNodeList2 read FNodes;
    {Returns a reference to the list of child nodes.}
    property attributes:TjanXMLNodeList2 read FAttributes;
    {Returns a reference to the list of attributes.}
    property id:string read GetID write SetID;
    {Shortcut for attribute['id']}
    function hasAttribute(aname:string):boolean;
    {Determines if a given attribute exists.}
    procedure addNode(node:TjanXMLNode2);
    {Adds a child node.}
    procedure deleteNode(node:TjanXMLNode2);
    {Delete a given child node}
    procedure insertNode(index:integer;node:TjanXMLNode2);
    {Insert childnode at given position}
    function indexOfAttribute(aname:string):integer;
    {Returns the index of a named attribute.}
    function deleteAttribute(attribute:TjanXMLAttribute2):boolean;
    {Deletes a given attribute.}
    function renameAttribute(oldname,newname:string):boolean;
    {Renames a named attribute.}
    function moveto(node:TjanXMLNode2):boolean;
    {Adds the node as child node to a given node.}
    function cloneNode:TjanXMLNode2;
    {Returns a recursive copy of the node.}
    procedure selectNodes(nodelist: TList; pattern:string;single:boolean=false);overload;
    {Adds recursive child nodes that match pattern to nodelist.}
    procedure selectNodes(parser:TjanXMLParser2;nodelist: TList; pattern:string;single:boolean=false);overload;
    {Adds recursive child nodes that match pattern to nodelist.
    Makes use of the parsers compiled patterns}
    procedure listChildren(alist:TList);
    {Adds recursive child nodes to alist.}
    function FirstChild:TjanXMLNode2;
    {Returns first child (if any) or nil}
    function LastChild:TjanXMLNode2;
    {Returns last child (if any) or nil}
    function NextSibling:TjanXMLNode2;
    {Returns next sibling (if any) or nil}
    function PreviousSibling:TjanXMLNode2;
    {Returns previous sibling (if any) or nil}
    function getParentByName(aname:string):TjanXMLNode2;
    {Find first (recursive) parentnode with the given name}
    function addChildByName(aname:string):TjanXMLNode2;
    {Adds a child with the given tagname}
    function forceChildByName(aname:string):TjanXMLNode2;
    {Returns the first child node with the given tagname and create this node when not present}
    function getChildByName(aname:string; descent:boolean=false):TjanXMLNode2;
    {Returns the first child node with the given tagname}
    function getChildByPath(apath:string):TjanXMLNode2;
    function getChildByPathNoNS(apath:string):TjanXMLNode2;
    {Returns the first (descendant node with the given path: child1/child2 etc}
    function forceChildByPath(apath:string):TjanXMLNode2;
    {Returns (and forces when required) the first (descendant node with the given path: child1/child2 etc}
    function getChildByID(aid:string;descent:boolean=false):TjanXMLNode2;
    {Returns the first child node with the given id attribute value}
    function getChildByAttribute(AttributeName,AttributeValue:string;Recurse:Boolean = false):TjanXMLNode2;
    {Returns the first child node where the given attributename has attributevalue}
    function getChildText(pName:string):string;
    {Returns the text of the first child node with the given tagname; if not found an empty string is returned}
    function transformNode(stylesheet:TjanXMLparser2):string;
    {Transforms the node using stylesheet. Stylesheet must contain an XSLT document.
    The method uses a simplified version of the XSLT standard.
    }
    function namespaceURI:string;
    {Retrieves the value of the matching xmlns:<namespace> value of the node or the first matching parentnode}
    function executeNode(parser:TjanXMLParser2):boolean;
    {Executes a node and any (recursive) child nodes using the script attribute.}
    function getXELVariable(aname:string):TjanXMLNode2;
    {Looks for neares <xel:var id="aname"> and returns the text or an empty string when not found}
    function GetParcer : TjanXMLParser2 ;
  end;



  TjanXMLParser2 = class(TjanXMLNode2)
  private
    { Private declarations }
    Fxml:string;
    Fscan:integer;
    FparseRoot:TjanXMLNode2;
    Foutput:string;
    FOutputDepth:integer;
    FXSLAtom:string;
    FXMLSize:integer;
    FXMLPosition:integer;
    FXMLP: PChar;
    FparseError: string;
    Fdeclaration: TjanXMLNode2;
    FPatterns:TjanXPathParserList2;
    FpageSize: integer;
    FonXEL: TXELEvent;
    function getXML: string;
    procedure setXML(const Value: string);
    function AsText:string;
    procedure OutputNode(node:TjanXMLNode2);
    procedure XSLTOutputNode(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure ExecXSLT(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_value_of(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_call_template(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_apply_templates(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_if(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_attribute(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_element(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_comment(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_choose(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    procedure xsl_for_each(node,context:TjanXMLNode2;matchlist,templatelist:TList);
    function cdatacheck(value:string):string;
    function parse:string;
    function parseFragment(pNode:TjanXMLNode2):string;
    procedure parseNode(rootNode,parentNode:TjanXMLNode2);
    procedure parseAttributes(node:TjanXMLNode2;atts:string);
    procedure parseText(node:TjanXMLNode2);
    procedure XMLPut(value: string);
    procedure SetpageSize(const Value: integer);
    procedure Sort(matchlist:TList;From, Count: Integer;orderby:array of TjanXSLSort);
    function Compare(matchlist:TList;i, j: Integer;orderby:array of TjanXSLSort): Integer;
    procedure Swap(matchlist:TList;i, j: Integer);
    procedure SetonXEL(const Value: TXELEvent);
    function getNodeXML(pNode: TjanXMLNode2): string;
    procedure setNodeXML(pNode: TjanXMLNode2; const Value: string);
  protected
    { Protected declarations }
    function transformNode_(node:TjanXMLNode2):string;
    {transforms the node using XSLT stylesheet}
  public
    { Public declarations }
    LastUsedfilename : String ;
    constructor create;
    destructor  destroy;override;
    {A descendant of TjanXMLNode2 with some added properties and methods for persisting XML}
    procedure LoadXML(filename:string);
    {Loads an XML document from filename and parses the document into a DOM.}
    procedure SaveXML(filename:string);
    {Saves the DOM to filename.}
    function getXPathParser(pattern:string):TjanXPathParser2;
    {Returns a reference to a TjanXPathParser2 instance. The parser keeps an index of used expressions and re-uses existing expressions. This speeds up execution because any expression is only compiled once.}
    property NodeXML[pNode:TjanXMLNode2]:string read getNodeXML write setNodeXML;
    {Parses XML fragment into pNode on write and returns XML document fragment on read }
    property xml:string read getXML write setXML;
    {Holds the XML source. Parses on write and returns DOM as text on read.}
    property parseError:string read FparseError;
    {Returns the parse error description.}
    property parsePosition:integer read Fscan;
    {Returns the parse error position in the XML source.}
    property declaration:TjanXMLNode2 read Fdeclaration;
    {Returns the <?xml  .?> declaration if any}
    property pageSize:integer read FpageSize write SetpageSize;
    {Determines the page size for turbo-speed string concatenation. The default = $10000}
    property onXEL:TXELEvent read FonXEL write SetonXEL;//event
    {Event is raised when executin a XEL script on a node and a <xel:custom> tag is executed}
  published
    { Published declarations }
  end;



  TjanXPathExpression2=class(TObject)
  private
    FInFix:TList;
    FPostFix:TList;
    FStack:TList;
    Fsource: string;
    VStack:array[0..100] of variant;
    SP:integer;
    SL:integer; // source length
//    FToken:string;
//    FTokenKind:TTokenKind;
//    FTokenValue:variant;
//    FTokenOperator:TTokenOperator;
//    FTokenLevel:integer;
//    FTokenExpression:string;
    FPC:integer;
    FonGetVariable: TVariableEvent;
    FCurrentNode: TjanXMLNode2;
    procedure Setsource(const Value: string);
    function Parse:boolean;
//    procedure AddToken;
    procedure ClearInfix;
    procedure ClearPostFix;
    procedure ClearStack;
    function InFixToStack(index:integer):boolean;
    function InfixToPostFix(index:integer):boolean;
    function StackToPostFix:boolean;
    function ConvertInFixToPostFix:boolean;
    procedure procString;
    procedure procNumber;
    procedure procAttribute;
    procedure procEq;
    procedure procNe;
    procedure procGt;
    procedure procGe;
    procedure procLt;
    procedure procLe;
    procedure procAdd;
    procedure procSubtract;
    procedure procMultiply;
    procedure procDivide;
    procedure procAnd;
    procedure procOr;
    procedure procNot;
    procedure procLike;
    procedure procIn;
//  node functions
    procedure procName;
    procedure procParentName;
    procedure procNameSpace;
    procedure procNameSpaceURI;
    procedure procBaseName;
    procedure procValue;
    procedure procAxis;
    procedure procChildCount;
    procedure procHasAttribute;
    procedure procHasChild;
// numerical functions
    procedure procSin;
    procedure procCos;
    procedure procSqr;
    procedure procSqrt;
    procedure procCeil;
    procedure procFloor;
    procedure procIsNumeric;
    procedure procIsDate;
// string functions
    procedure procUPPER;
    procedure procLOWER;
    procedure procTRIM;
    procedure procSoundex;
    procedure procLeft;
    procedure procRight;
    procedure procMid;
    procedure procsubstr_after;
    procedure procsubstr_before;
    procedure procReplace;
    procedure procLen;
    procedure procFix;
    procedure procFormat;
    procedure procYear;
    procedure procMonth;
    procedure procDay;
    procedure procDateAdd;
    procedure procEaster;
    procedure procWeekNumber;
    // conversion functions
    procedure procAsNumber;
    procedure procAsDate;
    procedure procParseFloat;
    // variable assignment and get
    procedure procAssign;
    procedure procGet;

    function CloseStackToPostFix: boolean;
    function OperatorsToPostFix(Level:integer): boolean;
    function FlushStackToPostFix: boolean;
    function runpop:variant;
    procedure runpush(value:variant);
    procedure SetonGetVariable(const Value: TVariableEvent);
    function IsLike(v1,v2:variant):boolean;
    procedure runOperator(op: TTokenOperator);
    procedure SetCurrentNode(const Value: TjanXMLNode2);
//    procedure GetElement(sender:Tobject;const VariableName:string;var VariableValue:variant;var handled:boolean);
    procedure GetAttribute(sender:Tobject;const VariableName:string;var VariableValue:variant;var handled:boolean);
    function IsIn(v1, v2: variant): boolean;
  public
    {Compiling expression evaluator for QXML expressions.}
    constructor Create;
    destructor  Destroy; override;
    procedure Clear;
    {Frees any child objects}
    procedure getInFix(list:TStrings);
    {Fills list with parsed tokens}
    procedure getPostFix(list:TStrings);
    {Fills list with parsed tokens as obtained after infix to postfix conversion.}
    function Evaluate:variant;
    {Evaluates expression. Works very fast because the expression is semi-compiled.}
    procedure GetTokenList(list:TList;from,till:integer);
    {Allows evaluation of sub expressions. For future use.}
    property Expression:string read Fsource write Setsource;
    {Holds the QXML expression. Parses and compiles on write.}
    property CurrentNode:TjanXMLNode2 read FCurrentNode write SetCurrentNode;
    {Hold a reference to the current node. Node functions in the expression work with the current node.}
    property onGetAttribute:TVariableEvent read FonGetVariable write SetonGetVariable;//event
    {Event is raised each time an attribute value is requested in the expression. In the present implementation this event is assigned to an internal method.}
  end;

    function DataSetToXmlString(aToDataset: TDataSet): String;
    procedure CreateFieldDefs(AFieldsNode: TJanXmlNode2;
      aFieldDefs: TFieldDefs);
    procedure ExportData(ARowsNode: TJanXmlNode2; aDataSet: TDataSet;RowName:String);
    procedure ExportFields(AFieldsNode: TJanXmlNode2;
      aFieldDefs: TFields);
    procedure InsertData(ARowNode: TJanXmlNode2; aDataSet: TDataSet;HtmlDecodeData:Boolean);
    procedure LoadXMLFromString(AXml: String; aToDataset: TDataSet;HtmlDecodeData:Boolean);
    procedure LoadXMLFromFile(AXmlFile: String; aToDataset: TDataSet;HtmlDecodeData:Boolean);



implementation

uses Variants;


const
  cr = chr(13)+chr(10);
  tab = chr(9);



procedure CreateFieldDefs(AFieldsNode : TJanXmlNode2;aFieldDefs: TFieldDefs);
var
  i : Integer ;
   FieldType : String ;
begin
  if AFieldsNode <> nil then
  begin

  AFieldDefs.Clear ;
  for i := 0 to AFieldsNode.nodes.Count -1 do
       begin
        // no double fields allowed. field value will probably be the last name value and the field create will folow by destroying the old one
        if aFieldDefs.IndexOf(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname']) <> -1 then
           begin
             // delete field
             raise Exception.Create(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname']);
             aFieldDefs.Delete(aFieldDefs.IndexOf(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname']));
           end;
         FieldType := LowerCase(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['fieldtype']) ;
         if FieldType = 'i2' then
           begin
              AFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftSmallint);
           end else
         if FieldType = 'i4' then
           begin
              AFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftInteger);
           end else
         if FieldType = 'string' then
           begin
              AFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftString,Min(StrToIntDef(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['WIDTH'],0),20000));
           end else
         if FieldType = 'r8' then
           begin
              AFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftFloat);
           end else
         if FieldType = 'datetime' then
           begin
              AFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftDateTime);
           end else
         if FieldType = 'date' then
           begin
              aFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftDate);
           end else
         if FieldType = 'sqldatetime' then
           begin
              aFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftTimeStamp);
           end else
         if FieldType = 'bin.hex' then
           begin
             if TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['SUBTYPE'] = 'Graphics' then
              aFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftGraphic)
             else
               aFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftMemo)
           end else
         if FieldType = 'nested' then
           begin
             AFieldDefs.Add(TJanXmlNode2(AFieldsNode.nodes.Items[i]).attribute['attrname'],ftDataSet) ;
             CreateFieldDefs(TJanXmlNode2(AFieldsNode.nodes.Items[i]).getChildByPath('FIELDS'),aFieldDefs.Items[aFieldDefs.Count-1].ChildDefs);
           end ;
       end;
  end; // End fieldsnode <> nil
end;

procedure LoadXMLFromString(AXml: String;
  aToDataset: TDataSet;HtmlDecodeData:Boolean);
  var
   ajanXMLParser2 : TjanXMLParser2 ;
   AFieldsNode : TJanXmlNode2 ;
   ARowsNode :  TJanXmlNode2 ;
   i : Integer ;
begin
  aToDataset.Close ;
   ajanXMLParser2 := TjanXMLParser2.create ;
    try
      ajanXMLParser2.xml := AXml ;
      AFieldsNode := ajanXMLParser2.getChildByPath('METADATA/FIELDS') ;
      if AFieldsNode <> nil then
        begin
           // create fielddefs
           CreateFieldDefs(AFieldsNode,aToDataset.FieldDefs);
           aToDataset.Open ;
           ARowsNode :=   ajanXMLParser2.getChildByPath('ROWDATA') ;
           // load data
           if ARowsNode <> nil then
            InsertData(ARowsNode,aToDataset,HtmlDecodeData);
        end;
    finally
     ajanXMLParser2.free ;
    end;
end;

procedure LoadXMLFromFile(AXmlFile: String; aToDataset: TDataSet;HtmlDecodeData:Boolean);
var
   ajanXMLParser2 : TjanXMLParser2 ;
   AFieldsNode : TJanXmlNode2 ;
   ARowsNode :  TJanXmlNode2 ;
   i : Integer ;
begin
  aToDataset.Close ;
   ajanXMLParser2 := TjanXMLParser2.create ;
    try
      ajanXMLParser2.LoadXML(AXmlFile) ;
      if ajanXMLParser2.parseError <> '' then
        raise Exception.Create(ajanXMLParser2.parseError);
      AFieldsNode := ajanXMLParser2.getChildByPath('METADATA/FIELDS') ;
      if AFieldsNode <> nil then
        begin
           // create fielddefs
           CreateFieldDefs(AFieldsNode,aToDataset.FieldDefs);
           aToDataset.Open ;
           ARowsNode :=   ajanXMLParser2.getChildByPath('ROWDATA') ;
           // load data
           if ARowsNode <> nil then
            InsertData(ARowsNode,aToDataset,HtmlDecodeData);

        end;
    finally
     ajanXMLParser2.free ;
    end;
end;


procedure InsertData(ARowNode: TJanXmlNode2; aDataSet: TDataSet;HtmlDecodeData:Boolean);
var
 rows,i : Integer ;
 AttribField : TField ;
 AValueString : String ;
 function GetDate(ADateString : String ) : TDateTime ;
 var
  Year,Month,Day,Hour,Minutes,Seconds,Miliseconds : Word ;
 begin
  Result := 0 ;
  if ADateString <> '' then
   begin
   Year := StrToIntDef(copy(ADateString,1,4),0);
   Month := StrToIntDef(copy(ADateString,5,2),0);
   Day := StrToIntDef(copy(ADateString,7,2),0);
   // todo : time
   Hour := StrToIntDef(copy(ADateString,10,2),0);
   Minutes := StrToIntDef(copy(ADateString,13,2),0);
   Seconds := StrToIntDef(copy(ADateString,16,2),0);
   result := EncodeDateTime(Year,Month,Day,Hour,Minutes,Seconds,Miliseconds);
   end;
 end;
begin
  AValueString := ARowNode.FParser.Fxml ;
  if  AValueString = '' then exit ;

  aDataSet.DisableControls ;
  try
  for rows := 0 to ARowNode.nodes.Count -1 do
    begin
      aDataSet.Append ;
       for i := 0 to TJanXmlNode2(ARowNode.nodes[rows]).attributecount -1 do
         begin
           AttribField := aDataSet.FindField(TJanXmlNode2(ARowNode.nodes[rows]).attributename[i]) ;
           if (AttribField <> nil) and (TJanXmlNode2(ARowNode.nodes[rows]).attribute[i] <> '') then
              begin
                 case AttribField.DataType of
                  ftString : begin
                               if HtmlDecodeData then
                                begin
                                  AValueString :=   HtmlDecode(HtmlDecode(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i]))  ;
                                  AttribField.AsString :=  copy(AValueString,1,AttribField.Size) ;
                                end else
                                begin
                                AValueString :=  UTF8Decode(HtmlDecode(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i])) ;
                                if trim(AValueString) = '' then
                                   AValueString :=  HtmlDecode(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i]) ;
                                AttribField.AsString :=  copy(AValueString,1,AttribField.Size) ;
                                end ;
                             end;

                  ftSmallint,
                  ftInteger,ftWord : begin
                                       AttribField.value := HtmlDecode(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i]) ;
                                     end;
                  ftDate,ftDateTime : begin
                                        AttribField.value := GetDate(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i]) ;
                                       end;
                  ftFloat : begin
                               AttribField.value := StrToFloat(StringReplace(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i],'.',DecimalSeparator,[]));
                            end;
                  ftmemo,ftBlob  : begin
                                        if HtmlDecodeData then
                                          AValueString :=  HtmlDecode(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i])
                                        else
                                       AttribField.value :=  utf8Decode(HtmlDecode(TJanXmlNode2(ARowNode.nodes[rows]).attribute[i])) ;
                                   end;
                  ftGraphic : AttribField.value := TJanXmlNode2(ARowNode.nodes[rows]).attribute[i] ;
                end; // end case
              end;
         end;
       // nesteled data
       for i := 0 to TJanXmlNode2(ARowNode.nodes[rows]).nodes.Count -1 do
           begin
             AttribField := aDataSet.FindField(TJanXmlNode2(TJanXmlNode2(ARowNode.nodes[rows]).nodes[i]).name) ;
             if (AttribField <> nil) and (AttribField.DataType = ftDataSet) then
                begin
                   InsertData(TJanXmlNode2(TJanXmlNode2(ARowNode.nodes[rows]).nodes[i]),TDataSetField(AttribField).NestedDataSet,HtmlDecodeData);
                end;
           end;
       aDataSet.Post ;
    end;
    aDataset.first ;
  finally
    aDataSet.EnableControls ;
  end;
end;


function DataSetToXmlString(aToDataset: TDataset): String;
  var
   ajanXMLParser2 : TjanXMLParser2 ;
   AFieldsNode : TJanXmlNode2 ;
   ARowsNode :  TJanXmlNode2 ;
   i : Integer ;
begin
   ajanXMLParser2 := TjanXMLParser2.create ;
    try
      ajanXMLParser2.name := 'DATAPACKET' ;
      ajanXMLParser2.attribute['Version'] := '2.0' ;
      AFieldsNode := ajanXMLParser2.forceChildByPath('METADATA/FIELDS') ;
      if AFieldsNode <> nil then
        begin
           // create fielddefs
           ExportFields(AFieldsNode,aToDataset.Fields);
           ARowsNode :=   ajanXMLParser2.forceChildByPath('ROWDATA') ;
           // Save data
           if ARowsNode <> nil then
            ExportData(ARowsNode,aToDataset,'');
        end;
      Result := ajanXMLParser2.xml ;
    finally
     ajanXMLParser2.free ;
    end;
end;

procedure ExportData(ARowsNode: TJanXmlNode2; aDataSet: TDataSet;RowName:String);
  var
   i : Integer ;
   TheRowNode : TJanXmlNode2 ;
begin
 aDataSet.First ;
 while not aDataSet.Eof do
   begin
     TheRowNode := ARowsNode.addChildByName('ROW'+RowName) ;
     for i := 0 to aDataSet.FieldCount -1 do
       begin
         if not aDataSet.Fields[i].IsNull then
           begin
             case aDataSet.Fields[i].DataType of
              ftDate : TheRowNode.attribute[aDataSet.Fields[i].FieldName] := FormatDateTime('yyyymmdd hh:nn:ss:zzzz',aDataSet.Fields[i].AsDateTime);
              ftDateTime : TheRowNode.attribute[aDataSet.Fields[i].FieldName] := FormatDateTime('yyyymmdd hh:nn:ss:zzzz',aDataSet.Fields[i].AsDateTime);
              ftDataSet : begin
                            ExportData(TheRowNode.addChildByName(aDataSet.Fields[i].FieldName),TDataSetField(aDataSet.Fields[i]).NestedDataSet,aDataSet.Fields[i].FieldName);
                         end;
             ftInteger,ftAutoInc,ftSmallint,ftLargeint : TheRowNode.attribute[aDataSet.Fields[i].FieldName] := IntToStr(aDataSet.Fields[i].AsInteger);

              else
               TheRowNode.attribute[aDataSet.Fields[i].FieldName] := HTMLEncode(trim(aDataSet.Fields[i].AsString)) ;
             end ; // end case
           end;
       end;
     aDataSet.Next ;  
   end; // end wile not eof
end;

procedure ExportFields(AFieldsNode: TJanXmlNode2;
  aFieldDefs: TFields);
  var
   i : Integer ;
   TheFieldNode : TJanXmlNode2 ;
begin
  for i := 0 to aFieldDefs.Count -1 do
       begin
        theFieldNode :=  AFieldsNode.addChildByName('FIELD') ;
        theFieldNode.attribute['attrname'] := aFieldDefs[i].FieldName ;

         case aFieldDefs[i].DataType of
         ftSmallint : theFieldNode.attribute['fieldtype'] := 'i2' ;
         ftInteger,ftLargeint : theFieldNode.attribute['fieldtype'] := 'i4' ;
         ftString : begin
                     theFieldNode.attribute['fieldtype'] := 'string' ;
                     theFieldNode.attribute['WIDTH'] := IntToStr(aFieldDefs[i].Size) ;
                    end;
         ftFloat : theFieldNode.attribute['fieldtype'] := 'r8' ;
         ftDateTime : theFieldNode.attribute['fieldtype'] := 'Datetime' ;
         ftDate : theFieldNode.attribute['fieldtype'] := 'date' ;
         ftTimeStamp : theFieldNode.attribute['fieldtype'] := 'SQLdatetime' ;

         ftGraphic : begin
                      theFieldNode.attribute['fieldtype'] := 'bin.hex' ;
                      theFieldNode.attribute['SUBTYPE'] := 'Graphics' ;
                     end;
         ftMemo,ftblob :   begin
                      theFieldNode.attribute['fieldtype'] := 'bin.hex' ;
                      theFieldNode.attribute['SUBTYPE'] := 'text' ;
                     end;
         ftDataSet : begin
                      theFieldNode.attribute['fieldtype'] := 'nested' ;
                      ExportFields(theFieldNode.forceChildByPath('FIELDS'),TDataSetField(aFieldDefs[i]).NestedDataSet.Fields);
                     end;

         end ;// end case ;;
  end; // End for i

end;

// xpath operators

// check the element name
function xpElement(node:TjanXMLNode2;aname,avalue:string):boolean;
begin
  result:=node.name=aname;
end;

// check the attribute existence
function xpNop(node:TjanXMLNode2;aname,avalue:string):boolean;
begin
  result:=false;
end;


function xpAttribute(node:TjanXMLNode2;aname,avalue:string):boolean;
begin
  result:=node.indexOfAttribute(aname)<>-1;
end;

// check the attribute=value
function xpAttributeEQ(node:TjanXMLNode2;aname,avalue:string):boolean;
begin
  result:=node.indexOfAttribute(aname)<>-1;
  if result then
    result:=node.attribute[aname]=avalue;
end;

// check the attribute<>value
function xpAttributeNE(node:TjanXMLNode2;aname,avalue:string):boolean;
begin
  result:=node.indexOfAttribute(aname)<>-1;
  if result then
    result:=node.attribute[aname]<>avalue;
end;

// check the presence of a named child
function xpChild(node:TjanXMLNode2;aname,avalue:string):boolean;
var
  i,c:integer;
  n:TjanXMLNode2;
begin
  result:=false;
  c:=node.nodes.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(node.nodes[i]);
    if n.name=aname then
      result:=true;
      exit;
  end;
end;



// check the presence of a named child with value
function xpChildEQ(node:TjanXMLNode2;aname,avalue:string):boolean;
var
  i,c:integer;
  n:TjanXMLNode2;
begin
  result:=false;
  c:=node.nodes.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(node.nodes[i]);
    if n.name=aname then
      if n.text=avalue then begin
        result:=true;
        exit;
      end;
  end;
end;

// check the presence of a named child with<>value
function xpChildNE(node:TjanXMLNode2;aname,avalue:string):boolean;
var
  i,c:integer;
  n:TjanXMLNode2;
begin
  result:=false;
  c:=node.nodes.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(node.nodes[i]);
    if n.name=aname then
      if n.text<>avalue then begin
        result:=true;
        exit;
      end;
  end;
end;




{ TjanXMLNode2 }

procedure TjanXMLNode2.addNode(node: TjanXMLNode2);
begin
  FNodes.Add(node);
  node.parentNode:=self;
end;

function TjanXMLNode2.cloneNode: TjanXMLNode2;
var i:integer;
    n:TjanXMLNode2;
    a:TjanXMLAttribute2;
begin
  result:=TjanXMLNode2.create;
  result.name:=name;
  result.text:=text;
  if Fattributes.Count>0 then
    for i:=0 to Fattributes.Count-1 do begin
      a:=TjanXMLAttribute2(attributes[i]).cloneAttribute;
      result.attributes.Add(a);
    end;
  if nodes.count>0 then begin
    for i:=0 to nodes.count-1 do begin
      n:=TjanXMLNode2(nodes[i]).cloneNode;
      result.Nodes.Add(n);
      n.ParentNode := Result;
    end;
  end;
end;

constructor TjanXMLNode2.create;
begin
  inherited;
  Fnodes:=TjanXMLNodeList2.create;
  Fattributes:=TjanXMLNodeList2.create;
  FCDATA:=false;
end;

function TjanXMLNode2.deleteAttribute(attribute:TjanXMLAttribute2): boolean;
var
  index:integer;
begin
  result:=false;
  index:=FAttributes.IndexOf(attribute);
  if index=-1 then exit;
  FAttributes.Delete(index);
  result:=true;
end;

procedure TjanXMLNode2.deleteNode(node: TjanXMLNode2);
var
  i:integer;
  dn:TjanXMLNode2;
begin
  i:=Fnodes.IndexOf(node);
  dn:=TjanXMLNode2(Fnodes[i]);
  dn.free;
  Fnodes.Delete(i);
end;

destructor TjanXMLNode2.destroy;
begin
  Fattributes.free;
  FNodes.free;
  inherited;

end;

{function TjanXMLNode2.processXSL(node: TjanXMLNode2): string;
begin
  if name='xsl:apply-templates' then
    result:=xsl_apply_templates(node)
  else
    result:='';
end;

function TjanXMLNode2.xsl_apply_templates(node: TjanXMLNode2): string;
var
  pattern:TjanXPathParser2;
  n,matchnode:TjanXMLNode2;
  nodelist:Tlist;
  i,c:integer;
begin
  pattern:=TjanXPathParser2.Create;
  pattern.pattern:=attribute['select'];
  if pattern.pattern='' then
    result:=node.execXSL(node)
  else begin
    n:=self.Fparser.selectTemplate(pattern);
    if n=nil then
      result:=''
    else begin
      nodelist:=Tlist.Create;
      try
     //   node.selectNodes(nodelist,pattern);
        result:='';
        c:=nodelist.count;
        if c<>0 then
          for i:=0 to c-1 do begin
            matchnode:=TjanXMLNode2(nodelist[i]);
            result:=result+n.execXSL(matchnode);
          end;
      finally
        nodelist.free;
      end;
    end;
  end;
  pattern.free;
end;

function TjanXMLNode2.match(pattern:string):boolean;
var
  s:string;
begin
  s:=pattern;
  result:=self.name=pattern;
end;}

procedure TjanXMLNode2.selectNodes(nodelist:TList;pattern:string;single:boolean=false);
var
  i,c:integer;
  xpp:TjanXPathParser2;
begin
  xpp:=TjanXPathParser2.Create;
  try
    xpp.pattern:=pattern;
    xpp.selectNodes(self,nodelist,single);
  finally
    xpp.free;
  end;
end;


{function TjanXMLNode2.selectTemplate(pattern:TjanXPathParser2):TjanXMLNode2;
var
  n:TjanXMLNode2;
  i,c:integer;
  ename,amatch:string;
begin
  result:=self;
  if (self.name='xsl:template') and (attribute['match']=pattern.pattern) then exit; // got it
  result:=nil;
  c:=self.nodes.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    result:=TjanXMLNode2(self.nodes[i]).selectTemplate(pattern);
    if result<>nil then exit;
  end;
end;

function TjanXMLNode2.execXSL(node: TjanXMLNode2): string;
var
  i,c:integer;
  aname:string;
begin
  if pos('xsl:',self.name)>0 then begin
    result:=processXSL(node);
    exit;
  end;
  result:='<'+self.name;
  c:=self.attributecount;
  if c<>0 then
    for i:=0 to c-1 do begin
      aname:=self.attributename[i];
      result:=result+' '+aname+'='''+self.attribute[aname]+'''';
    end;
  if self.text<>'' then begin
    result:=result+'>'+self.text;
  end;
  c:=self.nodes.count;
  if c=0 then begin
    if self.text='' then
      result:=result+'/>'+cr
    else
      result:=result+'</'+self.name+'>'+cr;
  end
  else begin
    if self.text='' then
      result:=result+'>';
    for i:=0 to c-1 do begin
      result:=result+TjanXMLNode2(self.nodes[i]).execXSL(node);
    end;
    result:=result+'</'+self.name+'>';
  end;
end;}

function TjanXMLNode2.getAttribute(index: variant): string;
var
  i:integer;
begin
  result:='';
  case VarType(index) of
    varstring:
      begin
        i:=indexOfAttribute(index);
        if i<>-1 then
          result:=TjanXMLAttribute2(Fattributes[i]).Value;
      end;
    varinteger:
      begin
        i:=index;
        if index<Fattributes.Count then
          result:= TjanXMLAttribute2(Fattributes[i]).Value;
      end;
  end
end;

function TjanXMLNode2.getAttributeCount: integer;
begin
  result:=Fattributes.Count;
end;

function TjanXMLNode2.Getattributename(index: integer): string;
begin
  if index<Fattributes.count then
    result:=TjanXMLAttribute2(Fattributes[index]).name
  else
    result:='';
end;

function TjanXMLNode2.moveto(node: TjanXMLNode2):boolean;
var
  n:TjanXMLNode2;
  index:integer;
begin
  result:=false;
  n:=self.parentNode;
  if n=nil then exit;
  index:=n.nodes.IndexOf(self);
  if index=-1 then exit;
  n.nodes.Delete(index);
  node.addNode(self);
  result:=true;
end;

function TjanXMLNode2.renameAttribute(oldname, newname: string): boolean;
var
  index,p:integer;
  s:string;
begin
  result:=false;
  index:=indexOfAttribute(oldname);
  if index=-1 then exit;
  TjanXMLAttribute2(FAttributes[index]).name:=newname;
  result:=true;
end;

procedure TjanXMLNode2.setAttribute(index: variant; const Value: string);
var
  idx:integer;
  a:TjanXMLAttribute2;
begin

  case vartype(index) of
  varstring:
    begin
      if Trim(index) = '' then exit ;
      idx:=indexofAttribute(index);
      if idx=-1 then begin
        a:=TjanXMLAttribute2.Create;
        a.name:=index;
        a.value:=value;
        FAttributes.Add(a);
      end
      else
        TjanXMLAttribute2(Fattributes[idx]).value:=value;
    end;
  varinteger:
    begin
      idx:=index;
      if idx<FAttributes.count then
        TjanXMLAttribute2(Fattributes[idx]).value:=value;
    end;
  end;
end;


procedure TjanXMLNode2.Setname(const Value: string);
var
  p:integer;
begin
  p:=pos(':',value);
  if p=0 then
    Fname := Value
  else begin
    Fnamespace:=copy(value,1,p);
    Fname:=value;
  end;
end;


procedure TjanXMLNode2.SetParentNode(const Value: TjanXMLNode2);
begin
  FParentNode := Value;
end;

procedure TjanXMLNode2.Settext(const Value: string);
begin
  FCDATA:= (posstr('<',value)<>0) or (posstr('>',value)<>0);
  Ftext := Value
end;


function TjanXMLNode2.indexOfAttribute(aname: string): integer;
var
  i,c:integer;
begin
  result:=-1;
  c:=attributes.Count;
  if c=0 then exit;
  for i:=0 to c-1 do
    if TjanXMLAttribute2(FAttributes[i]).name=aname then begin
      result:=i;
      exit;
    end;
end;

function TjanXMLNode2.hasAttribute(aname: string): boolean;
begin
  result:=self.indexOfAttribute(aname)<>-1;
end;

procedure TjanXMLNode2.listChildren(alist: TList);
var
  i,c:integer;
  n:TjanXMLNode2;
begin
  c:=nodes.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(nodes[i]);
    alist.Add(n);
    n.listChildren(alist);
  end;
end;

function TjanXMLNode2.getChildByID(aid: string;descent:boolean=false): TjanXMLNode2;
var
  i,c:integer;
  n:TjanXMLNode2;
begin
  result:=nil;
  c:=self.nodes.count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(nodes[i]);
    if n.attribute['id']=aid then begin
      result:=n;
      break;
    end
    else begin
      if not descent then
        continue
      else begin
        result:=n.getChildByID(aid,descent);
        if result<>nil then
          break
        else
          continue;
      end;
    end;
  end;
end;

function TjanXMLNode2.getChildByName(aname: string;descent:boolean=false): TjanXMLNode2;
var
  i,c:integer;
  n:TjanXMLNode2;
begin
  result:=nil;
  c:=self.nodes.count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(nodes[i]);
    if n.name=aname then begin
      result:=n;
      exit;
    end
    else begin
      if not descent then
        continue
      else begin
        result:=n.getChildByName(aname,descent);
        if result<>nil then
          exit
        else
          continue;
      end;
    end;
  end;
end;




function TjanXMLNode2.transformNode(stylesheet: TjanXMLparser2): string;
begin
  result:=stylesheet.transformNode_(self);
end;

procedure TjanXMLNode2.selectNodes(parser: TjanXMLParser2; nodelist: TList;
  pattern: string; single: boolean);
var
  i,c:integer;
  xpp:TjanXPathParser2;
begin
  xpp:=parser.getXPathParser(pattern);
  xpp.selectNodes(self,nodelist,single);
end;

function TjanXMLNode2.namespaceURI: string;
var
  n:TjanXMLNode2;
  ns,nsURI,xmlns:string;
begin
  result:='';
  n:=self;
  ns:=n.namespace;
  if ns='' then exit;
  ns:='xmlns:'+ns;
  result:=n.attribute[ns];
  if result<>'' then exit;
  while n.parentNode<>nil do begin
    n:=n.parentnode;
    result:=n.attribute[ns];
    if result<>'' then exit;
  end;
end;

procedure TjanXMLNode2.insertNode(index: integer; node: TjanXMLNode2);
begin
  FNodes.Insert(index,node);
end;

function TjanXMLNode2.forceChildByName(aname: string): TjanXMLNode2;
begin
  result:=getChildByName(aname);
  if result<>nil then exit;
  result:=TjanXMLNode2.create;
  result.name:=aname;
  AddNode(result);
end;

function TjanXMLNode2.GetID: string;
begin
  result:=attribute['id'];
end;

procedure TjanXMLNode2.SetID(const Value: string);
begin
  attribute['id']:=value;
end;

function TjanXMLNode2.getChildByAttribute(AttributeName,
  AttributeValue: string;Recurse:Boolean = false): TjanXMLNode2;
var
  i,c,x:integer;
  n:TjanXMLNode2;
begin
  result:=nil;
  c:=self.nodes.count;
  if c=0 then exit;
  for i:=0 to c-1 do
  begin
    n:=TjanXMLNode2(nodes[i]);
    if n.attribute[AttributeName]= AttributeValue then
    begin
       result:=n;
       exit;
     end  else
      if Recurse then
    begin
         for x := 0 to  TjanXMLNode2(nodes[i]).nodes.Count -1 do
           begin
              result :=  TjanXMLNode2(TjanXMLNode2(nodes[i]).nodes[x]).getChildByAttribute(AttributeName,AttributeValue);
           end;
      end;
  end;
end;

function TjanXMLNode2.addChildByName(aname: string): TjanXMLNode2;
begin
  result:=TjanXMLNode2.create;
  result.name:=aname;
  addNode(result);
end;

function TjanXMLNode2.getChildByPath(apath: string): TjanXMLNode2;
var
  tmp, atom:string;
  p:integer;
  n:TjanXMLNode2;
begin
  result:=nil;
  tmp:=apath;
  p:=pos('/',tmp);
  if p=0 then begin
    atom:=tmp;
    result:=getChildByName(atom);
  end
  else begin
    n:=self;
    atom:=copy(tmp,1,p-1);
    delete(tmp,1,p);
    while atom<>'' do begin
      result:=n.getChildbyName(atom);
      if result=nil then exit;
      n:=result;
      p:=pos('/',tmp);
      if p=0 then begin
        atom:=tmp;
        tmp:='';
      end
      else begin
        atom:=copy(tmp,1,p-1);
        delete(tmp,1,p);
      end;
    end;
  end;
end;

function TjanXMLNode2.getChildText(pName: string): string;
var
  xc:TjanXMLNode2;
begin
  result:='';
  xc:=getchildbyName(pName);
  if xc=nil then exit;
  result:=xc.text;
end;

function TjanXMLNode2.forceChildByPath(apath: string): TjanXMLNode2;
var
  tmp, atom:string;
  p:integer;
  n:TjanXMLNode2;
begin
  result:=nil;
  tmp:=apath;
  p:=pos('/',tmp);
  if p=0 then begin
    atom:=tmp;
    result:=forceChildByName(atom);
  end
  else begin
    n:=self;
    atom:=copy(tmp,1,p-1);
    delete(tmp,1,p);
    while atom<>'' do begin
      result:=n.forceChildbyName(atom);
      n:=result;
      p:=pos('/',tmp);
      if p=0 then begin
        atom:=tmp;
        tmp:='';
      end
      else begin
        atom:=copy(tmp,1,p-1);
        delete(tmp,1,p);
      end;
    end;
  end;
end;

function TjanXMLNode2.getParentByName(aname: string): TjanXMLNode2;
var
  n:TjanXMLNode2;
begin
  result:=nil;
  if parentNode=nil then exit;
  n:=parentNode;
  while n<>nil do begin
    if n.name=aname then begin
      result:=n;
      exit;
    end;
    n:=n.parentnode;
  end;
end;

function TjanXMLNode2.executeNode(parser: TjanXMLParser2): boolean;
var
  script:string;
  i,c:integer;
  xpp:TjanXPathParser2;
  atom:string;
  act:string;
  xcall,xswitch:TjanXMLNode2;
  runChildNodes:boolean;
  t1,t2:integer;
  skip:boolean;

  function getFunctionNode:TjanXMLNode2;
  begin
    result:=self.getParentByName('xel:program');
    if result=nil then exit;
    result:=result.getChildByID(text);
    if result=nil then exit;
    if result.name<>'xel:function' then result:=nil;
  end;
begin
  result:=false;
  atom:=name;
  if pos('xel:',atom)=1 then begin
    act:=self['act'];
    xpp:=parser.getXPathParser(act);
    delete(atom,1,4);
    if atom='program' then skip:=true
    else if atom='function' then skip:=true
    else if atom='var' then skip:=true
    else if atom='do' then begin
      xpp.testNode(self);
      exit;
    end
    else if atom='call' then begin
      xcall:=GetFunctionNode;
      if xcall=nil then exit;
      c:=xcall.nodes.count;
      if c=0 then exit;
      for i:=0 to c-1 do
         TjanXMLNode2(xcall.Nodes[i]).executeNode(parser);
      exit;
    end
    else if atom='if' then begin
      if not xpp.testNode(self) then exit;
      c:=nodes.count;
      if c=0 then exit;
      for i:=0 to c-1 do
         TjanXMLNode2(self.Nodes[i]).executeNode(parser);
      exit;
    end
    else if atom='while' then begin
      t1:=gettickcount;
      while xpp.testNode(self) do begin
        t2:=gettickcount;
        if (t2-t1)>10000 then exit;
        c:=nodes.Count;
        if c=0 then exit;
        for i:=0 to c-1 do
          TjanXMLNode2(Nodes[i]).executeNode(parser);
      end;
      exit;
    end
    else if atom='switch' then begin
      result:=xelSwitch(self,parser);
      exit;
    end
    else if atom='custom' then begin
      if assigned(parser.onXEL) then
        parser.onXEL(parser,self,act);
      exit;  
    end;
  end;
  c:=nodes.Count;
  if c<>0 then
    for i:=0 to c-1 do
      TjanXMLNode2(Nodes[i]).executeNode(parser);
end;

function TjanXMLNode2.xelSwitch(anode: TjanXMLNode2;
  parser: TjanXMLParser2): boolean;
var
  xpp:TjanXPathParser2;
  xcase:TjanXMLNode2;
  i,c:integer;
  ii,cc:integer;
begin
  result:=false;
  c:=anode.nodes.count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    xcase:=TjanXMLNode2(anode.nodes[i]);
    if xcase.name<>'xel:case' then continue;
    xpp:=parser.getXPathParser(xcase['act']);
    if not xpp.testNode(xcase) then  continue;
    cc:=xcase.nodes.count;
    if cc=0 then exit;
    for ii:=0 to cc-1 do
      TjanXMLNode2(xcase.nodes[ii]).executeNode(parser);
    exit;
  end;
end;

function TjanXMLNode2.getXELVariable(aname: string): TjanXMLNode2;
var
  n, nscope:TjanXMLNode2;
  stopsearch:boolean;
begin
// lookup first matching variable
  result:=nil;
  stopsearch:=false;
  nscope:=self;
  repeat
    n:=nscope.getParentByName('xel:function');
    if n=nil then begin
      n:=nscope.getParentByName('xel:program');
      if n=nil then exit;
      stopsearch:=true;
    end;
    nscope:=n;
    n:=n.getChildByID(aname);
    if n<>nil then
      if n.name='xel:var' then begin
        result:=n;
        exit;
      end;
  until stopsearch;
end;

function TjanXMLNode2.FirstChild: TjanXMLNode2;
begin
  result:=nil;
  if nodes.Count=0 then exit;
  result:=TjanXMLNode2(self.nodes[0]);
end;

function TjanXMLNode2.LastChild: TjanXMLNode2;
var
  c:integer;
begin
  result:=nil;
  c:=nodes.Count;
  if c=0 then exit;
  result:=TjanXMLNode2(self.nodes[c-1]);
end;

function TjanXMLNode2.NextSibling: TjanXMLNode2;
var
  xn:TjanXMLNode2;
  i,c:integer;
begin
  result:=nil;
  if self.parentNode=nil then exit;
  xn:=self.parentNode;
  i:=xn.nodes.IndexOf(self);
  if i<0 then exit;
  c:=xn.nodes.count;
  if i<(c-1) then
    result:=TjanXMLNode2(xn.nodes[i+1]);
end;

function TjanXMLNode2.PreviousSibling: TjanXMLNode2;
var
  xn:TjanXMLNode2;
  i,c:integer;
begin
  result:=nil;
  if self.parentNode=nil then exit;
  xn:=self.parentNode;
  i:=xn.nodes.IndexOf(self);
  if i<1 then exit;
  result:=TjanXMLNode2(xn.nodes[i-1]);
end;

function TjanXMLNode2.GetParcer: TjanXMLParser2;
begin
  if Self is TjanXMLParser2 then
    Result := (Self As TjanXMLParser2 ) else
    result := parentNode.GetParcer ;
end;

function TjanXMLNode2.getChildByPathNoNS(apath: string): TjanXMLNode2;
var
  tmp, atom:string;
  p:integer;
  n:TjanXMLNode2;
begin
  result:=nil;
  tmp:=apath;
  p:=pos('/',tmp);
  if p=0 then begin
    atom:=tmp;
    result:=getChildByName(self.namespace + atom);
  end
  else begin
    n:=self;
    atom:=copy(tmp,1,p-1);
    delete(tmp,1,p);
    while atom<>'' do begin
      result:=n.getChildbyName(self.namespace +atom);
      if result=nil then exit;
      n:=result;
      p:=pos('/',tmp);
      if p=0 then begin
        atom:=tmp;
        tmp:='';
      end
      else begin
        atom:=copy(tmp,1,p-1);
        delete(tmp,1,p);
      end;
    end;
  end;
end;
{ TjanXMLNodeList2 }

procedure TjanXMLNodeList2.Clear;
var
  i,c:integer;
begin
  c:=self.Count;
  if c>0 then
    for i:=0 to c-1 do
      TjanXMLNodeList2(self.Items[i]).free;
  inherited;
end;

destructor TjanXMLNodeList2.destroy;
var
  i,c:integer;
begin
  clear;
  inherited;
end;

{ TjanXMLParser2 }


{ TjanXMLParser2 }

function TjanXMLParser2.AsText: string;
var
  version,encoding:string;
begin
  FOutPut:='';
  FXMLSize:=$10000;
  FXMLPosition:=0;
  SetLength(FOutPut,FXMLSize);
  FXMLP:=pointer(FOutPut);
  FOutputdepth:=0;
  version:=declaration.attribute['version'];
  if version='' then
    version:='1.0';
  encoding:=declaration.attribute['encoding'];
  if encoding='' then
    encoding:='ISO-8859-1';
  XMLPut('<?xml version='''+version+''' encoding='''+encoding+''' ?>'+cr);
  OutputNode(self);
  result:=copy(FOutput,1,FXMLPosition);
  FOutput:='';
end;

function TjanXMLParser2.cdatacheck(value: string): string;
begin
// check if value containts < or >, if so output
// <![CDATA[   ... ]]>
  result:=value;
  if (posstr('<',value)=0) and (posstr('>',value)=0) then exit;
  result:='<![CDATA['+value+']]>';
end;

constructor TjanXMLParser2.create;
begin
  inherited;
  FPageSize:=$10000;
  FDeclaration:=TjanXMLNode2.create;
  FPatterns:=TjanXPathParserList2.create;
end;

destructor TjanXMLParser2.destroy;
begin
  FDeclaration.free;
  FPatterns.free;
  inherited;
end;

procedure TjanXMLParser2.ExecXSLT(node,context: TjanXMLNode2; matchlist,
  templatelist: TList);
begin
  if node.name='xsl:value-of' then begin
    xsl_value_of(node,context, matchlist, templatelist)
  end
  else if node.name='xsl:call-template' then begin
    xsl_call_template(node,context, matchlist, templatelist)
  end
  else if node.name='xsl:apply-templates' then begin
    xsl_apply_templates(node,context, matchlist, templatelist)
  end
  else if node.name='xsl:if' then begin
    xsl_if(node,context, matchlist, templatelist)
  end
  else if node.name='xsl:attribute' then begin
    xsl_attribute(node,context, matchlist, templatelist);
  end
  else if node.name='xsl:element' then begin
    xsl_element(node,context, matchlist, templatelist);
  end
  else if node.name='xsl:choose' then begin
    xsl_choose(node,context, matchlist, templatelist);
  end
  else if node.name='xsl:for-each' then begin
    xsl_for_each(node,context, matchlist, templatelist);
  end
  else if node.name='xsl:comment' then begin
    xsl_comment(node,context, matchlist, templatelist);
  end
end;

function TjanXMLParser2.getXML: string;
begin
  result:=AsText;
end;

function TjanXMLParser2.getXPathParser(pattern: string): TjanXPathParser2;
var
  index:integer;
  xpp:TjanXPathParser2;
begin
  index:=FPatterns.IndexOf(pattern);
  if index<>-1 then
    result:=TjanXPathParser2(FPatterns.objects[index])
  else begin
    xpp:=TjanXPathParser2.Create;
    xpp.pattern:=pattern;
    result:=xpp;
    FPatterns.AddObject(pattern,xpp);
  end;
end;

procedure TjanXMLParser2.LoadXML(filename: string);
begin
  LastUsedfilename := filename ;
  Fxml:=loadstring(filename);
  FParseError:=parse;
end;

procedure TjanXMLParser2.OutputNode(node: TjanXMLNode2);
var
 i,c:integer;
 att,attname,attvalue:string;
 spc:string;
begin
  if FoutputDepth=0 then
    spc:=''
  else
    spc:=stringofchar(' ',2*FoutputDepth);
  XMLPut(spc+'<'+node.name);
  c:=node.FAttributes.Count;
  if c<>0 then begin
    att:='';
    for i:=0 to c-1 do begin
      attname:=TjanXMLAttribute2(node.FAttributes[i]).name;
      attvalue:=TjanXMLAttribute2(node.FAttributes[i]).value;
      if posstr('''',attvalue)>0 then
        att:=att+' '+attname+'="'+attvalue+'"'
      else
        att:=att+' '+attname+'='''+attvalue+'''';
    end;
    XMLPut(att);
  end;
  c:=node.FNodes.Count;
  if (c=0) and (node.text='') then begin
    XMLPut('/>');
    exit;
  end;
  if c=0 then begin // version 3.01
    if node.CDATA then
      XMLPut('><![CDATA['+node.text+']]></'+node.name+'>')
    else
     // XMLPut('>'+cdatacheck(node.text)+'</'+node.name+'>');
      XMLPut('>'+node.text+'</'+node.name+'>');
    exit;
  end;
  if node.CDATA then // version 3.01
    XMLPut('><![CDATA['+node.text+']]>')
  else
    XMLPut('>'+node.text);
//  XMLPut('>'+cdatacheck(node.text));
  inc(FOutputDepth);
  for i:=0 to c-1 do begin
    XMLPut(cr);
    OutputNode(TjanXMLNode2(node.Fnodes.items[i]));
  end;
  XMLPut(cr+spc+'</'+node.name+'>');
  dec(FOutputDepth);
end;

function TjanXMLParser2.parse:string;
var
  src:string;
  p,p2:integer;
  atom:string;
begin
  // here it all happens
  FAttributes.Clear;
  Fnodes.Clear;
  FPatterns.Clear;
  Fname:='';
  ftext:='';
  Fscan:=1;
  FparseRoot:=self;
  // skip any <?xml version='1.0'?>
  p:=posstr('<',Fxml);
  if p>0 then
    if copy(Fxml,p,5)='<?xml' then begin
      p2:=posstr('?>',Fxml,p);
      if p2=0 then begin
        result:='Missing ?> in xml declaration.';
        exit;
      end
      else begin
        FScan:=p2+2;
        atom:=trim(copy(Fxml,p+6,p2-p-6));
        parseattributes(FDeclaration,atom);
      end;
    end;

 p:=posstr('<!--',Fxml);
 while p > 0 do
  begin
  p2:=posstr('-->',Fxml,p);
  if p2 > 0 then
    begin
      FScan:=p2+4;
   end;
    p:=posstr('<!--',Fxml,FScan);
  end;

 // skip any <!DCOTYPE etc dtd>
  p:=posstr('<!',Fxml);
  if p>0 then
    if copy(Fxml,p,5)='<!DOC' then begin
      p2:=posstr('>',Fxml,p);
      if p2=0 then begin
        result:='Missing > in DTD declaration.';
        exit;
      end
      else begin
        FScan:=p2+2;
      end;
    end;

  try
    parseNode(nil,nil);
    result:='';
  except
    on E: exception do begin
      if Fscan<21 then
        p:=1
      else
        p:=Fscan-20;
      src:=copy(Fxml,p,50);
      result:= Trim(LastUsedfilename + #13+#10+ e.Message)+' near '+src+cr+'Error position='+inttostr(Fscan)+cr+AsText;
    end;
  end
end;


procedure TjanXMLParser2.parseAttributes(node: TjanXMLNode2; atts: string);
var
  s,attname,attvalue:string;
  p1,p2,ps,pd:integer;
  delim:char;
begin
  s:=trim(atts);
 // if Length(s) > 10000 then
 //   raise exception.Create('Lenght exceeds 10000'+node.name);

  while s<>'' do begin
    p1:=posstr('=',s);
    if p1=0 then
      raise exception.Create('missing = when parsing attributes '+node.name);
    delim:=s[p1+1];
    if not (delim in ['"','''']) then
      raise exception.Create('missing value delimiter when parsing attributes '+node.name);
    p2:=posstr(delim,s,p1+2);
      if p2=0 then raise exception.Create('Expected closing '+delim+' when parsing attributes');
    attvalue:=copy(s,p1+2,p2-(p1+2));
    // replace &apos; by '  and &quot; by "
//    attvalue:=q_replacestr(attvalue,'&apos;','''');
//    attvalue:=q_replacestr(attvalue,'&quot;','"');
    attname:=trim(copy(s,1,p1-1));
    node.setAttribute(attname,attvalue);
    delete(s,1,p2);
  end;
end;

procedure TjanXMLParser2.parseNode(rootNode,parentNode:TjanXMLNode2);
var
  p,p1,p2:integer;
  tag,tagname, strAttributes:string;
  bShortcut:boolean;
  newnode:TjanXMLNode2;
  upnode:TjanXMLNode2;
  Docontinue : Boolean ;
begin
//showmessage(copy(fxml,fscan,maxint));
  Docontinue := true ;
  while Docontinue do
  begin
  Docontinue := False ;
  bShortcut:=false;
  fscan:=posstr('<',fxml,fscan);
  if fscan=0 then raise exception.Create('Missing <');
  p:=posstr('>',fxml,fscan);
  if p<=0 then raise exception.Create('Missing >');
  // done : Pieter No space if enter is used and messes up the values
   tag:= StringReplace(copy(fxml,fscan+1,p-fscan-1),#13+#10 , ' ',[rfReplaceAll]);
  // tag:= copy(fxml,fscan+1,p-fscan-1);
  if copy(tag,1,1)='/' then begin
    // closing tag
    FScan:=p+1;
    upnode:=parentNode.FParentNode;
    if (upNode=nil) then
      exit
    else if upNode=rootNode then begin
//      if posstr('<',fxml,fscan)>0 then
//      parseNode(rootNode,upnode);
      exit;
    end
    else begin
      parseNode(rootNode,upnode);
      exit;
    end;
  end;
  fscan:=p+1;
  // check for shortcut
  if copy(tag,length(tag),1)='/' then begin
    bShortCut:=true;
    tag:=trim(copy(tag,1,length(tag)-1));
  end
  else
   bShortCut:=false;
  // split tag and attributes
  p:=posstr(' ',tag);
  if p>0 then begin  // have attributes
    tagname:=copy(tag,1,p-1);
    strAttributes:=trim(copy(tag,p+1,maxint));
  end
  else begin
    tagname:=tag;
    strAttributes:='';
  end;
  if parentNode=nil then begin // xml root node
    newnode:=FparseRoot;
  end
  else if parentNode=rootNode then begin// fragment root node
    newnode:=FparseRoot;
  end
  else begin
    newnode:=TjanXMLNode2.create;
    newnode.FParser:=self;
    if parentnode<>nil then
      parentnode.FNodes.Add(newnode);
    newnode.FParentNode:=parentNode;
  end;
  newnode.name:=tagname;
  if strAttributes<>'' then
    parseAttributes(newnode,strAttributes);
  if bShortCut then begin
    upnode:=parentNode;
    if (upNode=nil) then
      exit
    else if (upNode=rootNode) then begin

      exit
    end
    else begin


      parentNode := upnode ;
      parseNode(rootNode,upnode);
      exit;
    end;
  end;
  parseText(newnode);
  parseNode(rootNode,newnode);
  end;
end;



procedure TjanXMLParser2.parseText(node: TjanXMLNode2);
var
  p1,p2:integer;
  s:string;
begin
  p1:=posstr('<',Fxml,fscan);
  if p1=0 then raise exception.Create('Expected < when parsing text');
  // check for <![CDATA[
  if copy(Fxml,p1,9)='<![CDATA[' then begin
    Fscan:=p1+9;
    p1:=posstr(']]>',Fxml,fscan);
    if p1=0 then raise exception.Create('Expected ]]> when parsing CDATA section');
    node.text:=trim(copy(Fxml,fscan,p1-fscan));
    Fscan:=p1+3;
  end
  else begin
    node.text:=trim(copy(Fxml,fscan,p1-Fscan));
    Fscan:=p1;
  end;
end;

procedure TjanXMLParser2.SaveXML(filename: string);
begin
  savestring(filename,self.AsText);
end;

procedure TjanXMLParser2.setXML(const Value: string);
begin
  Fxml:=value;
  FparseError:=parse;
end;



procedure TjanXMLParser2.XMLPut(value:string);
var
  L,oL:integer;
  tmp:string;
begin
  L:=length(value);
  if L=0 then exit;
  tmp:=value;
  if (FXMLPosition+L)>FXMLSize then begin
    if L>FpageSize then
      FXMLSize:=FXMLSize+L
    else
      FXMLSize:=FXMLSize+FpageSize;
    setlength(FOutPut,FXMLSize);
    FXMLP:=pointer(FOutPut);
    inc(FXMLP,FXMLPosition);
  end;
  System.Move(Pointer(tmp)^, FXMLP^, L);
  Inc(FXMLP, L);
  Inc(FXMLPosition,L);
end;


function TjanXMLParser2.transformNode_(node: TjanXMLNode2): string;
var
  templatelist,matchlist:TList;
  i,c:integer;
  nt,ncontext,templatenode:TjanXMLNode2;
  match:string;
  it,ct:integer;
  im,cm:integer;
begin
  FOutPut:='';
  FXMLSize:=FPageSize;
  FXMLPosition:=0;
  SetLength(FOutPut,FXMLSize);
  FXMLP:=pointer(FOutPut);
  FOutputdepth:=0;
  result:='';
  if self.name<>'xsl:stylesheet' then exit;
  try
    templatelist:=TList.Create;
    matchlist:=TList.Create;
    selectNodes(self,templatelist,'name=''xsl:template''');
    c:=templatelist.count;
    if c>0 then begin
      templatenode:=TjanXMLNode2(templatelist[0]);
      match:=templatenode.attribute['match'];
      ct:=templatenode.nodes.count;
      if match<>'' then begin
        if match='.' then
          matchlist.add(node)
        else
          node.selectNodes(self,matchlist,match);
        cm:=matchlist.count;
      end
      else
        cm:=0;
      if (cm<>0) and (ct<>0) then begin
        for im:=0 to cm-1 do begin
          ncontext:=TjanXMLNode2(matchlist[im]);
          for it:=0 to ct-1 do begin
            nt:=TjanXMLNode2(templatenode.nodes[it]);
            XSLTOutputNode(nt,ncontext,matchlist,templatelist);
          end;
        end;
      end;
    end;
  finally
    templatelist.free;
    matchlist.free;
  end;
  result:=copy(FOutput,1,FXMLPosition);
  FOutput:='';
end;

procedure TjanXMLParser2.XSLTOutputNode(node,context: TjanXMLNode2;matchlist,templatelist:TList);
var
  i,c:integer;
  att,attname,attvalue:string;
  ntext:string;
  v:variant;
  spc:string;
  atom:string;
  nodename:string;
  nchild:TjanXMLNode2;
  doatts:boolean;
  xpp:TjanXPathParser2;
begin
  nodename:=node.name;
  doatts:=true;
  if nodename='xsl:element' then begin
    nodename:=node.attribute['name'];
    if nodename='' then exit;
    doatts:=false;
    if nodename[1]='{' then begin
      if nodename[length(nodename)]<>'}' then exit;
      nodename:=copy(nodename,2,length(nodename)-2);
      xpp:=getXPathParser(nodename);
      xpp.XPath.CurrentNode:=context;
      v:= xpp.XPath.Evaluate;
      if v=null then exit;
      nodename:=v;
    end;
  end
//  else if copy(nodename,1,4)='xsl:' then begin
  else if node.namespace='xsl' then begin
    ExecXSLT(node,context,matchlist,templatelist);
    exit;
  end;
  if FoutputDepth=0 then
    spc:=''
  else
    spc:=stringofchar(' ',2*FoutputDepth);
  atom:=cr+spc+'<'+nodename;
  XMLPut(atom);
  c:=node.FAttributes.Count;
  if (c<>0) and doatts then begin
    att:='';
    for i:=0 to c-1 do begin
      attname:=TjanXMLAttribute2(node.FAttributes[i]).name;
      attvalue:=TjanXMLAttribute2(node.FAttributes[i]).value;
      if posstr('''',attvalue)>0 then
        att:=att+' '+attname+'="'+attvalue+'"'
      else
        att:=att+' '+attname+'='''+attvalue+'''';
    end;
    XMLPut(att);
  end;
  c:=node.FNodes.Count;
  ntext:=node.text;
  if (c=0) and (ntext='') then begin
    XMLPut('/>');
    exit;
  end;
//  atom:='>'+cdatacheck(ntext);
  if node.CDATA then // version 3.01
    atom:='><![CDATA['+ntext+']]>'
  else
    atom:='>'+ntext;
  if c=0 then begin
    //atom:=atom+cr+spc+'</'+nodename+'>';
    atom:=atom+'</'+nodename+'>';  // version 3.01
    XMLPut(atom);
    exit;
  end;
  inc(FOutputDepth);
  for i:=0 to c-1 do begin
    nchild:=TjanXMLNode2(node.Fnodes.items[i]);
    if nchild.name<>'xsl:attribute' then
     if atom<>'' then begin
       XMLPut(atom);
       atom:='';
     end;
     XSLTOutputNode(nchild,context,matchlist,templatelist);
  end;
  atom:=atom+cr+spc+'</'+nodename+'>';
  XMLPut(atom);
  dec(FOutputDepth);
end;

procedure TjanXMLParser2.xsl_call_template(node,context: TjanXMLNode2; matchlist,
  templatelist: TList);
var
  templatename:string;
  i,c:integer;
  ii,cc:integer;
  it,ct:integer;
  templateNode:TjanXMLNode2;
  match:string;
  matchlist_:TList;
  orderby:array of TjanXSLSort;

  function checksort:integer;
  var
    i,c:integer;
    nsort:TjanXMLNode2;
  begin
    result:=0;
    setlength(orderby,0);
    c:=node.nodes.count;
    if c=0 then exit;
    for i:=0 to c-1 do begin
      nsort:=TjanXMLNode2(node.nodes[i]);
      if nsort.name<>'xsl:sort' then continue;
      inc(result);
      setlength(orderby,result);
      orderby[result-1].pattern:=nsort.attribute['select'];
      orderby[result-1].SortAscending:=nsort.attribute['order']<>'descending';
      orderby[result-1].SortNumeric:=nsort.attribute['data-type']='number';
    end;
  end;
begin
  templatename:=node.attribute['name'];
  if templatename='' then exit;
  c:=templatelist.count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    templateNode:=TjanXMLNode2(templatelist[i]);
    if templateNode.attribute['name']<>templatename then continue;
    match:=templateNode.attribute['match'];
    ct:=templatenode.nodes.count;
    if ct=0 then exit;
    matchlist_:=TList.create;
    try
      context.selectNodes(self,matchlist_,match);
      cc:=matchlist_.count;
      if cc>0 then begin
        if checksort<>0 then begin
          sort(matchlist_,0,cc,orderby);
        end;
        for ii:=0 to cc-1 do begin
          context:=TjanXMLNode2(matchlist_[ii]);
          for it:=0 to ct-1 do begin
            XSLTOutputNode(TjanXMLNode2(templatenode.nodes[it]),TjanXMLNode2(matchlist_[ii]),matchlist_,templatelist);
          end;
          //FXSLTOutput:=FXSLTOutput+cr;
          XMLPut(cr);
        end;
      end;
    finally
      matchlist_.free;
    end;
    exit;
  end;
end;

procedure TjanXMLParser2.xsl_if(node, context: TjanXMLNode2; matchlist,
  templatelist: TList);
var
  xpp:TjanXPathParser2;
  test:string;
  i,c:integer;
begin
  test:=node.attribute['test'];
  if test='' then exit;
  c:=node.nodes.count;
  if c=0 then exit;
  xpp:=getXPathParser(test);
  xpp.XPath.CurrentNode:=context;
  if xpp.XPath.Evaluate then
    for i:=0 to c-1 do begin
      XSLTOutputNode(TjanXMLNode2(node.Fnodes.items[i]),context,matchlist,templatelist);
    end;
end;

procedure TjanXMLParser2.xsl_value_of(node,context: TjanXMLNode2; matchlist,
  templatelist: TList);
var
  select:string;
  v:variant;
  n:TjanXMLNode2;
  tmp,axis,attri:string;
  p:integer;
  xpp:TjanXPathParser2;
begin
  n:=context;
  select:=node.attribute['select'];
  if select='' then exit;
  if select='.' then begin
    XMLPut(context.text);
    exit;
  end;
  xpp:=getXPathParser(select);
  xpp.XPath.CurrentNode:=context;
  v:= xpp.XPath.Evaluate;
  if v=null then exit;
  tmp:=v;
  XMLPut(tmp);
{  p:=pos('@',select);
  if p=0 then begin
    axis:=select;
  end
  else begin
    axis:=copy(select,1,p-1);
    attri:=copy(select,p+1,maxint);
  end;
  if (axis='.') or (axis='self::') then begin
    n:=context;
  end
  else if (axis='parent::') then begin
    n:=context.parentNode;
    if n=nil then exit;
  end
  else if axis='' then begin
    n:=context;
  end
  else if pos('::',axis)=0 then begin  // named child
    n:=context.getChildByName(axis);
    if n=nil then exit;
  end
  else if pos('child::',axis)=1 then begin
    delete(axis,1,7);
    n:=context.getChildByName(axis);
    if n=nil then exit;
  end;
  if attri<>'' then
    XMLPut(n.attribute[attri])
  else
    XMLPut(n.text);}
end;

procedure TjanXMLParser2.xsl_attribute(node, context: TjanXMLNode2;
  matchlist, templatelist: TList);
var
  tmp:string;
  c:integer;
  n:TjanXMLNode2;
begin
  tmp:=node.attribute['name'];
  c:=node.nodes.count;
  if c=0 then begin
    XMLPut(' '+tmp+'='''+node.text+'''');
  end
  else begin
    n:=TjanXMLNode2(node.nodes[0]);
    if n.name='xsl:value-of' then begin
      XMLPut(' '+tmp+'=''');
      xsl_value_of(n,context, matchlist, templatelist);
      XMLPut('''');
    end
    else
      XMLPut(' '+tmp+'=''''');
  end;
end;

procedure TjanXMLParser2.SetpageSize(const Value: integer);
begin
  if value>=$400 then
    FpageSize := Value;
end;

procedure TjanXMLParser2.xsl_comment(node, context: TjanXMLNode2;
  matchlist, templatelist: TList);
begin
  XMLPut('<!--'+node.text+'-->');
end;

procedure TjanXMLParser2.xsl_choose(node, context: TjanXMLNode2; matchlist,
  templatelist: TList);
var
  xpp:TjanXPathParser2;
  test:string;
  i,c, iw,cw:integer;
  n:TjanXMLNode2;
begin
  c:=node.nodes.count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    n:=TjanXMLNode2(node.nodes[i]);
    if n.name='xsl:otherwise' then begin
      cw:=n.nodes.count;
      if cw=0 then exit;
      for iw:=0 to cw-1 do
        XSLTOutputNode(TjanXMLNode2(n.nodes.items[iw]),context,matchlist,templatelist);
      exit;
    end;
    if n.name<>'xsl:when' then continue;
    test:=n.attribute['test'];
    if test='' then continue;
    cw:=n.nodes.count;
    if cw=0 then continue;
    xpp:=getXPathParser(test);
    xpp.XPath.CurrentNode:=context;
    if xpp.XPath.Evaluate then begin
      for iw:=0 to cw-1 do
        XSLTOutputNode(TjanXMLNode2(n.nodes.items[iw]),context,matchlist,templatelist);
      exit;
    end;
  end
end;

procedure TjanXMLParser2.xsl_for_each(node, context: TjanXMLNode2;
  matchlist, templatelist: TList);
var
  templatename:string;
  i,c:integer;
  ii,cc:integer;
  it,ct:integer;
  templateNode:TjanXMLNode2;
  select:string;
  matchlist_:TList;
begin
  select:=node.attribute['select'];
  if select='' then exit;
  c:=node.nodes.count;
  if c=0 then exit;
  matchlist_:=TList.create;
  try
    context.selectNodes(self,matchlist_,select);
    cc:=matchlist_.count;
    if cc>0 then
      for ii:=0 to cc-1 do begin
        context:=TjanXMLNode2(matchlist_[ii]);
        for i:=0 to c-1 do begin
          XSLTOutputNode(TjanXMLNode2(node.nodes[i]),TjanXMLNode2(matchlist_[ii]),matchlist_,templatelist);
        end;
        XMLPut(cr);
      end;
  finally
    matchlist_.free;
  end;
end;

procedure TjanXMLParser2.Sort(matchlist: TList; From, Count: Integer;
  orderby: array of TjanXSLSort);
  procedure   Sort( iL, iR : Integer ) ;
  var
  	L, R, M : Integer ;
  begin
  	repeat
          	L := iL ;
              	R := iR ;
              	M := ( L + R ) div 2 ;

              	repeat
                  	while Compare(matchlist, From + L, From + M ,orderby) < 0 do Inc(L) ;
                  	while Compare(matchlist, From + M, From + R ,orderby) < 0 do Dec(R) ;
                  	if L <= R then begin
                      		Swap(matchlist, From + L, From + R ) ;
                      		if M = L then
                          		M := R
                      		else if M = R then
                          		M := L ;
                      		Inc(L) ;
                      		Dec(R) ;
                  	end ;
              	until L > R ;

              	if ( R - iL ) > ( iR - L ) then begin {Sort left here}
                  	if L < iR then
                      		Sort( L, iR ) ;
                  	iR := R ;
              	end else begin
                  	if iL < R then
                      		Sort( iL, R ) ;
                  	iL := L ;
              	end ;
          until iL >= iR ;
  end ;
begin
  if Count > 1 then
  	Sort( 0, Count - 1 ) ;
end;

function TjanXMLParser2.Compare(matchlist: TList; i, j: Integer;
  orderby: array of TjanXSLSort): Integer;
var
  v:variant;
  ni,nj:TjanXMLNode2;
  pattern,s1,s2:string;
  p:integer;
  tablename,fieldname:string;
  arecord:integer;
  obi,obc:integer;
  xpp:TjanXPathParser2;

  function safefloat(atext:string):double;
  begin
    try
      result:=strtofloat(atext);
    except
      result:=0;
    end;
  end;

  function comparefloats(afloat1,afloat2:double):integer;
  begin
    if afloat1=afloat2 then
      result:=0
    else if afloat1>afloat2 then
      result:=1
    else
      result:=-1;
  end;
begin
  result:=0;
  ni:=TjanXMLNode2(matchlist[i]);
  nj:=TjanXMLNode2(matchlist[j]);
  obc:=length(orderby);
  for obi:=0 to obc-1 do begin
    pattern:=orderby[obi].pattern;
    xpp:=getXPathParser(pattern);
    xpp.XPath.CurrentNode:=ni;
    v:=xpp.XPath.Evaluate;
    if v=null then
      s1:=ni.name
    else
      s1:=v;
    xpp.XPath.CurrentNode:=nj;
    v:=xpp.XPath.Evaluate;
    if v=null then
      s2:=nj.name
    else
      s2:=v;
    if orderby[obi].SortAscending then begin
      if orderby[obi].SortNumeric then
        result:=comparefloats(safefloat(s1),safefloat(s2))
      else
        result:=ansicomparestr(s1,s2);
      if result<>0 then break;
    end
    else begin
      if orderby[obi].SortNumeric then
        result:=comparefloats(safefloat(s2),safefloat(s1))
      else
        result:=ansicomparestr(s2,s1);
      if result<>0 then break;
    end
  end;
end;

procedure TjanXMLParser2.Swap(matchlist: TList; i, j: Integer);
begin
  matchlist.Exchange(i,j);
end;

procedure TjanXMLParser2.xsl_element(node, context: TjanXMLNode2;
  matchlist, templatelist: TList);
var
  tmp:string;
  v:variant;
  i,c:integer;
  n:TjanXMLNode2;
  xpp:TjanXPathParser2;
begin
  tmp:=node.attribute['name'];
  if tmp='' then exit;
  if tmp[1]='{' then begin
    if tmp[length(tmp)]<>'}' then exit;
    tmp:=copy(tmp,2,length(tmp)-2);
    xpp:=getXPathParser(tmp);
    xpp.XPath.CurrentNode:=context;
    v:= xpp.XPath.Evaluate;
    if v=null then exit;
    tmp:=v;
  end;
  c:=node.nodes.count;
  if c=0 then begin
    XMLPut('<'+tmp+' />');
    exit;
  end;
  XMLPut('<'+tmp);
  for i:=0 to c-1 do begin
    XSLTOutputNode(TjanXMLNode2(node.nodes[i]),context,matchlist,templatelist);
  end;
  XMLPut('</'+tmp+'>');
end;

procedure TjanXMLParser2.SetonXEL(const Value: TXELEvent);
begin
  FonXEL := Value;
end;

{function TjanXMLParser2.NodeXML(pNode: TjanXMLNode2): string;
var
  version,encoding:string;
begin
  result:='';
  if pNode=nil then exit;
  FOutPut:='';
  FXMLSize:=$10000;
  FXMLPosition:=0;
  SetLength(FOutPut,FXMLSize);
  FXMLP:=pointer(FOutPut);
  FOutputdepth:=0;
  version:=declaration.attribute['version'];
  if version='' then
    version:='1.0';
  encoding:=declaration.attribute['encoding'];
  if encoding='' then
    encoding:='ISO-8859-1';
  if pNode.parentNode=nil then
    XMLPut('<?xml version='''+version+''' encoding='''+encoding+''' ?>'+cr);
  OutputNode(pNode);
  result:=copy(FOutput,1,FXMLPosition);
  FOutput:='';
end;}

function TjanXMLParser2.getNodeXML(pNode: TjanXMLNode2): string;
var
  version,encoding:string;
begin
  result:='';
  if pNode=nil then exit;
  FOutPut:='';
  FXMLSize:=$10000;
  FXMLPosition:=0;
  SetLength(FOutPut,FXMLSize);
  FXMLP:=pointer(FOutPut);
  FOutputdepth:=0;
  version:=declaration.attribute['version'];
  if version='' then
    version:='1.0';
  encoding:=declaration.attribute['encoding'];
  if encoding='' then
    encoding:='ISO-8859-1';
  if pNode.parentNode=nil then
    XMLPut('<?xml version='''+version+''' encoding='''+encoding+''' ?>'+cr);
  OutputNode(pNode);
  result:=copy(FOutput,1,FXMLPosition);
  FOutput:='';
end;

procedure TjanXMLParser2.setNodeXML(pNode: TjanXMLNode2;
  const Value: string);
begin
  Fxml:=value;
  FparseError:=parseFragment(pNode);
end;


function TjanXMLParser2.parseFragment(pNode: TjanXMLNode2): string;
var
  src:string;
  p,p2:integer;
  atom:string;
begin
  Fscan:=1;
  FparseRoot:=pNode;
  if pNode=nil then begin
    result:='Invalid parameter pNode';
    exit;
  end;
  // clear any existing child nodes
  pNode.nodes.Clear;
  try
    parseNode(pNode.parentNode,pNode.parentNode);
    result:='';
  except
    on E: exception do begin
      if Fscan<21 then
        p:=1
      else
        p:=Fscan-20;
      src:=copy(Fxml,p,50);
      result:= e.Message+' near '+src+cr+'Error position='+inttostr(Fscan)+cr+AsText;
    end;
  end
end;

procedure TjanXMLParser2.xsl_apply_templates(node, context: TjanXMLNode2;
  matchlist, templatelist: TList);
var
  templatename:string;
  i,c:integer;
  ii,cc:integer;
  it,ct:integer;
  seli,selc:integer;
  templateNode, SelNode:TjanXMLNode2;
  select,match:string;
  selectlist_,matchlist_:TList;
  orderby:array of TjanXSLSort;

  function checksort:integer;
  var
    i,c:integer;
    nsort:TjanXMLNode2;
  begin
    result:=0;
    setlength(orderby,0);
    c:=node.nodes.count;
    if c=0 then exit;
    for i:=0 to c-1 do begin
      nsort:=TjanXMLNode2(node.nodes[i]);
      if nsort.name<>'xsl:sort' then continue;
      inc(result);
      setlength(orderby,result);
      orderby[result-1].pattern:=nsort.attribute['select'];
      orderby[result-1].SortAscending:=nsort.attribute['order']<>'descending';
      orderby[result-1].SortNumeric:=nsort.attribute['data-type']='number';
    end;
  end;
begin
  select:=node['select'];
  if select='' then exit;
  c:=templatelist.count;
  if c<2 then exit;
  selectlist_:=TList.create;
  matchlist_:=TList.create;
  context.selectNodes(self,selectlist_,select);
  selc:=selectlist_.Count;
  if selc=0 then begin  // no nodes selected
    selectlist_.free;
    matchlist_.free;
    exit;
  end;
  try
    // apply any order by
    if checksort<>0 then begin
      sort(selectlist_,0,selc,orderby);
    end;
    // now apply matching template to every node in selectlist_
    for seli:=0 to selc-1 do begin
      SelNode:=TjanXMLNode2(selectlist_[seli]);
      for i:=1 to c-1 do begin
        templateNode:=TjanXMLNode2(templatelist[i]);
        match:=templateNode.attribute['match'];
        ct:=templatenode.nodes.count;
        if ct=0 then continue;
        matchlist_.Clear;
        context.selectNodes(self,matchlist_,match);
        if matchlist_.IndexOf(SelNode)<>-1 then begin
          for it:=0 to ct-1 do begin
            XSLTOutputNode(TjanXMLNode2(templatenode.nodes[it]),SelNode,selectlist_,templatelist);
          end;
          XMLPut(cr);
          break;  // do not check following templates
        end;
      end;
    end;
  finally
    selectlist_.free;
    matchlist_.free;
  end;  
end;

{ TjanXPathParser2 }

constructor TjanXPathParser2.Create;
begin
  inherited;
  FXPath:=TjanXPathExpression2.create;
end;

destructor TjanXPathParser2.destroy;
begin
  FXPath.Free;
  inherited;
end;


procedure TjanXPathParser2.selectNodes(node:TjanXMLNode2;nodelist: TList;single:boolean=false);
var
  n:TjanXMLNode2;
  lis:TList;
  i,c:integer;
  b:boolean;
begin
{  try
    lis:=TList.create;
    node.ListChildren(lis);
    c:=lis.count;
    if c<>0 then
      for i:=0 to c-1 do begin
        n:=TjanXMLNode2(lis[i]);
        XPath.CurrentNode:=n;
        b:=XPath.Evaluate;
        if b then begin
          nodelist.add(n);
          if single then exit;
        end;
      end;
  finally
    lis.free;
  end;}

  //  new
  XPath.CurrentNode:=node;
  if XPath.Evaluate then begin
    nodelist.add(node);
    if single then exit;
  end;
  c:=node.nodes.count;
  if c=0 then exit;
  for i:=0 to c-1 do
    selectNodes(TjanXMLNode2(node.nodes[i]),nodelist,single);
end;



procedure TjanXPathParser2.SetCurrentNode(const Value: TjanXMLNode2);
begin
  FCurrentNode := Value;
end;


procedure TjanXPathParser2.Setpattern(const Value: string);
var
  tmp:string;
begin
  tmp:=value;
  // replace entities
  tmp:=janstrings.Q_ReplaceStr(tmp,'&lt;','<');
  tmp:=janstrings.Q_ReplaceStr(tmp,'&gt;','>');
  tmp:=janstrings.Q_ReplaceStr(tmp,'!=','<>');
  XPath.Expression:=tmp;
end;





function TjanXPathParser2.testNode(node: TjanXMLNode2): boolean;
begin
  XPath.CurrentNode:=node;
  result:=XPath.Evaluate;
end;

{ TjanXMLAttribute2 }

function TjanXMLAttribute2.cloneAttribute: TjanXMLAttribute2;
begin
  result:=TjanXMLAttribute2.Create;
  result.name:=name;
  result.value:=value;
end;


procedure TjanXMLAttribute2.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TjanXMLAttribute2.Setvalue(const Value: string);
begin
  Fvalue := Value;
end;

{ TjanXMLFilter2 }





{ TjanXPathExpression2 }

{procedure TjanXPathExpression2.AddToken;
var
  tok:TToken;
begin
  tok:=TToken.Create;
  tok.name:=FToken;
  tok.tokenkind:=FTokenKind;
  tok.value:=FTokenValue;
  tok.operator:=FTokenOperator;
  tok.level:=FtokenLevel;
  tok.expression:=FTokenExpression;
  FInFix.Add(tok);
end;}

procedure TjanXPathExpression2.Clear;
begin
  ClearInfix;
  ClearPostFix;
  ClearStack;
end;

procedure TjanXPathExpression2.ClearInfix;
var
  i,c:integer;
begin
  c:=FInFix.Count;
  if c=0 then exit;
  for i:=c-1 downto 0 do
    TObject(FInFix.items[i]).free;
  FInFix.clear;
end;

procedure TjanXPathExpression2.ClearPostFix;
var
  i,c:integer;
begin
  c:=FPostFix.Count;
  if c=0 then exit;
  for i:=c-1 downto 0 do
    TObject(FPostFix.items[i]).free;
  FPostFix.clear;
end;

procedure TjanXPathExpression2.ClearStack;
var
  i,c:integer;
begin
  c:=FStack.Count;
  if c=0 then exit;
  for i:=c-1 downto 0 do
    TObject(FStack.items[i]).free;
  FStack.clear;
end;
{
For each token in INPUT do the following:

If the token is an operand, enqueue it in OUTPUT.

If the token is an open bracket - push it on STACK.

If the token is a closing bracket:
  - pop operators off STACK and enqueue them in OUTPUT,
  until you encounter an open bracket.
  Discard the opening bracket. If you reach the bottom of STACK without seeing an open bracket this indicates that the parentheses in the infix expression do not match, and so you should indicate an error.

If the token is an operator - pop operators off STACK and enqueue them in OUTPUT, until one of the following occurs:
- STACK is empty
- the operator at the top of STACK has lower precedence than the token
- the operator at the top of the stack has the same precedence as the token and the token is right associative.
Once you have done that push the token on STACK.

When INPUT becomes empty pop any remaining operators from STACK and enqueue them in OUTPUT. If one of the operators on STACK happened to be an open bracket, that means that its closing bracket never came, so an an error should be indicated.
}
function TjanXPathExpression2.ConvertInFixToPostFix: boolean;
var
  i,c,level:integer;
  tok:TToken;
begin
  result:=false;
  c:=FInfix.count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    tok:=TToken(FInfix[i]);
    case tok.tokenkind of
    tkOperand: if not InFixToPostFix(i) then exit;
    tkOpen: if not InFixToStack(i) then exit;
    tkClose: if not CloseStackToPostFix then exit;
    tkOperator:
      begin
        if not OperatorsToPostFix(tok.level) then exit;
        InFixToStack(i);
      end;
    end;
  end;
  result:=FlushStackToPostFix;
end;

{
If the token is a closing bracket:
  - pop operators off STACK and enqueue them in OUTPUT,
  until you encounter an open bracket.
  Discard the opening bracket. If you reach the bottom of STACK without seeing an open bracket this indicates that the parentheses in the infix expression do not match, and so you should indicate an error.

}
function TjanXPathExpression2.CloseStackToPostFix: boolean;
begin
  result:=false;
  while (FStack.count<>0) and (TToken(Fstack[FStack.count-1]).tokenkind<>tkOpen) do
    StackToPostFix;
  if FStack.count<>0 then begin
    TToken(FStack[FStack.count-1]).free;
    Fstack.Delete(FStack.count-1);
    result:=true;
  end;
end;

{
If the token is an operator - pop operators off STACK and enqueue them in OUTPUT, until one of the following occurs:
- STACK is empty
- the operator at the top of STACK has lower precedence than the token
- the operator at the top of the stack has the same precedence as the token and the token is right associative.
Once you have done that push the token on STACK.
}
function TjanXPathExpression2.OperatorsToPostFix(Level:integer): boolean;
begin
  while (FStack.count<>0) and (TToken(Fstack[FStack.count-1]).level>=level) do
    StackToPostFix;
  result:=true;
end;

{
When INPUT becomes empty pop any remaining operators from STACK and enqueue them in OUTPUT. If one of the operators on STACK happened to be an open bracket, that means that its closing bracket never came, so an an error should be indicated.
}
function TjanXPathExpression2.FlushStackToPostFix: boolean;
begin
  result:=false;
  while (FStack.count<>0) and (TToken(Fstack[FStack.count-1]).tokenkind<>tkOpen) do
    StackToPostFix;
  result:=FStack.count=0;
end;

constructor TjanXPathExpression2.Create;
begin
  FInFix:=TList.create;
  FPostFix:=TList.create;
  FStack:=TList.create;
  CurrentNode:=nil;
  onGetAttribute:=GetAttribute;
end;

destructor TjanXPathExpression2.Destroy;
begin
  Clear;
  FInFix.free;
  FPostFix.free;
  Fstack.free;
  inherited;
end;

procedure TjanXPathExpression2.getInFix(list: TStrings);
var
  i,c:integer;
begin
  list.Clear;
  c:=FInFix.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    list.append(TToken(FInFix[i]).name);
  end;
end;

procedure TjanXPathExpression2.getPostFix(list:Tstrings);
var
  i,c:integer;
begin
  list.Clear;
  c:=FPostFix.Count;
  if c=0 then exit;
  for i:=0 to c-1 do begin
    list.append(TToken(FPostFix[i]).name);
  end;
end;



function TjanXPathExpression2.InfixToPostFix(index: integer): boolean;
begin
  result:=false;
  if (index<0) or (index>=FInFix.count) then exit;
  FPostFix.add(TToken(FInfix[index]).copy);
  result:=true;
end;


function TjanXPathExpression2.InFixToStack(index: integer): boolean;
begin
  result:=false;
  if (index<0) or (index>=FInFix.count) then exit;
  FStack.add(TToken(FInfix[index]).copy);
  result:=true;
end;

function TjanXPathExpression2.Parse;
var
  tokenizer:TjanXPathTokenizer;
begin
  clear;
  try
    tokenizer:=TjanXPathTokenizer.create;
    result:=Tokenizer.Tokenize(FSource,FInfix);
  finally
    tokenizer.free;
  end;
end;

procedure TjanXPathExpression2.procAdd;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2 + v1);
end;

procedure TjanXPathExpression2.procAnd;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2 and v1);
end;

procedure TjanXPathExpression2.procDivide;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2/v1);
end;

procedure TjanXPathExpression2.procEq;
var
  v1,v2:variant;
  b:boolean;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2=v1);
end;

procedure TjanXPathExpression2.procGe;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2>=v1);
end;

procedure TjanXPathExpression2.procGt;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2>v1);
end;

procedure TjanXPathExpression2.procLe;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2<=v1);
end;

procedure TjanXPathExpression2.procLt;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2<v1);
end;

procedure TjanXPathExpression2.procMultiply;
begin
  runpush(runpop* runpop);
end;

procedure TjanXPathExpression2.procNe;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2<>v1);
end;

procedure TjanXPathExpression2.procNumber;
begin
  runpush(TToken(FPostFix[FPC]).value);
end;

procedure TjanXPathExpression2.procOr;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2 or v1);
end;

procedure TjanXPathExpression2.procString;
begin
  runpush(TToken(FPostFix[FPC]).value);

end;

procedure TjanXPathExpression2.procSubtract;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(v2-v1);
end;

procedure TjanXPathExpression2.Setsource(const Value: string);
begin
  Fsource := Value;
  SL:=length(FSource);
  parse;
  ConvertInFixToPostFix;
end;

function TjanXPathExpression2.StackToPostFix: boolean;
var
  tok:TToken;
begin
  result:=false;
  if FStack.count=0 then exit;
  tok:=TToken(FStack[FStack.count-1]);
  FPostFix.Add(tok);
  FStack.Delete(FStack.count-1);
  result:=true;
end;

procedure TjanXPathExpression2.runOperator(op:TTokenOperator);
begin
  case op of
    toAssign: procAssign;
    toGet: procGet;
    janXPathTokenizer.toString: procString;
    toNumber: procNumber;
    toAttribute:procAttribute;
    toName: procName;
    toBaseName: procBaseName;
    toParentName: procParentName;
    toNameSpace: procNameSpace;
    toNameSpaceURI: procNameSpaceURI;
    toValue: procValue;
    toAxis: procAxis;
    toChildCount: procChildCount;
    toHasAttribute:procHasAttribute;
    toHasChild:procHasChild;
    toEq: procEq;
    toNe: procNe;
    toGt: procGt;
    toGe: procGe;
    toLt: procLt;
    toLe: procLe;
    toAdd: procAdd;
    toSubtract: procSubtract;
    toMultiply: procMultiply;
    toDivide: procDivide;
    toAnd: procAnd;
    toOr: procOr;
    toNot: procNot;
    toLike: procLike;
    toIn:procIn;
    toSin: procSin;
    toCos: procCos;
    toSqr: procSqr;
    toSqrt: procSqrt;
    toUPPER: procUPPER;
    toLOWER: procLOWER;
    toTRIM: procTRIM;
    toSoundex: procSoundex;
    toLeft:procLeft;
    toRight:procRight;
    toMid:procMid;
    toLen:procLen;
    toFix:procFix;
    toCeil:procCeil;
    toFloor:procFloor;
    toAsNumber: procAsNumber;
    toParseFloat: procParseFloat;
    toAsDate: procAsDate;
    toFormat: procFormat;
    toYear: procYear;
    toMonth: procMonth;
    toDay: procDay;
    toDateAdd: procDateAdd;
    toEaster: procEaster;
    toWeekNumber:procWeekNumber;
    toIsNumeric: procIsNumeric;
    toIsDate: procIsDate;
    toReplace:procReplace;
    toSubstr_After:procSubstr_After;
    toSubstr_Before:procSubstr_Before;
  end;
end;

function TjanXPathExpression2.Evaluate: variant;
var
  i,c:integer;
  op:TTokenOperator;
begin
  result:=null;
  c:=FPostFix.Count;
  if c=0 then exit;
  SP:=0;
  for i:=0 to c-1 do begin
    FPC:=i;
    op:=TToken(FPostFix[i]).operator;
    try
      runoperator(op);
    except
      exit;
    end;
  end;
  result:=runpop;
end;



function TjanXPathExpression2.runpop: variant;
begin
  if SP=0 then
    result:=null
  else begin
    dec(SP);
    result:=Vstack[sp];
  end;

end;

procedure TjanXPathExpression2.runpush(value: variant);
begin
  VStack[SP]:=value;
  inc(SP);
end;


procedure TjanXPathExpression2.SetonGetVariable(const Value: TVariableEvent);
begin
  FonGetVariable := Value;
end;


procedure TjanXPathExpression2.procSin;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(sin(v1));
end;

procedure TjanXPathExpression2.procNot;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(not(v1));
end;

procedure TjanXPathExpression2.procLike;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(IsLike(v1,v2));
end;

function TjanXPathExpression2.IsLike(v1, v2: variant): boolean;
var
  p1,p2:integer;
  s1,s2:string;
begin
  result:=false;
  s1:=v1;
  s2:=v2;
  if posstr('%',s1)=0 then begin
    result:=ansisametext(s1,s2)
  end
  else if (copy(s1,1,1)='%') and (copy(s1,length(s1),1)='%') then begin
    s1:=copy(s1,2,length(s1)-2);
    result:=postext(s1,s2)>0;
  end
  else if (copy(s1,1,1)='%') then begin
    s1:=copy(s1,2,maxint);
    p1:=postext(s1,s2);
    result:=p1=length(s2)-length(s1)+1;
  end
  else if (copy(s1,length(s1),1)='%') then begin
    s1:=copy(s1,1,length(s1)-1);
    result:=postext(s1,s2)=1;
  end;
end;






procedure TjanXPathExpression2.GetTokenList(list: TList; from,
  till: integer);
var
  tok:TToken;
  i:integer;

begin
  Clear;
  for i:=from to till do
    FInFix.Add(TToken(list[i]).copy);
  ConvertInFixToPostFix;
end;

procedure TjanXPathExpression2.procLOWER;
var
  v1:variant;
  s1:string;
begin
  v1:=runpop;
  s1:=v1;
  runpush(lowercase(s1));
end;

procedure TjanXPathExpression2.procTRIM;
var
  v1:variant;
  s1:string;
begin
  v1:=runpop;
  s1:=v1;
  runpush(trim(s1));
end;

procedure TjanXPathExpression2.procUPPER;
var
  v1:variant;
  s1:string;
begin
  v1:=runpop;
  s1:=v1;
  runpush(uppercase(s1));
end;

procedure TjanXPathExpression2.procSoundex;
var
  v1:variant;
  s1:string;
begin
  v1:=runpop;
  s1:=v1;
  runpush(soundex(s1));
end;

procedure TjanXPathExpression2.procAsNumber;
var
  v1:variant;
  s1:string;
  d1:double;
begin
  v1:=runpop;
  try
    s1:=v1;
    v1:=strtofloat(s1);
  except
    v1:=0;
  end;
  s1:=v1;
  runpush(v1);
end;

procedure TjanXPathExpression2.procLeft;
var
  asize,atext:variant;
  s1:string;
  p:integer;
begin
  asize:=runpop;
  atext:=runpop;
  s1:=atext;
  p:=asize;
  s1:=copy(s1,1,p);
  runpush(s1);
end;

procedure TjanXPathExpression2.procRight;
var
  asize,atext:variant;
  s1:string;
  p:integer;
begin
  asize:=runpop;
  atext:=runpop;
  s1:=atext;
  p:=asize;
  s1:=copy(s1,length(s1)-p+1,p);
  runpush(s1);
end;

procedure TjanXPathExpression2.procMid;
var
  vcount,vfrom,vtext:variant;
  s1:string;
  p,c:integer;
begin
  vcount:=runpop;
  vfrom:=runpop;
  vtext:=runpop;
  s1:=vtext;
  p:=vfrom;
  c:=vcount;
  s1:=copy(s1,p,c);
  runpush(s1);
end;

procedure TjanXPathExpression2.procCos;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(cos(v1));
end;

procedure TjanXPathExpression2.procSqr;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(sqr(v1));
end;



procedure TjanXPathExpression2.procSqrt;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(sqrt(v1));
end;

procedure TjanXPathExpression2.procLen;
var
  v1:variant;
  s1:string;
begin
  v1:=runpop;
  s1:=v1;
  runpush(length(s1));
end;

procedure TjanXPathExpression2.procFix;
var
  vfloat,vdecimals:variant;
  s1,s2:string;
  d1:double;
begin
  vdecimals:=runpop;
  vfloat:=runpop;
  s1:=vfloat;
  s2:=vdecimals;
  try
    d1:=strtofloat(s1);
    s1:=format('%.'+s2+'f',[d1]);
  except
  end;
  runpush(s1);
end;

procedure TjanXPathExpression2.procCeil;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(ceil(v1));
end;

procedure TjanXPathExpression2.procFloor;
var
  v1:variant;
begin
  v1:=runpop;
  runpush(floor(v1));
end;

procedure TjanXPathExpression2.procFormat;
var
  vfloat,vformat:variant;
  s1,s2:string;
  d1:double;
  i1:integer;
begin
  vformat:=runpop;
  vfloat:=runpop;
  s1:=vfloat;
  s2:=vformat;
  if s2='' then begin
    runpush(s1);
    exit;
  end;
  if s2[length(s2)] in ['d','x'] then
  try
    i1:=strtoint(s1);
    s1:=format(s2,[i1]);
  except
  end
  else if s2[length(s2)] in ['s'] then
  try
    s1:=format(s2,[s1]);
  except
  end
  else
  try
    d1:=strtofloat(s1);
    s1:=format(s2,[d1]);
  except
  end;
  runpush(s1);
end;


procedure TjanXPathExpression2.procDay;
{return the day part as integer from a 'yyyy-mm-dd' string}
var
  v1:variant;
  s1:string;
  i1:integer;
  adate:TDate;
begin
  v1:=runpop;
  s1:=v1;
  try
    adate:=strtodate(s1);
    i1:=Date2Day(aDate);
  except
    i1:=0;
  end;
  runpush(i1);
end;

procedure TjanXPathExpression2.procMonth;
{return the month part as integer from a 'yyyy-mm-dd' string}
var
  v1:variant;
  s1:string;
  i1:integer;
  adate:TDate;
begin
  v1:=runpop;
  s1:=v1;
  try
    adate:=strtodate(s1);
    i1:=Date2Month(aDate);
  except
    i1:=0;
  end;
  runpush(i1);
end;

procedure TjanXPathExpression2.procYear;
{return the year part as integer from a 'yyyy-mm-dd' string}
var
  v1:variant;
  s1:string;
  i1:integer;
  aDate:Tdate;
begin
  v1:=runpop;
  s1:=v1;
  try
    aDate:=strtodate(s1);
    i1:=Date2Year(aDate);
  except
    i1:=0;
  end;
  runpush(i1);
end;

procedure TjanXPathExpression2.procDateAdd;
{add number of intervals to date}
var
  vinterval,vnumber,vdate:variant;
  ayear,amonth,aday:word;
  adate:TDateTime;
  sinterval,sdate:string;
  inumber:integer;
begin
  vdate:=runpop;
  vnumber:=runpop;
  vinterval:=runpop;
  sinterval:=lowercase(vinterval);
  inumber:=vnumber;
  sdate:=vdate;
  try
    adate:=strtodate(sdate);
    decodedate(adate,ayear,amonth,aday);
    adate:=encodedate(ayear,amonth,aday);
    if sinterval='d' then
      adate:=adate+1
    else if sinterval='m' then
      adate:=incmonth(adate,inumber)
    else if sinterval='y' then
      adate:=encodedate(ayear+inumber,amonth,aday)
    else if sinterval='w' then
      adate:=adate+7*inumber
    else if sinterval='q' then
      adate:=incmonth(adate,inumber*3);
    sdate:=datetostr(adate);
  except
  end;
  runpush(sdate);
end;


procedure TjanXPathExpression2.procEaster;
// returns the easter date of a given year
var
  vyear:variant;
  ayear:integer;
  s1:string;
  adate:TDateTime;
begin
  vyear:=runpop;
  s1:='';
  try
    ayear:=vyear;
    s1:=datetostr(easter(ayear));
  except
  end;
  runpush(s1);
end;

procedure TjanXPathExpression2.procWeekNumber;
var
  v1:variant;
  s1:string;
  i1:integer;
  d1:TDateTime;
begin
  v1:=runpop;
  try
    s1:=v1;
    d1:=strtodate(s1);
    i1:=Date2WeekNo(d1);
  except
    i1:=0;
  end;
  runpush(i1);
end;

procedure TjanXPathExpression2.procIsNumeric;
var
  v1:variant;
  s1:string;
  d1:extended;
begin
  v1:=runpop;
  s1:=v1;
  try
    d1:=strtofloat(s1);
    runpush(true)
  except
    runpush(false)
  end;
end;

procedure TjanXPathExpression2.procIsDate;
var
  v1:variant;
  s1:string;
  d1:extended;
begin
  v1:=runpop;
  s1:=v1;
  runpush(SQLStringToDate(s1)<>0);
end;

procedure TjanXPathExpression2.procReplace;
// replace(source, oldpattern, newpattern)
var
  vsource, vold, vnew:variant;
  ssource, sold, snew:string;
begin
  vnew:=runpop;
  vold:=runpop;
  vsource:=runpop;
  ssource:=vsource;
  sold:=vold;
  snew:=vnew;
  ssource:=stringreplace(ssource,sold,snew,[rfreplaceall,rfignorecase]);
  runpush(ssource);
end;

procedure TjanXPathExpression2.procsubstr_after;
var
  vsource,vsubstr:variant;
  ssubstr,ssource,s1:string;
  p:integer;
begin
  vsubstr:=runpop;
  vsource:=runpop;
  ssubstr:=vsubstr;
  ssource:=vsource;
  p:=postext(ssubstr,ssource);
  if p>0 then
    s1:=copy(ssource,p+length(ssubstr),maxint)
  else
    s1:='';
  runpush(s1);
end;

procedure TjanXPathExpression2.procsubstr_before;
var
  vsource,vsubstr:variant;
  ssubstr,ssource,s1:string;
  p:integer;
begin
  vsubstr:=runpop;
  vsource:=runpop;
  ssubstr:=vsubstr;
  ssource:=vsource;
  p:=postext(ssubstr,ssource);
  if p>0 then
    s1:=copy(ssource,1,p-1)
  else
    s1:='';
  runpush(s1);
end;


procedure TjanXPathExpression2.procAttribute;
var
  AttributeName:string;
  AttributeValue:Variant;
  handled:boolean;
begin
  AttributeName:=TToken(FPostFix[FPC]).name;
  if assigned(onGetAttribute) then begin
    handled:=false;
    onGetAttribute(self,AttributeName,AttributeValue,handled);
    if not handled then
     AttributeValue:=AttributeName;
  end
  else
    AttributeValue:=AttributeName;
  runpush(AttributeValue);
end;


procedure TjanXPathExpression2.SetCurrentNode(const Value: TjanXMLNode2);
begin
  FCurrentNode := Value;
end;

procedure TjanXPathExpression2.GetAttribute(sender: Tobject;
  const VariableName: string; var VariableValue: variant;
  var handled: boolean);
begin
  if CurrentNode=nil then begin
    VariableValue:='';
    handled:=true;
  end;
  if CurrentNode.hasAttribute(variablename) then begin
    variableValue:=CurrentNode.attribute[variablename];
  end
  else
    variableValue:='';
  handled:=true;
end;

{procedure TjanXPathExpression2.GetElement(sender: Tobject;
  const VariableName: string; var VariableValue: variant;
  var handled: boolean);
begin
//
end;}

procedure TjanXPathExpression2.procName;
begin
  if CurrentNode=nil then begin
    runpush('');
  end
  else begin
    runpush(CurrentNode.name);
  end;
end;

procedure TjanXPathExpression2.procValue;
begin
  if CurrentNode=nil then
    runpush('')
  else
    runpush(CurrentNode.Text);
end;

procedure TjanXPathExpression2.procParentName;
begin
  if CurrentNode=nil then begin
    runpush('');
  end
  else begin
    if CurrentNode.parentNode<>nil then
      runpush(CurrentNode.ParentNode.name)
    else
      runpush('');
  end;
end;

procedure TjanXPathExpression2.procChildCount;
begin
  if CurrentNode=nil then begin
    runpush(0);
  end
  else begin
    runpush(CurrentNode.nodes.Count);
  end;
end;

procedure TjanXPathExpression2.procHasAttribute;
var
  s:string;
begin
  s:=runpop;
  if CurrentNode=nil then
    runpush(false)
  else
    runpush(CurrentNode.hasAttribute(s));
end;

procedure TjanXPathExpression2.procHasChild;
var
  s:string;
  i,c:integer;
begin
  s:=runpop;
  if CurrentNode=nil then
    runpush(false)
  else if CurrentNode.nodes.count=0 then
    runpush(false)
  else begin
    c:=CurrentNode.nodes.count;
    for i:=0 to c-1 do
      if TjanXMLNode2(CurrentNode.nodes[i]).name=s then begin
        runpush(true);
        exit;
      end;
    runpush(false);
  end;
end;

procedure TjanXPathExpression2.procAsDate;
var
  v1:variant;
  s1:string;
  d1:double;
begin
  v1:=runpop;
  try
    s1:=v1;
    v1:=strtodate(s1);
  except
    v1:=0;
  end;
  s1:=v1;
  runpush(v1);
end;

procedure TjanXPathExpression2.procIn;
var
  v1,v2:variant;
begin
  v1:=runpop;
  v2:=runpop;
  runpush(IsIn(v2,v1));
end;

function TjanXPathExpression2.IsIn(v1, v2: variant): boolean;
var
  p1,p2:integer;
  s1,s2:string;
begin
  s1:=v1;
  s2:=v2;
  s2:=','+s2+',';

  result:=pos(','+s1+',',s2)>0;
end;


procedure TjanXPathExpression2.procAxis;
var
  tmp,axis,predicate:string;
  attri:string;
  p:integer;
  n:TjanXMLNode2;
begin
  if CurrentNode=nil then
    runpush('')
  else begin
    tmp:=TToken(FPostFix[FPC]).name;
    p:=pos('::',tmp);
    if p=0 then
      runpush('')
    else begin
      axis:=copy(tmp,1,p-1);
      predicate:=copy(tmp,p+2,maxint);
      p:=pos('@',predicate);
      if p=0 then begin
        attri:='';
      end
      else begin
        attri:=copy(predicate,p+1,maxint);
        predicate:=copy(predicate,1,p-1);
      end;
      if axis='child' then begin
        n:=CurrentNode.getChildByName(predicate);
        if n<>nil then begin
          if attri='' then
            runpush(n.Text)
          else
            runpush(n.attribute[attri]);
        end;
      end
      else if axis='parent' then begin
        n:=CurrentNode.parentNode;
        if n<>nil then begin
          if attri='' then
            runpush(n.Text)
          else
            runpush(n.attribute[attri]);
        end
        else
          runpush('');
      end
      else
        runpush('');
    end;
  end;
end;

{ TjanXPathParserList2 }

procedure TjanXPathParserList2.Clear;
var
  i,c:integer;
begin
  c:=self.Count;
  if c>0 then
    for i:=0 to c-1 do
      TjanXPathParser2(self.objects[i]).free;
  inherited;
end;

destructor TjanXPathParserList2.destroy;
begin
  clear;
  inherited;
end;

procedure TjanXPathExpression2.procParseFloat;
var
  v1:variant;
  s1:string;
  d1:double;

  function parseFloat(s:string):string;
  var
    i:integer;
  begin
    result:='';
    if s='' then exit;
    for i:=1 to length(s) do
      if s[i] in ['0'..'9','-','+','.'] then
        result:=result+s[i];
  end;
begin
  v1:=runpop;
  try
    s1:=v1;
    v1:=strtofloat(parsefloat(s1));
  except
    v1:=0;
  end;
  runpush(v1);
end;

procedure TjanXPathExpression2.procNameSpace;
begin
  if CurrentNode=nil then
    runpush('')
  else
    runpush(CurrentNode.namespace);
end;

procedure TjanXPathExpression2.procBaseName;
var
  nodename:string;
  p:integer;
begin
  if CurrentNode=nil then
    runpush('')
  else begin
    nodename:=CurrentNode.name;
    p:=pos(':',nodename);
    if p=0 then
      runpush(nodename)
    else
      runpush(copy(nodename,p+1,maxint));
  end;
end;

procedure TjanXPathExpression2.procNameSpaceURI;
var
  ns:string;
begin
  if CurrentNode=nil then
    runpush('')
  else
    runpush(CurrentNode.namespaceURI);
end;

procedure TjanXPathExpression2.procAssign;
var
  vvariable,vvalue:variant;
  n:TjanXMLNode2;
  procresult, stopsearch:boolean;
begin
// lookup first matching variable
  vvalue:=runpop;
  vvariable:=runpop;
  procresult:=false;
  if CurrentNode<>nil then begin
    n:=CurrentNode.GetXELVariable(vvariable);
    if n<>nil then begin
      n.text:=vvalue;
      procresult:=true;
    end;
  end;
  runpush(procresult);
end;

procedure TjanXPathExpression2.procGet;
var
  vvariable:variant;
  n:TjanXMLNode2;
  procresult:string;
begin
  procresult:='';
  vvariable:=runpop;
  if CurrentNode<>nil then begin
    n:=CurrentNode.getXELVariable(vvariable);
    if n<>nil then
      procresult:=n.text;
  end;
  runpush(procresult);
end;


end.
