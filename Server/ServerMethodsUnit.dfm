object ServerMethods: TServerMethods
  OldCreateOrder = False
  Height = 405
  Width = 542
  object FDQueryName: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select * from Name t'
      'order by LastName, FirstName')
    Left = 24
    Top = 54
  end
  object dspName: TDataSetProvider
    DataSet = FDQueryName
    Left = 24
    Top = 8
  end
  object dspPhoneKind: TDataSetProvider
    DataSet = FDQueryPhoneKind
    Left = 120
    Top = 8
  end
  object FDQueryPhoneKind: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select * from PhoneKind'
      'order by Id')
    Left = 120
    Top = 54
  end
  object dspEmailKind: TDataSetProvider
    DataSet = FDQueryEmailKind
    Left = 216
    Top = 8
  end
  object FDQueryEmailKind: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select * from EmailKind'
      'order by Id')
    Left = 216
    Top = 54
  end
  object dspAddressKind: TDataSetProvider
    DataSet = FDQueryAddressKind
    Left = 320
    Top = 8
  end
  object FDQueryAddressKind: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select * from AddressKind'
      'order by Id')
    Left = 320
    Top = 54
  end
  object FDQueryExec: TFDQuery
    Connection = DMServer.ContactsConnection
    Left = 456
    Top = 56
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 456
    Top = 8
  end
  object dspPhoneData: TDataSetProvider
    DataSet = FDQueryPhoneData
    Left = 120
    Top = 136
  end
  object FDQueryPhoneData: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select p.*, pd.PhoneKindId, pd.PhoneValue from phone p'
      'left join phonedata pd on p.PhoneDataId = pd.Id'
      'where p.NameId = :pNameId'
      'order by id')
    Left = 120
    Top = 182
    ParamData = <
      item
        Name = 'PNAMEID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspEmailData: TDataSetProvider
    DataSet = FDQueryEmailData
    Left = 216
    Top = 136
  end
  object FDQueryEmailData: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select p.*, pd.EmailKindId, pd.EmailValue from Email p'
      'left join Emaildata pd on p.EmailDataId = pd.Id'
      'where p.NameId = :pNameId'
      'order by id')
    Left = 216
    Top = 182
    ParamData = <
      item
        Name = 'PNAMEID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspAddressData: TDataSetProvider
    DataSet = FDQueryAddressData
    Left = 320
    Top = 136
  end
  object FDQueryAddressData: TFDQuery
    Connection = DMServer.ContactsConnection
    SQL.Strings = (
      'select p.*, pd.AddressKindId, pd.* from Address p'
      'left join Addressdata pd on p.AddressDataId = pd.Id'
      'where p.NameId = :pNameId'
      'order by id')
    Left = 320
    Top = 182
    ParamData = <
      item
        Name = 'PNAMEID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
