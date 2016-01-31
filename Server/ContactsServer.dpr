program ContactsServer;

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  MainFrm in 'MainFrm.pas' {MainForm},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods: TDSServerModule},
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer: TDataModule},
  SysConfigUnit in '..\SysConfigUnit.pas',
  DMServerUnit in 'DMServerUnit.pas' {DMServer: TDataModule},
  ConfigServerUnit in 'ConfigServerUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TDMServer, DMServer);
  Application.Run;
end.

