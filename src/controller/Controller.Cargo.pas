unit Controller.Cargo;

interface

uses SysUtils, DB,
     Controller.Interfaces, Model.Interfaces, Model.Cargo;

type
  TControllerCargo = class(TInterfacedObject, IControllerCargo)
    private
      //FDAOCargo = TDAOCargo;
      FDataSource: TDataSource;
      FModelCargo: IModelCargo;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IControllerCargo;

      function Id(AValue: Integer): IControllerCargo; overload;
      function Id: integer; overload;
      function Descricao(AValue: string): IControllerCargo; overload;
      function Descricao: string; overload;

      function BuscarPorId(AValue: Integer): IControllerCargo;
      function Salvar: IControllerCargo;
      function ListarTodos: IControllerCargo;
      function Alterar: IControllerCargo;
      function Excluir(AValue: Integer): IControllerCargo;
  end;

implementation

{ TControllerCargo }

constructor TControllerCargo.Create(var ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  FModelCargo := TModelCargo.New(FDataSource);
end;

destructor TControllerCargo.Destroy;
begin
  inherited Destroy;
end;

class function TControllerCargo.New(var ADataSource: TDataSource): IControllerCargo;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerCargo.Id: Integer;
begin
  Result := FModelCargo.Id;
end;

function TControllerCargo.Id(AValue: Integer): IControllerCargo;
begin
  Result := Self;
  FModelCargo.Id(AValue);
end;

function TControllerCargo.Descricao: String;
begin
  Result := FModelCargo.Descricao;
end;

function TControllerCargo.Descricao(AValue: String): IControllerCargo;
begin
  Result := Self;

  if AValue = EmptyStr then
    raise Exception.Create('A descrição do cargo não pode ser vazia.');

  FModelCargo.Descricao(Avalue);
end;

function TControllerCargo.BuscarPorId(AValue: Integer): IControllerCargo;
begin
  Result := Self;
  FModelCargo.BuscarPorId(AValue);
end;

function TControllerCargo.ListarTodos: IControllerCargo;
begin
  Result := Self;
  FModelCargo.ListarTodos;
end;

function TControllerCargo.Salvar: IControllerCargo;
begin
  Result := Self;
  FModelCargo.Salvar;
end;

function TControllerCargo.Alterar: IControllerCargo;
begin
  Result := Self;
  FModelCargo.Alterar;
end;

function TControllerCargo.Excluir(AValue: Integer): IControllerCargo;
begin
  Result := Self;
  FModelCargo.Excluir(AValue);
end;

end.
