object FormDataserver: TFormDataserver
  Left = 258
  Top = 291
  Width = 259
  Height = 385
  Caption = 'osFdataserver'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 280
    Width = 52
    Height = 13
    Caption = 'Server port'
  end
  object Database: TGroupBox
    Left = 8
    Top = 0
    Width = 225
    Height = 265
    Caption = 'Database'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Username'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label3: TLabel
      Left = 8
      Top = 104
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object Label4: TLabel
      Left = 8
      Top = 144
      Width = 31
      Height = 13
      Caption = 'Server'
    end
    object Label5: TLabel
      Left = 8
      Top = 216
      Width = 39
      Height = 13
      Caption = 'Protocol'
    end
    object EUsername: TEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'sysdba'
    end
    object EPassword: TEdit
      Left = 8
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'masterkey'
    end
    object EDatabase: TEdit
      Left = 8
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'C:\osFinancials\books\Delphidreams2006\books.fdb'
    end
    object EServer: TEdit
      Left = 8
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '127.0.0.1'
    end
    object cbProtocol: TComboBox
      Left = 8
      Top = 232
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'firebird-1.5'
        'ado'
        'firebird-1.0'
        'interbase-5'
        'interbase-6'
        'mssql'
        'mysql'
        'mysql-3.20'
        'mysql-3.23'
        'mysql-4.0'
        'mysql-4.1'
        'oracle'
        'oracle-9i'
        'postgresql'
        'postgresql-7.3'
        'postgresql-7.4'
        'postgresql-8.x'
        'sqlite'
        'sqlite-2.8'
        'sybase')
    end
    object EPort: TEdit
      Left = 8
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '0'
    end
  end
  object BActivate: TBitBtn
    Left = 8
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Activate'
    TabOrder = 0
    OnClick = BActivateClick
  end
  object EServerPort: TEdit
    Left = 8
    Top = 296
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '88'
  end
  object Button1: TButton
    Left = 144
    Top = 320
    Width = 89
    Height = 25
    Caption = 'Launch browser'
    TabOrder = 3
    OnClick = Button1Click
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    CommandHandlers = <>
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = IdHTTPServer1Connect
    OnDisconnect = IdHTTPServer1Disconnect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    ThreadMgr = IdThreadMgrDefault1
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 176
    Top = 24
  end
  object IdThreadMgrDefault1: TIdThreadMgrDefault
    Left = 176
    Top = 88
  end
end
