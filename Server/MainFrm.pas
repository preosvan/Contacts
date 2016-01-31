unit MainFrm;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Edit, FMX.Types, FMX.Controls.Presentation,
  System.UITypes;

type
  TMainForm = class(TForm)
    btnStart: TButton;
    btnStop: TButton;
    edPort: TEdit;
    lbPort: TLabel;
    edPathToDB: TEdit;
    lbPathToDB: TLabel;
    btnPathToDB: TButton;
    btnTestConnectionDB: TButton;
    procedure btnTestConnectionDBClick(Sender: TObject);
    procedure btnPathToDBClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edPortChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    procedure InitConfig;
    procedure InitServerStatus;
    procedure SetServerStatus(AIsStart: Boolean);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  ServerMethodsUnit, DMServerUnit, ConfigServerUnit, ServerContainerUnit;

{$R *.fmx}

procedure TMainForm.btnPathToDBClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.FileName := Trim(edPathToDB.Text);
    OpenDialog.InitialDir :=  ExtractFileDir(Trim(edPathToDB.Text));
    OpenDialog.Filter := 'Database files|*.sqlite3';
    if OpenDialog.Execute then
    begin
      edPathToDB.Text := OpenDialog.FileName;
      ServerConfig.DBPath := edPathToDB.Text;
      DMServer.ContactsConnection.Close;
      DMServer.ContactsConnection.Params.Values['Database'] := ServerConfig.DBPath;
      DMServer.ContactsConnection.Open;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TMainForm.btnStartClick(Sender: TObject);
begin
  SetServerStatus(True);
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  SetServerStatus(False);
end;

procedure TMainForm.btnTestConnectionDBClick(Sender: TObject);
begin
  try
    DMServer.ContactsConnection.Open;
    if DMServer.ContactsConnection.Connected then
    begin
      ShowMessage('Ok');
      DMServer.ContactsConnection.Close;
    end;
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TMainForm.edPortChange(Sender: TObject);
begin
  ServerConfig.ServerPort := StrToIntDef(edPort.Text, 211);
  ServerContainer.DSTCPServerTransport.Port := ServerConfig.ServerPort;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ServerConfig.Apply;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  InitConfig;
end;

procedure TMainForm.InitConfig;
begin
  edPort.Text := IntToStr(ServerConfig.ServerPort);
  ServerContainer.DSTCPServerTransport.Port := ServerConfig.ServerPort;
  edPathToDB.Text := ServerConfig.DBPath;
  DMServer.ContactsConnection.Params.Values['Database'] := ServerConfig.DBPath;
  try
    DMServer.ContactsConnection.Connected := True;
  except on e: Exception do
    ShowMessage('Error connect to database: ' + e.Message);
  end;
  InitServerStatus;
end;

procedure TMainForm.InitServerStatus;
begin
  btnStart.Enabled := not ServerContainer.DSServer.Started;
  btnStop.Enabled := ServerContainer.DSServer.Started;
end;

procedure TMainForm.SetServerStatus(AIsStart: Boolean);
begin
  if AIsStart then
    ServerContainer.DSServer.Start
  else
    ServerContainer.DSServer.Stop;
  InitServerStatus;
end;

end.

