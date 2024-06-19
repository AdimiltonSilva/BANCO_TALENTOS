unit Model.Cargo;

interface

uses
  Model.Interfaces, Dao.Interfaces, Dao.Cargo, DB;

type
  TModelCargo = class(TInterfacedObject, IModelCargo)
    private
      FId: integer;
      FDescricao: string;
      FDAOCargo : IDAOCargo;
    public
      constructor Create(ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(ADataSource: TDataSource): IModelCargo;

      function Id(AValue: Integer): IModelCargo; overload;
      function Id: integer; overload;
      function Descricao(AValue: string): IModelCargo; overload;
      function Descricao: string; overload;

      function Salvar: IModelCargo;
      function ListarTodos: IModelCargo;
      function BuscarPorId(AValue: integer): IModelCargo;
      function Alterar: IModelCargo;
      function Excluir(AValue: Integer): IModelCargo;
  end;

implementation

{ TModelCargo }

constructor TModelCargo.Create(ADataSource: TDataSource);
begin
  FDAOCargo := TDAOCargo.New(ADataSource);
end;

destructor TModelCargo.Destroy;
begin
  inherited Destroy;
end;

class function TModelCargo.New(ADataSource: TDataSource): IModelCargo;
begin
  Result := Self.Create(ADataSource);
end;

function TModelCargo.Id: integer;
begin
  Result := Self.FId;
end;

function TModelCargo.Id(AValue: Integer): IModelCargo;
begin
  Result := Self;
  Self.FId := AValue;
end;

function TModelCargo.Descricao: string;
begin
  Result := Self.FDescricao;
end;

function TModelCargo.Descricao(AValue: string): IModelCargo;
begin
  Result := Self;
  Self.FDescricao := AValue;
end;

function TModelCargo.BuscarPorId(AValue: integer): IModelCargo;
begin
  Result := Self;
  FDAOCargo.Excluir(AValue);
end;

function TModelCargo.ListarTodos: IModelCargo;
begin
  Result := Self;
  FDAOCargo.ListarTodos;
end;

function TModelCargo.Salvar: IModelCargo;
begin
  Result := Self;
  FDAOCargo.Salvar(Self);
end;

function TModelCargo.Alterar: IModelCargo;
begin
  Result := Self;
  FDAOCargo.Alterar(Self);
end;

function TModelCargo.Excluir(AValue: Integer): IModelCargo;
begin
  Result := Self;
  FDAOCargo.Excluir(AValue);
end;

end.
