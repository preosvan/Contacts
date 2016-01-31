object ServerMethods: TServerMethods
  OldCreateOrder = False
  Height = 275
  Width = 228
  object FDQueryName: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select * from Name t'
      'order by LastName, FirstName')
    Left = 48
    Top = 174
  end
  object dspName: TDataSetProvider
    DataSet = FDQueryName
    Left = 48
    Top = 128
  end
end
