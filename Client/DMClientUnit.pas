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
  private
    { Private declarations }
  public

  end;

var
  DMClient: TDMClient;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
