unit Model.Vinculo;

interface

uses
  Model.Interfaces, Dao.Interfaces, Dao.Vinculo, DB;

type
  TModelVinculo = class(TInterfacedObject, IModelVinculo)
    private
      FIdFuncionario: Integer;
      FIdCargo: Integer;
      FIdEmpresa: Integer;
      FDataAdmissao: TDateTime;
      FDAOVinculo: IDAOVinculo;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IModelVinculo;

      function IdFuncionario(AValue: Integer): IModelVinculo; overload;
      function IdFuncionario: Integer; overload;
      function IdCargo(AValue: Integer): IModelVinculo; overload;
      function IdCargo: Integer; overload;
      function IdEmpresa(AValue: Integer): IModelVinculo; overload;
      function IdEmpresa: Integer; overload;
      function DataAdmissao(AValue: TDateTime): IModelVinculo; overload;
      function DataAdmissao: TDateTime; overload;

      function Adicionar: IModelVinculo;
      function Remover(AVinculo: IModelVinculo): IModelVinculo;
      function ListarVinculoPorFuncionario(AValue: Integer): IModelVinculo;
      function ConsultarVinculo(AVinculo: IModelVinculo): IModelVinculo;
  end;

implementation

{ TModelVinculo }

constructor TModelVinculo.Create(var ADataSource: TDataSource);
begin
  Self.FDataSource := ADataSource;
  FDAOVinculo := TDAOVinculo.New(FDataSource)
end;

destructor TModelVinculo.Destroy;
begin

  inherited Destroy;
end;

class function TModelVinculo.New(var ADataSource: TDataSource): IModelVinculo;
begin
  Result := Self.Create(ADataSource);
end;

function TModelVinculo.IdFuncionario: Integer;
begin
  Result := FIdFuncionario;
end;

function TModelVinculo.IdFuncionario(AValue: Integer): IModelVinculo;
begin
  Result := Self;
  Self.FIdFuncionario := AValue;
end;

function TModelVinculo.IdCargo: Integer;
begin
  Result := Self.FIdCargo;
end;

function TModelVinculo.IdCargo(AValue: Integer): IModelVinculo;
begin
  Result := Self;
  Self.FIdCargo := AValue;
end;

function TModelVinculo.IdEmpresa: Integer;
begin
  Result := Self.FIdEmpresa;
end;

function TModelVinculo.IdEmpresa(AValue: Integer): IModelVinculo;
begin
  Result := Self;
  Self.FIdEmpresa := AValue;
end;

function TModelVinculo.DataAdmissao: TDateTime;
begin
  Result := Self.FDataAdmissao;
end;

function TModelVinculo.DataAdmissao(AValue: TDateTime): IModelVinculo;
begin
  Result := Self;
  Self.FDataAdmissao := AValue;
end;

function TModelVinculo.ListarVinculoPorFuncionario(AValue: Integer): IModelVinculo;
begin
  Result := Self;
  FDAOVinculo.ListarVinculoPorFuncionario(AValue);
end;

function TModelVinculo.Adicionar: IModelVinculo;
begin
  Result := Self;
  FDAOVinculo.Adicionar(Self);
end;

function TModelVinculo.Remover(AVinculo: IModelVinculo): IModelVinculo;
begin
  Result := Self;
  FDAOVinculo.Remover(AVinculo);
end;

function TModelVinculo.ConsultarVinculo(AVinculo: IModelVinculo): IModelVinculo;
begin
  Result := Self;
  FDAOVinculo.ConsultarVinculo(AVinculo);
end;

end.
