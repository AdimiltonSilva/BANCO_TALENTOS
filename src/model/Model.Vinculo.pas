unit Model.Vinculo;

interface

uses
  Model.Interfaces, Dao.Interfaces, Dao.Vinculo, DB;

type
  TModelVinculo = class(TInterfacedObject, IModelVinculo)
    private
      FIdFuncionario: Integer;
      FIdEmpresa: Integer;
      FDAOVinculo: IDAOVinculo;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IModelVinculo;

      function IdEmpresa(AValue: Integer): IModelVinculo overload;
      function IdEmpresa: Integer; overload;
      function IdFuncionario(AValue: Integer): IModelVinculo overload;
      function IdFuncionario: Integer; overload;

      function Adicionar: IModelVinculo;
      function Remover(AVinculo: IModelVinculo): IModelVinculo;
      function ListarPorEmpresa(AValue: Integer): IModelVinculo;
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

function TModelVinculo.IdEmpresa: Integer;
begin
  Result := Self.FIdEmpresa;
end;

function TModelVinculo.IdEmpresa(AValue: Integer): IModelVinculo;
begin
  Result := Self;
  Self.FIdEmpresa := AValue;
end;

function TModelVinculo.ListarPorEmpresa(AValue: Integer): IModelVinculo;
begin
  Result := Self;
  FDAOVinculo.ListarPorEmpresa(AValue);
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
