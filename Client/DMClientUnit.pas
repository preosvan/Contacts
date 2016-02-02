unit DMClientUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect;

type
  TDMClient = class(TDataModule)
    SQLConnection: TSQLConnection;
    DSProviderConnection: TDSProviderConnection;
    cdsName: TClientDataSet;
    cdsPhoneKind: TClientDataSet;
    cdsPhoneKindId: TAutoIncField;
    cdsPhoneKindPhoneKindName: TStringField;
    cdsEmailKind: TClientDataSet;
    cdsAddressKind: TClientDataSet;
    cdsEmailKindId: TAutoIncField;
    cdsEmailKindEmailKindName: TStringField;
    cdsAddressKindId: TAutoIncField;
    cdsAddressKindAddressKindName: TStringField;
    cdsPhoneData: TClientDataSet;
    cdsPhoneDataId: TAutoIncField;
    cdsPhoneDataPhoneDataId: TIntegerField;
    cdsPhoneDataNameId: TIntegerField;
    cdsPhoneDataPhoneKindId: TIntegerField;
    cdsPhoneDataPhoneValue: TStringField;
    cdsEmailData: TClientDataSet;
    cdsAddressData: TClientDataSet;
    cdsEmailDataId: TAutoIncField;
    cdsEmailDataEmailDataId: TIntegerField;
    cdsEmailDataNameId: TIntegerField;
    cdsEmailDataEmailKindId: TIntegerField;
    cdsEmailDataEmailValue: TStringField;
    cdsAddressDataId: TAutoIncField;
    cdsAddressDataAddressDataId: TIntegerField;
    cdsAddressDataNameId: TIntegerField;
    cdsAddressDataAddressKindId: TIntegerField;
    cdsAddressDataId_1: TIntegerField;
    cdsAddressDataCountryName: TStringField;
    cdsAddressDataStateName: TStringField;
    cdsAddressDataCityName: TStringField;
    cdsAddressDataStreetName: TStringField;
    cdsAddressDataHouse: TStringField;
    cdsAddressDataApartment: TStringField;
    cdsAddressDataAddressKindId_1: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshNames;
  end;

var
  DMClient: TDMClient;

implementation

uses
  ServerMethodsClientUnit;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDMClient }

procedure TDMClient.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(dsClient) then
    dsClient.DisposeOf;
end;

procedure TDMClient.RefreshNames;
var
  Id: Integer;
begin
  if Assigned(cdsName) then
    if cdsName.State <> dsInsert then
    begin
      Id := 0;
      if not cdsName.IsEmpty then
        Id := cdsName.FieldByName('Id').AsInteger;
      cdsName.Active := False;
      cdsName.Active := True;
      if Id <> 0 then
        cdsName.Locate('Id', Id, []);
    end;
end;

end.
