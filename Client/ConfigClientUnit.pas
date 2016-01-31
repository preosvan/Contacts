unit ConfigClientUnit;

interface

uses
  SysConfigUnit;

type
  TClientConfig = class(TCustomConfig)
  private
    FServerHost: string;
  public
    procedure Apply; override;
    procedure Load; override;
    property ServerHost: string read FServerHost write FServerHost;
  end;

const
  KEY_SERVER_HOST = 'ServerHost';

var
  ClientConfig: TClientConfig;

implementation

uses
  System.SysUtils;

{ TServerConfig }

procedure TClientConfig.Apply;
begin
  inherited;
  IniFile.WriteString(SECTION_GENERAL, KEY_SERVER_HOST, ServerHost);
end;

procedure TClientConfig.Load;
var
  DefDBName: string;
begin
  inherited;
  FServerHost := IniFile.ReadString(SECTION_GENERAL, KEY_SERVER_HOST, '127.0.0.1');
end;

initialization
  ClientConfig := TClientConfig.Create(ExtractFilePath(ParamStr(0)) + 'ServerConfig.ini');

finalization
  if Assigned(ClientConfig) then
    ClientConfig.Free;

end.


