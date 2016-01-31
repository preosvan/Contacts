unit ConfigServerUnit;

interface

uses
  SysConfigUnit;

type
  TServerConfig = class(TCustomConfig)
  private
    FDBPath: string;
  public
    procedure Apply; override;
    procedure Load; override;
    property DBPath: string read FDBPath write FDBPath;
  end;

const
  KEY_DB_PATH = 'DBPath';

var
  ServerConfig: TServerConfig;

implementation

uses
  System.SysUtils;

{ TServerConfig }

procedure TServerConfig.Apply;
begin
  inherited;
  IniFile.WriteString(SECTION_GENERAL, KEY_DB_PATH, DBPath);
end;

procedure TServerConfig.Load;
var
  DefDBName: string;
begin
  inherited;
  DefDBName := ExtractFilePath(ParamStr(0)) + 'Data.sqlite3';
  FDBPath := IniFile.ReadString(SECTION_GENERAL, KEY_DB_PATH, DefDBName);
end;

initialization
  ServerConfig := TServerConfig.Create(ExtractFilePath(ParamStr(0)) + 'ServerConfig.ini');

finalization
  if Assigned(ServerConfig) then
    ServerConfig.Free;

end.


