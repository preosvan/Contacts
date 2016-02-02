unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, FireDAC.Comp.UI, DMServerUnit;

type
  TServerMethods = class(TDSServerModule)
    FDQueryName: TFDQuery;
    dspName: TDataSetProvider;
    dspPhoneKind: TDataSetProvider;
    FDQueryPhoneKind: TFDQuery;
    dspEmailKind: TDataSetProvider;
    FDQueryEmailKind: TFDQuery;
    dspAddressKind: TDataSetProvider;
    FDQueryAddressKind: TFDQuery;
    FDQueryExec: TFDQuery;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    dspPhoneData: TDataSetProvider;
    FDQueryPhoneData: TFDQuery;
    dspEmailData: TDataSetProvider;
    FDQueryEmailData: TFDQuery;
    dspAddressData: TDataSetProvider;
    FDQueryAddressData: TFDQuery;
  private
    procedure ExecSQL(ASQL: string);
    procedure PhoneDataInsUpd(APhoneKindId: Integer; APhoneValue: string);
    procedure EmailDataInsUpd(AEmailKindId: Integer; AEmailValue: string);
    procedure AddressDataInsUpd(AAddressKindId: Integer;
      ACountryName, AStateName, ACityName, AStreetName, AHouse, AApartment: string);
  public
    procedure PhoneInsUpd(ANameId, APhoneKindId: Integer; APhoneValue: string);
    procedure PhoneDelete(AId: Integer);
    procedure EmailInsUpd(ANameId, AEmailKindId: Integer; AEmailValue: string);
    procedure EmailDelete(AId: Integer);
    procedure AddressInsUpd(ANameId, AAddressKindId: Integer;
      ACountryName, AStateName, ACityName, AStreetName, AHouse, AApartment: string);
    procedure AddressDelete(AId: Integer);
    function GetMaxNameId: Integer;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


{ TServerMethods }

procedure TServerMethods.AddressDataInsUpd(AAddressKindId: Integer;
  ACountryName, AStateName, ACityName, AStreetName, AHouse, AApartment: string);
var
  SqlStr: string;
begin
  SqlStr := 'INSERT OR IGNORE INTO AddressData(' +
    'CountryName, StateName, CityName, StreetName, House, Apartment, AddressKindId) ' +
    'VALUES(' +
      QuotedStr(ACountryName) + ', ' +
      QuotedStr(AStateName) + ', ' +
      QuotedStr(ACityName) + ', ' +
      QuotedStr(AStreetName) + ', ' +
      QuotedStr(AHouse) + ', ' +
      QuotedStr(AApartment) + ', ' +
      AAddressKindId.ToString + ')';
  ExecSQL(SqlStr);
end;

procedure TServerMethods.AddressDelete(AId: Integer);
begin
  ExecSQL('delete from address where id = ' + AId.ToString);
end;

procedure TServerMethods.AddressInsUpd(ANameId, AAddressKindId: Integer;
  ACountryName, AStateName, ACityName, AStreetName, AHouse, AApartment: string);
var
  SqlStr: string;
begin
  AddressDataInsUpd(AAddressKindId,
    ACountryName, AStateName, ACityName, AStreetName, AHouse, AApartment);

  SqlStr :=
    'INSERT OR IGNORE INTO Address(AddressDataId, NameId) ' +
    'VALUES( ' +
      '(select t.id from AddressData t where ' +
        't.CountryName = ' + QuotedStr(ACountryName) + ' and ' +
        't.StateName = ' + QuotedStr(AStateName) + ' and ' +
        't.CityName = ' + QuotedStr(ACityName) + ' and ' +
        't.StreetName = ' + QuotedStr(AStreetName) + ' and ' +
        't.House = ' + QuotedStr(AHouse) + ' and ' +
        't.Apartment = ' + QuotedStr(AApartment) + ' and ' +
        't.AddressKindId = ' + AAddressKindId.ToString + '), ' +
        ANameId.ToString +
          ')';
  ExecSQL(SqlStr);
end;

procedure TServerMethods.EmailDataInsUpd(AEmailKindId: Integer;
  AEmailValue: string);
var
  SqlStr: string;
begin
  SqlStr := 'INSERT OR IGNORE INTO EmailData(EmailValue, EmailKindId) ' +
            'VALUES(' + QuotedStr(AEmailValue) + ', ' + IntToStr(AEmailKindId) + ')';
  ExecSQL(SqlStr);
end;

procedure TServerMethods.EmailDelete(AId: Integer);
begin
  ExecSQL('delete from email where id = ' + AId.ToString);
end;

procedure TServerMethods.EmailInsUpd(ANameId, AEmailKindId: Integer;
  AEmailValue: string);
var
  SqlStr: string;
begin
  EmailDataInsUpd(AEmailKindId, AEmailValue);
  SqlStr :=
    'INSERT OR IGNORE INTO Email(EmailDataId, NameId) ' +
    'VALUES( ' +
      '(select t.id from EmailData t where t.EmailValue = ' + QuotedStr(AEmailValue) + ' and t.EmailKindId = ' + AEmailKindId.ToString + '), ' +
      ANameId.ToString +
          ')';
  ExecSQL(SqlStr);
end;

procedure TServerMethods.ExecSQL(ASQL: string);
begin
  if DMServer.ContactsConnection.Connected then
  begin
    if FDQueryExec.Active then
      FDQueryExec.Close;
    FDQueryExec.SQL.Text := ASQL;
    try
      FDQueryExec.ExecSQL;
    except
      //logging
    end;
  end;
end;

function TServerMethods.GetMaxNameId: Integer;
begin
  Result := 0;
  if DMServer.ContactsConnection.Connected then
  begin
    if FDQueryExec.Active then
      FDQueryExec.Close;
    FDQueryExec.SQL.Text := 'select max(Id) max_id from Name';
    try
      FDQueryExec.Active := True;
      if not FDQueryExec.FieldByName('max_id').IsNull then
        Result := FDQueryExec.FieldByName('max_id').AsInteger;
    except
      //logging
    end;
  end;
end;

procedure TServerMethods.PhoneDataInsUpd(APhoneKindId: Integer;
  APhoneValue: string);
var
  SqlStr: string;
begin
  SqlStr := 'INSERT OR IGNORE INTO PhoneData(PhoneValue, PhoneKindId) ' +
            'VALUES(' + QuotedStr(APhoneValue) + ', ' + IntToStr(APhoneKindId) + ')';
  ExecSQL(SqlStr);
end;

procedure TServerMethods.PhoneDelete(AId: Integer);
begin
  ExecSQL('delete from phone where id = ' + AId.ToString);
end;

procedure TServerMethods.PhoneInsUpd(ANameId, APhoneKindId: Integer;
  APhoneValue: string);
var
  SqlStr: string;
begin
  PhoneDataInsUpd(APhoneKindId, APhoneValue);
  SqlStr :=
    'INSERT OR IGNORE INTO Phone(PhoneDataId, NameId) ' +
    'VALUES( ' +
      '(select t.id from phoneData t where t.PhoneValue = ' + QuotedStr(APhoneValue) + ' and t.PhoneKindId = ' + APhoneKindId.ToString + '), ' +
      ANameId.ToString +
          ')';
  ExecSQL(SqlStr);
end;

end.

