object FRpExpredialogVCL: TFRpExpredialogVCL
  Left = 320
  Top = 101
  Width = 552
  Height = 566
  Caption = 'Dialog'
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PBottom: TPanel
    Left = 0
    Top = 203
    Width = 544
    Height = 329
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 156
      Width = 544
      Height = 173
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 132
        Width = 544
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BCancel: TButton
          Left = 100
          Top = 8
          Width = 85
          Height = 25
          Caption = '&Cancel'
          ModalResult = 2
          TabOrder = 0
        end
        object BOK: TButton
          Left = 4
          Top = 8
          Width = 85
          Height = 25
          Caption = '&OK'
          Default = True
          TabOrder = 1
          OnClick = BOKClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 544
        Height = 132
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 1
        object LParams: TLabel
          Left = 2
          Top = 81
          Width = 540
          Height = 49
          Align = alBottom
          AutoSize = False
          Caption = 'Params'
          WordWrap = True
        end
        object LModel: TLabel
          Left = 2
          Top = 15
          Width = 540
          Height = 66
          Align = alClient
          AutoSize = False
          Caption = 'LModel'
          WordWrap = True
        end
        object LHelp: TLabel
          Left = 2
          Top = 2
          Width = 540
          Height = 13
          Align = alTop
          Caption = 'Help'
        end
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 544
      Height = 156
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 1
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 122
        Height = 152
        Align = alLeft
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object LabelCategory: TLabel
          Left = 2
          Top = 2
          Width = 118
          Height = 13
          Align = alTop
          Caption = 'Category'
        end
        object LCategory: TListBox
          Left = 2
          Top = 15
          Width = 118
          Height = 135
          Align = alClient
          ItemHeight = 13
          Items.Strings = (
            'Database fields'
            'Functions'
            'Variables'
            'Constants'
            'Operators')
          TabOrder = 0
          OnClick = LCategoryClick
        end
      end
      object Panel3: TPanel
        Left = 124
        Top = 2
        Width = 418
        Height = 152
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LOperation: TLabel
          Left = 0
          Top = 0
          Width = 418
          Height = 13
          Align = alTop
          Caption = 'Operation'
        end
        object LItems: TListBox
          Left = 0
          Top = 13
          Width = 418
          Height = 139
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = LItemsClick
          OnDblClick = LItemsDblClick
        end
      end
    end
  end
  object PAlClient: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 203
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object MemoExpre: TMemo
      Left = 0
      Top = 0
      Width = 544
      Height = 170
      Align = alClient
      Lines.Strings = (
        'MemoExpre')
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 170
      Width = 544
      Height = 33
      Align = alBottom
      TabOrder = 1
      object BShowResult: TButton
        Left = 312
        Top = 4
        Width = 149
        Height = 25
        Hint = 'Evaluates the expresion and shows the result'
        Caption = 'Show Result'
        TabOrder = 0
        OnClick = BShowResultClick
      end
      object BCheckSyn: TButton
        Left = 148
        Top = 4
        Width = 145
        Height = 25
        Hint = 'Syntax check the expresion'
        Caption = 'Syntax check'
        TabOrder = 1
        OnClick = BCheckSynClick
      end
      object BAdd: TButton
        Left = 4
        Top = 4
        Width = 129
        Height = 25
        Caption = 'Add selection'
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
end
