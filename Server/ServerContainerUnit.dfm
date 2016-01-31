object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 228
  Width = 337
  object DSServer: TDSServer
    Left = 56
    Top = 11
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    Server = DSServer
    Filters = <>
    Left = 56
    Top = 65
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    Left = 224
    Top = 11
  end
  object DSHTTPServiceProxyDispatcher: TDSHTTPServiceProxyDispatcher
    WebFileExtensions = <
      item
        MimeType = 'application/x-zip-compressed'
        Extensions = 'zip'
      end>
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '\proxy\*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\proxy\*\*'
      end>
    DSProxyGenerator = DSProxyGenerator
    Left = 224
    Top = 168
  end
  object DSProxyGenerator: TDSProxyGenerator
    MetaDataProvider = DSServerMetaDataProvider
    Left = 224
    Top = 112
  end
  object DSServerMetaDataProvider: TDSServerMetaDataProvider
    Server = DSServer
    Left = 224
    Top = 64
  end
end
