object Form1: TForm1
  Left = 345
  Top = 190
  Width = 640
  Height = 480
  Caption = 'Demo: MemCheck'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 427
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Shape7: TShape
      Left = 0
      Top = 346
      Width = 201
      Height = 81
      Align = alClient
      Brush.Color = 16444124
      Pen.Color = 13208139
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 88
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Shape5: TShape
        Left = 0
        Top = 25
        Width = 201
        Height = 63
        Align = alClient
        Brush.Color = 16444124
        Pen.Color = 13208139
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 201
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 201
          Height = 25
          Align = alClient
          Brush.Color = 16042402
          Pen.Color = 13208139
        end
        object tFilter: TStaticText
          Left = 7
          Top = 4
          Width = 117
          Height = 18
          Caption = 'MemCheck Leaks Filter:'
          Color = 16042402
          ParentColor = False
          TabOrder = 0
        end
      end
      object cbTraceObjects: TCheckBox
        Left = 12
        Top = 32
        Width = 153
        Height = 17
        Caption = 'Trace Objects'
        Checked = True
        Color = 16444124
        ParentColor = False
        State = cbChecked
        TabOrder = 1
        OnClick = cbTraceFilerChanged_Click
      end
      object cbTraceGetMem: TCheckBox
        Left = 12
        Top = 48
        Width = 153
        Height = 17
        Caption = 'Trace GetMem'
        Checked = True
        Color = 16444124
        ParentColor = False
        State = cbChecked
        TabOrder = 2
        OnClick = cbTraceFilerChanged_Click
      end
      object cbTraceReallocMem: TCheckBox
        Left = 12
        Top = 64
        Width = 153
        Height = 17
        Caption = 'Trace ReallocMem'
        Checked = True
        Color = 16444124
        ParentColor = False
        State = cbChecked
        TabOrder = 3
        OnClick = cbTraceFilerChanged_Click
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 88
      Width = 201
      Height = 258
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Shape6: TShape
        Left = 0
        Top = 25
        Width = 201
        Height = 233
        Align = alClient
        Brush.Color = 16444124
        Pen.Color = 13208139
      end
      object btnMemCheckTransactionNew: TButton
        Left = 12
        Top = 36
        Width = 177
        Height = 25
        Caption = 'MemCheck: New Transaction'
        TabOrder = 1
        OnClick = btnMemCheckTransactionNew_Click
      end
      object btnLeakObject: TButton
        Left = 108
        Top = 64
        Width = 81
        Height = 25
        Caption = 'Leak Object'
        TabOrder = 2
        OnClick = btnLeakObject_Click
      end
      object btnLeakMem: TButton
        Left = 108
        Top = 91
        Width = 81
        Height = 25
        Caption = 'Leak Memory'
        TabOrder = 3
        OnClick = btnLeakMem_Click
      end
      object btnLeakMemRealloc: TButton
        Left = 108
        Top = 118
        Width = 81
        Height = 25
        Caption = 'Leak Realloc'
        TabOrder = 4
        OnClick = btnLeakMemRealloc_Click
      end
      object btnMemCheckTransactionShowLeaks: TButton
        Left = 12
        Top = 147
        Width = 177
        Height = 25
        Caption = 'MemCheck: Show Leaks'
        TabOrder = 5
        OnClick = btnMemCheckTransactionShowLeaks_Click
      end
      object cbRaiseLeakFirstAddress: TCheckBox
        Left = 36
        Top = 172
        Width = 153
        Height = 17
        Caption = 'Raise Leak First Address'
        Color = 16444124
        ParentColor = False
        TabOrder = 6
      end
      object cbRaiseLeakAllAddresses: TCheckBox
        Left = 36
        Top = 188
        Width = 153
        Height = 17
        Caption = 'Raise Leak All Addresses'
        Color = 16444124
        ParentColor = False
        TabOrder = 7
      end
      object cbCheckWipedBlocks: TCheckBox
        Left = 36
        Top = 204
        Width = 153
        Height = 17
        Caption = 'Check Wiped Blocks'
        Checked = True
        Color = 16444124
        ParentColor = False
        State = cbChecked
        TabOrder = 8
      end
      object btnMemCheckTransactionHideLeaks: TButton
        Left = 12
        Top = 222
        Width = 177
        Height = 25
        Caption = 'MemCheck: Hide Leaks'
        TabOrder = 9
        OnClick = btnMemCheckTransactionHideLeaks_Click
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 201
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 201
          Height = 25
          Align = alClient
          Brush.Color = 16042402
          Pen.Color = 13208139
        end
        object StaticText1: TStaticText
          Left = 7
          Top = 4
          Width = 151
          Height = 18
          Caption = 'MemCheck Leaks Transaction:'
          Color = 16042402
          ParentColor = False
          TabOrder = 0
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 201
    Top = 0
    Width = 431
    Height = 427
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Shape4: TShape
      Left = 0
      Top = 56
      Width = 431
      Height = 371
      Align = alClient
      Brush.Color = 16042402
      Pen.Color = 13208139
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 431
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 431
        Height = 56
        Align = alClient
        Brush.Color = 16042402
        Pen.Color = 13208139
      end
      object tLeaks: TStaticText
        Left = 5
        Top = 22
        Width = 36
        Height = 18
        Caption = 'Leaks:'
        Color = 16042402
        ParentColor = False
        TabOrder = 0
      end
      object tVersion: TStaticText
        Left = 5
        Top = 8
        Width = 98
        Height = 18
        Caption = 'MemCheck version:'
        Color = 16042402
        ParentColor = False
        TabOrder = 1
      end
    end
    object mLeaks: TMemo
      Left = 2
      Top = 58
      Width = 427
      Height = 368
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 16119285
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
  end
end
