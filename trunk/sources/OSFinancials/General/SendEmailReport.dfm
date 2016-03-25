object fmSendEmailReport: TfmSendEmailReport
  Left = 190
  Top = 202
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sending E-mail  and  Fax Report'
  ClientHeight = 403
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 542
    Top = 2
    Width = 107
    Height = 351
  end
  object Label2: TLabel
    Left = 260
    Top = 2
    Width = 35
    Height = 13
    Caption = 'Cc To :'
  end
  object Label4: TLabel
    Left = 6
    Top = 2
    Width = 42
    Height = 13
    Caption = 'Subject :'
  end
  object spbMessage: TSpeedButton
    Left = 558
    Top = 16
    Width = 91
    Height = 24
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'Message'
    OnClick = spbMessageClick
  end
  object Notebook: TNotebook
    Left = 6
    Top = 46
    Width = 531
    Height = 315
    PopupMenu = PopupMenu1
    TabOrder = 4
    object TPage
      Left = 0
      Top = 0
      Caption = 'Publipostage'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 6
        Top = 2
        Width = 64
        Height = 13
        Caption = '&Publi-Mail List'
      end
      object pnlMessage: TPanel
        Left = 4
        Top = 16
        Width = 441
        Height = 296
        Caption = 'pnlMessage'
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 6
          Width = 55
          Height = 13
          Caption = 'E-mail Text '
        end
        object Memo1: TMemo
          Left = 6
          Top = 22
          Width = 429
          Height = 269
          Lines.Strings = (
            'Tcash3 e-mail Report Sender')
          TabOrder = 0
        end
      end
      object cbList: TcxListView
        Left = 6
        Top = 18
        Width = 523
        Height = 290
        Columns = <
          item
            Caption = 'Doc No'
            Width = 70
          end
          item
            Caption = 'E-mail'
            Width = 150
          end
          item
            Caption = 'Name'
            Width = 100
          end
          item
            Caption = 'ID'
          end
          item
            Caption = 'AccID'
          end>
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = cbListDblClick
        OnKeyUp = cbListKeyUp
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Single'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PnlSingleMail: TPanel
        Left = 4
        Top = 4
        Width = 439
        Height = 310
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 137
          Top = 0
          Height = 310
        end
        object LeftSingleMailPnl: TPanel
          Left = 0
          Top = 0
          Width = 137
          Height = 310
          Align = alLeft
          TabOrder = 0
          object Label5: TLabel
            Left = 1
            Top = 1
            Width = 66
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Send To : List'
          end
          object SendListBox: TListBox
            Left = 1
            Top = 14
            Width = 135
            Height = 295
            Align = alClient
            ItemHeight = 13
            Sorted = True
            TabOrder = 0
          end
        end
        object RigthSingleMailPnl: TPanel
          Left = 140
          Top = 0
          Width = 299
          Height = 310
          Align = alClient
          TabOrder = 1
          object Label6: TLabel
            Left = 1
            Top = 1
            Width = 297
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = '&Address book'
            ExplicitWidth = 65
          end
          object lvAddresses: TcxListView
            Left = 1
            Top = 14
            Width = 297
            Height = 295
            Align = alClient
            Columns = <
              item
                Caption = 'Email Address'
                Width = 130
              end
              item
                Caption = 'Full Name'
                Width = 163
              end
              item
                Caption = 'ID'
                Width = 0
              end>
            HideSelection = False
            MultiSelect = True
            ReadOnly = True
            RowSelect = True
            SortType = stText
            TabOrder = 0
            ViewStyle = vsReport
            OnDblClick = lvAddressesDblClick
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Backup'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LedtBckTo: TLabel
        Left = 8
        Top = 6
        Width = 16
        Height = 13
        Caption = 'To:'
      end
      object Label7: TLabel
        Left = 266
        Top = 24
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Password'
      end
      object BackMessage: TMemo
        Left = 6
        Top = 48
        Width = 435
        Height = 261
        TabOrder = 0
      end
      object edtBckTo: TEdit
        Left = 6
        Top = 20
        Width = 235
        Height = 21
        TabOrder = 1
        Text = 'info@pinksoft.co.za'
      end
      object edtPass: TEdit
        Left = 320
        Top = 16
        Width = 121
        Height = 21
        PasswordChar = '@'
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 259
    Top = 15
    Width = 192
    Height = 30
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = clWindow
    TabOrder = 2
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 366
    Width = 653
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object lblMessage: TLabel
      Left = 6
      Top = 12
      Width = 53
      Height = 13
      Caption = 'lblMessage'
      Transparent = True
    end
    object UnsentLbl: TLabel
      Left = 212
      Top = 12
      Width = 72
      Height = 13
      Caption = '                        '
      Transparent = True
    end
  end
  object edtCcAddress: TEdit
    Left = 264
    Top = 20
    Width = 183
    Height = 21
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 6
    Top = 15
    Width = 249
    Height = 30
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 3
    object edtMailSubject: TEdit
      Left = 5
      Top = 5
      Width = 239
      Height = 21
      TabOrder = 0
    end
  end
  object BtnCancel: TBitBtn
    Left = 547
    Top = 300
    Width = 94
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFF8383CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181
      C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171C64D4DD03F3FB7FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF3E3EAF4242C56B6BBBFFFFFFFFFFFFFFFFFF7272C7
      4E4ED16969E26969E94040B8FFFFFFFFFFFFFFFFFFFFFFFF3D3DB04E4ED84747
      D24444C96B6BBBFFFFFF8888D14949CD6060D96868DD7070E76C6CED4040B8FF
      FFFFFFFFFF3F3FB35252DC4444CE4242CC4747D24242C68181C4FFFFFF4343BD
      5E5EDE6868DE7070E77575EE6D6DEF4040B84141B65A5AE24D4DD54343CD4242
      CD4D4DD83D3DAFFFFFFFFFFFFFFFFFFF4444BE6464E47070E77676EE7777F16C
      6CEF6363E95A5ADE4C4CD44444CE4D4DD83D3DB0FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF4444BE6868E97575EE7777F07272EE6767E75A5ADE4D4DD54E4ED93E3E
      B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444BF6D6DEE7777F072
      72EE6767E75A5ADE5454DE3F3FB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4444C06D6DEE7777F07272EE6767E75A5ADE5454DE3C3CB6FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444C16868EA7575EE7777F072
      72EE6767E75A5ADE4D4DD54E4EDA3C3CB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      4444C26464E57070E77676EE7777F16B6BEE6363E95A5ADE4C4CD44444CE4D4D
      D93C3CB6FFFFFFFFFFFFFFFFFF4444C45E5EDF6868DE7070E77575EE6C6CEF44
      44C04444BF5A5AE34D4DD54343CD4242CC4D4DD93C3CB6FFFFFF8888D74B4BD2
      6060D96868DD7070E76B6BED4545C2FFFFFFFFFFFF4343BE5353DE4444CE4242
      CC4848D34343CA8888CDFFFFFF7474D15151D76969E26868E94646C4FFFFFFFF
      FFFFFFFFFFFFFFFF4242BD4E4EDA4848D34545CE7777C8FFFFFFFFFFFFFFFFFF
      7474D14F4FD74646C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4242BD4343
      CC7878CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787D6FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DD3FFFFFFFFFFFFFFFFFF}
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BtnCancelClick
  end
  object BtnOk: TBitBtn
    Left = 547
    Top = 264
    Width = 94
    Height = 25
    Caption = '&Send'
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF84CA8454B757ADDBADFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81CA8152D47A72F4A53E
      B850FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF8CD08C4BCD6D74F09777F08D63E69269BE6AFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF864ACC6B6FEB9476EE8A77F08C72
      F19244C561FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CCC7B
      4BCE6F69E48B70E78573F19C74F39C72EF8865EA944DB651FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF95D7954ACE6E61DA7F68DE7D68E89742BD5044C55E70
      F19468E9824DD27497D297FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53C3575CD887
      5FD47362E39144BD4FFFFFFF79C97960E48E68E87D5FE6863DB84DFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF7CD07C4ED27555D88047BE50FFFFFFFFFFFFFFFFFF40
      BE5067EC8F5BDF6F53DC815CBB5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDA9B
      91D690FFFFFFFFFFFFFFFFFFFFFFFF92D49252D87B5BE07351D96A44CA689CD5
      9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4EBC535BE3894ED55F4DD9733BB84DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FC25653DC7644CE554DD8
      7A4BB750FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF8FD38F49D16F47D15F44CE5749D27471C471FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC15F4DD87A43CD
      5547D26241C661A6D9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF46BC4D4DD97A42CC524EDA7952BA56FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBD
      4C4FDB7E49D37472C673FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC56A85CE85F1F7F1}
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BtnOkClick
  end
  object PopupMenu1: TPopupMenu
    Left = 234
    Top = 158
    object AddtoSendList1: TMenuItem
      Caption = '&Add to Send List'
      OnClick = AddtoSendList1Click
    end
    object SelectAll1: TMenuItem
      Caption = '&Select All'
      OnClick = SelectAll1Click
    end
    object Replaceemail1: TMenuItem
      Caption = '&Use Contact e-mail'
      OnClick = Replaceemail1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ClearSendtoList1: TMenuItem
      Caption = '&Clear All'
      OnClick = ClearSendtoList1Click
    end
  end
end
