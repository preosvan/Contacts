unit BaseFrameFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Ani;

type
  TBaseFrame = class(TFrame)
    LineTop: TLine;
  private
    FKindId: Integer;
    FId: Integer;
  public
    constructor Create(AOwner: TComponent; AKindId, AId: Integer;
      AIsViewLine: Boolean = False); overload;
    function GetKindId: Integer; virtual;
    procedure SetKindId(const Value: Integer); virtual;
    procedure InitControls; virtual; abstract;
    property KindId: Integer read GetKindId write SetKindId;
    property Id: Integer read FId;
  end;

implementation

{$R *.fmx}

{ TBaseFrame }

constructor TBaseFrame.Create(AOwner: TComponent; AKindId, AId: Integer;
  AIsViewLine: Boolean = False);
begin
  inherited Create(AOwner);
  KindId := AKindId;
  FId := AId;
  try
    InitControls;
  except
    //No implementation of an abstract method
  end;
  LineTop.Visible := AIsViewLine;
end;

function TBaseFrame.GetKindId: Integer;
begin
  Result := FKindId;
end;

procedure TBaseFrame.SetKindId(const Value: Integer);
begin
  FKindId := Value;
end;

end.
