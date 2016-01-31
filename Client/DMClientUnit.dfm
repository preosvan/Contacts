object DMClient: TDMClient
  OldCreateOrder = False
  Height = 214
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
    Left = 64
    Top = 112
  end
end
