object FOnlineRegistration: TFOnlineRegistration
  Left = 44
  Top = 97
  Width = 947
  Height = 543
  Caption = 'FOnlineRegistration'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 470
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 937
      Height = 696
      Align = alTop
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 16
        Top = 15
        Width = 353
        Height = 226
        Caption = 'Personal Data'
        TabOrder = 0
        object Label1: TLabel
          Left = 40
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Firstname'
        end
        object Label2: TLabel
          Left = 40
          Top = 88
          Width = 46
          Height = 13
          Caption = 'Lastname'
        end
        object Label3: TLabel
          Left = 40
          Top = 112
          Width = 87
          Height = 13
          Caption = 'Street and number'
        end
        object Label4: TLabel
          Left = 40
          Top = 136
          Width = 53
          Height = 13
          Caption = 'Postalcode'
        end
        object Label5: TLabel
          Left = 40
          Top = 160
          Width = 17
          Height = 13
          Caption = 'City'
        end
        object Label16: TLabel
          Left = 40
          Top = 208
          Width = 72
          Height = 13
          Caption = 'State/Province'
        end
        object Label17: TLabel
          Left = 40
          Top = 184
          Width = 36
          Height = 13
          Caption = 'Country'
        end
        object Label8: TLabel
          Left = 40
          Top = 32
          Width = 35
          Height = 13
          Caption = 'Gender'
        end
        object EPostalcode: TEdit
          Left = 152
          Top = 128
          Width = 185
          Height = 21
          TabOrder = 4
        end
        object EAddress: TEdit
          Left = 152
          Top = 104
          Width = 185
          Height = 21
          TabOrder = 3
        end
        object ELastname: TEdit
          Left = 152
          Top = 80
          Width = 185
          Height = 21
          TabOrder = 2
        end
        object EFirstname: TEdit
          Left = 152
          Top = 56
          Width = 185
          Height = 21
          TabOrder = 1
        end
        object RBGender: TRadioGroup
          Left = 152
          Top = 16
          Width = 185
          Height = 33
          Caption = 'Gender'
          Columns = 2
          Items.Strings = (
            'Male'
            'Female')
          TabOrder = 0
        end
        object ECity: TEdit
          Left = 152
          Top = 152
          Width = 185
          Height = 21
          TabOrder = 5
        end
        object CBState: TComboBox
          Left = 152
          Top = 200
          Width = 185
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
        end
        object CBCountry: TComboBox
          Left = 152
          Top = 176
          Width = 185
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
          OnChange = CBCountryChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 376
        Top = 16
        Width = 489
        Height = 121
        Caption = 'Company Data'
        TabOrder = 1
        object Label6: TLabel
          Left = 40
          Top = 28
          Width = 70
          Height = 13
          Caption = 'Companyname'
        end
        object Label7: TLabel
          Left = 40
          Top = 100
          Width = 79
          Height = 13
          Caption = 'TVA intracom nr.'
        end
        object Label21: TLabel
          Left = 40
          Top = 54
          Width = 31
          Height = 13
          Caption = 'Usage'
        end
        object Label22: TLabel
          Left = 40
          Top = 76
          Width = 39
          Height = 13
          Caption = 'Website'
        end
        object Label23: TLabel
          Left = 344
          Top = 80
          Width = 134
          Height = 13
          Caption = '(http://www.mydomain.com)'
        end
        object Label24: TLabel
          Left = 344
          Top = 104
          Width = 93
          Height = 13
          Caption = '(NL123456789B01)'
        end
        object ECompanyname: TEdit
          Left = 152
          Top = 24
          Width = 185
          Height = 21
          TabOrder = 0
        end
        object EVat: TEdit
          Left = 152
          Top = 96
          Width = 185
          Height = 21
          TabOrder = 1
        end
        object Edit1: TEdit
          Left = 152
          Top = 48
          Width = 185
          Height = 21
          TabOrder = 2
          Text = 'Pull down voor het gebruik'
        end
        object EWebsiteURL: TEdit
          Left = 152
          Top = 72
          Width = 185
          Height = 21
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 16
        Top = 248
        Width = 353
        Height = 193
        Caption = 'Contact Data'
        TabOrder = 2
        object Label9: TLabel
          Left = 40
          Top = 32
          Width = 48
          Height = 13
          Caption = 'Username'
        end
        object Label10: TLabel
          Left = 40
          Top = 56
          Width = 65
          Height = 13
          Caption = 'Email address'
        end
        object Label11: TLabel
          Left = 40
          Top = 80
          Width = 89
          Height = 13
          Caption = 'Telephone number'
        end
        object Label12: TLabel
          Left = 40
          Top = 104
          Width = 55
          Height = 13
          Caption = 'Fax number'
        end
        object Label13: TLabel
          Left = 40
          Top = 128
          Width = 56
          Height = 13
          Caption = 'Skypename'
        end
        object Label18: TLabel
          Left = 40
          Top = 152
          Width = 50
          Height = 13
          Caption = 'Consultant'
        end
        object Label19: TLabel
          Left = 40
          Top = 176
          Width = 74
          Height = 13
          Caption = 'Referral Source'
        end
        object EUsername: TEdit
          Left = 152
          Top = 24
          Width = 185
          Height = 21
          TabOrder = 0
        end
        object EEmailaddress: TEdit
          Left = 152
          Top = 48
          Width = 185
          Height = 21
          TabOrder = 1
        end
        object EPhonenumber: TEdit
          Left = 152
          Top = 72
          Width = 185
          Height = 21
          TabOrder = 2
        end
        object EFaxnumber: TEdit
          Left = 152
          Top = 96
          Width = 185
          Height = 21
          TabOrder = 3
        end
        object ESkypename: TEdit
          Left = 152
          Top = 120
          Width = 185
          Height = 21
          TabOrder = 4
        end
        object CBConsultant: TComboBox
          Left = 152
          Top = 144
          Width = 185
          Height = 21
          ItemHeight = 13
          TabOrder = 5
        end
        object CBReferral: TComboBox
          Left = 152
          Top = 168
          Width = 185
          Height = 21
          ItemHeight = 13
          TabOrder = 6
        end
      end
      object GroupBox4: TGroupBox
        Left = 376
        Top = 256
        Width = 545
        Height = 113
        Caption = 'Newsletters and Password'
        TabOrder = 3
        object Label14: TLabel
          Left = 40
          Top = 72
          Width = 46
          Height = 13
          Caption = 'Password'
        end
        object Label15: TLabel
          Left = 40
          Top = 96
          Width = 107
          Height = 13
          Caption = 'Password Confirmation'
        end
        object Label20: TLabel
          Left = 40
          Top = 40
          Width = 55
          Height = 13
          Caption = 'Newsletters'
        end
        object RBNewsletter: TCheckListBox
          Left = 150
          Top = 32
          Width = 373
          Height = 20
          BevelOuter = bvRaised
          BevelKind = bkFlat
          Columns = 3
          ItemHeight = 13
          Items.Strings = (
            'General Mailinglist'
            'Release Maillinglist'
            'Bug Fix Maillinglist')
          TabOrder = 0
        end
        object EPassword: TEdit
          Left = 152
          Top = 64
          Width = 185
          Height = 21
          PasswordChar = '*'
          TabOrder = 1
        end
        object EPasswordConfirm: TEdit
          Left = 152
          Top = 88
          Width = 185
          Height = 21
          PasswordChar = '*'
          TabOrder = 2
        end
        object PWencrypted: TEdit
          Left = 360
          Top = 72
          Width = 169
          Height = 21
          TabOrder = 3
        end
      end
      object Memo1: TMemo
        Left = 640
        Top = 296
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssBoth
        TabOrder = 4
        WordWrap = False
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 470
    Width = 939
    Height = 39
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Serial: TEdit
      Left = 288
      Top = 8
      Width = 137
      Height = 21
      TabOrder = 2
    end
  end
  object HTTPRequest: TIdHTTP
    MaxLineAction = maException
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    OnRedirect = HTTPRequestRedirect
    Left = 384
    Top = 171
  end
  object DSCountries: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 171
  end
  object DSConsultants: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 483
  end
  object DSSources: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 483
  end
  object DSStates: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 171
  end
end
