inherited fmGenOsfSearch: TfmGenOsfSearch
  Width = 504
  Height = 351
  Caption = 'fmGenOsfSearch'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PPrintoptions: TPanel
    Width = 496
  end
  inherited ButtonPanel: TPanel
    Top = 283
    Width = 496
    inherited BtnOk: TBitBtn
      Left = 285
      OnClick = BtnOkClick
    end
    inherited BtnCancel: TBitBtn
      Left = 385
      ModalResult = 2
    end
  end
end
