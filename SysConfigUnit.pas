unit SysConfigUnit;

interface

uses
  IniFiles;

type
  TCustomConfig = class
  private
    FIniFile: TIniFile;
    FServerPort: Integer;
  public
    constructor Create(APathToConfig: string);
    destructor Destroy; override;
    procedure Apply; virtual;
    procedure Load; virtual;
    property ServerPort: Integer read FServerPort write FServerPort;
    property IniFile: TIniFile read FIniFile write FIniFile;
  end;

const
  SECTION_GENERAL = 'GENERAL';
  KEY_SERVER_PORT = 'ServerPort';

implementation

uses
  System.SysUtils;

{ TServerConfig }

procedure TCustomConfig.Apply;
begin
  IniFile.WriteInteger(SECTION_GENERAL, KEY_SERVER_PORT, ServerPort);
end;

constructor TCustomConfig.Create(APathToConfig: string);
begin
  FIniFile := TIniFile.Create(APathToConfig);
  Load;
end;

destructor TCustomConfig.Destroy;
begin
  Apply;
  if Assigned(FIniFile) then
    FIniFile.Free;
  inherited;
end;

procedure TCustomConfig.Load;
begin
  FServerPort := FIniFile.ReadInteger(SECTION_GENERAL, KEY_SERVER_PORT, 211);
end;

end.


