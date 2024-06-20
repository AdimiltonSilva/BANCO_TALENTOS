unit Controller.Vinculo;

interface

uses SysUtils,
     DB,
     Controller.Interfaces, Model.Interfaces,
     Model.Vinculo, Dao.Vinculo;

type
  TControllerVinculo = class(TInterfacedObject, IControllerVinculo)
  private
    FDataSource: TDataSource;
    FModelVinculo: IModelVinculo;
  public
    constructor Create(var ADatasource: TDataSource);
    destructor Destroy; override;
    class function New(var ADataSource: TDataSource): IControllerVinculo;

    function IdFuncionario: Integer; overload;
    function IdFuncionario(AValue: Integer): IControllerVinculo; overload;
    function IdCargo: Integer; overload;
    function IdCargo(AValue: Integer): IControllerVinculo; overload;
    function IdEmpresa: Integer; overload;
    function IdEmpresa(AValue: Integer): IControllerVinculo; overload;
    function DataAdmissao: TDateTime; overload;
    function DataAdmissao(AValue: TDateTime): IControllerVinculo; overload;

    function Adicionar: IControllerVinculo;
    function Remover: IControllerVinculo;
    function ListarVinculoPorFuncionario(AValue: Integer): IControllerVinculo;
    function ConsultarVinculo: IControllerVinculo;
  end;

implementation

{ TControllerVinculo }

constructor TControllerVinculo.Create(var ADatasource: TDataSource);
begin
  FDataSource := ADatasource;
  FModelVinculo := TModelVinculo.New(FDataSource);
end;

destructor TControllerVinculo.Destroy;
begin

  inherited;
end;

function TControllerVinculo.Adicionar: IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.Adicionar;
end;

function TControllerVinculo.IdFuncionario: Integer;
begin
  Result := FModelVinculo.IdFuncionario;
end;

function TControllerVinculo.IdFuncionario(AValue: Integer): IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.IdFuncionario(AValue);
end;

function TControllerVinculo.IdCargo(AValue: Integer): IControllerVinculo;
begin
  Result := Self;
  FmodelVinculo.IdCargo(AValue);
end;

function TControllerVinculo.IdCargo: Integer;
begin
  Result := FModelVinculo.IdCargo;
end;

function TControllerVinculo.IdEmpresa: Integer;
begin
  Result := FModelVinculo.IdEmpresa;
end;

function TControllerVinculo.IdEmpresa(AValue: Integer): IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.IdEmpresa(AValue)
end;

function TControllerVinculo.DataAdmissao(AValue: TDateTime): IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.DataAdmissao(AValue);
end;

function TControllerVinculo.DataAdmissao: TDateTime;
begin
  Result := FModelVinculo.DataAdmissao;
end;

function TControllerVinculo.ListarVinculoPorFuncionario(AValue: Integer): IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.ListarVinculoPorFuncionario(AValue);
end;

class function TControllerVinculo.New(var ADataSource: TDataSource): IControllerVinculo;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerVinculo.Remover: IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.Remover(FModelVinculo);
end;

function TControllerVinculo.ConsultarVinculo: IControllerVinculo;
begin
  Result := Self;
  FModelVinculo.ConsultarVinculo(FModelVinculo);
end;

end.
