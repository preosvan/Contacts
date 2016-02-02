object DMClient: TDMClient
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 420
  Width = 362
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=23.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Left = 56
    Top = 16
    UniqueId = '{33AD6408-D8D4-43D2-8CA1-5F6CE2226D1F}'
  end
  object DSProviderConnection: TDSProviderConnection
    ServerClassName = 'TServerMethods'
    SQLConnection = SQLConnection
    Left = 168
    Top = 16
  end
  object cdsName: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspName'
    RemoteServer = DSProviderConnection
    Left = 56
    Top = 88
  end
  object cdsPhoneKind: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPhoneKind'
    RemoteServer = DSProviderConnection
    Left = 56
    Top = 160
    object cdsPhoneKindId: TAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPhoneKindPhoneKindName: TStringField
      FieldName = 'PhoneKindName'
      Origin = 'PhoneKindName'
      FixedChar = True
      Size = 50
    end
  end
  object cdsEmailKind: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmailKind'
    RemoteServer = DSProviderConnection
    Left = 136
    Top = 160
    object cdsEmailKindId: TAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsEmailKindEmailKindName: TStringField
      FieldName = 'EmailKindName'
      Origin = 'EmailKindName'
      FixedChar = True
      Size = 50
    end
  end
  object cdsAddressKind: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAddressKind'
    RemoteServer = DSProviderConnection
    Left = 208
    Top = 160
    object cdsAddressKindId: TAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsAddressKindAddressKindName: TStringField
      FieldName = 'AddressKindName'
      Origin = 'AddressKindName'
      FixedChar = True
      Size = 50
    end
  end
  object cdsPhoneData: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PNAMEID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPhoneData'
    RemoteServer = DSProviderConnection
    Left = 56
    Top = 232
    object cdsPhoneDataId: TAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPhoneDataPhoneDataId: TIntegerField
      FieldName = 'PhoneDataId'
      Origin = 'PhoneDataId'
    end
    object cdsPhoneDataNameId: TIntegerField
      FieldName = 'NameId'
      Origin = 'NameId'
    end
    object cdsPhoneDataPhoneKindId: TIntegerField
      FieldName = 'PhoneKindId'
      Origin = 'PhoneKindId'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsPhoneDataPhoneValue: TStringField
      FieldName = 'PhoneValue'
      Origin = 'PhoneValue'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
  end
  object cdsEmailData: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PNAMEID'
        ParamType = ptInput
      end>
    ProviderName = 'dspEmailData'
    RemoteServer = DSProviderConnection
    Left = 136
    Top = 232
    object cdsEmailDataId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object cdsEmailDataEmailDataId: TIntegerField
      FieldName = 'EmailDataId'
    end
    object cdsEmailDataNameId: TIntegerField
      FieldName = 'NameId'
    end
    object cdsEmailDataEmailKindId: TIntegerField
      FieldName = 'EmailKindId'
      ReadOnly = True
    end
    object cdsEmailDataEmailValue: TStringField
      FieldName = 'EmailValue'
      ReadOnly = True
      FixedChar = True
      Size = 150
    end
  end
  object cdsAddressData: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PNAMEID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAddressData'
    RemoteServer = DSProviderConnection
    Left = 208
    Top = 232
    object cdsAddressDataId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object cdsAddressDataAddressDataId: TIntegerField
      FieldName = 'AddressDataId'
    end
    object cdsAddressDataNameId: TIntegerField
      FieldName = 'NameId'
    end
    object cdsAddressDataAddressKindId: TIntegerField
      FieldName = 'AddressKindId'
      ReadOnly = True
    end
    object cdsAddressDataId_1: TIntegerField
      FieldName = 'Id_1'
      ReadOnly = True
    end
    object cdsAddressDataCountryName: TStringField
      FieldName = 'CountryName'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object cdsAddressDataStateName: TStringField
      FieldName = 'StateName'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object cdsAddressDataCityName: TStringField
      FieldName = 'CityName'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object cdsAddressDataStreetName: TStringField
      FieldName = 'StreetName'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object cdsAddressDataHouse: TStringField
      FieldName = 'House'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object cdsAddressDataApartment: TStringField
      FieldName = 'Apartment'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object cdsAddressDataAddressKindId_1: TIntegerField
      FieldName = 'AddressKindId_1'
      ReadOnly = True
    end
  end
end
