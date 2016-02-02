unit PhoneFrameFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  DMClientUnit, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Data.DB, Datasnap.DBClient, BaseFrameFrm, FMX.Objects;

type
  TPhoneFrame = class(TBaseFrame)
    cbPhoneKind: TComboBox;
    edPhoneData: TEdit;
    layPhone: TLayout;
    btnDeletePhone: TSpeedButton;
    BindSourceDBPhoneKind: TBindSourceDB;
    BindingsListPhoneKind: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
  private
    function GetPhoneValue: string;
    function GetKindId: Integer; override;
    procedure SetKindId(const Value: Integer); override;
    procedure SetPhoneValue(const Value: string);
  public
    procedure InitControls; override;
    property PhoneValue: string read GetPhoneValue write SetPhoneValue;
  end;

implementation

{$R *.fmx}

{ TPhoneFrame }

function TPhoneFrame.GetKindId: Integer;
begin
  if Assigned(cbPhoneKind.Selected) then
    Result := cbPhoneKind.Selected.ImageIndex
  else
    Result := 0;
end;

function TPhoneFrame.GetPhoneValue: string;
begin
  Result := Trim(edPhoneData.Text)
end;

procedure TPhoneFrame.InitControls;
begin
  btnDeletePhone.Tag := Id;
end;

procedure TPhoneFrame.SetKindId(const Value: Integer);
var
  I: Integer;
begin
  cbPhoneKind.ItemIndex := 0;
  for I := 0 to cbPhoneKind.Count - 1 do
  if cbPhoneKind.ListItems[I].ImageIndex = Value then
  begin
    cbPhoneKind.ItemIndex := I;
    Break;
  end;
end;

procedure TPhoneFrame.SetPhoneValue(const Value: string);
begin
  edPhoneData.Text := Value;
end;

end.
