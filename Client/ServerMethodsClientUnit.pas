unit ServerMethodsClientUnit;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethodsClient = class(TDSAdminClient)
  private
    FPhoneInsUpdCommand: TDBXCommand;
    FPhoneDeleteCommand: TDBXCommand;
    FEmailInsUpdCommand: TDBXCommand;
    FEmailDeleteCommand: TDBXCommand;
    FAddressInsUpdCommand: TDBXCommand;
    FAddressDeleteCommand: TDBXCommand;
    FGetMaxNameIdCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure PhoneInsUpd(ANameId: Integer; APhoneKindId: Integer; APhoneValue: string);
    procedure PhoneDelete(AId: Integer);
    procedure EmailInsUpd(ANameId: Integer; AEmailKindId: Integer; AEmailValue: string);
    procedure EmailDelete(AId: Integer);
    procedure AddressInsUpd(ANameId: Integer; AAddressKindId: Integer; ACountryName: string; AStateName: string; ACityName: string; AStreetName: string; AHouse: string; AApartment: string);
    procedure AddressDelete(AId: Integer);
    function GetMaxNameId: Integer;
  end;

var
  dsClient: TServerMethodsClient;

implementation

procedure TServerMethodsClient.PhoneInsUpd(ANameId: Integer; APhoneKindId: Integer; APhoneValue: string);
begin
  if FPhoneInsUpdCommand = nil then
  begin
    FPhoneInsUpdCommand := FDBXConnection.CreateCommand;
    FPhoneInsUpdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPhoneInsUpdCommand.Text := 'TServerMethods.PhoneInsUpd';
    FPhoneInsUpdCommand.Prepare;
  end;
  FPhoneInsUpdCommand.Parameters[0].Value.SetInt32(ANameId);
  FPhoneInsUpdCommand.Parameters[1].Value.SetInt32(APhoneKindId);
  FPhoneInsUpdCommand.Parameters[2].Value.SetWideString(APhoneValue);
  FPhoneInsUpdCommand.ExecuteUpdate;
end;

procedure TServerMethodsClient.PhoneDelete(AId: Integer);
begin
  if FPhoneDeleteCommand = nil then
  begin
    FPhoneDeleteCommand := FDBXConnection.CreateCommand;
    FPhoneDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPhoneDeleteCommand.Text := 'TServerMethods.PhoneDelete';
    FPhoneDeleteCommand.Prepare;
  end;
  FPhoneDeleteCommand.Parameters[0].Value.SetInt32(AId);
  FPhoneDeleteCommand.ExecuteUpdate;
end;

procedure TServerMethodsClient.EmailInsUpd(ANameId: Integer; AEmailKindId: Integer; AEmailValue: string);
begin
  if FEmailInsUpdCommand = nil then
  begin
    FEmailInsUpdCommand := FDBXConnection.CreateCommand;
    FEmailInsUpdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmailInsUpdCommand.Text := 'TServerMethods.EmailInsUpd';
    FEmailInsUpdCommand.Prepare;
  end;
  FEmailInsUpdCommand.Parameters[0].Value.SetInt32(ANameId);
  FEmailInsUpdCommand.Parameters[1].Value.SetInt32(AEmailKindId);
  FEmailInsUpdCommand.Parameters[2].Value.SetWideString(AEmailValue);
  FEmailInsUpdCommand.ExecuteUpdate;
end;

procedure TServerMethodsClient.EmailDelete(AId: Integer);
begin
  if FEmailDeleteCommand = nil then
  begin
    FEmailDeleteCommand := FDBXConnection.CreateCommand;
    FEmailDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmailDeleteCommand.Text := 'TServerMethods.EmailDelete';
    FEmailDeleteCommand.Prepare;
  end;
  FEmailDeleteCommand.Parameters[0].Value.SetInt32(AId);
  FEmailDeleteCommand.ExecuteUpdate;
end;

procedure TServerMethodsClient.AddressInsUpd(ANameId: Integer; AAddressKindId: Integer; ACountryName: string; AStateName: string; ACityName: string; AStreetName: string; AHouse: string; AApartment: string);
begin
  if FAddressInsUpdCommand = nil then
  begin
    FAddressInsUpdCommand := FDBXConnection.CreateCommand;
    FAddressInsUpdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddressInsUpdCommand.Text := 'TServerMethods.AddressInsUpd';
    FAddressInsUpdCommand.Prepare;
  end;
  FAddressInsUpdCommand.Parameters[0].Value.SetInt32(ANameId);
  FAddressInsUpdCommand.Parameters[1].Value.SetInt32(AAddressKindId);
  FAddressInsUpdCommand.Parameters[2].Value.SetWideString(ACountryName);
  FAddressInsUpdCommand.Parameters[3].Value.SetWideString(AStateName);
  FAddressInsUpdCommand.Parameters[4].Value.SetWideString(ACityName);
  FAddressInsUpdCommand.Parameters[5].Value.SetWideString(AStreetName);
  FAddressInsUpdCommand.Parameters[6].Value.SetWideString(AHouse);
  FAddressInsUpdCommand.Parameters[7].Value.SetWideString(AApartment);
  FAddressInsUpdCommand.ExecuteUpdate;
end;

procedure TServerMethodsClient.AddressDelete(AId: Integer);
begin
  if FAddressDeleteCommand = nil then
  begin
    FAddressDeleteCommand := FDBXConnection.CreateCommand;
    FAddressDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAddressDeleteCommand.Text := 'TServerMethods.AddressDelete';
    FAddressDeleteCommand.Prepare;
  end;
  FAddressDeleteCommand.Parameters[0].Value.SetInt32(AId);
  FAddressDeleteCommand.ExecuteUpdate;
end;

function TServerMethodsClient.GetMaxNameId: Integer;
begin
  if FGetMaxNameIdCommand = nil then
  begin
    FGetMaxNameIdCommand := FDBXConnection.CreateCommand;
    FGetMaxNameIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetMaxNameIdCommand.Text := 'TServerMethods.GetMaxNameId';
    FGetMaxNameIdCommand.Prepare;
  end;
  FGetMaxNameIdCommand.ExecuteUpdate;
  Result := FGetMaxNameIdCommand.Parameters[0].Value.GetInt32;
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethodsClient.Destroy;
begin
  FPhoneInsUpdCommand.DisposeOf;
  FPhoneDeleteCommand.DisposeOf;
  FEmailInsUpdCommand.DisposeOf;
  FEmailDeleteCommand.DisposeOf;
  FAddressInsUpdCommand.DisposeOf;
  FAddressDeleteCommand.DisposeOf;
  FGetMaxNameIdCommand.DisposeOf;
  inherited;
end;

end.
