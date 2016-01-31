unit ServerContainerUnit;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSProxyJavaAndroid, Datasnap.DSProxyJavaBlackBerry,
  Datasnap.DSProxyObjectiveCiOS, Datasnap.DSProxyCsharpSilverlight,
  Datasnap.DSProxyFreePascal_iOS,
  Datasnap.DSAuth, IPPeerServer, Datasnap.DSMetadata, Datasnap.DSServerMetadata,
  Datasnap.DSHTTP;

type
  TServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    DSHTTPServiceProxyDispatcher: TDSHTTPServiceProxyDispatcher;
    DSProxyGenerator: TDSProxyGenerator;
    DSServerMetaDataProvider: TDSServerMetaDataProvider;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

var
  ServerContainer: TServerContainer;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses Winapi.Windows, ServerMethodsUnit;

procedure TServerContainer.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods;
end;


end.

