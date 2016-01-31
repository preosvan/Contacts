program ContactsClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  DMClientUnit in 'DMClientUnit.pas' {DMClient: TDataModule},
  SysConfigUnit in '..\SysConfigUnit.pas',
  ConfigClientUnit in 'ConfigClientUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDMClient, DMClient);
  Application.Run;
end.
