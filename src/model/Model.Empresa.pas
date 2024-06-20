unit Model.Empresa;

interface

uses
  Model.Interfaces, Dao.Interfaces, Dao.Empresa, DB;

type
  TModelEmpresa = class(TInterfacedObject, IModelEmpresa)
    private
      FId: integer;
      FRazaoSocial: string;
      FCNPJ: string;
      FDAOEmpresa : IDAOEmpresa;
    public
      constructor Create(ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(ADataSource: TDataSource): IModelEmpresa;

      function Id(AValue: Integer): IModelEmpresa; overload;
      function Id: integer; overload;
      function RazaoSocial(AValue: string): IModelEmpresa; overload;
      function RazaoSocial: string; overload;
      function CNPJ(AValue: string): IModelEmpresa; overload;
      function CNPJ: string; overload;

      function Salvar: IModelEmpresa;
      function ListarTodos: IModelEmpresa;
      function BuscarPorId(AValue: integer): IModelEmpresa;
      function Alterar: IModelEmpresa;
      function Excluir(AValue: Integer): IModelEmpresa;
  end;

implementation

{ TModelEmpresa }

constructor TModelEmpresa.Create(ADataSource: TDataSource);
begin
  FDAOEmpresa := TDAOEmpresa.New(ADataSource);
end;

destructor TModelEmpresa.Destroy;
begin
  inherited Destroy;
end;

class function TModelEmpresa.New(ADataSource: TDataSource): IModelEmpresa;
begin
  Result := Self.Create(ADataSource);
end;

function TModelEmpresa.Id: integer;
begin
  Result := Self.FId;
end;

function TModelEmpresa.Id(AValue: Integer): IModelEmpresa;
begin
  Result := Self;
  Self.FId := AValue;
end;

function TModelEmpresa.RazaoSocial: string;
begin
  Result := Self.FRazaoSocial;
end;

function TModelEmpresa.RazaoSocial(AValue: string): IModelEmpresa;
begin
  Result := Self;
  Self.FRazaoSocial := AValue;
end;

function TModelEmpresa.CNPJ: string;
begin
  Result := Self.FCNPJ;
end;

function TModelEmpresa.CNPJ(AValue: string): IModelEmpresa;
begin
  Result := Self;
  Self.FCNPJ := AValue;
end;

function TModelEmpresa.BuscarPorId(AValue: integer): IModelEmpresa;
begin
  Result := Self;
  FDAOEmpresa.BuscarPorId(AValue);
end;

function TModelEmpresa.ListarTodos: IModelEmpresa;
begin
  Result := Self;
  FDAOEmpresa.ListarTodos;
end;

function TModelEmpresa.Salvar: IModelEmpresa;
begin
  Result := Self;
  FDAOEmpresa.Salvar(Self);
end;

function TModelEmpresa.Alterar: IModelEmpresa;
begin
  Result := Self;
  FDAOEmpresa.Alterar(Self);
end;

function TModelEmpresa.Excluir(AValue: Integer): IModelEmpresa;
begin
  Result := Self;
  FDAOEmpresa.Excluir(AValue);
end;

end.
