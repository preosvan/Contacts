unit MainFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Gestures, DMClientUnit,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.Edit,
  FMX.SearchBox, FMX.Layouts, FMX.ListBox, FMX.DateTimeCtrls;

type
  TMainForm = class(TForm)
    ActionList: TActionList;
    actTabPrevious: TPreviousTabAction;
    actTabNext: TNextTabAction;
    TabControl: TTabControl;
    TabContacts: TTabItem;
    TabViewContact: TTabItem;
    BottomToolBar: TToolBar;
    TabNewContact: TTabItem;
    GestureManager: TGestureManager;
    StyleBook: TStyleBook;
    lbContacts: TListBox;
    SearchBox: TSearchBox;
    BindSourceDBName: TBindSourceDB;
    BindingsList: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    actSearchView: TAction;
    ToolBarContacts: TToolBar;
    lebContacts: TLabel;
    btnNewContact: TSpeedButton;
    btnSearch: TSpeedButton;
    actTabNewContact: TChangeTabAction;
    ToolBarNewContact: TToolBar;
    lebNewContact: TLabel;
    btnDoneNewContact: TSpeedButton;
    btnCancelNewContact: TSpeedButton;
    ToolBarViewContact: TToolBar;
    labViewContact: TLabel;
    btnEditContact: TSpeedButton;
    btnAllContacts: TSpeedButton;
    actTabContacts: TChangeTabAction;
    actTabEditContact: TChangeTabAction;
    actCancel: TAction;
    actDone: TAction;
    actEditContact: TAction;
    TabEditContact: TTabItem;
    actTabViewContact: TChangeTabAction;
    ToolBarEditContact: TToolBar;
    labEditContact: TLabel;
    btnDoneEditContact: TSpeedButton;
    btnCancelEditContact: TSpeedButton;
    TabSettings: TTabItem;
    btnSettings: TSpeedButton;
    actTabSettings: TChangeTabAction;
    laySettings: TLayout;
    edServerHost: TEdit;
    edServerPort: TEdit;
    btnConnect: TSpeedButton;
    labServerHost: TLabel;
    labServerPort: TLabel;
    labSettingsTitle: TLabel;
    labErrorMsg: TLabel;
    actConnectToServer: TAction;
    ClearEditButton1: TClearEditButton;
    SpinEditBtnPort: TSpinEditButton;
    layViewContact: TLayout;
    edFirstName: TEdit;
    edLastName: TEdit;
    DateEditView: TDateEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure actSearchViewExecute(Sender: TObject);
    procedure actTabNewContactExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDoneExecute(Sender: TObject);
    procedure lbContactsItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure actConnectToServerExecute(Sender: TObject);
    procedure SpinEditBtnPortDownClick(Sender: TObject);
    procedure SpinEditBtnPortUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edServerHostChangeTracking(Sender: TObject);
    procedure edServerPortChangeTracking(Sender: TObject);
  private
    procedure InitConfig;
    function ConnectToServer(AHost: string; APort: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  ConfigClientUnit;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TMainForm.actCancelExecute(Sender: TObject);
begin
  actTabContacts.ExecuteTarget(Self);
end;

procedure TMainForm.actConnectToServerExecute(Sender: TObject);
var
  Connected: Boolean;
begin
  Connected := ConnectToServer(ClientConfig.ServerHost, ClientConfig.ServerPort);
  labErrorMsg.Visible := not Connected;
  if Connected then
  begin
    actTabContacts.ExecuteTarget(Self);
    ClientConfig.Apply;
  end;
end;

procedure TMainForm.actDoneExecute(Sender: TObject);
begin
  actTabContacts.ExecuteTarget(Self);
end;

procedure TMainForm.actSearchViewExecute(Sender: TObject);
begin
  SearchBox.Visible := not SearchBox.Visible;
end;

procedure TMainForm.actTabNewContactExecute(Sender: TObject);
begin
  TabControl.ActiveTab := TabNewContact;
end;

function TMainForm.ConnectToServer(AHost: string; APort: Integer): Boolean;
begin
  Result := False;
  if (AHost <> EmptyStr) and (APort <> 0) then
  begin
    DMClient.SQLConnection.Params.Values['HostName'] := ClientConfig.ServerHost;
    DMClient.SQLConnection.Params.Values['Port'] := IntToStr(ClientConfig.ServerPort);
    try
      if DMClient.SQLConnection.Connected then
        DMClient.SQLConnection.Connected := False;
      DMClient.SQLConnection.Connected := True;
      DMClient.cdsName.Open;
      Result := True;
    except

    end;
  end;
end;

procedure TMainForm.edServerHostChangeTracking(Sender: TObject);
begin
  labErrorMsg.Visible := False;
  ClientConfig.ServerHost := Trim(edServerHost.Text);
  DMClient.SQLConnection.Params.Values['HostName'] := ClientConfig.ServerHost;
end;

procedure TMainForm.edServerPortChangeTracking(Sender: TObject);
begin
  labErrorMsg.Visible := False;
  ClientConfig.ServerPort := StrToIntDef(edServerPort.Text, 211);
  DMClient.SQLConnection.Params.Values['Port'] := IntToStr(ClientConfig.ServerPort);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl.First(TTabTransition.None);
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkHardwareBack) and (TabControl.TabIndex <> 0) then
  begin
    TabControl.First;
    Key := 0;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  InitConfig;
  actConnectToServer.Execute;
end;

procedure TMainForm.InitConfig;
begin
  edServerHost.Text := ClientConfig.ServerHost;
  edServerPort.Text := IntToStr(ClientConfig.ServerPort);
  DMClient.SQLConnection.Params.Values['HostName'] := ClientConfig.ServerHost;
  DMClient.SQLConnection.Params.Values['Port'] := IntToStr(ClientConfig.ServerPort);
end;

procedure TMainForm.lbContactsItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  actTabViewContact.ExecuteTarget(Self);
end;

procedure TMainForm.SpinEditBtnPortDownClick(Sender: TObject);
begin
  edServerPort.Text := IntToStr(edServerPort.Text.ToInteger - 1);
end;

procedure TMainForm.SpinEditBtnPortUpClick(Sender: TObject);
begin
  edServerPort.Text := IntToStr(edServerPort.Text.ToInteger + 1);
end;

end.
