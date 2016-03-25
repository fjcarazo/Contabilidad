object FormMainConversion: TFormMainConversion
  Left = 161
  Top = 183
  Caption = 'osFinancials 1.XX to osFinancials 2'
  ClientHeight = 519
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    847
    519)
  PixelsPerInch = 96
  TextHeight = 13
  object PCConversion: TPageControl
    Left = 0
    Top = 0
    Width = 847
    Height = 420
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 855
    ExplicitHeight = 428
    object TsStart: TTabSheet
      Caption = 'TsStart'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 13
        Top = 112
        Width = 139
        Height = 13
        Caption = 'Your osFinancials 1.xxx folder'
      end
      object ETC37Folder: TEdit
        Left = 8
        Top = 128
        Width = 193
        Height = 21
        TabOrder = 0
        Text = 'c:\osfinancials'
      end
      object BNext: TButton
        Left = 8
        Top = 176
        Width = 297
        Height = 25
        Caption = 'Scan for books in osFinacials 1.xxx'
        Default = True
        TabOrder = 1
        OnClick = BNextClick
      end
      object MemohelpFindFile: TMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 73
        Color = clScrollBar
        Lines.Strings = (
          'Select Your old folder of  osfinancials'
          '1.0.0.0+'
          '')
        TabOrder = 2
      end
      object Button5: TButton
        Left = 205
        Top = 127
        Width = 97
        Height = 22
        Caption = 'Find your folder'
        TabOrder = 3
        OnClick = Button5Click
      end
      object CBCopyReports: TCheckBox
        Left = 11
        Top = 88
        Width = 97
        Height = 17
        Caption = 'Copy reports'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 3
      DesignSize = (
        839
        392)
      object Label4: TLabel
        Left = 16
        Top = 56
        Width = 165
        Height = 13
        Caption = 'Select your set of books to convert'
      end
      object Label6: TLabel
        Left = 17
        Top = 364
        Width = 161
        Height = 13
        Caption = 'Put in conversion in this sub folder'
      end
      object BConvert: TButton
        Left = 13
        Top = 2
        Width = 821
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Convert'
        TabOrder = 0
        OnClick = Button4Click
      end
      object CBSetOfBooksToConvert: TCheckListBox
        Left = 14
        Top = 73
        Width = 819
        Height = 285
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 1
      end
      object ESubFolder: TEdit
        Left = 264
        Top = 360
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'books'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TCFinished'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        839
        392)
      object BStartStop: TButton
        Left = 12
        Top = 144
        Width = 816
        Height = 73
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Start again'
        TabOrder = 0
        OnClick = BStartStopClick
      end
      object MDoneTables: TMemo
        Left = 12
        Top = 48
        Width = 817
        Height = 89
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          'Finisched!')
        TabOrder = 1
      end
    end
    object TCConvBooks: TTabSheet
      Caption = 'TCConvBooks'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        839
        392)
      object Button2: TButton
        Left = 400
        Top = 232
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 0
      end
      object PageControl1: TPageControl
        Left = 8
        Top = 56
        Width = 825
        Height = 337
        ActivePage = TabSheet3
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        object TabSheet2: TTabSheet
          Caption = 'General'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            817
            309)
          object MemoSQLError: TMemo
            Left = 9
            Top = 0
            Width = 799
            Height = 97
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              'Select the set of books for conversion')
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
          object MemoSQLErrorRunSql: TMemo
            Left = 8
            Top = 112
            Width = 798
            Height = 177
            Anchors = [akLeft, akTop, akRight, akBottom]
            ScrollBars = ssBoth
            TabOrder = 1
            WordWrap = False
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Programmers tab'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Memo5: TMemo
            Left = 8
            Top = 8
            Width = 593
            Height = 169
            Lines.Strings = (
              'Memo5')
            TabOrder = 0
          end
          object Memo1: TMemo
            Left = 8
            Top = 184
            Width = 137
            Height = 145
            Lines.Strings = (
              'CREATE '
              'DOMAIN '
              'BOOLEAN '
              'AS'
              'SMALLINT'
              'NOT NULL'
              'CHECK '
              '(value in '
              '(0,1))'
              '')
            TabOrder = 1
          end
          object Memo2: TMemo
            Left = 152
            Top = 184
            Width = 225
            Height = 145
            Lines.Strings = (
              'Memo2')
            TabOrder = 2
          end
          object Edit1: TEdit
            Left = 384
            Top = 216
            Width = 121
            Height = 21
            TabOrder = 3
            Text = 'Edit1'
          end
          object Button1: TButton
            Left = 0
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Button1'
            TabOrder = 4
            OnClick = Button1Click
          end
          object Button8: TButton
            Left = 384
            Top = 184
            Width = 75
            Height = 25
            Caption = 'Go to start'
            TabOrder = 5
            OnClick = Button8Click
          end
        end
      end
    end
  end
  object PHideTabs: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 420
    Width = 847
    Height = 99
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      847
      99)
    object Label2: TLabel
      Left = 16
      Top = 61
      Width = 265
      Height = 13
      AutoSize = False
      Caption = 'Table'
    end
    object Label1: TLabel
      Left = 16
      Top = 29
      Width = 60
      Height = 13
      Caption = 'Set of books'
    end
    object Label5: TLabel
      Left = 16
      Top = 8
      Width = 96
      Height = 13
      Caption = 'Conversion progress'
    end
    object Lcount1: TLabel
      Left = 292
      Top = 60
      Width = 57
      Height = 13
      Caption = '                   '
    end
    object LCountmain: TLabel
      Left = 296
      Top = 28
      Width = 57
      Height = 13
      Caption = '                   '
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 74
      Width = 817
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Step = 1
      TabOrder = 0
      Visible = False
    end
    object PBMainPRocess: TProgressBar
      Left = 16
      Top = 44
      Width = 817
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Step = 1
      TabOrder = 1
      Visible = False
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofEnableSizing, ofDontAddToRecent]
    Left = 588
    Top = 240
  end
  object ZTable1: TUniTable
    DataTypeMap = <>
    Connection = ZConnection1
    CachedUpdates = True
    Left = 592
    Top = 160
  end
  object ZConnection1: TUniConnection
    DataTypeMap = <>
    ProviderName = 'InterBase'
    Password = 'masterkey'
    Left = 496
    Top = 208
  end
  object ZQuery3: TUniQuery
    DataTypeMap = <>
    Connection = ZConnection1
    Left = 464
    Top = 256
  end
  object ZUpdateSQL1: TUniUpdateSQL
    Left = 464
    Top = 320
  end
  object ZQuery2: TUniQuery
    DataTypeMap = <>
    Connection = ZConnection1
    SQL.Strings = (
      'Select * from tc_totals')
    Left = 336
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ZTable2
    Left = 496
    Top = 80
  end
  object ZTable2: TUniTable
    TableName = 'TC_STOCK'
    DataTypeMap = <>
    Connection = ZConnection1
    Left = 440
    Top = 72
    object ZTable2WSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZTable2SSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object ZTable2SBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object ZTable2SDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZTable2WREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZTable2WREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZTable2WCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object ZTable2WINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object ZTable2WOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object ZTable2FOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object ZTable2FQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZTable2FOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object ZTable2FINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object ZTable2FREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZTable2WSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object ZTable2BAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object ZTable2WSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object ZTable2FSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object ZTable2FSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object ZTable2FSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object ZTable2FUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZTable2FUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZTable2WUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object ZTable2DSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZTable2BAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object ZTable2WINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object ZTable2BTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object ZTable2WSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object ZTable2WSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object ZTable2WSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object ZTable2WOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object ZTable2WPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZTable2BDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object ZTable2WPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object ZTable2WLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object ZTable2WFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
  end
  object ZQuery1: TUniQuery
    DataTypeMap = <>
    Connection = ZConnection1
    Left = 312
    Top = 160
  end
  object ZSQLProcessor1: TUniScript
    AutoCommit = True
    Connection = ZConnection1
    Left = 340
    Top = 264
  end
  object ZSQLPrUpdateTables: TUniScript
    SQL.Strings = (
      'CREATE TABLE Abreviat('
      'CKey char(1) not null'
      ',SAbreviation char(30),'
      'PRIMARY KEY  (CKey)'
      ');'
      'CREATE TABLE Account('
      'WAccountID integer not null'
      ',SSubAccountCode char(3)'
      ',WAccountTypeID integer not null'
      ',SDescription char(35)'
      ',WReportingGroup1ID integer not null'
      ',WReportingGroup2ID integer not null'
      ',BSubAccounts SmallInt not null'
      ',BIncomeExpense SmallInt not null'
      ',DSysDate timestamp'
      ',WProfileID integer'
      ',SMainAccountCode char(4)'
      ',SAccountCode char(7),'
      'PRIMARY KEY  (WAccountID));'
      ''
      'create'
      
        'INDEX ACCOUNT_IND_ACCOUNTCODES ON ACCOUNT (SMAINACCOUNTCODE, SSU' +
        'BACCOUNTCODE);'
      'create'
      'INDEX ACCOUNT_IND_REPGROUP1 ON ACCOUNT (WReportingGroup1ID);'
      'create'
      'INDEX ACCOUNT_IND_REPGROUP2 ON ACCOUNT (WReportingGroup2ID);'
      'create'
      'INDEX ACCOUNT_IND_ACCOUNTCODE ON ACCOUNT (SAccountCode);'
      'create'
      'INDEX ACCOUNT_IND_DESCRIPTION ON ACCOUNT (SDescription);'
      ''
      ''
      'CREATE TABLE addressPerAccount('
      'WAddressPerAccountId integer not null'
      ',WAccountId integer not null'
      ',WContactID integer not null,'
      'Primary Key (WAddressPerAccountId)'
      ');'
      'create'
      'INDEX ADDR_PER_ACC_IND_ACCID ON addressPerAccount (WAccountId);'
      ''
      ''
      'CREATE TABLE AssetMas('
      'WAssetID integer not null'
      ',SDesription char(35)'
      ',WLocationID integer'
      ',WGroup1ID integer not null'
      ',WGroup2ID integer not null'
      ',SAssetCode char(15)'
      ',SSubAssetCode char(15)'
      ',SSerialNo char(25)'
      ',DDepStart timestamp'
      ',DDepEnd timestamp'
      ',DBuy timestamp'
      ',DAssetOut timestamp'
      ',WDepTypeID integer'
      ',FDepRate float'
      ',FTaxRate float'
      ',WTaxType integer'
      ',WTaxID integer'
      ',WSupplierID integer'
      ',BDisabled SmallInt'
      ',FCostPrice float'
      ',FPurPrice float'
      ',FCapTaxAmt float'
      ',FMArketValue float'
      ',FBookValue float'
      ',FUnsed1 float'
      ',FUnsed2 float'
      ',DSysDate timestamp'
      ',WAccountID integer not null,'
      'primary key (WAssetID)'
      ');'
      ''
      'CREATE TABLE BackOrd('
      'WBackOrderID integer not null'
      ',WAccountID integer not null'
      ',WStockID integer not null'
      ',FQty float'
      ',FSellingPrice float'
      ',BSelected SmallInt'
      ',DSysDate timestamp,'
      'primary key (WBackOrderID)'
      ');'
      ''
      'CREATE TABLE Bank('
      'WAccountID integer not null'
      ',WContactID integer'
      ',WReceiptsID integer'
      ',WPaymentsID integer'
      ',WCurrencyID integer'
      ',DSysDate timestamp,'
      'primary key (WAccountID)'
      ');'
      'create'
      'INDEX BANK_IND_ACCID ON Bank (WAccountId);'
      ''
      'CREATE TABLE BatCon('
      'WBatchID integer not null'
      ',WUserID integer not null'
      ',WBatchTypeID integer not null'
      ',SBatchNumber char(8)'
      ',BPosted SmallInt'
      ',BImported SmallInt'
      ',BDocSource SmallInt'
      ',WLineCount integer'
      ',SFilename char(16)'
      ',WDocID integer'
      ',DSysDate timestamp'
      ',WInitBatID integer'
      ',SAlias char(15)'
      ',SUniqueID char(8),'
      'primary key (WBatchID)'
      ''
      ');'
      ''
      'CREATE TABLE BatTypes('
      'WBatchTypeID integer not null'
      ',SDescription char(16)'
      ',BCashBook SmallInt'
      ',WContraAccountID integer'
      ',BContraPerLine SmallInt'
      ',BIncrementRefNo SmallInt'
      ',BRepeatDetails SmallInt'
      ',BConsolidateBalancing SmallInt'
      ',WDebitCredit integer'
      ',WPaymentGroupID integer'
      ',WDefaultTaxID integer'
      ',BViewExclusive SmallInt'
      ',BLinkOI SmallInt'
      ',BInclusiveMode SmallInt'
      ',DSysDate timestamp,'
      'primary key (WBatchTypeID)'
      ');'
      ''
      ''
      'CREATE TABLE Contacts('
      'RecordID integer not null'
      ',ResourceID integer not null'
      ',FirstName char(50)'
      ',LastName char(50)'
      ',Birthdate timestamp'
      ',Anniversary timestamp'
      ',Title char(50)'
      ',Company char(50)'
      ',Job_Position char(30)'
      ',Address char(100)'
      ',City char(50)'
      ',State char(25)'
      ',Zip char(10)'
      ',Country char(25)'
      ',Note char(255)'
      ',Phone1 char(25)'
      ',Phone2 char(25)'
      ',Phone3 char(25)'
      ',Phone4 char(25)'
      ',Phone5 char(25)'
      ',PhoneType1 integer'
      ',PhoneType2 integer'
      ',PhoneType3 integer'
      ',PhoneType4 integer'
      ',PhoneType5 integer'
      ',Category integer'
      ',EMail char(100)'
      ',Custom1 char(100)'
      ',Custom2 char(100)'
      ',Custom3 char(100)'
      ',Custom4 char(100)'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100),'
      'primary key (RecordID)'
      ');'
      ''
      'CREATE TABLE creditor('
      'WAccountID integer not null'
      ',WContactID integer not null'
      ',SPassword char(8)'
      ',SPostal1 char(30)'
      ',SPostal2 char(30)'
      ',SPostal3 char(30)'
      ',SPostalCode char(8)'
      ',SDelivery1 char(30)'
      ',SDelivery2 char(30)'
      ',SDelivery3 char(30)'
      ',STelephone1 char(20)'
      ',STelephone2 char(20)'
      ',SFax char(20)'
      ',SEmail char(50)'
      ',WBankName char(20)'
      ',SBranchCode char(10)'
      ',SBankAccountNumber char(20)'
      ',SBankAccountName char(30)'
      ',FCreditLimit float'
      ',FChargeAmount float'
      ',SCode char(6)'
      ',BOpenItem SmallInt'
      ',BPostBBF SmallInt'
      ',DLastActivity timestamp'
      ',WCurrencyID integer'
      ',WForexAccountID integer'
      ',SMessage char(50)'
      ',SReference char(15)'
      ',FDiscount float'
      ',WDefaultPriceTypeID integer'
      ',DSysDate timestamp'
      ',WDueDays integer'
      ',WDefaultAccount integer'
      ',WDefaultTax integer,'
      'primary key (WAccountID)'
      ');'
      'create'
      'INDEX CREDITOR_IND_CONTACT ON creditor (WContactId);'
      ''
      'CREATE TABLE Currency('
      'WCurrencyID integer not null'
      ',SDescription char(30)'
      ',SSymbol char(6)'
      ',FRate1 float'
      ',FRate2 float'
      ',FRete3 float'
      ',FRate4 float'
      ',FRate5 float'
      ',FRate6 float'
      ',FRate7 float'
      ',FRate8 float'
      ',FRate9 float'
      ',FRate10 float'
      ',FRate11 float'
      ',FRate12 float'
      ',FRate13 float'
      ',FRate14 float'
      ',FRate15 float'
      ',FRate16 float'
      ',FRate17 float'
      ',FRate18 float'
      ',FRate19 float'
      ',FRate20 float'
      ',FRate21 float'
      ',FRate22 float'
      ',FRate23 float'
      ',FRate24 float'
      ',FRate25 float'
      ',FRate26 float'
      ',WContryID integer'
      ',WVarianceAccountID integer'
      ',WNoofDecimals integer,'
      'primary key (WCurrencyID)'
      ');'
      ''
      'CREATE TABLE Debtor('
      'WAccountID integer not null'
      ',SCode char(6)'
      ',WContactID integer'
      ',SPassword char(8)'
      ',SPostal1 char(30)'
      ',SPostal2 char(30)'
      ',SPostal3 char(30)'
      ',SPostalCode char(8)'
      ',SDelivery1 char(30)'
      ',SDelivery2 char(30)'
      ',SDelivery3 char(30)'
      ',SDeliveryCode char(8)'
      ',STelephone1 char(20)'
      ',STelephone2 char(20)'
      ',SFax char(20)'
      ',SEmail char(50)'
      ',SBankName char(20)'
      ',SBranchCode char(10)'
      ',SBankAccountNumber char(20)'
      ',SBankAccountName char(30)'
      ',SCreditCardNumber char(20)'
      ',DExpiryDate timestamp'
      ',SCreditCardType char(20)'
      ',SCreditCardHolder char(20)'
      ',FCreditLimit float'
      ',FChargeAmount float'
      ',FDiscount float'
      ',FInterest float'
      ',WBankID integer'
      ',WSalesmanID integer'
      ',BOpenItem SmallInt'
      ',BPostBBF SmallInt'
      ',BDisabled SmallInt'
      ',SMessage char(50)'
      ',WDefaultPriceTypeID integer'
      ',DLastActivity timestamp'
      ',WCurrencyID integer'
      ',WForexAccountID integer'
      ',SReference char(15)'
      ',DSysDate timestamp'
      ',WDueDays integer'
      ',WDefaultAccount integer'
      ',WDefaultTax integer,'
      'primary key (WAccountID)'
      ');'
      'create'
      'INDEX Debtor_IND_CONTACT ON Debtor (WContactId);'
      ''
      'CREATE TABLE DnlBanks('
      'STransID char(32) not null'
      ',WLineTypeID integer'
      ',WSourceID integer'
      ',WBankID integer'
      ',WTransTypeID integer'
      ',SAccountCode char(15)'
      ',DTransDate timestamp'
      ',DPostedDate timestamp'
      ',FAmount float'
      ',SMemo char(40)'
      ',SReference char(15)'
      ',BReconciled SmallInt'
      ',SDescription char(40)'
      ',WCurrencyID integer'
      ',WAccountID integer'
      ',WLineID integer'
      ',WTcTransID integer'
      ',WProfileID integer'
      ',WAutoMatchID integer'
      ',BUseForBatch integer'
      ',DSysDate timestamp'
      ',WAmtSgn integer'
      ');'
      ''
      'CREATE TABLE DocHead('
      'WDocID integer not null'
      ',SDocNo char(15)'
      ',WTypeID integer not null'
      ',DDate timestamp'
      ',DAllocatedDate timestamp'
      ',WAccountID integer not null'
      ',WPaymentTypeID integer'
      ',WPostal1ID integer'
      ',WPostal2ID integer'
      ',WPostal3ID integer'
      ',WPostalCodeID integer'
      ',WMessage1ID integer'
      ',WMessage2ID integer'
      ',WMessage3ID integer'
      ',FInvoiceDiscount float'
      ',WSalesmanID integer'
      ',SReference char(15)'
      ',WDelAddress1ID integer'
      ',WDelAddress2ID integer'
      ',WDelAddress3ID integer'
      ',WDelCodeID integer'
      ',BPrinted SmallInt'
      ',BPosted SmallInt'
      ',WReportingGroup1ID integer'
      ',WReportingGroup2ID integer'
      ',WPaymentGroupID integer'
      ',BExclusive SmallInt'
      ',WCurrencyID integer'
      ',FDocAmount float'
      ',FTaxAmount float'
      ',BRepeating SmallInt'
      ',DSysDate timestamp'
      ',WSourceTypeID integer'
      ',WProfileID integer'
      ',WTerms integer'
      ',WJobCodeID integer'
      ',DDueDate timestamp'
      ',WUserID integer,'
      'primary key (WDocID)'
      ');'
      ''
      'CREATE TABLE DocLine('
      'WDocLineID integer not null'
      ',WDocID integer not null'
      ',WStockID integer'
      ',WLineTypeID integer'
      ',WDescriptionID integer'
      ',FQtyOrdered float'
      ',FQtyShipped float'
      ',FSellingPrice float'
      ',FItemDiscount float'
      ',WTaxID integer'
      ',FExclusiveAmt float'
      ',FInclusiveAmt float'
      ',FTaxAmount float'
      ',DSysDate timestamp'
      ',SUnit char(8)'
      ',SSTockCode char(15)'
      ',WProfileID integer'
      ',WSerialNoID integer,'
      'primary key (WDocID,WDocLineID)'
      ');'
      ''
      'CREATE TABLE EmpMas('
      'WEmployeeID integer not null'
      ',SEmployeeNumber char(15)'
      ',SFirstName char(20)'
      ',SSurname char(20)'
      ',SAddress1 char(30)'
      ',SAddress2 char(30)'
      ',SAddress3 char(30)'
      ',SPostCode char(15)'
      ',SIDNumber char(20)'
      ',SPassportNumber char(20)'
      ',SIncomeTaxRefNumber char(30)'
      ',SDirectiveNumber char(20)'
      ',SBranch char(30)'
      ',DStartDate timestamp'
      ',DTerminationDate timestamp'
      ',BActive SmallInt'
      ',DBirthDate timestamp'
      ',WIRPType integer'
      ',SReason char(30)'
      ',WReportingGroup1 integer'
      ',WReportingGroup2 integer'
      ',WAccountID integer'
      ',WPaymentMethodID integer'
      ',SBankName char(20)'
      ',SBankAccountNumber char(20)'
      ',SBankBranch char(20)'
      ',FLeaveAllocated float'
      ',FLeaveTaken float'
      ',SData1 char(20)'
      ',SData2 char(20)'
      ',SData3 char(20)'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WEmployeeID)'
      ');'
      ''
      'CREATE TABLE EmpSource('
      'WSourceID integer not null'
      ',WUnitID integer'
      ',SDescription char(20)'
      ',WAccountID integer'
      ',WSourceTypeID integer'
      ',BTaxable SmallInt'
      ',BActive SmallInt'
      ',WParentSourceID integer'
      ',SFormula char(35)'
      ',WProfileID integer'
      ',BForInfo integer'
      ',WDrAccountID integer'
      ',WCrAccountID integer'
      ',DSysDate timestamp,'
      'primary key (WSourceID)'
      ');'
      ''
      'CREATE TABLE Events('
      'RecordID integer not null'
      ',StartTime timestamp'
      ',EndTime timestamp'
      ',ResourceID integer'
      ',WContactID integer'
      ',Description char(255)'
      ',Notes char(255)'
      ',Category integer'
      ',AllDayEvent SmallInt'
      ',DingPath char(255)'
      ',AlarmSet SmallInt'
      ',AlarmAdvance integer'
      ',AlarmAdvanceType integer'
      ',SnoozeTime timestamp'
      ',RepeatCode integer'
      ',RepeatRangeEnd timestamp'
      ',CustomInterval integer'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100)'
      ',WAccountID integer,'
      'primary key (RecordID)'
      ');'
      ''
      'CREATE TABLE FlowTmp('
      'WAccountID integer not null'
      ',WBatchID integer'
      ',SDescription char(32)'
      ',WPeriodID integer'
      ',SCode char(8)'
      ',FAmount1 float'
      ',FAmount2 float'
      ',FAmount3 float'
      ',FAmount4 float'
      ',FAmount5 float'
      ',FAmount6 float'
      ');'
      ''
      'CREATE TABLE Global('
      'WNewAccountID integer '
      ',WNewBackOrderID integer'
      ',WNewContactID integer'
      ',WNewBatchTypeID integer'
      ',WNewBatchID integer'
      ',WNewGroupID integer'
      ',WNewCurrencyID integer'
      ',WNewDocID integer'
      ',WNewLabSpecsID integer'
      ',WNewReportID integer'
      ',WNewTransactionID integer'
      ',WNewStockID integer'
      ',WNewUnitID integer'
      ',WNewUserID integer'
      ',WNewMessageID integer'
      ',WNewStockTransID integer'
      ');'
      ''
      'CREATE TABLE Groups('
      'WGroupID integer not null'
      ',WGroupTypeID integer'
      ',SDescription char(30)'
      ',WParentGroup2ID integer'
      ',WParentGroup1ID integer'
      ',DSysDate timestamp'
      ',WSortNo integer,'
      'primary key (WGroupID)'
      ');'
      ''
      'CREATE TABLE JobProject('
      'WJobProjectID integer not null'
      ',SJobProjectCode char(10)'
      ',SDescription char(35)'
      ',DStartDate timestamp'
      ',DEndDate timestamp'
      ',WParentID integer'
      ',WNoteFileID integer'
      ',BEnabled SmallInt'
      ',WStatusID integer'
      ',WInBudgetAccID integer'
      ',WExBudgetAccID integer'
      ',WProfileID integer'
      ',WInfosID integer'
      ',WGroup1ID integer'
      ',DSysDate timestamp'
      ',WUserID integer'
      ',WGroup2ID integer'
      ',WProfBudgetID integer,'
      'primary key (WJobProjectID)'
      ');'
      ''
      'CREATE TABLE KeysCont('
      'WKeyValue integer not null'
      ',SKeyName char(10),'
      'primary key (WKeyValue)'
      ');'
      ''
      'CREATE TABLE LabSpecs('
      'WLabSpecsID integer not null'
      ',SDescription char(30)'
      ',FTopMargin float'
      ',FBottomMargin float'
      ',FLeftMargin float'
      ',FRightMargin float'
      ',BPortrait SmallInt'
      ',FHeight float'
      ',FWidth float'
      ',WAccross integer'
      ',WDown integer'
      ',FHGap float'
      ',FVGap float'
      ',FUnprintableTop float'
      ',FUnprintableLeft float'
      ',FPageHeight float'
      ',FPageWidth float'
      ',DSysDate timestamp'
      ',WFontSize integer,'
      'primary key (WLabSpecsID)'
      ');'
      ''
      'CREATE TABLE Locations('
      'WLocationID integer not null'
      ',SDescription char(35)'
      ',SLocCode char(8)'
      ',WLocationTypeID integer'
      ',WParentID integer'
      ',DSysDate timestamp'
      ',WSortNo integer,'
      'primary key (WLocationID)'
      ');'
      ''
      'CREATE TABLE ManufacD('
      'WMfcDocID integer not null'
      ',WLineID integer not null'
      ',WLinetypeID integer'
      ',SStockCode char(20)'
      ',SDescription char(40)'
      ',WLocationID integer'
      ',FQty float'
      ',FValue float'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WMfcDocID,WLineID)'
      ');'
      ''
      'CREATE TABLE ManufacH('
      'WMfcDocID integer not null'
      ',WMfcTypeID integer'
      ',SMfcCode char(20)'
      ',WParentID integer'
      ',SPicture char(20)'
      ',BDisabled SmallInt'
      ',SDescription char(35)'
      ',WLocationID integer'
      ',WFinishedStockID integer'
      ',FPrice1 float'
      ',FPrice2 float'
      ',FPrice3 float'
      ',FUnused float'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WMfcDocID)'
      ');'
      ''
      'CREATE TABLE messages('
      'WMessageID integer not null'
      ',SDescription char(35)'
      ',SExtraDescription char(255),'
      'primary key (WMessageID)'
      ');'
      'CREATE  '
      'INDEX MESSAGES_IND_DESCRIPTION ON MESSAGES (SDESCRIPTION);'
      ''
      ''
      'CREATE TABLE OILinks('
      'DDocDate timestamp'
      ',SReference char(35)'
      ',SLinkedReference char(15)'
      ',WFullAmount float'
      ',WOutStandingAmount float'
      ',WLinkedAmount float'
      ',DDate timestamp'
      ',UnUsed1 integer'
      ',WAmountTransactionID integer'
      ',WLinkTransactionID integer'
      ',WUserID integer'
      ',UnUsed2 integer'
      ',WBatchID integer'
      ',WAccountID integer'
      ',WTaxID integer'
      ',DSysDate timestamp'
      ');'
      ''
      'CREATE TABLE OpReport('
      'WOptionID integer not null'
      ',StrOption char(25)'
      ',SOptionValue char(35)'
      ',WOptionTypeID integer,'
      'primary key (WOptionID)'
      ');'
      'CREATE  '
      'INDEX OPREPORT_IND_STR_OPTION ON OpReport (StrOption);'
      ''
      ''
      'CREATE TABLE PayCon('
      'WPayRollID integer not null'
      ',DDate timestamp'
      ',SDescription char(15)'
      ',BActive SmallInt'
      ',BCurrentYear SmallInt'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WPayRollID)'
      ');'
      ''
      'CREATE TABLE PayTrans('
      'WPayRollID integer not null'
      ',WEmployeeID integer'
      ',WSourceID integer'
      ',WPeriodID integer'
      ',FAmount float'
      ',FUnits float'
      ',WUserID integer'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WPayRollID)'
      ');'
      ''
      'CREATE TABLE Periods('
      'WPeriodID integer not null'
      ',DStartDate timestamp not null'
      ',DEndDate timestamp not null'
      ',SDescription char(12)'
      ',BShutDown SmallInt'
      ',BContainsTransactions SmallInt,'
      'primary key (WPeriodID)'
      ');'
      ''
      'CREATE TABLE Printers('
      'WPrinterID integer not null'
      ',SPrinterName char(20)'
      ',WLinesPerPage integer'
      ',WLinesPerInch integer'
      ',WCharsPerInch integer'
      ',WPageLength integer'
      ',WPageWidth integer'
      ',S6LinesPerInch char(20)'
      ',S8LinesPerInch char(20)'
      ',S10LinesPerInch char(20)'
      ',S5CharsPerInchOn char(20)'
      ',S5CharsPerInchOff char(20)'
      ',S10CharsPerInchOn char(20)'
      ',S12CharsPerInchOn char(20)'
      ',S16CharsPerInchOn char(20)'
      ',S16CharsPerInchOff char(20)'
      ',SBoldFaceOn char(20)'
      ',SBoldFaceOff char(20)'
      ',DSysDate timestamp,'
      'primary key (WPrinterID)'
      ');'
      ''
      'CREATE TABLE Profiles('
      'WProfileID integer not null'
      ',WProfileTypeID integer'
      ',WParentID integer'
      ',WSourceID integer'
      ',WSourceTypeID integer'
      ',SDescription char(35)'
      ',BActive SmallInt'
      ',DSysDate timestamp'
      ',WSortNo integer'
      ',WStatus integer,'
      'primary key (WProfileID)'
      ');'
      ''
      'CREATE TABLE ReconBank('
      'SReference char(15)'
      ',DDate timestamp'
      ',SAccount char(7)'
      ',SDescription char(35)'
      ',FAmount float'
      ',FTaxAmount float'
      ',BReconciled SmallInt'
      ',FRecNo float'
      ',FBatchType float'
      ');'
      ''
      'CREATE TABLE RepCells('
      'WReportID integer not null'
      ',WColumnID integer not null'
      ',WRowID integer not null'
      ',SValue char(30)'
      ',DSysDate timestamp,'
      'primary key (WReportID,WColumnID,WRowID)'
      ''
      ');'
      ''
      'CREATE TABLE RepCols('
      'WReportID integer not null'
      ',WColumnID integer not null'
      ',SHeading1 char(15)'
      ',SHeading2 char(15)'
      ',WColumnTypeID integer'
      ',WPeriodStart integer'
      ',WPeriodEnd integer'
      ',SFormula char(15)'
      ',DSysDate timestamp,'
      'primary key (WReportID,WColumnID)'
      ');'
      ''
      'CREATE TABLE RepHead('
      'WReportID integer not null'
      ',SReportName char(15)'
      ',STitle1 char(31)'
      ',STitle2 char(31)'
      ',BDisplayDecimal SmallInt'
      ',BCompressPrint SmallInt'
      ',WNoOfColumns integer'
      ',WReportTypeID integer'
      ',DSysDate timestamp,'
      'primary key (WReportID)'
      ');'
      ''
      'CREATE TABLE RepLine('
      'WReportID integer not null'
      ',WRowID integer not null'
      ',WRowTypeID integer'
      ',WRowItemID integer'
      ',SItemName char(8)'
      ',SRowDescription char(35)'
      ',BMainAccount SmallInt'
      ',BSupressPrint SmallInt'
      ',SDescription char(35)'
      ',SColumn1 char(30)'
      ',SColumn2 char(30)'
      ',SColumn3 char(30)'
      ',SColumn4 char(30)'
      ',SColumn5 char(30)'
      ',SColumn6 char(30)'
      ',SColumn7 char(30)'
      ',SColumn8 char(30)'
      ',SColumn9 char(30)'
      ',SColumn10 char(30)'
      ',SColumn11 char(30)'
      ',SColumn12 char(30)'
      ',SColumn13 char(30)'
      ',SColumn14 char(30)'
      ',SColumn15 char(30)'
      ',DSysDate timestamp,'
      'primary key (WReportID,WRowID)'
      ');'
      ''
      'CREATE TABLE ReportOp('
      'SAccountListingSequence char(35)'
      ',SAccountListingFromAcc char(7)'
      ',SAccountListingToAcc char(7)'
      ',BAccountListingShowSub SmallInt'
      ',WTrialBalFromDateID integer'
      ',WTrialBaloDateID integer'
      ',BTrialBalDisplaySubAcc SmallInt'
      ',BTrialBalNilBalances SmallInt'
      ',STrialBalSSequence char(35)'
      ',SBudgetPerfSequence char(35)'
      ',SBudgetPerfFromAcc char(7)'
      ',SBudgetPerfToAcc char(7)'
      ',BBudgetPerfShowSub SmallInt'
      ',BBudgetPerfNilBal SmallInt'
      ',WBatchTypeType integer'
      ',SBatchTypeWhichYear char(10)'
      ',WBatchTypeFromDateID integer'
      ',WBatchTypeToDateID integer'
      ',BBatchTypeShowPeriod SmallInt'
      ',BBatchTypeShowBal SmallInt'
      ',SCreditorListingSequence char(35)'
      ',SCredListingFromAccount char(7)'
      ',SCredListingToAccount char(7)'
      ',SCredMovementsSequence char(35)'
      ',SCredMovementsFromAccount char(7)'
      ',SCredMovementsToAccount char(7)'
      ',BCredMovementsBNiBal SmallInt'
      ',SDebtorListingSequence char(35)'
      ',SDebtorListingFromAccount char(7)'
      ',SDebtorListingToAccount char(7)'
      ',BDebtorListingShowDetail SmallInt'
      ',SDebtorMovementSequence char(35)'
      ',SDebtorMovementFromAcc char(7)'
      ',SDebtorMovementToAcc char(7)'
      ',BDebtorMovementBNilBal SmallInt'
      ',WDocListTypeID integer'
      ',SDocListSequence char(35)'
      ',SDocListFromNumber char(8)'
      ',SDocListToNumber char(8)'
      ',DDocListFromDate timestamp'
      ',DDocListToDate timestamp'
      ',SDebtorAgeFrom char(7)'
      ',SDebtorAgeTo char(7)'
      ',DDebtorAgeCurrentDate timestamp'
      ',DDebtorAgeDateLimit1 timestamp'
      ',DDebtorAgeDateLimit2 timestamp'
      ',DDebtorAgeDateLimit3 timestamp'
      ',DDebtorAgeDateLimit4 timestamp'
      ',SDebtorAgeRangeName0 char(15)'
      ',SDebtorAgeRangeName1 char(15)'
      ',SDebtorAgeRangeName2 char(15)'
      ',SDebtorAgeRangeName3 char(15)'
      ',FDebtorAgeMinimumAmount float'
      ',WDebtorAgeMonth1 integer'
      ',WDebtorAgeMonth2 integer'
      ',WDebtorAgeMonth3 integer'
      ',BDebtorAgeSort SmallInt'
      ',BDebtorAgeAccountdetail SmallInt'
      ',BDebtorAgeShowTransac SmallInt'
      ',BDebtorAgeShowOpenItem SmallInt'
      ',BDebtorAgeIgnoreZeroBal SmallInt'
      ',SCreditorAgeFrom char(7)'
      ',SCreditorAgeTo char(7)'
      ',DCreditorAgeCurrentDate timestamp'
      ',DCreditorAgeDateLimit1 timestamp'
      ',DCreditorAgeDateLimit2 timestamp'
      ',DCreditorAgeDateLimit3 timestamp'
      ',DCreditorAgeDateLimit4 timestamp'
      ',SCreditorAgeRangeName0 char(15)'
      ',SCreditorAgeRangeName1 char(15)'
      ',SCreditorAgeRangeName2 char(15)'
      ',SCreditorAgeRangeName3 char(15)'
      ',FCreditorAgeMinimumAmount float'
      ',WCreditorAgeMonth1 integer'
      ',WCreditorAgeMonth2 integer'
      ',WCreditorAgeMonth3 integer'
      ',BCreditorAgeSort SmallInt'
      ',BCreditorAgeAccountDetail SmallInt'
      ',BCreditorAgeShowTransac SmallInt'
      ',BCreditorAgeShowOpenItem SmallInt'
      ',BCreditorAgeIgnoreZeroBal SmallInt'
      ',SReconBankAccount char(35)'
      ',DReconUntil timestamp'
      ',FReconBankBalance float'
      ',SReconReportBankAccount char(35)'
      ',DReconReportUntil timestamp'
      ',FReconReportBalance float'
      ',BCredTransIncNilBal SmallInt'
      ',SCredTransSequence char(35)'
      ',SCredTransWhichYear char(35)'
      ',SCredTransFromAccount char(7)'
      ',SCredTransToAccount char(7)'
      ',WCredTransFromDate integer'
      ',WCredTransToDate integer'
      ',BCredTransEachPeriod SmallInt'
      ',BCredTransNewPage SmallInt'
      ',BDebTransIncNilBal SmallInt'
      ',SDebTransSequence char(35)'
      ',SDebTransWhichYear char(35)'
      ',SDebTransFromAccount char(7)'
      ',SDebTransToAccount char(7)'
      ',WDebTransFromDate integer'
      ',WDebTransToDate integer'
      ',BDebTransEachPeriod SmallInt'
      ',BDebTransNewPage SmallInt'
      ',SStockActivityFromCode char(15)'
      ',SStockActivityToCode char(15)'
      ',SStockActivitySequence char(35)'
      ',SStockListSequence char(35)'
      ',SStockListFromCode char(15)'
      ',SStockListToCode char(15)'
      ',BStockListQtyOnHand SmallInt'
      ',BStockListCostPrice SmallInt'
      ',BStockListSellingPrice SmallInt'
      ',BStockListStockCount SmallInt'
      ',BStockListStockValue SmallInt'
      ',SStockMovementSequence char(35)'
      ',SStockMovementFromCode char(15)'
      ',SStockMovementToCode char(15)'
      ',DStockMovementFromDate timestamp'
      ',DStockMovementToDate timestamp'
      ',BStockMovementShowDetail SmallInt'
      ',BStockMovementNewPage SmallInt'
      ',SStockReorderSequence char(35)'
      ',SStockReorderFromCode char(15)'
      ',SStockReorderToCode char(15)'
      ',BGLLedgerNilBalances SmallInt'
      ',SGLLedgerSequence char(35)'
      ',SGLLedgerWhichYear char(35)'
      ',SGLLedgerFromAccount char(7)'
      ',SGLLedgerToAccount char(7)'
      ',WGLLedgerFromDate integer'
      ',WGLLedgerToDate integer'
      ',BGLLedgerEachPeriod SmallInt'
      ',BGLLedgerNewPage SmallInt'
      ',SGLMovementSequence char(35)'
      ',SGLMovementFromAccount char(7)'
      ',SGLMovementToAccount char(7)'
      ',BGLMovementBInclNilBal SmallInt'
      ',SSalesByCustSequence char(35)'
      ',SSalesByCustFromCust char(7)'
      ',SSalesByCustToCust char(7)'
      ',DSalesByCustFromDate timestamp'
      ',DSalesByCustToDate timestamp'
      ',SPurchBySuppSequence char(35)'
      ',SPurchBySuppFromSupp char(7)'
      ',SPurchBySuppToSupp char(7)'
      ',DPurchBySuppFromDate timestamp'
      ',DPurchBySuppToDate timestamp'
      ',SSalesByProdSequence char(35)'
      ',SSalesByProdFromProd char(15)'
      ',SSalesByProdToProd char(15)'
      ',DSalesByProdFromDate timestamp'
      ',DSalesByProdToDate timestamp'
      ',SPurchByProdSequence char(35)'
      ',SPurchByProdFromProd char(7)'
      ',SPurchByProdToProd char(7)'
      ',DPurchByProdFromDate timestamp'
      ',DPurchByProdToDate timestamp'
      ',SCustByProdSequence char(35)'
      ',SCustByProdFromProd char(15)'
      ',SCustByProdToProd char(15)'
      ',DCustByProdFromDate timestamp'
      ',DCustByProdToDate timestamp'
      ',SSalesPersByProdSequence char(35)'
      ',SSalesPersByProdFromProd char(15)'
      ',SSalesPersByProdToProd char(15)'
      ',DSalesPersByProdFromDate timestamp'
      ',DSalesPersByProdToDate timestamp'
      ',SProdByCustSequence char(35)'
      ',SProdByCustFromProd char(15)'
      ',SProdByCustToProd char(15)'
      ',DProdByCustFromDate timestamp'
      ',DProdByCustToDate timestamp'
      ',SCustBySPersonSPerson char(30)'
      ',DCustBySPersonFromDate timestamp'
      ',DCustBySPersonToDate timestamp'
      ',SSalesBySPSalesPerson char(30)'
      ',DSalesBySPFromDate timestamp'
      ',DSalesBySPToDate timestamp'
      ',SProdBySPSalesPerson char(30)'
      ',DProdBySPFromDate timestamp'
      ',DProdBySPToDate timestamp'
      ',SSalesByGroupFromGroup char(15)'
      ',SSalesByGroupToGroup char(15)'
      ',DSalesByGroupFromDate timestamp'
      ',DSalesByGroupToDate timestamp'
      ',SInvoiceDetailWhichYear char(35)'
      ',WInvoiceDetailFromDate integer'
      ',WInvoiceDetailtoDate integer'
      ',SInvoiceDetailSTaxAccount char(35)'
      ',BInvoiceDetailShowDetail SmallInt'
      ',SDebtStatementFromAcc char(7)'
      ',SDebtStatementToAcc char(7)'
      ',FDebtStatementMinAmount float'
      ',DDebtStatementCurrentDate timestamp'
      ',DDebtStatementDateLimit1 timestamp'
      ',DDebtStatementDateLimit2 timestamp'
      ',DDebtStatementDateLimit3 timestamp'
      ',DDebtStatementDateLimit4 timestamp'
      ',SDebtStatementAgeName0 char(15)'
      ',SDebtStatementAgeName1 char(15)'
      ',SDebtStatementAgeName2 char(15)'
      ',SDebtStatementAgeName3 char(15)'
      ',WDebtStatementMonth1 integer'
      ',WDebtStatementMonth2 integer'
      ',WDebtStatementMonth3 integer'
      ',BDebtStatementTaxSeperate SmallInt'
      ',BDebtStatementTaxTransact SmallInt'
      ',BDebtStatementOpenItem SmallInt'
      ',WIncomeStmntFromDateID integer'
      ',WIncomeStmntToDateID integer'
      ',BIncomeStmntDisplaySubAcc SmallInt'
      ',BIncomeStmntNilBalances SmallInt'
      ',SIncomeStmntSSequence char(35)'
      ',SRemittanceFromAcc char(7)'
      ',SRemittanceToAcc char(7)'
      ',FRemittanceMinAmount float'
      ',DRemittanceDateLimit1 timestamp'
      ',DRemittanceDateLimit2 timestamp'
      ',DRemittanceDateLimit3 timestamp'
      ',DRemittanceDateLimit4 timestamp'
      ',SRemittanceAgeName0 char(15)'
      ',SRemittanceAgeName1 char(15)'
      ',SRemittanceAgeName2 char(15)'
      ',SRemittanceAgeName3 char(15)'
      ',WRemittanceMonth1 integer'
      ',WRemittanceMonth2 integer'
      ',WRemittanceMonth3 integer'
      ',BRemittanceTaxSeperate SmallInt'
      ',BRemittanceTaxTransact SmallInt'
      ',BRemittanceOpenItem SmallInt'
      ',WRemittanceFromDateID integer'
      ',WRemittanceToDateID integer'
      ',BRemittanceDisplaySubAcc SmallInt'
      ',BRemittanceNilBalances SmallInt'
      ',SRemittanceSSequence char(35)'
      ',WBalSheetFromDateID integer'
      ',WBalSheetToDateID integer'
      ',BBalSheetDisplaySubAccs SmallInt'
      ',BBalSheetNilBalances SmallInt'
      ',SBalSheetSSequence char(35)'
      ',SSalesPersByCustSequence char(35)'
      ',SSalesPersByCustFromCust char(7)'
      ',SSalesPersByCustToCust char(7)'
      ',DSalesPersByCustFromDate timestamp'
      ',DSalesPersByCustToDate timestamp'
      ',WDataEntryDrCrFormat integer'
      ',WDecimal integer'
      ',SLabelFromAcc char(7)'
      ',SlabelToAcc char(7)'
      ',SlabelSSequence char(35)'
      ',SLabelSFile char(35)'
      ');'
      ''
      'CREATE TABLE ReptBat('
      'WTransactionID integer not null'
      ',WUserID integer'
      ',WBatchTypeID integer'
      ',SReference char(15)'
      ',DDate timestamp'
      ',SDescription char(35)'
      ',WTaxID integer'
      ',WAccountID integer'
      ',WContraID integer'
      ',FAmount float,'
      'primary key (WTransactionID)'
      ''
      ');'
      ''
      'CREATE TABLE ReptDocs('
      'WDocID integer not null'
      ',WGroupID integer,'
      'primary key (WDocID)'
      ');'
      ''
      'CREATE TABLE Resources('
      'ResourceID integer not null'
      ',Description char(255)'
      ',Notes char(255)'
      ',ImageIndex integer'
      ',ResourceActive SmallInt'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100),'
      'primary key (ResourceID)'
      ');'
      ''
      'CREATE TABLE Stock('
      'WStockID integer not null'
      ',SStockCode char(15)'
      ',SBarCodeNumber char(25)'
      ',SDescription char(35)'
      ',WReportingGroup1ID integer'
      ',WReportingGroup2ID integer'
      ',WCostAccountID integer'
      ',WInputTaxID integer'
      ',WOutputTaxID integer'
      ',FOpeningAveCost float'
      ',FQtyOnHand float'
      ',FOpeningQty float'
      ',FInvQtyOnHand float'
      ',FReorderQty float'
      ',WSalesAccountID integer'
      ',BApplyInvoiceDiscount SmallInt'
      ',WStockAccountID integer'
      ',FSellingPrice1 float'
      ',FSellingPrice2 float'
      ',FSellingPrice3 float'
      ',FUnitAveCost float'
      ',FUnitCost float'
      ',WUnitID integer'
      ',DSysDate timestamp'
      ',BApplyTax SmallInt'
      ',WInputTax2ID integer'
      ',BTaxable SmallInt'
      ',WSupplier1ID integer'
      ',WSupplier2ID integer'
      ',WStockTypeID integer'
      ',WOutputTax2ID integer'
      ',WProfileID integer'
      ',BDisabled SmallInt'
      ',WPerentID integer'
      ',WLocationID integer'
      ',WFileNameID integer'
      ',SExtraDesc char(255),'
      'primary key (WStockID),'
      'UNIQUE (SStockCode)'
      ');'
      'CREATE  '
      'INDEX STOCK_IND_SDESCRIPTION ON Stock (SDESCRIPTION);'
      'CREATE  '
      'INDEX STOCK_IND_SBARCODE ON Stock (SBarCodeNumber);'
      'CREATE  '
      'INDEX STOCK_IND_SSTOCKCODE ON Stock (SStockCode);'
      ''
      'CREATE  '
      'INDEX STOCK_IND_REPGROUP1 ON Stock (WReportingGroup1ID);'
      'CREATE  '
      'INDEX STOCK_IND_REPGROUP2 ON Stock (WReportingGroup2ID);'
      ''
      ''
      'CREATE TABLE StockPub('
      'WStockID integer not null'
      ',WPriceID integer'
      ',BLOBPicture blob'
      ',DSysDate timestamp,'
      'primary key (WStockID)'
      ');'
      ''
      'CREATE TABLE StockTrn('
      'WStockTransactionID integer not null'
      ',WStockID integer not null'
      ',DDate timestamp'
      ',WSalesmanID integer'
      ',WDocID integer'
      ',WDocTypeID integer'
      ',FQty float'
      ',FCostPrice float'
      ',FSellingPrice float'
      ',WAccountID integer'
      ',DSysDate timestamp,'
      'primary key (WStockTransactionID)'
      ');'
      ''
      'CREATE TABLE SysParams('
      'WParamID integer not null'
      ',WUserID integer not null'
      ',SParamName char(25) not null'
      ',SParamValue char(50)'
      ',WTypeID integer'
      ',WSourceID integer'
      ',WSourceTypeID integer'
      ',DSysDate timestamp'
      ',WParentID integer'
      ',WParentTypeID integer'
      ',BActive SmallInt'
      ',primary key (WParamID)'
      ');'
      ''
      'CREATE TABLE Sysvars('
      'SCompanyName char(35)'
      ',SCompanyRegNo char(30)'
      ',WEmailServerAddress char(30)'
      ',WFaxServerID integer'
      ',BlobLogo blob'
      ',SAddress1 char(30)'
      ',SAddress2 char(30)'
      ',SAddress3 char(30)'
      ',SPostCode char(8)'
      ',SPhoneNumber char(30)'
      ',SFaxNumber char(30)'
      ',WRetainedIncomeID integer'
      ',WDebtorsControlID integer'
      ',WCreditorsControlID integer'
      ',SBackupPath char(255)'
      ',WCostOfSalesTypeID integer'
      ',WCreditNoteBatchTypeID integer'
      ',SCreditNoteMessage1 char(30)'
      ',SCreditNoteMessage2 char(30)'
      ',SCreditNoteMessage3 char(30)'
      ',WPurchasesBatchID integer'
      ',SPurchasesMessage1 char(30)'
      ',SPurchasesMessage2 char(30)'
      ',SPurchasesMessage3 char(30)'
      ',WGoodsReturnedBatchID integer'
      ',SGoodsReturnedMessage1 char(30)'
      ',SGoodsReturnedMessage2 char(30)'
      ',SGoodsReturnedMessage3 char(30)'
      ',WInvoicesBatchID integer'
      ',SInvoicesMessage1 char(30)'
      ',SInvoicesMessage2 char(30)'
      ',SInvoicesMessage3 char(30)'
      ',WDisplayAmount integer'
      ',BAccountsOpen SmallInt'
      ',BBatchTypes SmallInt'
      ',BGroups SmallInt'
      ',BNotClosed SmallInt'
      ',BPeriodChange SmallInt'
      ',BSalesmanExist SmallInt'
      ',BUnitsExist SmallInt'
      ',FLastYearPL float'
      ',WNoOfPeriods integer'
      ',WInvoicePaperID integer'
      ',WCreditNotePaperID integer'
      ',WPurchasePaperID integer'
      ',WGoodsReturnedPaperID integer'
      ',WQuotePaperID integer'
      ',WOrderPaperID integer'
      ',WStatementPaperID integer'
      ',WRemittancePaperID integer'
      ',FReconciledBankBalance float'
      ',WReconciledBankID integer'
      ',DReconciledLastDate timestamp'
      ',SStatementMessage1 char(30)'
      ',SStatementMessage2 char(30)'
      ',SStatementMessage3 char(30)'
      ',BCreateBalanceLink SmallInt'
      ',WTaxDueAccountID integer'
      ',BTaxInvoiceBased SmallInt'
      ',BCreateCostOfSales SmallInt'
      ',WCurrentUserID integer'
      ',SInvoiceHeading char(20)'
      ',SCreditNoteHeading char(20)'
      ',SPurchaseHeading char(20)'
      ',SGoodsReturnedHeading char(20)'
      ',SQuoteHeading char(20)'
      ',SQuoteMessage1 char(30)'
      ',SQuoteMessage2 char(30)'
      ',SQuoteMessage3 char(30)'
      ',SOrderHeading char(20)'
      ',SOrderMessage1 char(30)'
      ',SOrderMessage2 char(30)'
      ',SOrderMessage3 char(30)'
      ',BPostToLastYear SmallInt'
      ',WBaseCurrencyID integer'
      ',BMultiCurrency SmallInt'
      ',STaxRegNo char(30)'
      ',BPaymentsBased SmallInt'
      ',WDueAccountID integer'
      ',WLanguageID integer'
      ',BOnline SmallInt'
      ',BRemote SmallInt'
      ',WColourID integer'
      ',SAccountReportName1 char(15)'
      ',SAccountReportName2 char(15)'
      ',SDebtorReportName1 char(15)'
      ',SDebtorReportName2 char(15)'
      ',SCreditorReportName1 char(15)'
      ',SCreditorReportName2 char(15)'
      ',SStockReportName1 char(15)'
      ',SStockReportName2 char(15)'
      ',SDocumentReportName1 char(15)'
      ',SDocumentReportName2 char(15)'
      ',SSellingPriceName1 char(15)'
      ',SSellingPriceName2 char(15)'
      ',SSellingPriceName3 char(15)'
      ',WVersion integer'
      ',SReportFontsName char(35)'
      ',BUseAvgCost SmallInt'
      ',BPrnStatementLogo SmallInt'
      ',DTLastUseTime timestamp'
      ',BShowTips SmallInt'
      ',WAutoSaveTime integer'
      ',BShowReminder SmallInt'
      ',BServicePreprinted SmallInt'
      ',WDefaultOutPutID integer'
      ',WDefaultZoom integer'
      ',BUseOutLookExp SmallInt'
      ',SEmailAddress char(60)'
      ');'
      ''
      'CREATE TABLE TaskAction('
      'TaskActionID integer not null'
      ',EventId integer not null'
      ',InvoiceID integer'
      ',AccountId integer'
      ',WGroupId integer'
      ',WTypeId integer,'
      'primary key (TaskActionID)'
      ');'
      ''
      'CREATE TABLE Tasks('
      'RecordID integer not null'
      ',ResourceID integer not null'
      ',Complete SmallInt'
      ',Description char(100)'
      ',Details blob'
      ',CreatedOn timestamp'
      ',CompletedOn timestamp'
      ',Priority integer'
      ',Category integer'
      ',DueDate timestamp'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100),'
      'primary key (RecordID)'
      ');'
      ''
      'CREATE TABLE Tax('
      'WAccountID integer not null'
      ',SDescription char(30)'
      ',DStartDate timestamp'
      ',DEndDate timestamp'
      ',FRate float'
      ',DSysDate timestamp,'
      'primary key (WAccountID)'
      ');'
      ''
      'CREATE TABLE Temp1('
      'SMainAccountCode char(4) not null'
      ',SSubAccountCode char(3) not null'
      ',WDocTypeID integer'
      ',SDescription char(35)'
      ',WStockTransactionID integer'
      ',WGroupID integer'
      ',SDocNo char(15)'
      ',DDate timestamp'
      ',WSalespersonID integer'
      ',SStockCode char(35)'
      ',FSellingPrice float'
      ',FCostPrice float'
      ',FQty float'
      ');'
      ''
      ''
      'CREATE TABLE TmpAgeAn('
      'WAccountID integer not null'
      ',WaccountTypeID integer'
      ',SAccountCode char(8)'
      ',Sdescription char(35)'
      ',FCurrent float'
      ',F30Days float'
      ',F60Days float'
      ',F90Days float'
      ',FBBF float'
      ');'
      ''
      'CREATE TABLE Totals('
      'WAccountID integer not null'
      ',WPeriodID integer not null'
      ',BActual SmallInt not null'
      ',FAmount float'
      ',DSysDate timestamp,'
      'primary key (WAccountID,WPeriodID,BActual)'
      ');'
      ''
      'CREATE TABLE TransAct('
      'WTransactionID integer not null'
      ',WBatchID integer not null'
      ',WBatchTypeID integer not null'
      ',WLineID integer not null'
      ',BCarriedForward SmallInt'
      ',BLastYear SmallInt'
      ',BLinksUsed SmallInt'
      ',BMultipleItems SmallInt'
      ',WAccountID integer not null'
      ',DDate timestamp'
      ',WPeriodID integer not null'
      ',SReference char(15)'
      ',FTaxRate float'
      ',WTaxAccountID integer'
      ',FAmount float not null'
      ',FTaxAmount float'
      ',FOutstandingAmount float'
      ',BReconciled SmallInt'
      ',WBalancingAccountID integer'
      ',WDescriptionID integer'
      ',WCurrencyID integer'
      ',FForexAmount float'
      ',WUserID integer'
      ',Unused integer'
      ',DSysDate timestamp'
      ',BUnused SmallInt'
      ',WTax2ID integer'
      ',FCurrencyRate2 float'
      ',FTaxRate2 float'
      ',FTax2Amount float'
      ',WJobCodeID integer'
      ',WProfileID integer'
      ',primary key (WTransactionID)'
      ');'
      ''
      'CREATE TABLE Types('
      'WTypeID integer not null'
      ',SDescription char(30)'
      ',WTypeParent integer'
      ',primary key (WTypeID)'
      ');'
      ''
      'CREATE TABLE Unit('
      'WUnitID integer not null'
      ',SDescription char(8)'
      ',DSysDate timestamp'
      ',primary key (WUnitID)'
      ');'
      ''
      'CREATE TABLE Users('
      'WUserID integer not null'
      ',SPassword char(8)'
      ',SUserName char(20)'
      ',SCreditNoteNextNumber char(8)'
      ',SInvoiceNextNumber char(8)'
      ',SPurchaseNextNumber char(8)'
      ',SGoodsReturnedNextNumber char(8)'
      ',SReceiptNextNumber char(8)'
      ',SQuoteNextNumber char(8)'
      ',SOrderNextNumber char(8)'
      ',SNextBatchNumber char(8)'
      ',BDisabled SmallInt'
      ',BAccounts SmallInt'
      ',BStock SmallInt'
      ',BBatchEntry SmallInt'
      ',BCreditNote SmallInt'
      ',BInvoices SmallInt'
      ',BPurchases SmallInt'
      ',BStockReturns SmallInt'
      ',BReconciliation SmallInt'
      ',BCreditorReports SmallInt'
      ',BDebtorReports SmallInt'
      ',BLedgerReports SmallInt'
      ',BStockReports SmallInt'
      ',BUserReports SmallInt'
      ',BPosting SmallInt'
      ',BGlobalProcesses SmallInt'
      ',BSystemSetup SmallInt'
      ',UserEmail char(30)'
      ',BOnLine SmallInt'
      ',SPcIPAddress char(20)'
      ',DSysDate timestamp'
      ',BEditPrices SmallInt'
      ',BGlobalSeq SmallInt'
      ',BCashBook SmallInt'
      ',BOnlyPOS SmallInt'
      ',BPOSSuper SmallInt'
      ',BSearch SmallInt'
      ',BEmail SmallInt'
      ',BNotUsed1 SmallInt'
      ',primary key (WUserID)'
      ');'
      ''
      'CREATE TABLE BOM('
      'WBomID integer not null'
      ',WStockId integer not null'
      ',WLinkedStockID integer not null'
      ',FQty float not null,'
      'primary key (WBomID)'
      ');'
      ''
      'create'
      'INDEX BOM_IND_STOCKID ON BOM (WStockId);'
      ''
      'alter table ADDRESSPERACCOUNT'
      'add constraint PK_ADDRESSPERACCOUNT_ID'
      'primary key (WADDRESSPERACCOUNTID);'
      'alter table DEBTOR'
      'add constraint FK_DEBTOR_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE '
      'on delete CASCADE ;'
      'alter table CREDITOR'
      'add constraint FK_CREDITOR_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE '
      'on delete CASCADE ;'
      'alter table DOCHEAD'
      'add constraint FK_DOCHEAD_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE '
      'on delete CASCADE ;'
      'alter table DOCLINE'
      'add constraint PK_DOCLINE_ID'
      'primary key (WDOCLINEID, WDOCID);'
      'alter table DOCLINE'
      'add constraint FK_DOCLINE_DOCHEAD'
      'foreign key (WDOCID)'
      'references DOCHEAD (WDOCID)'
      'on update CASCADE'
      'on delete CASCADE ;'
      'alter table BANK'
      'add constraint FK_BANK_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE'
      'on delete CASCADE ;'
      'alter table TRANSACT'
      'add constraint FK_TRANSACT_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID);'
      'alter table TRANSACT'
      'add constraint FK_TRANSACT_BATCH'
      'foreign key (WBATCHTYPEID)'
      'references BATTYPES (WBATCHTYPEID);'
      'alter table TRANSACT'
      'add constraint FK_TRANSACT_BATCON'
      'foreign key (WBATCHID)'
      'references BATCON (WBATCHID);'
      'alter table DOCLINE'
      'add constraint FK_DOCLINE_STOCK'
      'foreign key (WSTOCKID)'
      'references STOCK (WSTOCKID);'
      'alter table TOTALS'
      'add constraint PK_TOTALS_ID'
      'primary key (WACCOUNTID, WPERIODID, BACTUAL);'
      'alter table TOTALS'
      'add constraint FK_TOTALS_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID);'
      '')
    AutoCommit = True
    Connection = ZConnection1
    Left = 628
    Top = 320
  end
  object SQLNewDBSript: TUniScript
    SQL.Strings = (
      'CREATE TABLE Abreviat('
      'CKey char(1) not null'
      ',SAbreviation char(30),'
      'PRIMARY KEY  (CKey)'
      ');'
      'CREATE TABLE Account('
      'WAccountID integer not null'
      ',SAccountCode char(<@ACCOUNTCODE@>)'
      ',SMainAccountCode char(<@MAINACCOUNTCODE@>)'
      ',SSubAccountCode char(3)'
      ',SDescription char(35)'
      ',WAccountTypeID integer not null'
      ',WReportingGroup1ID integer not null'
      ',WReportingGroup2ID integer not null'
      ',BSubAccounts SmallInt not null'
      ',BIncomeExpense SmallInt not null'
      ',DSysDate timestamp'
      ',WProfileID integer,'
      'PRIMARY KEY  (WAccountID));'
      ''
      'create'
      
        'INDEX ACCOUNT_IND_ACCOUNTCODES ON ACCOUNT (SMAINACCOUNTCODE, SSU' +
        'BACCOUNTCODE);'
      'create'
      'INDEX ACCOUNT_IND_REPGROUP1 ON ACCOUNT (WReportingGroup1ID);'
      'create'
      'INDEX ACCOUNT_IND_REPGROUP2 ON ACCOUNT (WReportingGroup2ID);'
      'create'
      'INDEX ACCOUNT_IND_ACCOUNTCODE ON ACCOUNT (SAccountCode);'
      'create'
      'INDEX ACCOUNT_IND_DESCRIPTION ON ACCOUNT (SDescription);'
      ''
      ''
      'CREATE TABLE addressPerAccount('
      'WAddressPerAccountId integer not null'
      ',WAccountId integer not null'
      ',WContactID integer not null,'
      'Primary Key (WAddressPerAccountId)'
      ');'
      'create'
      'INDEX ADDR_PER_ACC_IND_ACCID ON addressPerAccount (WAccountId);'
      ''
      ''
      'CREATE TABLE AssetMas('
      'WAssetID integer not null'
      ',SDesription char(35)'
      ',WLocationID integer'
      ',WGroup1ID integer not null'
      ',WGroup2ID integer not null'
      ',SAssetCode char(15)'
      ',SSubAssetCode char(15)'
      ',SSerialNo char(25)'
      ',DDepStart timestamp'
      ',DDepEnd timestamp'
      ',DBuy timestamp'
      ',DAssetOut timestamp'
      ',WDepTypeID integer'
      ',FDepRate float'
      ',FTaxRate float'
      ',WTaxType integer'
      ',WTaxID integer'
      ',WSupplierID integer'
      ',BDisabled SmallInt'
      ',FCostPrice float'
      ',FPurPrice float'
      ',FCapTaxAmt float'
      ',FMArketValue float'
      ',FBookValue float'
      ',FUnsed1 float'
      ',FUnsed2 float'
      ',DSysDate timestamp'
      ',WAccountID integer not null,'
      'primary key (WAssetID)'
      ');'
      ''
      'CREATE TABLE BackOrd('
      'WBackOrderID integer not null'
      ',WAccountID integer not null'
      ',WStockID integer not null'
      ',FQty float'
      ',FSellingPrice float'
      ',BSelected SmallInt'
      ',DSysDate timestamp,'
      'primary key (WBackOrderID)'
      ');'
      ''
      'CREATE TABLE Bank('
      'WAccountID integer not null'
      ',WContactID integer'
      ',WReceiptsID integer'
      ',WPaymentsID integer'
      ',WCurrencyID integer'
      ',DSysDate timestamp,'
      'primary key (WAccountID)'
      ');'
      'create'
      'INDEX BANK_IND_ACCID ON Bank (WAccountId);'
      ''
      'CREATE TABLE BatCon('
      'WBatchID integer not null'
      ',WUserID integer not null'
      ',WBatchTypeID integer not null'
      ',SBatchNumber char(8)'
      ',BPosted SmallInt'
      ',BImported SmallInt'
      ',BDocSource SmallInt'
      ',WLineCount integer'
      ',SFilename char(16)'
      ',WDocID integer'
      ',DSysDate timestamp'
      ',WInitBatID integer'
      ',SAlias char(15)'
      ',SUniqueID char(8),'
      'primary key (WBatchID)'
      ''
      ');'
      ''
      'CREATE TABLE BatTypes('
      'WBatchTypeID integer not null'
      ',SDescription char(16)'
      ',BCashBook SmallInt'
      ',WContraAccountID integer'
      ',BContraPerLine SmallInt'
      ',BIncrementRefNo SmallInt'
      ',BRepeatDetails SmallInt'
      ',BConsolidateBalancing SmallInt'
      ',WDebitCredit integer'
      ',WPaymentGroupID integer'
      ',WDefaultTaxID integer'
      ',BViewExclusive SmallInt'
      ',BLinkOI SmallInt'
      ',BInclusiveMode SmallInt'
      ',DSysDate timestamp,'
      'primary key (WBatchTypeID)'
      ');'
      ''
      ''
      'CREATE TABLE Contacts('
      'RecordID integer not null'
      ',ResourceID integer not null'
      ',FirstName char(50)'
      ',LastName char(50)'
      ',Birthdate timestamp'
      ',Anniversary timestamp'
      ',Title char(50)'
      ',Company char(50)'
      ',Job_Position char(30)'
      ',Address char(100)'
      ',City char(50)'
      ',State char(25)'
      ',Zip char(10)'
      ',Country char(25)'
      ',Note char(255)'
      ',Phone1 char(25)'
      ',Phone2 char(25)'
      ',Phone3 char(25)'
      ',Phone4 char(25)'
      ',Phone5 char(25)'
      ',PhoneType1 integer'
      ',PhoneType2 integer'
      ',PhoneType3 integer'
      ',PhoneType4 integer'
      ',PhoneType5 integer'
      ',Category integer'
      ',EMail char(100)'
      ',Custom1 char(100)'
      ',Custom2 char(100)'
      ',Custom3 char(100)'
      ',Custom4 char(100)'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100),'
      'primary key (RecordID)'
      ');'
      ''
      'CREATE TABLE creditor('
      'WAccountID integer not null'
      ',SCode char(6)'
      ',WContactID integer not null'
      ',SPassword char(8)'
      ',SPostal1 char(30)'
      ',SPostal2 char(30)'
      ',SPostal3 char(30)'
      ',SPostalCode char(8)'
      ',SDelivery1 char(30)'
      ',SDelivery2 char(30)'
      ',SDelivery3 char(30)'
      ',STelephone1 char(20)'
      ',STelephone2 char(20)'
      ',SFax char(20)'
      ',SEmail char(50)'
      ',WBankName char(20)'
      ',SBranchCode char(10)'
      ',SBankAccountNumber char(20)'
      ',SBankAccountName char(30)'
      ',FCreditLimit float'
      ',FChargeAmount float'
      ''
      ',BOpenItem SmallInt'
      ',BPostBBF SmallInt'
      ',DLastActivity timestamp'
      ',WCurrencyID integer'
      ',WForexAccountID integer'
      ',SMessage char(50)'
      ',SReference char(15)'
      ',FDiscount float'
      ',WDefaultPriceTypeID integer'
      ',DSysDate timestamp'
      ',WDueDays integer'
      ',WDefaultAccount integer'
      ',WDefaultTax integer,'
      'primary key (WAccountID)'
      ');'
      'create'
      'INDEX CREDITOR_IND_CONTACT ON creditor (WContactId);'
      ''
      'CREATE TABLE Currency('
      'WCurrencyID integer not null'
      ',SDescription char(30)'
      ',SSymbol char(6)'
      ',FRate1 float'
      ',FRate2 float'
      ',FRete3 float'
      ',FRate4 float'
      ',FRate5 float'
      ',FRate6 float'
      ',FRate7 float'
      ',FRate8 float'
      ',FRate9 float'
      ',FRate10 float'
      ',FRate11 float'
      ',FRate12 float'
      ',FRate13 float'
      ',FRate14 float'
      ',FRate15 float'
      ',FRate16 float'
      ',FRate17 float'
      ',FRate18 float'
      ',FRate19 float'
      ',FRate20 float'
      ',FRate21 float'
      ',FRate22 float'
      ',FRate23 float'
      ',FRate24 float'
      ',FRate25 float'
      ',FRate26 float'
      ',WContryID integer'
      ',WVarianceAccountID integer'
      ',WNoofDecimals integer,'
      'primary key (WCurrencyID)'
      ');'
      ''
      'CREATE TABLE Debtor('
      'WAccountID integer not null'
      ',SCode char(6)'
      ',WContactID integer'
      ',SPassword char(8)'
      ',SPostal1 char(30)'
      ',SPostal2 char(30)'
      ',SPostal3 char(30)'
      ',SPostalCode char(8)'
      ',SDelivery1 char(30)'
      ',SDelivery2 char(30)'
      ',SDelivery3 char(30)'
      ',SDeliveryCode char(8)'
      ',STelephone1 char(20)'
      ',STelephone2 char(20)'
      ',SFax char(20)'
      ',SEmail char(50)'
      ',SBankName char(20)'
      ',SBranchCode char(10)'
      ',SBankAccountNumber char(20)'
      ',SBankAccountName char(30)'
      ',SCreditCardNumber char(20)'
      ',DExpiryDate timestamp'
      ',SCreditCardType char(20)'
      ',SCreditCardHolder char(20)'
      ',FCreditLimit float'
      ',FChargeAmount float'
      ',FDiscount float'
      ',FInterest float'
      ',WBankID integer'
      ',WSalesmanID integer'
      ',BOpenItem SmallInt'
      ',BPostBBF SmallInt'
      ',BDisabled SmallInt'
      ',SMessage char(50)'
      ',WDefaultPriceTypeID integer'
      ',DLastActivity timestamp'
      ',WCurrencyID integer'
      ',WForexAccountID integer'
      ',SReference char(15)'
      ',DSysDate timestamp'
      ',WDueDays integer'
      ',WDefaultAccount integer'
      ',WDefaultTax integer,'
      'primary key (WAccountID)'
      ');'
      'create'
      'INDEX Debtor_IND_CONTACT ON Debtor (WContactId);'
      ''
      'CREATE TABLE DnlBanks('
      'STransID char(32) not null'
      ',WLineTypeID integer'
      ',WSourceID integer'
      ',WBankID integer'
      ',WTransTypeID integer'
      ',SAccountCode char(15)'
      ',DTransDate timestamp'
      ',DPostedDate timestamp'
      ',FAmount float'
      ',SMemo char(40)'
      ',SReference char(15)'
      ',BReconciled SmallInt'
      ',SDescription char(40)'
      ',WCurrencyID integer'
      ',WAccountID integer'
      ',WLineID integer'
      ',WTcTransID integer'
      ',WProfileID integer'
      ',WAutoMatchID integer'
      ',BUseForBatch integer'
      ',DSysDate timestamp'
      ',WAmtSgn integer'
      ');'
      ''
      'CREATE TABLE DocHead('
      'WDocID integer not null'
      ',SDocNo char(15)'
      ',WTypeID integer not null'
      ',DDate timestamp'
      ',DAllocatedDate timestamp'
      ',WAccountID integer not null'
      ',WPaymentTypeID integer'
      ',WPostal1ID integer'
      ',WPostal2ID integer'
      ',WPostal3ID integer'
      ',WPostalCodeID integer'
      ',WMessage1ID integer'
      ',WMessage2ID integer'
      ',WMessage3ID integer'
      ',FInvoiceDiscount float'
      ',WSalesmanID integer'
      ',SReference char(15)'
      ',WDelAddress1ID integer'
      ',WDelAddress2ID integer'
      ',WDelAddress3ID integer'
      ',WDelCodeID integer'
      ',BPrinted SmallInt'
      ',BPosted SmallInt'
      ',WReportingGroup1ID integer'
      ',WReportingGroup2ID integer'
      ',WPaymentGroupID integer'
      ',BExclusive SmallInt'
      ',WCurrencyID integer'
      ',FDocAmount float'
      ',FTaxAmount float'
      ',BRepeating SmallInt'
      ',DSysDate timestamp'
      ',WSourceTypeID integer'
      ',WProfileID integer'
      ',WTerms integer'
      ',WJobCodeID integer'
      ',DDueDate timestamp'
      ',WUserID integer,'
      'primary key (WDocID)'
      ');'
      ''
      'CREATE TABLE DocLine('
      'WDocLineID integer not null'
      ',WDocID integer not null'
      ',WStockID integer'
      ',WLineTypeID integer'
      ',WDescriptionID integer'
      ',FQtyOrdered float'
      ',FQtyShipped float'
      ',FSellingPrice float'
      ',FItemDiscount float'
      ',WTaxID integer'
      ',FExclusiveAmt float'
      ',FInclusiveAmt float'
      ',FTaxAmount float'
      ',DSysDate timestamp'
      ',SUnit char(8)'
      ',SSTockCode char(15)'
      ',WProfileID integer'
      ',WSerialNoID integer,'
      'primary key (WDocID,WDocLineID)'
      ');'
      ''
      'CREATE TABLE EmpMas('
      'WEmployeeID integer not null'
      ',SEmployeeNumber char(15)'
      ',SFirstName char(20)'
      ',SSurname char(20)'
      ',SAddress1 char(30)'
      ',SAddress2 char(30)'
      ',SAddress3 char(30)'
      ',SPostCode char(15)'
      ',SIDNumber char(20)'
      ',SPassportNumber char(20)'
      ',SIncomeTaxRefNumber char(30)'
      ',SDirectiveNumber char(20)'
      ',SBranch char(30)'
      ',DStartDate timestamp'
      ',DTerminationDate timestamp'
      ',BActive SmallInt'
      ',DBirthDate timestamp'
      ',WIRPType integer'
      ',SReason char(30)'
      ',WReportingGroup1 integer'
      ',WReportingGroup2 integer'
      ',WAccountID integer'
      ',WPaymentMethodID integer'
      ',SBankName char(20)'
      ',SBankAccountNumber char(20)'
      ',SBankBranch char(20)'
      ',FLeaveAllocated float'
      ',FLeaveTaken float'
      ',SData1 char(20)'
      ',SData2 char(20)'
      ',SData3 char(20)'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WEmployeeID)'
      ');'
      ''
      'CREATE TABLE EmpSource('
      'WSourceID integer not null'
      ',WUnitID integer'
      ',SDescription char(20)'
      ',WAccountID integer'
      ',WSourceTypeID integer'
      ',BTaxable SmallInt'
      ',BActive SmallInt'
      ',WParentSourceID integer'
      ',SFormula char(35)'
      ',WProfileID integer'
      ',BForInfo integer'
      ',WDrAccountID integer'
      ',WCrAccountID integer'
      ',DSysDate timestamp,'
      'primary key (WSourceID)'
      ');'
      ''
      'CREATE TABLE Events('
      'RecordID integer not null'
      ',StartTime timestamp'
      ',EndTime timestamp'
      ',ResourceID integer'
      ',WContactID integer'
      ',Description char(255)'
      ',Notes char(255)'
      ',Category integer'
      ',AllDayEvent SmallInt'
      ',DingPath char(255)'
      ',AlarmSet SmallInt'
      ',AlarmAdvance integer'
      ',AlarmAdvanceType integer'
      ',SnoozeTime timestamp'
      ',RepeatCode integer'
      ',RepeatRangeEnd timestamp'
      ',CustomInterval integer'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100)'
      ',WAccountID integer,'
      'primary key (RecordID)'
      ');'
      ''
      'CREATE TABLE FlowTmp('
      'WAccountID integer not null'
      ',WBatchID integer'
      ',SDescription char(32)'
      ',WPeriodID integer'
      ',SCode char(8)'
      ',FAmount1 float'
      ',FAmount2 float'
      ',FAmount3 float'
      ',FAmount4 float'
      ',FAmount5 float'
      ',FAmount6 float'
      ');'
      ''
      'CREATE TABLE Global('
      'WNewAccountID integer '
      ',WNewBackOrderID integer'
      ',WNewContactID integer'
      ',WNewBatchTypeID integer'
      ',WNewBatchID integer'
      ',WNewGroupID integer'
      ',WNewCurrencyID integer'
      ',WNewDocID integer'
      ',WNewLabSpecsID integer'
      ',WNewReportID integer'
      ',WNewTransactionID integer'
      ',WNewStockID integer'
      ',WNewUnitID integer'
      ',WNewUserID integer'
      ',WNewMessageID integer'
      ',WNewStockTransID integer'
      ');'
      ''
      'CREATE TABLE Groups('
      'WGroupID integer not null'
      ',WGroupTypeID integer'
      ',SDescription char(30)'
      ',WParentGroup2ID integer'
      ',WParentGroup1ID integer'
      ',DSysDate timestamp'
      ',WSortNo integer,'
      'primary key (WGroupID)'
      ');'
      ''
      'CREATE TABLE JobProject('
      'WJobProjectID integer not null'
      ',SJobProjectCode char(10)'
      ',SDescription char(35)'
      ',DStartDate timestamp'
      ',DEndDate timestamp'
      ',WParentID integer'
      ',WNoteFileID integer'
      ',BEnabled SmallInt'
      ',WStatusID integer'
      ',WInBudgetAccID integer'
      ',WExBudgetAccID integer'
      ',WProfileID integer'
      ',WInfosID integer'
      ',WGroup1ID integer'
      ',DSysDate timestamp'
      ',WUserID integer'
      ',WGroup2ID integer'
      ',WProfBudgetID integer,'
      'primary key (WJobProjectID)'
      ');'
      ''
      'CREATE TABLE KeysCont('
      'WKeyValue integer not null'
      ',SKeyName char(10),'
      'primary key (WKeyValue)'
      ');'
      ''
      'CREATE TABLE LabSpecs('
      'WLabSpecsID integer not null'
      ',SDescription char(30)'
      ',FTopMargin float'
      ',FBottomMargin float'
      ',FLeftMargin float'
      ',FRightMargin float'
      ',BPortrait SmallInt'
      ',FHeight float'
      ',FWidth float'
      ',WAccross integer'
      ',WDown integer'
      ',FHGap float'
      ',FVGap float'
      ',FUnprintableTop float'
      ',FUnprintableLeft float'
      ',FPageHeight float'
      ',FPageWidth float'
      ',DSysDate timestamp'
      ',WFontSize integer,'
      'primary key (WLabSpecsID)'
      ');'
      ''
      'CREATE TABLE Locations('
      'WLocationID integer not null'
      ',SDescription char(35)'
      ',SLocCode char(8)'
      ',WLocationTypeID integer'
      ',WParentID integer'
      ',DSysDate timestamp'
      ',WSortNo integer,'
      'primary key (WLocationID)'
      ');'
      ''
      'CREATE TABLE ManufacD('
      'WMfcDocID integer not null'
      ',WLineID integer not null'
      ',WLinetypeID integer'
      ',SStockCode char(20)'
      ',SDescription char(40)'
      ',WLocationID integer'
      ',FQty float'
      ',FValue float'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WMfcDocID,WLineID)'
      ');'
      ''
      'CREATE TABLE ManufacH('
      'WMfcDocID integer not null'
      ',WMfcTypeID integer'
      ',SMfcCode char(20)'
      ',WParentID integer'
      ',SPicture char(20)'
      ',BDisabled SmallInt'
      ',SDescription char(35)'
      ',WLocationID integer'
      ',WFinishedStockID integer'
      ',FPrice1 float'
      ',FPrice2 float'
      ',FPrice3 float'
      ',FUnused float'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WMfcDocID)'
      ');'
      ''
      'CREATE TABLE messages('
      'WMessageID integer not null'
      ',SDescription char(35)'
      ',SExtraDescription char(255),'
      'primary key (WMessageID)'
      ');'
      'CREATE  '
      'INDEX MESSAGES_IND_DESCRIPTION ON MESSAGES (SDESCRIPTION);'
      ''
      ''
      'CREATE TABLE OILinks('
      'DDocDate timestamp'
      ',SReference char(35)'
      ',SLinkedReference char(15)'
      ',WFullAmount float'
      ',WOutStandingAmount float'
      ',WLinkedAmount float'
      ',DDate timestamp'
      ',UnUsed1 integer'
      ',WAmountTransactionID integer'
      ',WLinkTransactionID integer'
      ',WUserID integer'
      ',UnUsed2 integer'
      ',WBatchID integer'
      ',WAccountID integer'
      ',WTaxID integer'
      ',DSysDate timestamp'
      ');'
      ''
      'CREATE TABLE OpReport('
      'WOptionID integer not null'
      ',StrOption char(25)'
      ',SOptionValue char(35)'
      ',WOptionTypeID integer,'
      'primary key (WOptionID)'
      ');'
      'CREATE  '
      'INDEX OPREPORT_IND_STR_OPTION ON OpReport (StrOption);'
      ''
      ''
      'CREATE TABLE PayCon('
      'WPayRollID integer not null'
      ',DDate timestamp'
      ',SDescription char(15)'
      ',BActive SmallInt'
      ',BCurrentYear SmallInt'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WPayRollID)'
      ');'
      ''
      'CREATE TABLE PayTrans('
      'WPayRollID integer not null'
      ',WEmployeeID integer'
      ',WSourceID integer'
      ',WPeriodID integer'
      ',FAmount float'
      ',FUnits float'
      ',WUserID integer'
      ',WProfileID integer'
      ',DSysDate timestamp,'
      'primary key (WPayRollID)'
      ');'
      ''
      'CREATE TABLE Periods('
      'WPeriodID integer not null'
      ',DStartDate timestamp not null'
      ',DEndDate timestamp not null'
      ',SDescription char(12)'
      ',BShutDown SmallInt'
      ',BContainsTransactions SmallInt,'
      'primary key (WPeriodID)'
      ');'
      ''
      'CREATE TABLE Printers('
      'WPrinterID integer not null'
      ',SPrinterName char(20)'
      ',WLinesPerPage integer'
      ',WLinesPerInch integer'
      ',WCharsPerInch integer'
      ',WPageLength integer'
      ',WPageWidth integer'
      ',S6LinesPerInch char(20)'
      ',S8LinesPerInch char(20)'
      ',S10LinesPerInch char(20)'
      ',S5CharsPerInchOn char(20)'
      ',S5CharsPerInchOff char(20)'
      ',S10CharsPerInchOn char(20)'
      ',S12CharsPerInchOn char(20)'
      ',S16CharsPerInchOn char(20)'
      ',S16CharsPerInchOff char(20)'
      ',SBoldFaceOn char(20)'
      ',SBoldFaceOff char(20)'
      ',DSysDate timestamp,'
      'primary key (WPrinterID)'
      ');'
      ''
      'CREATE TABLE Profiles('
      'WProfileID integer not null'
      ',WProfileTypeID integer'
      ',WParentID integer'
      ',WSourceID integer'
      ',WSourceTypeID integer'
      ',SDescription char(35)'
      ',BActive SmallInt'
      ',DSysDate timestamp'
      ',WSortNo integer'
      ',WStatus integer,'
      'primary key (WProfileID)'
      ');'
      ''
      'CREATE TABLE ReconBank('
      'SReference char(15)'
      ',DDate timestamp'
      ',SAccount char(<@ACCOUNTCODE@>)'
      ',SDescription char(35)'
      ',FAmount float'
      ',FTaxAmount float'
      ',BReconciled SmallInt'
      ',FRecNo float'
      ',FBatchType float'
      ');'
      ''
      'CREATE TABLE RepCells('
      'WReportID integer not null'
      ',WColumnID integer not null'
      ',WRowID integer not null'
      ',SValue char(30)'
      ',DSysDate timestamp,'
      'primary key (WReportID,WColumnID,WRowID)'
      ''
      ');'
      ''
      'CREATE TABLE RepCols('
      'WReportID integer not null'
      ',WColumnID integer not null'
      ',SHeading1 char(15)'
      ',SHeading2 char(15)'
      ',WColumnTypeID integer'
      ',WPeriodStart integer'
      ',WPeriodEnd integer'
      ',SFormula char(15)'
      ',DSysDate timestamp,'
      'primary key (WReportID,WColumnID)'
      ');'
      ''
      'CREATE TABLE RepHead('
      'WReportID integer not null'
      ',SReportName char(15)'
      ',STitle1 char(31)'
      ',STitle2 char(31)'
      ',BDisplayDecimal SmallInt'
      ',BCompressPrint SmallInt'
      ',WNoOfColumns integer'
      ',WReportTypeID integer'
      ',DSysDate timestamp,'
      'primary key (WReportID)'
      ');'
      ''
      'CREATE TABLE RepLine('
      'WReportID integer not null'
      ',WRowID integer not null'
      ',WRowTypeID integer'
      ',WRowItemID integer'
      ',SItemName char(8)'
      ',SRowDescription char(35)'
      ',BMainAccount SmallInt'
      ',BSupressPrint SmallInt'
      ',SDescription char(35)'
      ',SColumn1 char(30)'
      ',SColumn2 char(30)'
      ',SColumn3 char(30)'
      ',SColumn4 char(30)'
      ',SColumn5 char(30)'
      ',SColumn6 char(30)'
      ',SColumn7 char(30)'
      ',SColumn8 char(30)'
      ',SColumn9 char(30)'
      ',SColumn10 char(30)'
      ',SColumn11 char(30)'
      ',SColumn12 char(30)'
      ',SColumn13 char(30)'
      ',SColumn14 char(30)'
      ',SColumn15 char(30)'
      ',DSysDate timestamp,'
      'primary key (WReportID,WRowID)'
      ');'
      ''
      'CREATE TABLE ReportOp('
      'SAccountListingSequence char(35)'
      ',SAccountListingFromAcc char(<@ACCOUNTCODELONG@>)'
      ',SAccountListingToAcc char(<@ACCOUNTCODELONG@>)'
      ',BAccountListingShowSub SmallInt'
      ',WTrialBalFromDateID integer'
      ',WTrialBaloDateID integer'
      ',BTrialBalDisplaySubAcc SmallInt'
      ',BTrialBalNilBalances SmallInt'
      ',STrialBalSSequence char(35)'
      ',SBudgetPerfSequence char(35)'
      ',SBudgetPerfFromAcc char(<@ACCOUNTCODELONG@>)'
      ',SBudgetPerfToAcc char(<@ACCOUNTCODELONG@>)'
      ',BBudgetPerfShowSub SmallInt'
      ',BBudgetPerfNilBal SmallInt'
      ',WBatchTypeType integer'
      ',SBatchTypeWhichYear char(10)'
      ',WBatchTypeFromDateID integer'
      ',WBatchTypeToDateID integer'
      ',BBatchTypeShowPeriod SmallInt'
      ',BBatchTypeShowBal SmallInt'
      ',SCreditorListingSequence char(35)'
      ',SCredListingFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SCredListingToAccount char(<@ACCOUNTCODELONG@>)'
      ',SCredMovementsSequence char(35)'
      ',SCredMovementsFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SCredMovementsToAccount char(<@ACCOUNTCODELONG@>)'
      ',BCredMovementsBNiBal SmallInt'
      ',SDebtorListingSequence char(35)'
      ',SDebtorListingFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SDebtorListingToAccount char(<@ACCOUNTCODELONG@>)'
      ',BDebtorListingShowDetail SmallInt'
      ',SDebtorMovementSequence char(35)'
      ',SDebtorMovementFromAcc char(<@ACCOUNTCODELONG@>)'
      ',SDebtorMovementToAcc char(<@ACCOUNTCODELONG@>)'
      ',BDebtorMovementBNilBal SmallInt'
      ',WDocListTypeID integer'
      ',SDocListSequence char(35)'
      ',SDocListFromNumber char(8)'
      ',SDocListToNumber char(8)'
      ',DDocListFromDate timestamp'
      ',DDocListToDate timestamp'
      ',SDebtorAgeFrom char(<@ACCOUNTCODELONG@>)'
      ',SDebtorAgeTo char(<@ACCOUNTCODELONG@>)'
      ',DDebtorAgeCurrentDate timestamp'
      ',DDebtorAgeDateLimit1 timestamp'
      ',DDebtorAgeDateLimit2 timestamp'
      ',DDebtorAgeDateLimit3 timestamp'
      ',DDebtorAgeDateLimit4 timestamp'
      ',SDebtorAgeRangeName0 char(15)'
      ',SDebtorAgeRangeName1 char(15)'
      ',SDebtorAgeRangeName2 char(15)'
      ',SDebtorAgeRangeName3 char(15)'
      ',FDebtorAgeMinimumAmount float'
      ',WDebtorAgeMonth1 integer'
      ',WDebtorAgeMonth2 integer'
      ',WDebtorAgeMonth3 integer'
      ',BDebtorAgeSort SmallInt'
      ',BDebtorAgeAccountdetail SmallInt'
      ',BDebtorAgeShowTransac SmallInt'
      ',BDebtorAgeShowOpenItem SmallInt'
      ',BDebtorAgeIgnoreZeroBal SmallInt'
      ',SCreditorAgeFrom char(<@ACCOUNTCODELONG@>)'
      ',SCreditorAgeTo char(<@ACCOUNTCODELONG@>)'
      ',DCreditorAgeCurrentDate timestamp'
      ',DCreditorAgeDateLimit1 timestamp'
      ',DCreditorAgeDateLimit2 timestamp'
      ',DCreditorAgeDateLimit3 timestamp'
      ',DCreditorAgeDateLimit4 timestamp'
      ',SCreditorAgeRangeName0 char(15)'
      ',SCreditorAgeRangeName1 char(15)'
      ',SCreditorAgeRangeName2 char(15)'
      ',SCreditorAgeRangeName3 char(15)'
      ',FCreditorAgeMinimumAmount float'
      ',WCreditorAgeMonth1 integer'
      ',WCreditorAgeMonth2 integer'
      ',WCreditorAgeMonth3 integer'
      ',BCreditorAgeSort SmallInt'
      ',BCreditorAgeAccountDetail SmallInt'
      ',BCreditorAgeShowTransac SmallInt'
      ',BCreditorAgeShowOpenItem SmallInt'
      ',BCreditorAgeIgnoreZeroBal SmallInt'
      ',SReconBankAccount char(35)'
      ',DReconUntil timestamp'
      ',FReconBankBalance float'
      ',SReconReportBankAccount char(35)'
      ',DReconReportUntil timestamp'
      ',FReconReportBalance float'
      ',BCredTransIncNilBal SmallInt'
      ',SCredTransSequence char(35)'
      ',SCredTransWhichYear char(35)'
      ',SCredTransFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SCredTransToAccount char(<@ACCOUNTCODELONG@>)'
      ',WCredTransFromDate integer'
      ',WCredTransToDate integer'
      ',BCredTransEachPeriod SmallInt'
      ',BCredTransNewPage SmallInt'
      ',BDebTransIncNilBal SmallInt'
      ',SDebTransSequence char(35)'
      ',SDebTransWhichYear char(35)'
      ',SDebTransFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SDebTransToAccount char(<@ACCOUNTCODELONG@>)'
      ',WDebTransFromDate integer'
      ',WDebTransToDate integer'
      ',BDebTransEachPeriod SmallInt'
      ',BDebTransNewPage SmallInt'
      ',SStockActivityFromCode char(15)'
      ',SStockActivityToCode char(15)'
      ',SStockActivitySequence char(35)'
      ',SStockListSequence char(35)'
      ',SStockListFromCode char(15)'
      ',SStockListToCode char(15)'
      ',BStockListQtyOnHand SmallInt'
      ',BStockListCostPrice SmallInt'
      ',BStockListSellingPrice SmallInt'
      ',BStockListStockCount SmallInt'
      ',BStockListStockValue SmallInt'
      ',SStockMovementSequence char(35)'
      ',SStockMovementFromCode char(15)'
      ',SStockMovementToCode char(15)'
      ',DStockMovementFromDate timestamp'
      ',DStockMovementToDate timestamp'
      ',BStockMovementShowDetail SmallInt'
      ',BStockMovementNewPage SmallInt'
      ',SStockReorderSequence char(35)'
      ',SStockReorderFromCode char(15)'
      ',SStockReorderToCode char(15)'
      ',BGLLedgerNilBalances SmallInt'
      ',SGLLedgerSequence char(35)'
      ',SGLLedgerWhichYear char(35)'
      ',SGLLedgerFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SGLLedgerToAccount char(<@ACCOUNTCODELONG@>)'
      ',WGLLedgerFromDate integer'
      ',WGLLedgerToDate integer'
      ',BGLLedgerEachPeriod SmallInt'
      ',BGLLedgerNewPage SmallInt'
      ',SGLMovementSequence char(35)'
      ',SGLMovementFromAccount char(<@ACCOUNTCODELONG@>)'
      ',SGLMovementToAccount char(<@ACCOUNTCODELONG@>)'
      ',BGLMovementBInclNilBal SmallInt'
      ',SSalesByCustSequence char(35)'
      ',SSalesByCustFromCust char(<@ACCOUNTCODELONG@>)'
      ',SSalesByCustToCust char(<@ACCOUNTCODELONG@>)'
      ',DSalesByCustFromDate timestamp'
      ',DSalesByCustToDate timestamp'
      ',SPurchBySuppSequence char(35)'
      ',SPurchBySuppFromSupp char(<@ACCOUNTCODELONG@>)'
      ',SPurchBySuppToSupp char(<@ACCOUNTCODELONG@>)'
      ',DPurchBySuppFromDate timestamp'
      ',DPurchBySuppToDate timestamp'
      ',SSalesByProdSequence char(35)'
      ',SSalesByProdFromProd char(15)'
      ',SSalesByProdToProd char(15)'
      ',DSalesByProdFromDate timestamp'
      ',DSalesByProdToDate timestamp'
      ',SPurchByProdSequence char(35)'
      ',SPurchByProdFromProd char(<@ACCOUNTCODELONG@>)'
      ',SPurchByProdToProd char(<@ACCOUNTCODELONG@>)'
      ',DPurchByProdFromDate timestamp'
      ',DPurchByProdToDate timestamp'
      ',SCustByProdSequence char(35)'
      ',SCustByProdFromProd char(15)'
      ',SCustByProdToProd char(15)'
      ',DCustByProdFromDate timestamp'
      ',DCustByProdToDate timestamp'
      ',SSalesPersByProdSequence char(35)'
      ',SSalesPersByProdFromProd char(15)'
      ',SSalesPersByProdToProd char(15)'
      ',DSalesPersByProdFromDate timestamp'
      ',DSalesPersByProdToDate timestamp'
      ',SProdByCustSequence char(35)'
      ',SProdByCustFromProd char(15)'
      ',SProdByCustToProd char(15)'
      ',DProdByCustFromDate timestamp'
      ',DProdByCustToDate timestamp'
      ',SCustBySPersonSPerson char(30)'
      ',DCustBySPersonFromDate timestamp'
      ',DCustBySPersonToDate timestamp'
      ',SSalesBySPSalesPerson char(30)'
      ',DSalesBySPFromDate timestamp'
      ',DSalesBySPToDate timestamp'
      ',SProdBySPSalesPerson char(30)'
      ',DProdBySPFromDate timestamp'
      ',DProdBySPToDate timestamp'
      ',SSalesByGroupFromGroup char(15)'
      ',SSalesByGroupToGroup char(15)'
      ',DSalesByGroupFromDate timestamp'
      ',DSalesByGroupToDate timestamp'
      ',SInvoiceDetailWhichYear char(35)'
      ',WInvoiceDetailFromDate integer'
      ',WInvoiceDetailtoDate integer'
      ',SInvoiceDetailSTaxAccount char(35)'
      ',BInvoiceDetailShowDetail SmallInt'
      ',SDebtStatementFromAcc char(<@ACCOUNTCODELONG@>)'
      ',SDebtStatementToAcc char(<@ACCOUNTCODELONG@>)'
      ',FDebtStatementMinAmount float'
      ',DDebtStatementCurrentDate timestamp'
      ',DDebtStatementDateLimit1 timestamp'
      ',DDebtStatementDateLimit2 timestamp'
      ',DDebtStatementDateLimit3 timestamp'
      ',DDebtStatementDateLimit4 timestamp'
      ',SDebtStatementAgeName0 char(15)'
      ',SDebtStatementAgeName1 char(15)'
      ',SDebtStatementAgeName2 char(15)'
      ',SDebtStatementAgeName3 char(15)'
      ',WDebtStatementMonth1 integer'
      ',WDebtStatementMonth2 integer'
      ',WDebtStatementMonth3 integer'
      ',BDebtStatementTaxSeperate SmallInt'
      ',BDebtStatementTaxTransact SmallInt'
      ',BDebtStatementOpenItem SmallInt'
      ',WIncomeStmntFromDateID integer'
      ',WIncomeStmntToDateID integer'
      ',BIncomeStmntDisplaySubAcc SmallInt'
      ',BIncomeStmntNilBalances SmallInt'
      ',SIncomeStmntSSequence char(35)'
      ',SRemittanceFromAcc char(<@ACCOUNTCODELONG@>)'
      ',SRemittanceToAcc char(<@ACCOUNTCODELONG@>)'
      ',FRemittanceMinAmount float'
      ',DRemittanceDateLimit1 timestamp'
      ',DRemittanceDateLimit2 timestamp'
      ',DRemittanceDateLimit3 timestamp'
      ',DRemittanceDateLimit4 timestamp'
      ',SRemittanceAgeName0 char(15)'
      ',SRemittanceAgeName1 char(15)'
      ',SRemittanceAgeName2 char(15)'
      ',SRemittanceAgeName3 char(15)'
      ',WRemittanceMonth1 integer'
      ',WRemittanceMonth2 integer'
      ',WRemittanceMonth3 integer'
      ',BRemittanceTaxSeperate SmallInt'
      ',BRemittanceTaxTransact SmallInt'
      ',BRemittanceOpenItem SmallInt'
      ',WRemittanceFromDateID integer'
      ',WRemittanceToDateID integer'
      ',BRemittanceDisplaySubAcc SmallInt'
      ',BRemittanceNilBalances SmallInt'
      ',SRemittanceSSequence char(35)'
      ',WBalSheetFromDateID integer'
      ',WBalSheetToDateID integer'
      ',BBalSheetDisplaySubAccs SmallInt'
      ',BBalSheetNilBalances SmallInt'
      ',SBalSheetSSequence char(35)'
      ',SSalesPersByCustSequence char(35)'
      ',SSalesPersByCustFromCust char(<@ACCOUNTCODELONG@>)'
      ',SSalesPersByCustToCust char(<@ACCOUNTCODELONG@>)'
      ',DSalesPersByCustFromDate timestamp'
      ',DSalesPersByCustToDate timestamp'
      ',WDataEntryDrCrFormat integer'
      ',WDecimal integer'
      ',SLabelFromAcc char(<@ACCOUNTCODELONG@>)'
      ',SlabelToAcc char(<@ACCOUNTCODELONG@>)'
      ',SlabelSSequence char(35)'
      ',SLabelSFile char(35)'
      ');'
      ''
      'CREATE TABLE ReptBat('
      'WTransactionID integer not null'
      ',WUserID integer'
      ',WBatchTypeID integer'
      ',SReference char(15)'
      ',DDate timestamp'
      ',SDescription char(35)'
      ',WTaxID integer'
      ',WAccountID integer'
      ',WContraID integer'
      ',FAmount float,'
      'primary key (WTransactionID)'
      ''
      ');'
      ''
      'CREATE TABLE ReptDocs('
      'WDocID integer not null'
      ',WGroupID integer,'
      'primary key (WDocID)'
      ');'
      ''
      'CREATE TABLE Resources('
      'ResourceID integer not null'
      ',Description char(255)'
      ',Notes char(255)'
      ',ImageIndex integer'
      ',ResourceActive SmallInt'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100),'
      'primary key (ResourceID)'
      ');'
      ''
      'CREATE TABLE Stock('
      'WStockID integer not null'
      ',SStockCode char(15)'
      ',SBarCodeNumber char(25)'
      ',SDescription char(35)'
      ',WReportingGroup1ID integer'
      ',WReportingGroup2ID integer'
      ',WCostAccountID integer'
      ',WInputTaxID integer'
      ',WOutputTaxID integer'
      ',FOpeningAveCost float'
      ',FQtyOnHand float'
      ',FOpeningQty float'
      ',FInvQtyOnHand float'
      ',FReorderQty float'
      ',WSalesAccountID integer'
      ',BApplyInvoiceDiscount SmallInt'
      ',WStockAccountID integer'
      ',FSellingPrice1 float'
      ',FSellingPrice2 float'
      ',FSellingPrice3 float'
      ',FUnitAveCost float'
      ',FUnitCost float'
      ',WUnitID integer'
      ',DSysDate timestamp'
      ',BApplyTax SmallInt'
      ',WInputTax2ID integer'
      ',BTaxable SmallInt'
      ',WSupplier1ID integer'
      ',WSupplier2ID integer'
      ',WStockTypeID integer'
      ',WOutputTax2ID integer'
      ',WProfileID integer'
      ',BDisabled SmallInt'
      ',WPerentID integer'
      ',WLocationID integer'
      ',WFileNameID integer'
      ',SExtraDesc char(255),'
      'primary key (WStockID),'
      'UNIQUE (SStockCode)'
      ');'
      'CREATE  '
      'INDEX STOCK_IND_SDESCRIPTION ON Stock (SDESCRIPTION);'
      'CREATE  '
      'INDEX STOCK_IND_SBARCODE ON Stock (SBarCodeNumber);'
      'CREATE  '
      'INDEX STOCK_IND_SSTOCKCODE ON Stock (SStockCode);'
      ''
      'CREATE  '
      'INDEX STOCK_IND_REPGROUP1 ON Stock (WReportingGroup1ID);'
      'CREATE  '
      'INDEX STOCK_IND_REPGROUP2 ON Stock (WReportingGroup2ID);'
      ''
      ''
      'CREATE TABLE StockPub('
      'WStockID integer not null'
      ',WPriceID integer'
      ',BLOBPicture blob'
      ',DSysDate timestamp,'
      'primary key (WStockID)'
      ');'
      ''
      'CREATE TABLE StockTrn('
      'WStockTransactionID integer not null'
      ',WStockID integer not null'
      ',DDate timestamp'
      ',WSalesmanID integer'
      ',WDocID integer'
      ',WDocTypeID integer'
      ',FQty float'
      ',FCostPrice float'
      ',FSellingPrice float'
      ',WAccountID integer'
      ',DSysDate timestamp,'
      'primary key (WStockTransactionID)'
      ');'
      ''
      'CREATE TABLE SysParams('
      'WParamID integer not null'
      ',WUserID integer not null'
      ',SParamName char(25) not null'
      ',SParamValue char(50)'
      ',WTypeID integer'
      ',WSourceID integer'
      ',WSourceTypeID integer'
      ',DSysDate timestamp'
      ',WParentID integer'
      ',WParentTypeID integer'
      ',BActive SmallInt'
      ',primary key (WParamID)'
      ');'
      ''
      'CREATE TABLE Sysvars('
      'SCompanyName char(35)'
      ',SCompanyRegNo char(30)'
      ',WEmailServerAddress char(30)'
      ',WFaxServerID integer'
      ',BlobLogo blob'
      ',SAddress1 char(30)'
      ',SAddress2 char(30)'
      ',SAddress3 char(30)'
      ',SPostCode char(8)'
      ',SPhoneNumber char(30)'
      ',SFaxNumber char(30)'
      ',WRetainedIncomeID integer'
      ',WDebtorsControlID integer'
      ',WCreditorsControlID integer'
      ',SBackupPath char(255)'
      ',WCostOfSalesTypeID integer'
      ',WCreditNoteBatchTypeID integer'
      ',SCreditNoteMessage1 char(30)'
      ',SCreditNoteMessage2 char(30)'
      ',SCreditNoteMessage3 char(30)'
      ',WPurchasesBatchID integer'
      ',SPurchasesMessage1 char(30)'
      ',SPurchasesMessage2 char(30)'
      ',SPurchasesMessage3 char(30)'
      ',WGoodsReturnedBatchID integer'
      ',SGoodsReturnedMessage1 char(30)'
      ',SGoodsReturnedMessage2 char(30)'
      ',SGoodsReturnedMessage3 char(30)'
      ',WInvoicesBatchID integer'
      ',SInvoicesMessage1 char(30)'
      ',SInvoicesMessage2 char(30)'
      ',SInvoicesMessage3 char(30)'
      ',WDisplayAmount integer'
      ',BAccountsOpen SmallInt'
      ',BBatchTypes SmallInt'
      ',BGroups SmallInt'
      ',BNotClosed SmallInt'
      ',BPeriodChange SmallInt'
      ',BSalesmanExist SmallInt'
      ',BUnitsExist SmallInt'
      ',FLastYearPL float'
      ',WNoOfPeriods integer'
      ',WInvoicePaperID integer'
      ',WCreditNotePaperID integer'
      ',WPurchasePaperID integer'
      ',WGoodsReturnedPaperID integer'
      ',WQuotePaperID integer'
      ',WOrderPaperID integer'
      ',WStatementPaperID integer'
      ',WRemittancePaperID integer'
      ',FReconciledBankBalance float'
      ',WReconciledBankID integer'
      ',DReconciledLastDate timestamp'
      ',SStatementMessage1 char(30)'
      ',SStatementMessage2 char(30)'
      ',SStatementMessage3 char(30)'
      ',BCreateBalanceLink SmallInt'
      ',WTaxDueAccountID integer'
      ',BTaxInvoiceBased SmallInt'
      ',BCreateCostOfSales SmallInt'
      ',WCurrentUserID integer'
      ',SInvoiceHeading char(20)'
      ',SCreditNoteHeading char(20)'
      ',SPurchaseHeading char(20)'
      ',SGoodsReturnedHeading char(20)'
      ',SQuoteHeading char(20)'
      ',SQuoteMessage1 char(30)'
      ',SQuoteMessage2 char(30)'
      ',SQuoteMessage3 char(30)'
      ',SOrderHeading char(20)'
      ',SOrderMessage1 char(30)'
      ',SOrderMessage2 char(30)'
      ',SOrderMessage3 char(30)'
      ',BPostToLastYear SmallInt'
      ',WBaseCurrencyID integer'
      ',BMultiCurrency SmallInt'
      ',STaxRegNo char(30)'
      ',BPaymentsBased SmallInt'
      ',WDueAccountID integer'
      ',WLanguageID integer'
      ',BOnline SmallInt'
      ',BRemote SmallInt'
      ',WColourID integer'
      ',SAccountReportName1 char(15)'
      ',SAccountReportName2 char(15)'
      ',SDebtorReportName1 char(15)'
      ',SDebtorReportName2 char(15)'
      ',SCreditorReportName1 char(15)'
      ',SCreditorReportName2 char(15)'
      ',SStockReportName1 char(15)'
      ',SStockReportName2 char(15)'
      ',SDocumentReportName1 char(15)'
      ',SDocumentReportName2 char(15)'
      ',SSellingPriceName1 char(15)'
      ',SSellingPriceName2 char(15)'
      ',SSellingPriceName3 char(15)'
      ',WVersion integer'
      ',SReportFontsName char(35)'
      ',BUseAvgCost SmallInt'
      ',BPrnStatementLogo SmallInt'
      ',DTLastUseTime timestamp'
      ',BShowTips SmallInt'
      ',WAutoSaveTime integer'
      ',BShowReminder SmallInt'
      ',BServicePreprinted SmallInt'
      ',WDefaultOutPutID integer'
      ',WDefaultZoom integer'
      ',BUseOutLookExp SmallInt'
      ',SEmailAddress char(60)'
      ');'
      ''
      'CREATE TABLE TaskAction('
      'TaskActionID integer not null'
      ',EventId integer not null'
      ',InvoiceID integer'
      ',AccountId integer'
      ',WGroupId integer'
      ',WTypeId integer,'
      'primary key (TaskActionID)'
      ');'
      ''
      'CREATE TABLE Tasks('
      'RecordID integer not null'
      ',ResourceID integer not null'
      ',Complete SmallInt'
      ',Description char(100)'
      ',Details blob'
      ',CreatedOn timestamp'
      ',CompletedOn timestamp'
      ',Priority integer'
      ',Category integer'
      ',DueDate timestamp'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100),'
      'primary key (RecordID)'
      ');'
      ''
      'CREATE TABLE Tax('
      'WAccountID integer not null'
      ',SDescription char(30)'
      ',DStartDate timestamp'
      ',DEndDate timestamp'
      ',FRate float'
      ',DSysDate timestamp,'
      'primary key (WAccountID)'
      ');'
      ''
      'CREATE TABLE Temp1('
      'SMainAccountCode char(4) not null'
      ',SSubAccountCode char(3) not null'
      ',WDocTypeID integer'
      ',SDescription char(35)'
      ',WStockTransactionID integer'
      ',WGroupID integer'
      ',SDocNo char(15)'
      ',DDate timestamp'
      ',WSalespersonID integer'
      ',SStockCode char(35)'
      ',FSellingPrice float'
      ',FCostPrice float'
      ',FQty float'
      ');'
      ''
      ''
      'CREATE TABLE TmpAgeAn('
      'WAccountID integer not null'
      ',WaccountTypeID integer'
      ',SAccountCode char(8)'
      ',Sdescription char(35)'
      ',FCurrent float'
      ',F30Days float'
      ',F60Days float'
      ',F90Days float'
      ',FBBF float'
      ');'
      ''
      'CREATE TABLE Totals('
      'WAccountID integer not null'
      ',WPeriodID integer not null'
      ',BActual SmallInt not null'
      ',FAmount float'
      ',DSysDate timestamp,'
      'primary key (WAccountID,WPeriodID,BActual)'
      ');'
      ''
      'CREATE TABLE TransAct('
      'WTransactionID integer not null'
      ',WBatchID integer not null'
      ',WBatchTypeID integer not null'
      ',WLineID integer not null'
      ',BCarriedForward SmallInt'
      ',BLastYear SmallInt'
      ',BLinksUsed SmallInt'
      ',BMultipleItems SmallInt'
      ',WAccountID integer not null'
      ',DDate timestamp'
      ',WPeriodID integer not null'
      ',SReference char(15)'
      ',FTaxRate float'
      ',WTaxAccountID integer'
      ',FAmount float not null'
      ',FTaxAmount float'
      ',FOutstandingAmount float'
      ',BReconciled SmallInt'
      ',WBalancingAccountID integer'
      ',WDescriptionID integer'
      ',WCurrencyID integer'
      ',FForexAmount float'
      ',WUserID integer'
      ',Unused integer'
      ',DSysDate timestamp'
      ',BUnused SmallInt'
      ',WTax2ID integer'
      ',FCurrencyRate2 float'
      ',FTaxRate2 float'
      ',FTax2Amount float'
      ',WJobCodeID integer'
      ',WProfileID integer'
      ',primary key (WTransactionID)'
      ');'
      ''
      'CREATE TABLE Types('
      'WTypeID integer not null'
      ',SDescription char(30)'
      ',WTypeParent integer'
      ',primary key (WTypeID)'
      ');'
      ''
      'CREATE TABLE Unit('
      'WUnitID integer not null'
      ',SDescription char(8)'
      ',DSysDate timestamp'
      ',primary key (WUnitID)'
      ');'
      ''
      'CREATE TABLE Users('
      'WUserID integer not null'
      ',SPassword char(8)'
      ',SUserName char(20)'
      ',SCreditNoteNextNumber char(8)'
      ',SInvoiceNextNumber char(8)'
      ',SPurchaseNextNumber char(8)'
      ',SGoodsReturnedNextNumber char(8)'
      ',SReceiptNextNumber char(8)'
      ',SQuoteNextNumber char(8)'
      ',SOrderNextNumber char(8)'
      ',SNextBatchNumber char(8)'
      ',BDisabled SmallInt'
      ',BAccounts SmallInt'
      ',BStock SmallInt'
      ',BBatchEntry SmallInt'
      ',BCreditNote SmallInt'
      ',BInvoices SmallInt'
      ',BPurchases SmallInt'
      ',BStockReturns SmallInt'
      ',BReconciliation SmallInt'
      ',BCreditorReports SmallInt'
      ',BDebtorReports SmallInt'
      ',BLedgerReports SmallInt'
      ',BStockReports SmallInt'
      ',BUserReports SmallInt'
      ',BPosting SmallInt'
      ',BGlobalProcesses SmallInt'
      ',BSystemSetup SmallInt'
      ',UserEmail char(30)'
      ',BOnLine SmallInt'
      ',SPcIPAddress char(20)'
      ',DSysDate timestamp'
      ',BEditPrices SmallInt'
      ',BGlobalSeq SmallInt'
      ',BCashBook SmallInt'
      ',BOnlyPOS SmallInt'
      ',BPOSSuper SmallInt'
      ',BSearch SmallInt'
      ',BEmail SmallInt'
      ',BNotUsed1 SmallInt'
      ',primary key (WUserID)'
      ');'
      ''
      'CREATE TABLE BOM('
      'WBomID integer not null'
      ',WStockId integer not null'
      ',WLinkedStockID integer not null'
      ',FQty float not null,'
      'primary key (WBomID)'
      ');'
      ''
      'create'
      'INDEX BOM_IND_STOCKID ON BOM (WStockId);'
      ''
      'alter table ADDRESSPERACCOUNT'
      'add constraint PK_ADDRESSPERACCOUNT_ID'
      'primary key (WADDRESSPERACCOUNTID);'
      'alter table DEBTOR'
      'add constraint FK_DEBTOR_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE '
      'on delete CASCADE ;'
      'alter table CREDITOR'
      'add constraint FK_CREDITOR_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE '
      'on delete CASCADE ;'
      'alter table DOCHEAD'
      'add constraint FK_DOCHEAD_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE '
      'on delete CASCADE ;'
      'alter table DOCLINE'
      'add constraint PK_DOCLINE_ID'
      'primary key (WDOCLINEID, WDOCID);'
      'alter table DOCLINE'
      'add constraint FK_DOCLINE_DOCHEAD'
      'foreign key (WDOCID)'
      'references DOCHEAD (WDOCID)'
      'on update CASCADE'
      'on delete CASCADE ;'
      'alter table BANK'
      'add constraint FK_BANK_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID)'
      'on update CASCADE'
      'on delete CASCADE ;'
      'alter table TRANSACT'
      'add constraint FK_TRANSACT_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID);'
      'alter table TRANSACT'
      'add constraint FK_TRANSACT_BATCH'
      'foreign key (WBATCHTYPEID)'
      'references BATTYPES (WBATCHTYPEID);'
      'alter table TRANSACT'
      'add constraint FK_TRANSACT_BATCON'
      'foreign key (WBATCHID)'
      'references BATCON (WBATCHID);'
      'alter table DOCLINE'
      'add constraint FK_DOCLINE_STOCK'
      'foreign key (WSTOCKID)'
      'references STOCK (WSTOCKID);'
      'alter table TOTALS'
      'add constraint PK_TOTALS_ID'
      'primary key (WACCOUNTID, WPERIODID, BACTUAL);'
      'alter table TOTALS'
      'add constraint FK_TOTALS_ACCOUNT'
      'foreign key (WACCOUNTID)'
      'references ACCOUNT (WACCOUNTID);')
    AutoCommit = True
    Connection = ZConnection1
    Left = 680
    Top = 88
  end
  object QryParams: TUniScript
    SQL.Strings = (
      'MAINACCOUNTCODE=4'
      'ACCOUNTCODE=7'
      'ACCOUNTCODELONG=8')
    AutoCommit = True
    Left = 576
    Top = 368
  end
  object ZConTC4: TUniConnection
    DataTypeMap = <>
    ProviderName = 'InterBase'
    Password = 'masterkey'
    Left = 92
    Top = 288
  end
  object ZQData: TUniQuery
    DataTypeMap = <>
    Connection = ZConTC4
    Left = 92
    Top = 240
  end
  object Ztc4Table: TUniTable
    DataTypeMap = <>
    Connection = ZConTC4
    Left = 148
    Top = 240
  end
  object ZUSQLToLogo: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO SYSVARS'
      
        '  (SYSVARS.SCOMPANYNAME, SYSVARS.SCOMPANYREGNO, SYSVARS.WEMAILSE' +
        'RVERADDRESS, '
      
        '   SYSVARS.WFAXSERVERID, SYSVARS.BLOBLOGO, SYSVARS.SADDRESS1, SY' +
        'SVARS.SADDRESS2, '
      
        '   SYSVARS.SADDRESS3, SYSVARS.SPOSTCODE, SYSVARS.SPHONENUMBER, S' +
        'YSVARS.SFAXNUMBER, '
      
        '   SYSVARS.WRETAINEDINCOMEID, SYSVARS.WDEBTORSCONTROLID, SYSVARS' +
        '.WCREDITORSCONTROLID, '
      
        '   SYSVARS.SBACKUPPATH, SYSVARS.WCOSTOFSALESTYPEID, SYSVARS.WCRE' +
        'DITNOTEBATCHTYPEID, '
      
        '   SYSVARS.SCREDITNOTEMESSAGE1, SYSVARS.SCREDITNOTEMESSAGE2, SYS' +
        'VARS.SCREDITNOTEMESSAGE3, '
      
        '   SYSVARS.WPURCHASESBATCHID, SYSVARS.SPURCHASESMESSAGE1, SYSVAR' +
        'S.SPURCHASESMESSAGE2, '
      
        '   SYSVARS.SPURCHASESMESSAGE3, SYSVARS.WGOODSRETURNEDBATCHID, SY' +
        'SVARS.SGOODSRETURNEDMESSAGE1, '
      
        '   SYSVARS.SGOODSRETURNEDMESSAGE2, SYSVARS.SGOODSRETURNEDMESSAGE' +
        '3, SYSVARS.WINVOICESBATCHID, '
      
        '   SYSVARS.SINVOICESMESSAGE1, SYSVARS.SINVOICESMESSAGE2, SYSVARS' +
        '.SINVOICESMESSAGE3, '
      
        '   SYSVARS.WDISPLAYAMOUNT, SYSVARS.BACCOUNTSOPEN, SYSVARS.BBATCH' +
        'TYPES, '
      
        '   SYSVARS.BGROUPS, SYSVARS.BNOTCLOSED, SYSVARS.BPERIODCHANGE, S' +
        'YSVARS.BSALESMANEXIST, '
      
        '   SYSVARS.BUNITSEXIST, SYSVARS.FLASTYEARPL, SYSVARS.WNOOFPERIOD' +
        'S, SYSVARS.WINVOICEPAPERID, '
      
        '   SYSVARS.WCREDITNOTEPAPERID, SYSVARS.WPURCHASEPAPERID, SYSVARS' +
        '.WGOODSRETURNEDPAPERID, '
      
        '   SYSVARS.WQUOTEPAPERID, SYSVARS.WORDERPAPERID, SYSVARS.WSTATEM' +
        'ENTPAPERID, '
      
        '   SYSVARS.WREMITTANCEPAPERID, SYSVARS.FRECONCILEDBANKBALANCE, S' +
        'YSVARS.WRECONCILEDBANKID, '
      
        '   SYSVARS.DRECONCILEDLASTDATE, SYSVARS.SSTATEMENTMESSAGE1, SYSV' +
        'ARS.SSTATEMENTMESSAGE2, '
      
        '   SYSVARS.SSTATEMENTMESSAGE3, SYSVARS.BCREATEBALANCELINK, SYSVA' +
        'RS.WTAXDUEACCOUNTID, '
      
        '   SYSVARS.BTAXINVOICEBASED, SYSVARS.BCREATECOSTOFSALES, SYSVARS' +
        '.WCURRENTUSERID, '
      
        '   SYSVARS.SINVOICEHEADING, SYSVARS.SCREDITNOTEHEADING, SYSVARS.' +
        'SPURCHASEHEADING, '
      
        '   SYSVARS.SGOODSRETURNEDHEADING, SYSVARS.SQUOTEHEADING, SYSVARS' +
        '.SQUOTEMESSAGE1, '
      
        '   SYSVARS.SQUOTEMESSAGE2, SYSVARS.SQUOTEMESSAGE3, SYSVARS.SORDE' +
        'RHEADING, '
      
        '   SYSVARS.SORDERMESSAGE1, SYSVARS.SORDERMESSAGE2, SYSVARS.SORDE' +
        'RMESSAGE3, '
      
        '   SYSVARS.BPOSTTOLASTYEAR, SYSVARS.WBASECURRENCYID, SYSVARS.BMU' +
        'LTICURRENCY, '
      
        '   SYSVARS.STAXREGNO, SYSVARS.BPAYMENTSBASED, SYSVARS.WDUEACCOUN' +
        'TID, SYSVARS.WLANGUAGEID, '
      
        '   SYSVARS.BONLINE, SYSVARS.BREMOTE, SYSVARS.WCOLOURID, SYSVARS.' +
        'SACCOUNTREPORTNAME1, '
      
        '   SYSVARS.SACCOUNTREPORTNAME2, SYSVARS.SDEBTORREPORTNAME1, SYSV' +
        'ARS.SDEBTORREPORTNAME2, '
      
        '   SYSVARS.SCREDITORREPORTNAME1, SYSVARS.SCREDITORREPORTNAME2, S' +
        'YSVARS.SSTOCKREPORTNAME1, '
      
        '   SYSVARS.SSTOCKREPORTNAME2, SYSVARS.SDOCUMENTREPORTNAME1, SYSV' +
        'ARS.SDOCUMENTREPORTNAME2, '
      
        '   SYSVARS.SSELLINGPRICENAME1, SYSVARS.SSELLINGPRICENAME2, SYSVA' +
        'RS.SSELLINGPRICENAME3, '
      
        '   SYSVARS.WVERSION, SYSVARS.SREPORTFONTSNAME, SYSVARS.BUSEAVGCO' +
        'ST, SYSVARS.BPRNSTATEMENTLOGO, '
      
        '   SYSVARS.DTLASTUSETIME, SYSVARS.BSHOWTIPS, SYSVARS.WAUTOSAVETI' +
        'ME, SYSVARS.BSHOWREMINDER, '
      
        '   SYSVARS.BSERVICEPREPRINTED, SYSVARS.WDEFAULTOUTPUTID, SYSVARS' +
        '.WDEFAULTZOOM, '
      '   SYSVARS.BUSEOUTLOOKEXP, SYSVARS.SEMAILADDRESS)'
      'VALUES'
      
        '  (:SCOMPANYNAME, :SCOMPANYREGNO, :WEMAILSERVERADDRESS, :WFAXSER' +
        'VERID, '
      
        '   :BLOBLOGO, :SADDRESS1, :SADDRESS2, :SADDRESS3, :SPOSTCODE, :S' +
        'PHONENUMBER, '
      
        '   :SFAXNUMBER, :WRETAINEDINCOMEID, :WDEBTORSCONTROLID, :WCREDIT' +
        'ORSCONTROLID, '
      
        '   :SBACKUPPATH, :WCOSTOFSALESTYPEID, :WCREDITNOTEBATCHTYPEID, :' +
        'SCREDITNOTEMESSAGE1, '
      
        '   :SCREDITNOTEMESSAGE2, :SCREDITNOTEMESSAGE3, :WPURCHASESBATCHI' +
        'D, :SPURCHASESMESSAGE1, '
      
        '   :SPURCHASESMESSAGE2, :SPURCHASESMESSAGE3, :WGOODSRETURNEDBATC' +
        'HID, :SGOODSRETURNEDMESSAGE1, '
      
        '   :SGOODSRETURNEDMESSAGE2, :SGOODSRETURNEDMESSAGE3, :WINVOICESB' +
        'ATCHID, '
      
        '   :SINVOICESMESSAGE1, :SINVOICESMESSAGE2, :SINVOICESMESSAGE3, :' +
        'WDISPLAYAMOUNT, '
      
        '   :BACCOUNTSOPEN, :BBATCHTYPES, :BGROUPS, :BNOTCLOSED, :BPERIOD' +
        'CHANGE, '
      
        '   :BSALESMANEXIST, :BUNITSEXIST, :FLASTYEARPL, :WNOOFPERIODS, :' +
        'WINVOICEPAPERID, '
      
        '   :WCREDITNOTEPAPERID, :WPURCHASEPAPERID, :WGOODSRETURNEDPAPERI' +
        'D, :WQUOTEPAPERID, '
      
        '   :WORDERPAPERID, :WSTATEMENTPAPERID, :WREMITTANCEPAPERID, :FRE' +
        'CONCILEDBANKBALANCE, '
      
        '   :WRECONCILEDBANKID, :DRECONCILEDLASTDATE, :SSTATEMENTMESSAGE1' +
        ', :SSTATEMENTMESSAGE2, '
      
        '   :SSTATEMENTMESSAGE3, :BCREATEBALANCELINK, :WTAXDUEACCOUNTID, ' +
        ':BTAXINVOICEBASED, '
      
        '   :BCREATECOSTOFSALES, :WCURRENTUSERID, :SINVOICEHEADING, :SCRE' +
        'DITNOTEHEADING, '
      
        '   :SPURCHASEHEADING, :SGOODSRETURNEDHEADING, :SQUOTEHEADING, :S' +
        'QUOTEMESSAGE1, '
      
        '   :SQUOTEMESSAGE2, :SQUOTEMESSAGE3, :SORDERHEADING, :SORDERMESS' +
        'AGE1, :SORDERMESSAGE2, '
      
        '   :SORDERMESSAGE3, :BPOSTTOLASTYEAR, :WBASECURRENCYID, :BMULTIC' +
        'URRENCY, '
      
        '   :STAXREGNO, :BPAYMENTSBASED, :WDUEACCOUNTID, :WLANGUAGEID, :B' +
        'ONLINE, '
      
        '   :BREMOTE, :WCOLOURID, :SACCOUNTREPORTNAME1, :SACCOUNTREPORTNA' +
        'ME2, :SDEBTORREPORTNAME1, '
      
        '   :SDEBTORREPORTNAME2, :SCREDITORREPORTNAME1, :SCREDITORREPORTN' +
        'AME2, :SSTOCKREPORTNAME1, '
      
        '   :SSTOCKREPORTNAME2, :SDOCUMENTREPORTNAME1, :SDOCUMENTREPORTNA' +
        'ME2, :SSELLINGPRICENAME1, '
      
        '   :SSELLINGPRICENAME2, :SSELLINGPRICENAME3, :WVERSION, :SREPORT' +
        'FONTSNAME, '
      
        '   :BUSEAVGCOST, :BPRNSTATEMENTLOGO, :DTLASTUSETIME, :BSHOWTIPS,' +
        ' :WAUTOSAVETIME, '
      
        '   :BSHOWREMINDER, :BSERVICEPREPRINTED, :WDEFAULTOUTPUTID, :WDEF' +
        'AULTZOOM, '
      '   :BUSEOUTLOOKEXP, :SEMAILADDRESS)')
    DeleteSQL.Strings = (
      'DELETE FROM SYSVARS'
      'WHERE'
      
        '  (((SYSVARS.SCOMPANYNAME IS NULL) AND (:OLD_SCOMPANYNAME IS NUL' +
        'L)) OR (SYSVARS.SCOMPANYNAME = :OLD_SCOMPANYNAME))')
    ModifySQL.Strings = (
      'UPDATE SYSVARS SET'
      '  SYSVARS.SCOMPANYNAME = :SCOMPANYNAME,'
      '  SYSVARS.SCOMPANYREGNO = :SCOMPANYREGNO,'
      '  SYSVARS.WEMAILSERVERADDRESS = '
      ':WEMAILSERVERADDRESS,'
      '  SYSVARS.WFAXSERVERID = :WFAXSERVERID,'
      '  SYSVARS.BLOBLOGO = :BLOBLOGO,'
      '  SYSVARS.SADDRESS1 = :SADDRESS1,'
      '  SYSVARS.SADDRESS2 = :SADDRESS2,'
      '  SYSVARS.SADDRESS3 = :SADDRESS3,'
      '  SYSVARS.SPOSTCODE = :SPOSTCODE,'
      '  SYSVARS.SPHONENUMBER = :SPHONENUMBER,'
      '  SYSVARS.SFAXNUMBER = :SFAXNUMBER,'
      '  SYSVARS.WRETAINEDINCOMEID = :WRETAINEDINCOMEID,'
      '  SYSVARS.WDEBTORSCONTROLID = :WDEBTORSCONTROLID,'
      '  SYSVARS.WCREDITORSCONTROLID = :WCREDITORSCONTROLID,'
      '  SYSVARS.SBACKUPPATH = :SBACKUPPATH,'
      '  SYSVARS.WCOSTOFSALESTYPEID = :WCOSTOFSALESTYPEID,'
      '  SYSVARS.WCREDITNOTEBATCHTYPEID = '
      ':WCREDITNOTEBATCHTYPEID,'
      '  SYSVARS.SCREDITNOTEMESSAGE1 = :SCREDITNOTEMESSAGE1,'
      '  SYSVARS.SCREDITNOTEMESSAGE2 = :SCREDITNOTEMESSAGE2,'
      '  SYSVARS.SCREDITNOTEMESSAGE3 = :SCREDITNOTEMESSAGE3,'
      '  SYSVARS.WPURCHASESBATCHID = :WPURCHASESBATCHID,'
      '  SYSVARS.SPURCHASESMESSAGE1 = :SPURCHASESMESSAGE1,'
      '  SYSVARS.SPURCHASESMESSAGE2 = :SPURCHASESMESSAGE2,'
      '  SYSVARS.SPURCHASESMESSAGE3 = :SPURCHASESMESSAGE3,'
      '  SYSVARS.WGOODSRETURNEDBATCHID = '
      ':WGOODSRETURNEDBATCHID,'
      '  SYSVARS.SGOODSRETURNEDMESSAGE1 = '
      ':SGOODSRETURNEDMESSAGE1,'
      '  SYSVARS.SGOODSRETURNEDMESSAGE2 = '
      ':SGOODSRETURNEDMESSAGE2,'
      '  SYSVARS.SGOODSRETURNEDMESSAGE3 = '
      ':SGOODSRETURNEDMESSAGE3,'
      '  SYSVARS.WINVOICESBATCHID = :WINVOICESBATCHID,'
      '  SYSVARS.SINVOICESMESSAGE1 = :SINVOICESMESSAGE1,'
      '  SYSVARS.SINVOICESMESSAGE2 = :SINVOICESMESSAGE2,'
      '  SYSVARS.SINVOICESMESSAGE3 = :SINVOICESMESSAGE3,'
      '  SYSVARS.WDISPLAYAMOUNT = :WDISPLAYAMOUNT,'
      '  SYSVARS.BACCOUNTSOPEN = :BACCOUNTSOPEN,'
      '  SYSVARS.BBATCHTYPES = :BBATCHTYPES,'
      '  SYSVARS.BGROUPS = :BGROUPS,'
      '  SYSVARS.BNOTCLOSED = :BNOTCLOSED,'
      '  SYSVARS.BPERIODCHANGE = :BPERIODCHANGE,'
      '  SYSVARS.BSALESMANEXIST = :BSALESMANEXIST,'
      '  SYSVARS.BUNITSEXIST = :BUNITSEXIST,'
      '  SYSVARS.FLASTYEARPL = :FLASTYEARPL,'
      '  SYSVARS.WNOOFPERIODS = :WNOOFPERIODS,'
      '  SYSVARS.WINVOICEPAPERID = :WINVOICEPAPERID,'
      '  SYSVARS.WCREDITNOTEPAPERID = :WCREDITNOTEPAPERID,'
      '  SYSVARS.WPURCHASEPAPERID = :WPURCHASEPAPERID,'
      '  SYSVARS.WGOODSRETURNEDPAPERID = '
      ':WGOODSRETURNEDPAPERID,'
      '  SYSVARS.WQUOTEPAPERID = :WQUOTEPAPERID,'
      '  SYSVARS.WORDERPAPERID = :WORDERPAPERID,'
      '  SYSVARS.WSTATEMENTPAPERID = :WSTATEMENTPAPERID,'
      '  SYSVARS.WREMITTANCEPAPERID = :WREMITTANCEPAPERID,'
      '  SYSVARS.FRECONCILEDBANKBALANCE = '
      ':FRECONCILEDBANKBALANCE,'
      '  SYSVARS.WRECONCILEDBANKID = :WRECONCILEDBANKID,'
      '  SYSVARS.DRECONCILEDLASTDATE = :DRECONCILEDLASTDATE,'
      '  SYSVARS.SSTATEMENTMESSAGE1 = :SSTATEMENTMESSAGE1,'
      '  SYSVARS.SSTATEMENTMESSAGE2 = :SSTATEMENTMESSAGE2,'
      '  SYSVARS.SSTATEMENTMESSAGE3 = :SSTATEMENTMESSAGE3,'
      '  SYSVARS.BCREATEBALANCELINK = :BCREATEBALANCELINK,'
      '  SYSVARS.WTAXDUEACCOUNTID = :WTAXDUEACCOUNTID,'
      '  SYSVARS.BTAXINVOICEBASED = :BTAXINVOICEBASED,'
      '  SYSVARS.BCREATECOSTOFSALES = :BCREATECOSTOFSALES,'
      '  SYSVARS.WCURRENTUSERID = :WCURRENTUSERID,'
      '  SYSVARS.SINVOICEHEADING = :SINVOICEHEADING,'
      '  SYSVARS.SCREDITNOTEHEADING = :SCREDITNOTEHEADING,'
      '  SYSVARS.SPURCHASEHEADING = :SPURCHASEHEADING,'
      '  SYSVARS.SGOODSRETURNEDHEADING = '
      ':SGOODSRETURNEDHEADING,'
      '  SYSVARS.SQUOTEHEADING = :SQUOTEHEADING,'
      '  SYSVARS.SQUOTEMESSAGE1 = :SQUOTEMESSAGE1,'
      '  SYSVARS.SQUOTEMESSAGE2 = :SQUOTEMESSAGE2,'
      '  SYSVARS.SQUOTEMESSAGE3 = :SQUOTEMESSAGE3,'
      '  SYSVARS.SORDERHEADING = :SORDERHEADING,'
      '  SYSVARS.SORDERMESSAGE1 = :SORDERMESSAGE1,'
      '  SYSVARS.SORDERMESSAGE2 = :SORDERMESSAGE2,'
      '  SYSVARS.SORDERMESSAGE3 = :SORDERMESSAGE3,'
      '  SYSVARS.BPOSTTOLASTYEAR = :BPOSTTOLASTYEAR,'
      '  SYSVARS.WBASECURRENCYID = :WBASECURRENCYID,'
      '  SYSVARS.BMULTICURRENCY = :BMULTICURRENCY,'
      '  SYSVARS.STAXREGNO = :STAXREGNO,'
      '  SYSVARS.BPAYMENTSBASED = :BPAYMENTSBASED,'
      '  SYSVARS.WDUEACCOUNTID = :WDUEACCOUNTID,'
      '  SYSVARS.WLANGUAGEID = :WLANGUAGEID,'
      '  SYSVARS.BONLINE = :BONLINE,'
      '  SYSVARS.BREMOTE = :BREMOTE,'
      '  SYSVARS.WCOLOURID = :WCOLOURID,'
      '  SYSVARS.SACCOUNTREPORTNAME1 = '
      ':SACCOUNTREPORTNAME1,'
      '  SYSVARS.SACCOUNTREPORTNAME2 = '
      ':SACCOUNTREPORTNAME2,'
      '  SYSVARS.SDEBTORREPORTNAME1 = :SDEBTORREPORTNAME1,'
      '  SYSVARS.SDEBTORREPORTNAME2 = :SDEBTORREPORTNAME2,'
      '  SYSVARS.SCREDITORREPORTNAME1 = '
      ':SCREDITORREPORTNAME1,'
      '  SYSVARS.SCREDITORREPORTNAME2 = '
      ':SCREDITORREPORTNAME2,'
      '  SYSVARS.SSTOCKREPORTNAME1 = :SSTOCKREPORTNAME1,'
      '  SYSVARS.SSTOCKREPORTNAME2 = :SSTOCKREPORTNAME2,'
      '  SYSVARS.SDOCUMENTREPORTNAME1 = '
      ':SDOCUMENTREPORTNAME1,'
      '  SYSVARS.SDOCUMENTREPORTNAME2 = '
      ':SDOCUMENTREPORTNAME2,'
      '  SYSVARS.SSELLINGPRICENAME1 = :SSELLINGPRICENAME1,'
      '  SYSVARS.SSELLINGPRICENAME2 = :SSELLINGPRICENAME2,'
      '  SYSVARS.SSELLINGPRICENAME3 = :SSELLINGPRICENAME3,'
      '  SYSVARS.WVERSION = :WVERSION,'
      '  SYSVARS.SREPORTFONTSNAME = :SREPORTFONTSNAME,'
      '  SYSVARS.BUSEAVGCOST = :BUSEAVGCOST,'
      '  SYSVARS.BPRNSTATEMENTLOGO = :BPRNSTATEMENTLOGO,'
      '  SYSVARS.DTLASTUSETIME = :DTLASTUSETIME,'
      '  SYSVARS.BSHOWTIPS = :BSHOWTIPS,'
      '  SYSVARS.WAUTOSAVETIME = :WAUTOSAVETIME,'
      '  SYSVARS.BSHOWREMINDER = :BSHOWREMINDER,'
      '  SYSVARS.BSERVICEPREPRINTED = :BSERVICEPREPRINTED,'
      '  SYSVARS.WDEFAULTOUTPUTID = :WDEFAULTOUTPUTID,'
      '  SYSVARS.WDEFAULTZOOM = :WDEFAULTZOOM,'
      '  SYSVARS.BUSEOUTLOOKEXP = :BUSEOUTLOOKEXP,'
      '  SYSVARS.SEMAILADDRESS = :SEMAILADDRESS'
      '')
    Left = 236
    Top = 264
  end
  object ZQToLogo: TUniQuery
    DataTypeMap = <>
    Connection = ZConnection1
    SQL.Strings = (
      'select  * from SYSVARS')
    UpdateObject = ZUSQLToLogo
    Left = 244
    Top = 120
    object ZQToLogoSCOMPANYNAME: TStringField
      FieldName = 'SCOMPANYNAME'
      Size = 35
    end
    object ZQToLogoSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 30
    end
    object ZQToLogoWEMAILSERVERADDRESS: TStringField
      FieldName = 'WEMAILSERVERADDRESS'
      Size = 30
    end
    object ZQToLogoWFAXSERVERID: TIntegerField
      FieldName = 'WFAXSERVERID'
    end
    object ZQToLogoBLOBLOGO: TBlobField
      FieldName = 'BLOBLOGO'
    end
    object ZQToLogoSADDRESS1: TStringField
      FieldName = 'SADDRESS1'
      Size = 30
    end
    object ZQToLogoSADDRESS2: TStringField
      FieldName = 'SADDRESS2'
      Size = 30
    end
    object ZQToLogoSADDRESS3: TStringField
      FieldName = 'SADDRESS3'
      Size = 30
    end
    object ZQToLogoSPOSTCODE: TStringField
      FieldName = 'SPOSTCODE'
      Size = 8
    end
    object ZQToLogoSPHONENUMBER: TStringField
      FieldName = 'SPHONENUMBER'
      Size = 30
    end
    object ZQToLogoSFAXNUMBER: TStringField
      FieldName = 'SFAXNUMBER'
      Size = 30
    end
    object ZQToLogoWRETAINEDINCOMEID: TIntegerField
      FieldName = 'WRETAINEDINCOMEID'
    end
    object ZQToLogoWDEBTORSCONTROLID: TIntegerField
      FieldName = 'WDEBTORSCONTROLID'
    end
    object ZQToLogoWCREDITORSCONTROLID: TIntegerField
      FieldName = 'WCREDITORSCONTROLID'
    end
    object ZQToLogoSBACKUPPATH: TStringField
      FieldName = 'SBACKUPPATH'
      Size = 255
    end
    object ZQToLogoWCOSTOFSALESTYPEID: TIntegerField
      FieldName = 'WCOSTOFSALESTYPEID'
    end
    object ZQToLogoWCREDITNOTEBATCHTYPEID: TIntegerField
      FieldName = 'WCREDITNOTEBATCHTYPEID'
    end
    object ZQToLogoSCREDITNOTEMESSAGE1: TStringField
      FieldName = 'SCREDITNOTEMESSAGE1'
      Size = 30
    end
    object ZQToLogoSCREDITNOTEMESSAGE2: TStringField
      FieldName = 'SCREDITNOTEMESSAGE2'
      Size = 30
    end
    object ZQToLogoSCREDITNOTEMESSAGE3: TStringField
      FieldName = 'SCREDITNOTEMESSAGE3'
      Size = 30
    end
    object ZQToLogoWPURCHASESBATCHID: TIntegerField
      FieldName = 'WPURCHASESBATCHID'
    end
    object ZQToLogoSPURCHASESMESSAGE1: TStringField
      FieldName = 'SPURCHASESMESSAGE1'
      Size = 30
    end
    object ZQToLogoSPURCHASESMESSAGE2: TStringField
      FieldName = 'SPURCHASESMESSAGE2'
      Size = 30
    end
    object ZQToLogoSPURCHASESMESSAGE3: TStringField
      FieldName = 'SPURCHASESMESSAGE3'
      Size = 30
    end
    object ZQToLogoWGOODSRETURNEDBATCHID: TIntegerField
      FieldName = 'WGOODSRETURNEDBATCHID'
    end
    object ZQToLogoSGOODSRETURNEDMESSAGE1: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE1'
      Size = 30
    end
    object ZQToLogoSGOODSRETURNEDMESSAGE2: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE2'
      Size = 30
    end
    object ZQToLogoSGOODSRETURNEDMESSAGE3: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE3'
      Size = 30
    end
    object ZQToLogoWINVOICESBATCHID: TIntegerField
      FieldName = 'WINVOICESBATCHID'
    end
    object ZQToLogoSINVOICESMESSAGE1: TStringField
      FieldName = 'SINVOICESMESSAGE1'
      Size = 30
    end
    object ZQToLogoSINVOICESMESSAGE2: TStringField
      FieldName = 'SINVOICESMESSAGE2'
      Size = 30
    end
    object ZQToLogoSINVOICESMESSAGE3: TStringField
      FieldName = 'SINVOICESMESSAGE3'
      Size = 30
    end
    object ZQToLogoWDISPLAYAMOUNT: TIntegerField
      FieldName = 'WDISPLAYAMOUNT'
    end
    object ZQToLogoBACCOUNTSOPEN: TSmallintField
      FieldName = 'BACCOUNTSOPEN'
    end
    object ZQToLogoBBATCHTYPES: TSmallintField
      FieldName = 'BBATCHTYPES'
    end
    object ZQToLogoBGROUPS: TSmallintField
      FieldName = 'BGROUPS'
    end
    object ZQToLogoBNOTCLOSED: TSmallintField
      FieldName = 'BNOTCLOSED'
    end
    object ZQToLogoBPERIODCHANGE: TSmallintField
      FieldName = 'BPERIODCHANGE'
    end
    object ZQToLogoBSALESMANEXIST: TSmallintField
      FieldName = 'BSALESMANEXIST'
    end
    object ZQToLogoBUNITSEXIST: TSmallintField
      FieldName = 'BUNITSEXIST'
    end
    object ZQToLogoFLASTYEARPL: TFloatField
      FieldName = 'FLASTYEARPL'
    end
    object ZQToLogoWNOOFPERIODS: TIntegerField
      FieldName = 'WNOOFPERIODS'
    end
    object ZQToLogoWINVOICEPAPERID: TIntegerField
      FieldName = 'WINVOICEPAPERID'
    end
    object ZQToLogoWCREDITNOTEPAPERID: TIntegerField
      FieldName = 'WCREDITNOTEPAPERID'
    end
    object ZQToLogoWPURCHASEPAPERID: TIntegerField
      FieldName = 'WPURCHASEPAPERID'
    end
    object ZQToLogoWGOODSRETURNEDPAPERID: TIntegerField
      FieldName = 'WGOODSRETURNEDPAPERID'
    end
    object ZQToLogoWQUOTEPAPERID: TIntegerField
      FieldName = 'WQUOTEPAPERID'
    end
    object ZQToLogoWORDERPAPERID: TIntegerField
      FieldName = 'WORDERPAPERID'
    end
    object ZQToLogoWSTATEMENTPAPERID: TIntegerField
      FieldName = 'WSTATEMENTPAPERID'
    end
    object ZQToLogoWREMITTANCEPAPERID: TIntegerField
      FieldName = 'WREMITTANCEPAPERID'
    end
    object ZQToLogoFRECONCILEDBANKBALANCE: TFloatField
      FieldName = 'FRECONCILEDBANKBALANCE'
    end
    object ZQToLogoWRECONCILEDBANKID: TIntegerField
      FieldName = 'WRECONCILEDBANKID'
    end
    object ZQToLogoDRECONCILEDLASTDATE: TDateTimeField
      FieldName = 'DRECONCILEDLASTDATE'
    end
    object ZQToLogoSSTATEMENTMESSAGE1: TStringField
      FieldName = 'SSTATEMENTMESSAGE1'
      Size = 30
    end
    object ZQToLogoSSTATEMENTMESSAGE2: TStringField
      FieldName = 'SSTATEMENTMESSAGE2'
      Size = 30
    end
    object ZQToLogoSSTATEMENTMESSAGE3: TStringField
      FieldName = 'SSTATEMENTMESSAGE3'
      Size = 30
    end
    object ZQToLogoBCREATEBALANCELINK: TSmallintField
      FieldName = 'BCREATEBALANCELINK'
    end
    object ZQToLogoWTAXDUEACCOUNTID: TIntegerField
      FieldName = 'WTAXDUEACCOUNTID'
    end
    object ZQToLogoBTAXINVOICEBASED: TSmallintField
      FieldName = 'BTAXINVOICEBASED'
    end
    object ZQToLogoBCREATECOSTOFSALES: TSmallintField
      FieldName = 'BCREATECOSTOFSALES'
    end
    object ZQToLogoWCURRENTUSERID: TIntegerField
      FieldName = 'WCURRENTUSERID'
    end
    object ZQToLogoSINVOICEHEADING: TStringField
      FieldName = 'SINVOICEHEADING'
    end
    object ZQToLogoSCREDITNOTEHEADING: TStringField
      FieldName = 'SCREDITNOTEHEADING'
    end
    object ZQToLogoSPURCHASEHEADING: TStringField
      FieldName = 'SPURCHASEHEADING'
    end
    object ZQToLogoSGOODSRETURNEDHEADING: TStringField
      FieldName = 'SGOODSRETURNEDHEADING'
    end
    object ZQToLogoSQUOTEHEADING: TStringField
      FieldName = 'SQUOTEHEADING'
    end
    object ZQToLogoSQUOTEMESSAGE1: TStringField
      FieldName = 'SQUOTEMESSAGE1'
      Size = 30
    end
    object ZQToLogoSQUOTEMESSAGE2: TStringField
      FieldName = 'SQUOTEMESSAGE2'
      Size = 30
    end
    object ZQToLogoSQUOTEMESSAGE3: TStringField
      FieldName = 'SQUOTEMESSAGE3'
      Size = 30
    end
    object ZQToLogoSORDERHEADING: TStringField
      FieldName = 'SORDERHEADING'
    end
    object ZQToLogoSORDERMESSAGE1: TStringField
      FieldName = 'SORDERMESSAGE1'
      Size = 30
    end
    object ZQToLogoSORDERMESSAGE2: TStringField
      FieldName = 'SORDERMESSAGE2'
      Size = 30
    end
    object ZQToLogoSORDERMESSAGE3: TStringField
      FieldName = 'SORDERMESSAGE3'
      Size = 30
    end
    object ZQToLogoBPOSTTOLASTYEAR: TSmallintField
      FieldName = 'BPOSTTOLASTYEAR'
    end
    object ZQToLogoWBASECURRENCYID: TIntegerField
      FieldName = 'WBASECURRENCYID'
    end
    object ZQToLogoBMULTICURRENCY: TSmallintField
      FieldName = 'BMULTICURRENCY'
    end
    object ZQToLogoSTAXREGNO: TStringField
      FieldName = 'STAXREGNO'
      Size = 30
    end
    object ZQToLogoBPAYMENTSBASED: TSmallintField
      FieldName = 'BPAYMENTSBASED'
    end
    object ZQToLogoWDUEACCOUNTID: TIntegerField
      FieldName = 'WDUEACCOUNTID'
    end
    object ZQToLogoWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
    end
    object ZQToLogoBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object ZQToLogoBREMOTE: TSmallintField
      FieldName = 'BREMOTE'
    end
    object ZQToLogoWCOLOURID: TIntegerField
      FieldName = 'WCOLOURID'
    end
    object ZQToLogoSACCOUNTREPORTNAME1: TStringField
      FieldName = 'SACCOUNTREPORTNAME1'
      Size = 15
    end
    object ZQToLogoSACCOUNTREPORTNAME2: TStringField
      FieldName = 'SACCOUNTREPORTNAME2'
      Size = 15
    end
    object ZQToLogoSDEBTORREPORTNAME1: TStringField
      FieldName = 'SDEBTORREPORTNAME1'
      Size = 15
    end
    object ZQToLogoSDEBTORREPORTNAME2: TStringField
      FieldName = 'SDEBTORREPORTNAME2'
      Size = 15
    end
    object ZQToLogoSCREDITORREPORTNAME1: TStringField
      FieldName = 'SCREDITORREPORTNAME1'
      Size = 15
    end
    object ZQToLogoSCREDITORREPORTNAME2: TStringField
      FieldName = 'SCREDITORREPORTNAME2'
      Size = 15
    end
    object ZQToLogoSSTOCKREPORTNAME1: TStringField
      FieldName = 'SSTOCKREPORTNAME1'
      Size = 15
    end
    object ZQToLogoSSTOCKREPORTNAME2: TStringField
      FieldName = 'SSTOCKREPORTNAME2'
      Size = 15
    end
    object ZQToLogoSDOCUMENTREPORTNAME1: TStringField
      FieldName = 'SDOCUMENTREPORTNAME1'
      Size = 15
    end
    object ZQToLogoSDOCUMENTREPORTNAME2: TStringField
      FieldName = 'SDOCUMENTREPORTNAME2'
      Size = 15
    end
    object ZQToLogoSSELLINGPRICENAME1: TStringField
      FieldName = 'SSELLINGPRICENAME1'
      Size = 15
    end
    object ZQToLogoSSELLINGPRICENAME2: TStringField
      FieldName = 'SSELLINGPRICENAME2'
      Size = 15
    end
    object ZQToLogoSSELLINGPRICENAME3: TStringField
      FieldName = 'SSELLINGPRICENAME3'
      Size = 15
    end
    object ZQToLogoWVERSION: TIntegerField
      FieldName = 'WVERSION'
    end
    object ZQToLogoSREPORTFONTSNAME: TStringField
      FieldName = 'SREPORTFONTSNAME'
      Size = 35
    end
    object ZQToLogoBUSEAVGCOST: TSmallintField
      FieldName = 'BUSEAVGCOST'
    end
    object ZQToLogoBPRNSTATEMENTLOGO: TSmallintField
      FieldName = 'BPRNSTATEMENTLOGO'
    end
    object ZQToLogoDTLASTUSETIME: TDateTimeField
      FieldName = 'DTLASTUSETIME'
    end
    object ZQToLogoBSHOWTIPS: TSmallintField
      FieldName = 'BSHOWTIPS'
    end
    object ZQToLogoWAUTOSAVETIME: TIntegerField
      FieldName = 'WAUTOSAVETIME'
    end
    object ZQToLogoBSHOWREMINDER: TSmallintField
      FieldName = 'BSHOWREMINDER'
    end
    object ZQToLogoBSERVICEPREPRINTED: TSmallintField
      FieldName = 'BSERVICEPREPRINTED'
    end
    object ZQToLogoWDEFAULTOUTPUTID: TIntegerField
      FieldName = 'WDEFAULTOUTPUTID'
    end
    object ZQToLogoWDEFAULTZOOM: TIntegerField
      FieldName = 'WDEFAULTZOOM'
    end
    object ZQToLogoBUSEOUTLOOKEXP: TSmallintField
      FieldName = 'BUSEOUTLOOKEXP'
    end
    object ZQToLogoSEMAILADDRESS: TStringField
      FieldName = 'SEMAILADDRESS'
      Size = 60
    end
  end
  object ZQFromLogo: TUniQuery
    DataTypeMap = <>
    Connection = ZConTC4
    SQL.Strings = (
      'select * from sysvars')
    Left = 164
    Top = 120
    object ZQFromLogoSCOMPANYNAME: TStringField
      FieldName = 'SCOMPANYNAME'
      Size = 35
    end
    object ZQFromLogoSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 30
    end
    object ZQFromLogoWEMAILSERVERADDRESS: TStringField
      FieldName = 'WEMAILSERVERADDRESS'
      Size = 30
    end
    object ZQFromLogoWFAXSERVERID: TIntegerField
      FieldName = 'WFAXSERVERID'
    end
    object ZQFromLogoBLOBLOGO: TBlobField
      FieldName = 'BLOBLOGO'
    end
    object ZQFromLogoSADDRESS1: TStringField
      FieldName = 'SADDRESS1'
      Size = 30
    end
    object ZQFromLogoSADDRESS2: TStringField
      FieldName = 'SADDRESS2'
      Size = 30
    end
    object ZQFromLogoSADDRESS3: TStringField
      FieldName = 'SADDRESS3'
      Size = 30
    end
    object ZQFromLogoSPOSTCODE: TStringField
      FieldName = 'SPOSTCODE'
      Size = 8
    end
    object ZQFromLogoSPHONENUMBER: TStringField
      FieldName = 'SPHONENUMBER'
      Size = 30
    end
    object ZQFromLogoSFAXNUMBER: TStringField
      FieldName = 'SFAXNUMBER'
      Size = 30
    end
    object ZQFromLogoWRETAINEDINCOMEID: TIntegerField
      FieldName = 'WRETAINEDINCOMEID'
    end
    object ZQFromLogoWDEBTORSCONTROLID: TIntegerField
      FieldName = 'WDEBTORSCONTROLID'
    end
    object ZQFromLogoWCREDITORSCONTROLID: TIntegerField
      FieldName = 'WCREDITORSCONTROLID'
    end
    object ZQFromLogoSBACKUPPATH: TStringField
      FieldName = 'SBACKUPPATH'
      Size = 255
    end
    object ZQFromLogoWCOSTOFSALESTYPEID: TIntegerField
      FieldName = 'WCOSTOFSALESTYPEID'
    end
    object ZQFromLogoWCREDITNOTEBATCHTYPEID: TIntegerField
      FieldName = 'WCREDITNOTEBATCHTYPEID'
    end
    object ZQFromLogoSCREDITNOTEMESSAGE1: TStringField
      FieldName = 'SCREDITNOTEMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSCREDITNOTEMESSAGE2: TStringField
      FieldName = 'SCREDITNOTEMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSCREDITNOTEMESSAGE3: TStringField
      FieldName = 'SCREDITNOTEMESSAGE3'
      Size = 30
    end
    object ZQFromLogoWPURCHASESBATCHID: TIntegerField
      FieldName = 'WPURCHASESBATCHID'
    end
    object ZQFromLogoSPURCHASESMESSAGE1: TStringField
      FieldName = 'SPURCHASESMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSPURCHASESMESSAGE2: TStringField
      FieldName = 'SPURCHASESMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSPURCHASESMESSAGE3: TStringField
      FieldName = 'SPURCHASESMESSAGE3'
      Size = 30
    end
    object ZQFromLogoWGOODSRETURNEDBATCHID: TIntegerField
      FieldName = 'WGOODSRETURNEDBATCHID'
    end
    object ZQFromLogoSGOODSRETURNEDMESSAGE1: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSGOODSRETURNEDMESSAGE2: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSGOODSRETURNEDMESSAGE3: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE3'
      Size = 30
    end
    object ZQFromLogoWINVOICESBATCHID: TIntegerField
      FieldName = 'WINVOICESBATCHID'
    end
    object ZQFromLogoSINVOICESMESSAGE1: TStringField
      FieldName = 'SINVOICESMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSINVOICESMESSAGE2: TStringField
      FieldName = 'SINVOICESMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSINVOICESMESSAGE3: TStringField
      FieldName = 'SINVOICESMESSAGE3'
      Size = 30
    end
    object ZQFromLogoWDISPLAYAMOUNT: TIntegerField
      FieldName = 'WDISPLAYAMOUNT'
    end
    object ZQFromLogoBACCOUNTSOPEN: TSmallintField
      FieldName = 'BACCOUNTSOPEN'
    end
    object ZQFromLogoBBATCHTYPES: TSmallintField
      FieldName = 'BBATCHTYPES'
    end
    object ZQFromLogoBGROUPS: TSmallintField
      FieldName = 'BGROUPS'
    end
    object ZQFromLogoBNOTCLOSED: TSmallintField
      FieldName = 'BNOTCLOSED'
    end
    object ZQFromLogoBPERIODCHANGE: TSmallintField
      FieldName = 'BPERIODCHANGE'
    end
    object ZQFromLogoBSALESMANEXIST: TSmallintField
      FieldName = 'BSALESMANEXIST'
    end
    object ZQFromLogoBUNITSEXIST: TSmallintField
      FieldName = 'BUNITSEXIST'
    end
    object ZQFromLogoFLASTYEARPL: TFloatField
      FieldName = 'FLASTYEARPL'
    end
    object ZQFromLogoWNOOFPERIODS: TIntegerField
      FieldName = 'WNOOFPERIODS'
    end
    object ZQFromLogoWINVOICEPAPERID: TIntegerField
      FieldName = 'WINVOICEPAPERID'
    end
    object ZQFromLogoWCREDITNOTEPAPERID: TIntegerField
      FieldName = 'WCREDITNOTEPAPERID'
    end
    object ZQFromLogoWPURCHASEPAPERID: TIntegerField
      FieldName = 'WPURCHASEPAPERID'
    end
    object ZQFromLogoWGOODSRETURNEDPAPERID: TIntegerField
      FieldName = 'WGOODSRETURNEDPAPERID'
    end
    object ZQFromLogoWQUOTEPAPERID: TIntegerField
      FieldName = 'WQUOTEPAPERID'
    end
    object ZQFromLogoWORDERPAPERID: TIntegerField
      FieldName = 'WORDERPAPERID'
    end
    object ZQFromLogoWSTATEMENTPAPERID: TIntegerField
      FieldName = 'WSTATEMENTPAPERID'
    end
    object ZQFromLogoWREMITTANCEPAPERID: TIntegerField
      FieldName = 'WREMITTANCEPAPERID'
    end
    object ZQFromLogoFRECONCILEDBANKBALANCE: TFloatField
      FieldName = 'FRECONCILEDBANKBALANCE'
    end
    object ZQFromLogoWRECONCILEDBANKID: TIntegerField
      FieldName = 'WRECONCILEDBANKID'
    end
    object ZQFromLogoDRECONCILEDLASTDATE: TDateTimeField
      FieldName = 'DRECONCILEDLASTDATE'
    end
    object ZQFromLogoSSTATEMENTMESSAGE1: TStringField
      FieldName = 'SSTATEMENTMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSSTATEMENTMESSAGE2: TStringField
      FieldName = 'SSTATEMENTMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSSTATEMENTMESSAGE3: TStringField
      FieldName = 'SSTATEMENTMESSAGE3'
      Size = 30
    end
    object ZQFromLogoBCREATEBALANCELINK: TSmallintField
      FieldName = 'BCREATEBALANCELINK'
    end
    object ZQFromLogoWTAXDUEACCOUNTID: TIntegerField
      FieldName = 'WTAXDUEACCOUNTID'
    end
    object ZQFromLogoBTAXINVOICEBASED: TSmallintField
      FieldName = 'BTAXINVOICEBASED'
    end
    object ZQFromLogoBCREATECOSTOFSALES: TSmallintField
      FieldName = 'BCREATECOSTOFSALES'
    end
    object ZQFromLogoWCURRENTUSERID: TIntegerField
      FieldName = 'WCURRENTUSERID'
    end
    object ZQFromLogoSINVOICEHEADING: TStringField
      FieldName = 'SINVOICEHEADING'
    end
    object ZQFromLogoSCREDITNOTEHEADING: TStringField
      FieldName = 'SCREDITNOTEHEADING'
    end
    object ZQFromLogoSPURCHASEHEADING: TStringField
      FieldName = 'SPURCHASEHEADING'
    end
    object ZQFromLogoSGOODSRETURNEDHEADING: TStringField
      FieldName = 'SGOODSRETURNEDHEADING'
    end
    object ZQFromLogoSQUOTEHEADING: TStringField
      FieldName = 'SQUOTEHEADING'
    end
    object ZQFromLogoSQUOTEMESSAGE1: TStringField
      FieldName = 'SQUOTEMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSQUOTEMESSAGE2: TStringField
      FieldName = 'SQUOTEMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSQUOTEMESSAGE3: TStringField
      FieldName = 'SQUOTEMESSAGE3'
      Size = 30
    end
    object ZQFromLogoSORDERHEADING: TStringField
      FieldName = 'SORDERHEADING'
    end
    object ZQFromLogoSORDERMESSAGE1: TStringField
      FieldName = 'SORDERMESSAGE1'
      Size = 30
    end
    object ZQFromLogoSORDERMESSAGE2: TStringField
      FieldName = 'SORDERMESSAGE2'
      Size = 30
    end
    object ZQFromLogoSORDERMESSAGE3: TStringField
      FieldName = 'SORDERMESSAGE3'
      Size = 30
    end
    object ZQFromLogoBPOSTTOLASTYEAR: TSmallintField
      FieldName = 'BPOSTTOLASTYEAR'
    end
    object ZQFromLogoWBASECURRENCYID: TIntegerField
      FieldName = 'WBASECURRENCYID'
    end
    object ZQFromLogoBMULTICURRENCY: TSmallintField
      FieldName = 'BMULTICURRENCY'
    end
    object ZQFromLogoSTAXREGNO: TStringField
      FieldName = 'STAXREGNO'
      Size = 30
    end
    object ZQFromLogoBPAYMENTSBASED: TSmallintField
      FieldName = 'BPAYMENTSBASED'
    end
    object ZQFromLogoWDUEACCOUNTID: TIntegerField
      FieldName = 'WDUEACCOUNTID'
    end
    object ZQFromLogoWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
    end
    object ZQFromLogoBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object ZQFromLogoBREMOTE: TSmallintField
      FieldName = 'BREMOTE'
    end
    object ZQFromLogoWCOLOURID: TIntegerField
      FieldName = 'WCOLOURID'
    end
    object ZQFromLogoSACCOUNTREPORTNAME1: TStringField
      FieldName = 'SACCOUNTREPORTNAME1'
      Size = 15
    end
    object ZQFromLogoSACCOUNTREPORTNAME2: TStringField
      FieldName = 'SACCOUNTREPORTNAME2'
      Size = 15
    end
    object ZQFromLogoSDEBTORREPORTNAME1: TStringField
      FieldName = 'SDEBTORREPORTNAME1'
      Size = 15
    end
    object ZQFromLogoSDEBTORREPORTNAME2: TStringField
      FieldName = 'SDEBTORREPORTNAME2'
      Size = 15
    end
    object ZQFromLogoSCREDITORREPORTNAME1: TStringField
      FieldName = 'SCREDITORREPORTNAME1'
      Size = 15
    end
    object ZQFromLogoSCREDITORREPORTNAME2: TStringField
      FieldName = 'SCREDITORREPORTNAME2'
      Size = 15
    end
    object ZQFromLogoSSTOCKREPORTNAME1: TStringField
      FieldName = 'SSTOCKREPORTNAME1'
      Size = 15
    end
    object ZQFromLogoSSTOCKREPORTNAME2: TStringField
      FieldName = 'SSTOCKREPORTNAME2'
      Size = 15
    end
    object ZQFromLogoSDOCUMENTREPORTNAME1: TStringField
      FieldName = 'SDOCUMENTREPORTNAME1'
      Size = 15
    end
    object ZQFromLogoSDOCUMENTREPORTNAME2: TStringField
      FieldName = 'SDOCUMENTREPORTNAME2'
      Size = 15
    end
    object ZQFromLogoSSELLINGPRICENAME1: TStringField
      FieldName = 'SSELLINGPRICENAME1'
      Size = 15
    end
    object ZQFromLogoSSELLINGPRICENAME2: TStringField
      FieldName = 'SSELLINGPRICENAME2'
      Size = 15
    end
    object ZQFromLogoSSELLINGPRICENAME3: TStringField
      FieldName = 'SSELLINGPRICENAME3'
      Size = 15
    end
    object ZQFromLogoWVERSION: TIntegerField
      FieldName = 'WVERSION'
    end
    object ZQFromLogoSREPORTFONTSNAME: TStringField
      FieldName = 'SREPORTFONTSNAME'
      Size = 35
    end
    object ZQFromLogoBUSEAVGCOST: TSmallintField
      FieldName = 'BUSEAVGCOST'
    end
    object ZQFromLogoBPRNSTATEMENTLOGO: TSmallintField
      FieldName = 'BPRNSTATEMENTLOGO'
    end
    object ZQFromLogoDTLASTUSETIME: TDateTimeField
      FieldName = 'DTLASTUSETIME'
    end
    object ZQFromLogoBSHOWTIPS: TSmallintField
      FieldName = 'BSHOWTIPS'
    end
    object ZQFromLogoWAUTOSAVETIME: TIntegerField
      FieldName = 'WAUTOSAVETIME'
    end
    object ZQFromLogoBSHOWREMINDER: TSmallintField
      FieldName = 'BSHOWREMINDER'
    end
    object ZQFromLogoBSERVICEPREPRINTED: TSmallintField
      FieldName = 'BSERVICEPREPRINTED'
    end
    object ZQFromLogoWDEFAULTOUTPUTID: TIntegerField
      FieldName = 'WDEFAULTOUTPUTID'
    end
    object ZQFromLogoWDEFAULTZOOM: TIntegerField
      FieldName = 'WDEFAULTZOOM'
    end
    object ZQFromLogoBUSEOUTLOOKEXP: TSmallintField
      FieldName = 'BUSEOUTLOOKEXP'
    end
    object ZQFromLogoSEMAILADDRESS: TStringField
      FieldName = 'SEMAILADDRESS'
      Size = 60
    end
  end
  object ProcessList: TSQLHOLDER
    SQL.Strings = (
      'COUNTRIES'
      'YEARS'
      'Resources'
      'Tasks'
      'TaskAction'
      'Events'
      'Periods'
      'Groups'
      'Types'
      'Unit'
      'messages'
      'Currency'
      'Contacts'
      'Users'
      'Account'
      'Stock'
      'StockPub'
      'StockTrn'
      'Debtor'
      'Bank'
      'Tax'
      'creditor'
      'addressPerAccount'
      'AssetMas'
      'BatTypes'
      'BatCon'
      'BOM'
      'BackOrd'
      'DnlBanks'
      'DocHead'
      'DocLine'
      'EmpMas'
      'EmpSource'
      'FlowTmp'
      'Global'
      'JobProject'
      'KeysCont'
      'LabSpecs'
      'Locations'
      'ManufacH'
      'ManufacD'
      'OILinks'
      'OpReport'
      'PayCon'
      'PayTrans'
      'Printers'
      'Profiles'
      'ReconBank'
      'RepCells'
      'RepCols'
      'RepHead'
      'RepLine'
      'ReportOp'
      'ReptBat'
      'ReptDocs'
      'Totals'
      'TransAct'
      'SysParams'
      'Sysvars'
      'dnlbanks'
      'ACCOUNTREF'
      'IMP_LINK'
      'IMP_SOURCE'
      'IMP_STOCKACCOUNTS'
      'IMP_TOTALS'
      'OSF_SEARCH_FIELDS'
      'GROUPSSTATUS'
      'LOGENTRY'
      'LOGGEDIN'
      'MULTIMEDIA'
      'MULTIMEDIABLOB'
      'PARCEL'
      'PARCEL_ITEM'
      'PARCEL_PROD'
      'PARCEL_XDBSEND')
    Left = 172
    Top = 312
  end
end
