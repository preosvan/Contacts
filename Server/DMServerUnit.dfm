object DMServer: TDMServer
  OldCreateOrder = False
  Height = 147
  Width = 228
  object ContactsConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Contacts')
    LoginPrompt = False
    Left = 43
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 144
    Top = 24
  end
end
