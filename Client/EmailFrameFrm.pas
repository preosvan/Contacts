unit EmailFrameFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, DMClientUnit, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, BaseFrameFrm,
  FMX.Objects;

type
  TEmailFrame = class(TBaseFrame)
    cbEmailKind: TComboBox;
    edEmailData: TEdit;
    btnDeleteEmail: TSpeedButton;
    BindSourceDBEmailKind: TBindSourceDB;
    BindingsListEmailKind: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
  private
    function GetEmailValue: string;
    function GetKindId: Integer; override;
    procedure SetKindId(const Value: Integer); override;
    procedure SetEmailValue(const Value: string);
  public
    procedure InitControls; override;
    property EmailValue: string read GetEmailValue write SetEmailValue;
  end;

implementation

{$R *.fmx}

{ TEmailFrame }

function TEmailFrame.GetEmailValue: string;
begin
  Result := Trim(edEmailData.Text)
end;

function TEmailFrame.GetKindId: Integer;
begin
  if Assigned(cbEmailKind.Selected) then
    Result := cbEmailKind.Selected.ImageIndex
  else
    Result := 0;
end;

procedure TEmailFrame.InitControls;
begin
  btnDeleteEmail.Tag := Id;
end;

procedure TEmailFrame.SetEmailValue(const Value: string);
begin
  edEmailData.Text := Value;
end;

procedure TEmailFrame.SetKindId(const Value: Integer);
var
  I: Integer;
begin
  cbEmailKind.ItemIndex := 0;
  for I := 0 to cbEmailKind.Count - 1 do
  if cbEmailKind.ListItems[I].ImageIndex = Value then
  begin
    cbEmailKind.ItemIndex := I;
    Break;
  end;
end;

end.
