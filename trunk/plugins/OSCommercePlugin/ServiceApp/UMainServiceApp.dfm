object MainServiceApp: TMainServiceApp
  Left = 254
  Top = 180
  Width = 501
  Height = 395
  Caption = 'Setup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    493
    361)
  PixelsPerInch = 96
  TextHeight = 13
  object Bstart: TButton
    Left = 312
    Top = 320
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Start'
    TabOrder = 0
    OnClick = BstartClick
  end
  object BSetupOsfOSc: TButton
    Left = 395
    Top = 320
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Setup'
    TabOrder = 1
    OnClick = BSetupOsfOScClick
  end
  object pcmainsetup: TPageControl
    Left = 8
    Top = 16
    Width = 465
    Height = 289
    ActivePage = tsdatabase
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object tsdatabase: TTabSheet
      Caption = 'Database'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Username'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 46
        Height = 13
        Caption = 'Database'
      end
      object Label4: TLabel
        Left = 8
        Top = 128
        Width = 31
        Height = 13
        Caption = 'Server'
      end
      object Label5: TLabel
        Left = 8
        Top = 208
        Width = 39
        Height = 13
        Caption = 'Protocol'
      end
      object Label12: TLabel
        Left = 8
        Top = 168
        Width = 19
        Height = 13
        Caption = 'Port'
      end
      object Label11: TLabel
        Left = 184
        Top = 8
        Width = 91
        Height = 13
        Caption = 'check Interval(sec)'
      end
      object EUsername: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'sysdba'
      end
      object EPassword: TEdit
        Left = 8
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'masterkey'
      end
      object EDatabase: TEdit
        Left = 8
        Top = 104
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'C:\osFinancials\books\Delphidreams2006\books.fdb'
      end
      object EServer: TEdit
        Left = 8
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '127.0.0.1'
      end
      object cbProtocol: TComboBox
        Left = 8
        Top = 224
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
        Top = 184
        Width = 121
        Height = 21
        TabOrder = 5
        Text = '0'
      end
      object EtimerInterval: TEdit
        Left = 184
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 6
        Text = '300'
      end
    end
    object tsemail: TTabSheet
      Caption = 'Email'
      ImageIndex = 1
      object Label10: TLabel
        Left = 8
        Top = 168
        Width = 37
        Height = 13
        Caption = 'Send to'
      end
      object Label9: TLabel
        Left = 8
        Top = 128
        Width = 56
        Height = 13
        Caption = 'Smtp server'
      end
      object Label8: TLabel
        Left = 8
        Top = 88
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object Label7: TLabel
        Left = 8
        Top = 48
        Width = 48
        Height = 13
        Caption = 'Username'
      end
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 41
        Height = 13
        Caption = 'pop host'
      end
      object Label13: TLabel
        Left = 176
        Top = 8
        Width = 135
        Height = 13
        Caption = 'Time between mails(minutes)'
      end
      object ESendToEmail: TEdit
        Left = 8
        Top = 184
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'ESendToEmail'
      end
      object ESMTPServer: TEdit
        Left = 8
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'ESMTPServer'
      end
      object EPopPassword: TEdit
        Left = 8
        Top = 104
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'EPopPassword'
      end
      object EPopUsername: TEdit
        Left = 8
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'EPopUsername'
      end
      object EPopMailserver: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 4
        Text = 'EPopMailserver'
      end
      object ETimeBetweenMails: TEdit
        Left = 176
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 5
        Text = '1'
      end
    end
    object tslog: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      TabVisible = False
      DesignSize = (
        457
        261)
      object MLog: TMemo
        Left = 4
        Top = 5
        Width = 447
        Height = 248
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300000
    OnTimer = Timer1Timer
    Left = 176
    Top = 80
  end
  object IdPOP31: TIdPOP3
    MaxLineAction = maException
    ReadTimeout = 0
    Left = 200
    Top = 128
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 200
    Top = 176
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 288
    Top = 8
  end
end
