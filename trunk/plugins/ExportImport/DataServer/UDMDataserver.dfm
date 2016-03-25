object DMDataserver: TDMDataserver
  OldCreateOrder = False
  Left = 403
  Top = 227
  Height = 200
  Width = 215
  object ZConnection1: TUniconnection
    Protocol = 'firebird-1.5'
    Left = 40
    Top = 8
  end
  object ZQuery: TuniQuery
    Connection = ZConnection1
    Params = <>
    Left = 40
    Top = 56
  end
end
