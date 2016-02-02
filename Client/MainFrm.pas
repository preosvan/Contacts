unit MainFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Gestures, DMClientUnit,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.Edit,
  FMX.SearchBox, FMX.Layouts, FMX.ListBox, FMX.DateTimeCtrls, Fmx.Bind.Navigator,
  PhoneFrameFrm, EmailFrameFrm, AddressFrameFrm;

type
  TMainForm = class(TForm)
    ActionList: TActionList;
    actTabPrevious: TPreviousTabAction;
    actTabNext: TNextTabAction;
    TabControl: TTabControl;
    TabContacts: TTabItem;
    TabViewContact: TTabItem;
    BottomToolBarContacts: TToolBar;
    TabNewContact: TTabItem;
    GestureManager: TGestureManager;
    StyleBook: TStyleBook;
    lbContacts: TListBox;
    SearchBox: TSearchBox;
    BindSourceDBName: TBindSourceDB;
    BindingsListDBName: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    actSearchView: TAction;
    ToolBarContacts: TToolBar;
    labContacts: TLabel;
    btnNewContact: TSpeedButton;
    btnSearch: TSpeedButton;
    actTabNewContact: TChangeTabAction;
    ToolBarNewContact: TToolBar;
    labNewContact: TLabel;
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
    actTabViewContact: TChangeTabAction;
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
    layNewName: TLayout;
    edNewFirstName: TEdit;
    labNewFirstName: TLabel;
    layNewFirstName: TLayout;
    ClearEditButton2: TClearEditButton;
    layNewLastName: TLayout;
    labNewLastName: TLabel;
    edNewLastName: TEdit;
    ClearEditButton3: TClearEditButton;
    layNewBirthday: TLayout;
    labNewBirthday: TLabel;
    dedNewBirthday: TDateEdit;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    actLBNaviNameCancel: TFMXBindNavigateCancel;
    actLBNaviNameApplyUpdates: TFMXBindNavigateApplyUpdates;
    actLBNaviNameInsert: TFMXBindNavigateInsert;
    actNewContact: TAction;
    ToolBarDeleteContact: TToolBar;
    btnDeleteContact: TSpeedButton;
    actLBNaviNameDelete: TFMXBindNavigateDelete;
    actDeleteContact: TAction;
    layPhones: TLayout;
    btnPhoneAdd: TSpeedButton;
    layEmails: TLayout;
    btnEmailAdd: TSpeedButton;
    layAddress: TLayout;
    btnAddressAdd: TSpeedButton;
    vsbNewContact: TFramedVertScrollBox;
    vsbViewContact: TFramedVertScrollBox;
    layViewName: TLayout;
    layViewFirstName: TLayout;
    labViewFirstName: TLabel;
    edViewFirstName: TEdit;
    layViewLastName: TLayout;
    labViewLastName: TLabel;
    edViewLastName: TEdit;
    layViewBirthday: TLayout;
    labViewBirthday: TLabel;
    dedViewBirthday: TDateEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    layPhonesView: TLayout;
    btnPhoneView: TSpeedButton;
    layEmailsView: TLayout;
    btnEmailView: TSpeedButton;
    layAddressView: TLayout;
    btnAddressView: TSpeedButton;
    vsbContacts: TFramedVertScrollBox;
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
    procedure actNewContactExecute(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure SearchBoxChange(Sender: TObject);
    procedure actEditContactExecute(Sender: TObject);
    procedure actDeleteContactExecute(Sender: TObject);
    procedure actCancelEditExecute(Sender: TObject);
    procedure actDoneEditExecute(Sender: TObject);
    procedure btnPhoneAddClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEmailAddClick(Sender: TObject);
    procedure btnAddressAddClick(Sender: TObject);
  private
    FIsEditContact: Boolean;
    procedure InitConfig;
    function ConnectToServer(AHost: string; APort: Integer): Boolean;
    function GetIsFiltered: Boolean;
    procedure SearchReset;
    procedure SetIsEditContact(const Value: Boolean);
    function CreatePhoneFrame(AKindId, AId: Integer; ALay: TLayout): TPhoneFrame;
    function CreateEmailFrame(AKindId, AId: Integer; ALay: TLayout): TEmailFrame;
    function CreateAddressFrame(AKindId, AId: Integer; ALay: TLayout): TAddressFrame;
    procedure InitPhoneData(ANameId: Integer; ALay: TLayout);
    procedure InitEmailData(ANameId: Integer; ALay: TLayout);
    procedure InitAddressData(ANameId: Integer; ALay: TLayout);
    procedure DeleteFrameAll(AFrameList: TList);
    procedure DeleteFrameById(AFrameList: TList; AId: Integer);
    procedure DeletePhoneFrame(ASender: TObject);
    procedure DeleteEmailFrame(ASender: TObject);
    procedure DeleteAddressFrame(ASender: TObject);
    procedure LayHeightRecalcForFrame(AList: TList; ALay: TLayout; ABtn: TSpeedButton);
    procedure ContactSaveData(ANameId: Integer);
    procedure ContactInitData(ANameId: Integer);
    procedure ContactInitDataView(ANameId: Integer);
    function GetContactId: Integer;
  public
    property ContactId: Integer read GetContactId;
    property IsFiltered: Boolean read GetIsFiltered;
    property IsEditContact: Boolean read FIsEditContact write SetIsEditContact;
  end;

var
  MainForm: TMainForm;
  PhoneFrameList, EmailFrameList, AddressFrameList: TList;

implementation

uses
  ConfigClientUnit, Data.DB, BaseFrameFrm, ServerMethodsClientUnit;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TMainForm.actCancelEditExecute(Sender: TObject);
begin
  actLBNaviNameCancel.ExecuteTarget(Self);
  actTabViewContact.ExecuteTarget(Self);
end;

procedure TMainForm.actCancelExecute(Sender: TObject);
begin
  actLBNaviNameCancel.ExecuteTarget(Self);
  if IsEditContact then
    actTabViewContact.ExecuteTarget(Self)
  else
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

procedure TMainForm.actDeleteContactExecute(Sender: TObject);
begin
  if MessageDlg('Delete Contact?', TMsgDlgType.mtConfirmation,
     [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    DMClient.cdsName.Delete;
    DMClient.cdsName.ApplyUpdates(-1);
    actTabContacts.ExecuteTarget(Self);
  end;
end;

procedure TMainForm.actDoneEditExecute(Sender: TObject);
begin
  actLBNaviNameApplyUpdates.ExecuteTarget(Self);
  actTabViewContact.ExecuteTarget(Self);
end;

procedure TMainForm.actDoneExecute(Sender: TObject);
var
  NameId: Integer;
begin
  actLBNaviNameApplyUpdates.ExecuteTarget(Self);
  NameId := dsClient.GetMaxNameId;
  if not IsEditContact then
  begin
    DMClient.RefreshNames;
    if NameId <> 0 then
      DMClient.cdsName.Locate('Id', NameId, []);
  end;

  ContactSaveData(ContactId);
  if IsEditContact then
    actTabViewContact.ExecuteTarget(Self)
  else
    actTabContacts.ExecuteTarget(Self);
end;

procedure TMainForm.actEditContactExecute(Sender: TObject);
begin
  IsEditContact := True;
  ContactInitData(ContactId);
  actTabNewContact.ExecuteTarget(Self);
end;

procedure TMainForm.actNewContactExecute(Sender: TObject);
begin
  DeleteFrameAll(PhoneFrameList);
  DeleteFrameAll(EmailFrameList);
  DeleteFrameAll(AddressFrameList);
  LayHeightRecalcForFrame(PhoneFrameList, layPhones, btnPhoneAdd);
  LayHeightRecalcForFrame(EmailFrameList, layEmails, btnEmailAdd);
  LayHeightRecalcForFrame(AddressFrameList, layAddress, btnAddressAdd);
  actLBNaviNameInsert.ExecuteTarget(Self);
  actTabNewContact.ExecuteTarget(Self);
end;

procedure TMainForm.actSearchViewExecute(Sender: TObject);
begin
  SearchBox.Visible := not SearchBox.Visible;
  SearchReset;
end;

procedure TMainForm.actTabNewContactExecute(Sender: TObject);
begin
  TabControl.ActiveTab := TabNewContact;
end;

procedure TMainForm.btnAddressAddClick(Sender: TObject);
var
  KindId: Integer;
  Id: Integer;
begin
  KindId := 1;
  Id := 1;
  if AddressFrameList.Count > 0 then
  begin
    KindId := TBaseFrame(AddressFrameList.Last).KindId + 1;
    Id := TBaseFrame(AddressFrameList.Last).Id + 1;
  end;

  AddressFrameList.Add(CreateAddressFrame(KindId, Id, layAddress)); 
  LayHeightRecalcForFrame(AddressFrameList, layAddress, btnAddressAdd);
end;

procedure TMainForm.btnEmailAddClick(Sender: TObject);
var
  KindId: Integer;
  EmailId: Integer;
begin
  KindId := 1;
  EmailId := 1;
  if EmailFrameList.Count > 0 then
  begin
    KindId := TEmailFrame(EmailFrameList.Last).KindId + 1;
    EmailId := TEmailFrame(EmailFrameList.Last).Id + 1;
  end;

  EmailFrameList.Add(CreateEmailFrame(KindId, EmailId, layEmails)); 
  LayHeightRecalcForFrame(EmailFrameList, layEmails, btnEmailAdd);
end;

procedure TMainForm.btnPhoneAddClick(Sender: TObject);
var
  KindId: Integer;
  Id: Integer;
begin
  KindId := 1;
  Id := 1;
  if PhoneFrameList.Count > 0 then
  begin
    KindId := TBaseFrame(PhoneFrameList.Last).KindId + 1;
    Id := TBaseFrame(PhoneFrameList.Last).Id + 1;
  end;

  PhoneFrameList.Add(CreatePhoneFrame(KindId, Id, layPhones)); 
  LayHeightRecalcForFrame(PhoneFrameList, layPhones, btnPhoneAdd);
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

      if Assigned(dsClient) then
        dsClient.Free;
      dsClient := TServerMethodsClient.Create(DMClient.SQLConnection.DBXConnection, False);

      DMClient.cdsName.Open;
      DMClient.cdsPhoneKind.Open;
      DMClient.cdsEmailKind.Open;
      DMClient.cdsAddressKind.Open;
      Result := True;
    except

    end;
  end;
end;

procedure TMainForm.ContactInitData(ANameId: Integer);
begin
  InitPhoneData(ANameId, layPhones);
  LayHeightRecalcForFrame(PhoneFrameList, layPhones, btnPhoneAdd);
  InitEmailData(ANameId, layEmails);
  LayHeightRecalcForFrame(EmailFrameList, layEmails, btnEmailAdd);
  InitAddressData(ANameId, layAddress);
  LayHeightRecalcForFrame(AddressFrameList, layAddress, btnAddressAdd);
end;

procedure TMainForm.ContactInitDataView(ANameId: Integer);
begin
  InitPhoneData(ANameId, layPhonesView);
  LayHeightRecalcForFrame(PhoneFrameList, layPhonesView, btnPhoneView);
  InitEmailData(ANameId, layEmailsView);
  LayHeightRecalcForFrame(EmailFrameList, layEmailsView, btnEmailView);
  InitAddressData(ANameId, layAddressView);
  LayHeightRecalcForFrame(AddressFrameList, layAddressView, btnAddressView);
end;

procedure TMainForm.ContactSaveData(ANameId: Integer);
var
  I: Integer;
  PhoneFrame: TPhoneFrame;
  EmailFrame: TEmailFrame;
  AddressFrame: TAddressFrame;
begin
  //Save phone data
  for I := 0 to PhoneFrameList.Count - 1 do
  begin
    PhoneFrame := TPhoneFrame(PhoneFrameList[I]);
    if Trim(PhoneFrame.PhoneValue) <> EmptyStr then
      dsClient.PhoneInsUpd(ANameId, PhoneFrame.KindId, PhoneFrame.PhoneValue);
  end;
  //Save email data
  for I := 0 to EmailFrameList.Count - 1 do
  begin
    EmailFrame := TEmailFrame(EmailFrameList[I]);
    if Trim(EmailFrame.EmailValue) <> EmptyStr then
      dsClient.EmailInsUpd(ANameId, EmailFrame.KindId, EmailFrame.EmailValue);
  end;
  //Save address data
  for I := 0 to AddressFrameList.Count - 1 do
  begin
    AddressFrame := TAddressFrame(AddressFrameList[I]);
    dsClient.AddressInsUpd(ANameId, AddressFrame.KindId,
      AddressFrame.CountryName, AddressFrame.StateName, AddressFrame.CityName,
      AddressFrame.StreetName, AddressFrame.House, AddressFrame.Apartment);
  end;
end;

function TMainForm.CreateAddressFrame(AKindId, AId: Integer; ALay: TLayout): TAddressFrame;
begin
  Result := TAddressFrame.Create(Self, AKindId, AId, AddressFrameList.Count > 0);
  Result.Name := 'AddressFrame' + AId.ToString;
  Result.Parent := ALay;
  Result.Align := TAlignLayout(4);
  Result.Align := TAlignLayout(1);
  Result.btnDeleteAddress.OnClick := DeleteAddressFrame;
end;

function TMainForm.CreateEmailFrame(AKindId, AId: Integer; ALay: TLayout): TEmailFrame;
begin
  Result := TEmailFrame.Create(Self, AKindId, AId);
  Result.Name := 'EmailFrame' + AId.ToString;
  Result.Parent := ALay;
  Result.Align := TAlignLayout(4);
  Result.Align := TAlignLayout(1);
  Result.btnDeleteEmail.OnClick := DeleteEmailFrame;
end;

function TMainForm.CreatePhoneFrame(AKindId, AId: Integer; ALay: TLayout): TPhoneFrame;
begin
  Result := TPhoneFrame.Create(Self, AKindId, AId);
  Result.Name := 'PhoneFrame' + AId.ToString;
  Result.Parent := ALay;
  Result.Align := TAlignLayout(4);
  Result.Align := TAlignLayout(1);
  Result.btnDeletePhone.OnClick := DeletePhoneFrame;
end;

procedure TMainForm.DeleteAddressFrame(ASender: TObject);
begin
  dsClient.AddressDelete(TSpeedButton(ASender).Tag);
  DeleteFrameById(AddressFrameList, TSpeedButton(ASender).Tag);
  LayHeightRecalcForFrame(AddressFrameList, layAddress, btnAddressAdd);
end;

procedure TMainForm.DeleteEmailFrame(ASender: TObject);
begin
  dsClient.EmailDelete(TSpeedButton(ASender).Tag);
  DeleteFrameById(EmailFrameList, TSpeedButton(ASender).Tag);
  LayHeightRecalcForFrame(EmailFrameList, layEmails, btnEmailAdd);
end;

procedure TMainForm.DeletePhoneFrame(ASender: TObject);
begin
  dsClient.PhoneDelete(TSpeedButton(ASender).Tag);
  DeleteFrameById(PhoneFrameList, TSpeedButton(ASender).Tag);
  LayHeightRecalcForFrame(PhoneFrameList, layPhones, btnPhoneAdd);
end;

procedure TMainForm.DeleteFrameAll(AFrameList: TList);
var
  I: Integer;
begin
  for I := AFrameList.Count - 1 downto 0 do
    DeleteFrameById(AFrameList, TBaseFrame(AFrameList[I]).Id);
end;

procedure TMainForm.DeleteFrameById(AFrameList: TList; AId: Integer);
var
  I: Integer;
begin
  if Assigned(AFrameList) then
  begin
    for I := 0 to AFrameList.Count - 1 do
    if TBaseFrame(AFrameList[I]).Id = AId then
    begin
      TBaseFrame(AFrameList[I]).Free;
      AFrameList.Remove(AFrameList[I]);
      Break;
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
  PhoneFrameList := TList.Create;
  EmailFrameList := TList.Create;
  AddressFrameList := TList.Create;
  TabControl.First(TTabTransition.None);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(PhoneFrameList) then
    PhoneFrameList.Free;
  if Assigned(EmailFrameList) then
    EmailFrameList.Free;
  if Assigned(AddressFrameList) then
    AddressFrameList.Free;
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

function TMainForm.GetContactId: Integer;
begin
  Result := BindSourceDBName.DataSet.FieldByName('Id').AsInteger;
end;

function TMainForm.GetIsFiltered: Boolean;
begin
  Result := SearchBox.Text.Trim <> EmptyStr;
end;

procedure TMainForm.InitAddressData(ANameId: Integer; ALay: TLayout);
var
  KindId, Id: Integer;
  CountryName, StateName, CityName, StreetName, House, Apartment: string;
begin
  DeleteFrameAll(AddressFrameList);
  DMClient.cdsAddressData.Close;
  DMClient.cdsAddressData.ParamByName('pNameId').AsInteger := ContactId;
  DMClient.cdsAddressData.Open;
  while not DMClient.cdsAddressData.Eof do
  begin
    KindId := DMClient.cdsAddressData.FieldByName('AddressKindId').AsInteger;
    Id := DMClient.cdsAddressData.FieldByName('Id').AsInteger;
    CountryName := DMClient.cdsAddressData.FieldByName('CountryName').AsString;
    StateName := DMClient.cdsAddressData.FieldByName('StateName').AsString;
    CityName := DMClient.cdsAddressData.FieldByName('CityName').AsString;
    StreetName := DMClient.cdsAddressData.FieldByName('StreetName').AsString;
    House := DMClient.cdsAddressData.FieldByName('House').AsString;
    Apartment := DMClient.cdsAddressData.FieldByName('Apartment').AsString;

    AddressFrameList.Add(CreateAddressFrame(KindId, Id, ALay));
    TAddressFrame(AddressFrameList.Last).CountryName := CountryName;
    TAddressFrame(AddressFrameList.Last).StateName := StateName;
    TAddressFrame(AddressFrameList.Last).CityName := CityName;
    TAddressFrame(AddressFrameList.Last).StreetName := StreetName;
    TAddressFrame(AddressFrameList.Last).House := House;
    TAddressFrame(AddressFrameList.Last).Apartment := Apartment;
    DMClient.cdsAddressData.Next;
  end;
end;

procedure TMainForm.InitConfig;
begin
  edServerHost.Text := ClientConfig.ServerHost;
  edServerPort.Text := IntToStr(ClientConfig.ServerPort);
  DMClient.SQLConnection.Params.Values['HostName'] := ClientConfig.ServerHost;
  DMClient.SQLConnection.Params.Values['Port'] := IntToStr(ClientConfig.ServerPort);
end;

procedure TMainForm.InitEmailData(ANameId: Integer; ALay: TLayout);
var
  KindId, Id: Integer;
  EmailValue: string;
begin
  DeleteFrameAll(EmailFrameList);
  DMClient.cdsEmailData.Close;
  DMClient.cdsEmailData.ParamByName('pNameId').AsInteger := ContactId;
  DMClient.cdsEmailData.Open;
  while not DMClient.cdsEmailData.Eof do
  begin
    KindId := DMClient.cdsEmailData.FieldByName('EmailKindId').AsInteger;
    Id := DMClient.cdsEmailData.FieldByName('Id').AsInteger;
    EmailValue := DMClient.cdsEmailData.FieldByName('EmailValue').AsString;

    EmailFrameList.Add(CreateEmailFrame(KindId, Id, ALay));
    TEmailFrame(EmailFrameList.Last).EmailValue := EmailValue;
    DMClient.cdsEmailData.Next;
  end;
end;

procedure TMainForm.InitPhoneData(ANameId: Integer; ALay: TLayout);
var
  KindId, Id: Integer;
  PhoneValue: string;
begin
  DeleteFrameAll(PhoneFrameList);
  DMClient.cdsPhoneData.Close;
  DMClient.cdsPhoneData.ParamByName('pNameId').AsInteger := ContactId;
  DMClient.cdsPhoneData.Open;
  while not DMClient.cdsPhoneData.Eof do
  begin
    KindId := DMClient.cdsPhoneData.FieldByName('PhoneKindId').AsInteger;
    Id := DMClient.cdsPhoneData.FieldByName('Id').AsInteger;
    PhoneValue := DMClient.cdsPhoneData.FieldByName('PhoneValue').AsString;

    PhoneFrameList.Add(CreatePhoneFrame(KindId, Id, ALay));
    TPhoneFrame(PhoneFrameList.Last).PhoneValue := PhoneValue;
    DMClient.cdsPhoneData.Next;
  end;
end;

procedure TMainForm.LayHeightRecalcForFrame(AList: TList; ALay: TLayout;
  ABtn: TSpeedButton);
begin
  if Assigned(AList) then
  begin
    if AList.Count > 0 then
      ALay.Height :=
        TFrame(AList.Last).Height*AList.Count +
          ABtn.Height
    else
      ALay.Height := ABtn.Height*2;
  end;
end;

procedure TMainForm.lbContactsItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  NameSel, NameCur: string;
begin
  if IsFiltered then
  begin
    NameSel := Item.Text;
    actTabViewContact.ExecuteTarget(Sender);
    NameCur := BindSourceDBName.DataSet.FieldByName('LastName').AsString + ' ' +
                   BindSourceDBName.DataSet.FieldByName('FirstName').AsString;
    if NameCur <> NameSel then
    begin
      BindSourceDBName.DataSet.First;
      while not BindSourceDBName.DataSet.Eof do
      begin
        NameCur := BindSourceDBName.DataSet.FieldByName('LastName').AsString + ' ' +
                   BindSourceDBName.DataSet.FieldByName('FirstName').AsString;
        if NameCur = NameSel then
            Break;
        BindSourceDBName.DataSet.Next;
      end;
    end;
  end
  else
    actTabViewContact.ExecuteTarget(Sender);
end;

procedure TMainForm.SearchBoxChange(Sender: TObject);
begin
  if Trim(SearchBox.Text) = EmptyStr then
  begin
    SearchReset;
    DMClient.RefreshNames;
  end;
end;

procedure TMainForm.SearchReset;
begin
  lbContacts.FilterPredicate := nil;
  SearchBox.Text := EmptyStr;
end;

procedure TMainForm.SetIsEditContact(const Value: Boolean);
begin
  FIsEditContact := Value;
  ToolBarDeleteContact.Visible := Value;
  if Value then
    labNewContact.Text := EmptyStr
  else
    labNewContact.Text := 'New Contact';
end;

procedure TMainForm.SpinEditBtnPortDownClick(Sender: TObject);
begin
  edServerPort.Text := IntToStr(edServerPort.Text.ToInteger - 1);
end;

procedure TMainForm.SpinEditBtnPortUpClick(Sender: TObject);
begin
  edServerPort.Text := IntToStr(edServerPort.Text.ToInteger + 1);
end;

procedure TMainForm.TabControlChange(Sender: TObject);
var
  SearchText: string;
begin
//  if (TabControl.ActiveTab <> TabSettings) then
  if (TabControl.ActiveTab = TabContacts) then
    DMClient.RefreshNames;

  if TabControl.ActiveTab = TabContacts then
    IsEditContact := False;

  if (TabControl.ActiveTab = TabContacts) and IsFiltered then
  begin
    SearchText := SearchBox.Text;
    SearchReset;
    SearchBox.Text := SearchText;
  end;

  if TabControl.ActiveTab = TabViewContact then
    ContactInitDataView(ContactId);
end;

end.
