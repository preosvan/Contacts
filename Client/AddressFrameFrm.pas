unit AddressFrameFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts, DMClientUnit,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, BaseFrameFrm,
  FMX.Objects, FMX.Ani;

type
  TAddressFrame = class(TBaseFrame)
    layLeft: TLayout;
    cbAddressKind: TComboBox;
    layClient: TLayout;
    layRight: TLayout;
    btnDeleteAddress: TSpeedButton;
    edCountryName: TEdit;
    edApartment: TEdit;
    edHouse: TEdit;
    edStreetName: TEdit;
    edCityName: TEdit;
    edStateName: TEdit;
    BindSourceDBAddressKind: TBindSourceDB;
    BindingsListAddressKind: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
  private
    function GetKindId: Integer; override;
    function GetCityName: string;
    function GetCountryName: string;
    function GetHouse: string;
    function GetStateName: string;
    function GetStreetName: string;
    function GetApartment: string;
    procedure SetKindId(const Value: Integer); override;
    procedure SetCityName(const Value: string);
    procedure SetCountryName(const Value: string);
    procedure SetHouse(const Value: string);
    procedure SetStateName(const Value: string);
    procedure SetStreetName(const Value: string);
    procedure SetApartment(const Value: string);
  public
    procedure InitControls; override;
    property CountryName: string read GetCountryName write SetCountryName;
    property StateName: string read GetStateName write SetStateName;
    property CityName: string read GetCityName write SetCityName;
    property StreetName: string read GetStreetName write SetStreetName;
    property House: string read GetHouse write SetHouse;
    property Apartment: string read GetApartment write SetApartment;
  end;

implementation

{$R *.fmx}

function TAddressFrame.GetApartment: string;
begin
  Result := Trim(edApartment.Text)
end;

function TAddressFrame.GetCityName: string;
begin
  Result := Trim(edCityName.Text)
end;

function TAddressFrame.GetCountryName: string;
begin
  Result := Trim(edCountryName.Text)
end;

function TAddressFrame.GetHouse: string;
begin
  Result := Trim(edHouse.Text)
end;

function TAddressFrame.GetKindId: Integer;
begin
  if Assigned(cbAddressKind.Selected) then
    Result := cbAddressKind.Selected.ImageIndex
  else
    Result := 0;
end;

function TAddressFrame.GetStateName: string;
begin
  Result := Trim(edStateName.Text)
end;

function TAddressFrame.GetStreetName: string;
begin
  Result := Trim(edStreetName.Text)
end;

procedure TAddressFrame.InitControls;
begin
  btnDeleteAddress.Tag := Id;
end;

procedure TAddressFrame.SetApartment(const Value: string);
begin
  edApartment.Text := Value;
end;

procedure TAddressFrame.SetCityName(const Value: string);
begin
  edCityName.Text := Value;
end;

procedure TAddressFrame.SetCountryName(const Value: string);
begin
  edCountryName.Text := Value;
end;

procedure TAddressFrame.SetHouse(const Value: string);
begin
  edHouse.Text := Value;
end;

procedure TAddressFrame.SetKindId(const Value: Integer);
var
  I: Integer;
begin
  cbAddressKind.ItemIndex := 0;
  for I := 0 to cbAddressKind.Count - 1 do
  if cbAddressKind.ListItems[I].ImageIndex = Value then
  begin
    cbAddressKind.ItemIndex := I;
    Break;
  end;
end;

procedure TAddressFrame.SetStateName(const Value: string);
begin
  edStateName.Text := Value;
end;

procedure TAddressFrame.SetStreetName(const Value: string);
begin
  edStreetName.Text := Value;
end;

end.
