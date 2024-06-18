unit Controller.Empresa;

interface

uses System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
     DB,
     Controller.Interfaces, Model.Interfaces, Model.Empresa;

type
  TControllerEmpresa = class(TInterfacedObject, IControllerEmpresa)
    private
      //FDAOEmpresa = TDAOEmpresa;
      FDataSource: TDataSource;
      FModelEmpresa: IModelEmpresa;
    public
      constructor Create(ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(ADataSource: TDataSource): IControllerEmpresa;

      function Id(AValue: Integer): IControllerEmpresa overload;
      function Id: integer; overload;
      function RazaoSocial(AValue: string): IControllerEmpresa overload;
      function RazaoSocial: string; overload;
      function CNPJ(AValue: string): IControllerEmpresa overload;
      function CNPJ: string; overload;

      function BuscarPorId(AValue: Integer): IControllerEmpresa;
      function Salvar: IControllerEmpresa;
      function ListarTodos: IControllerEmpresa;
      function Alterar: IControllerEmpresa;
      function Excluir(AValue: Integer): IControllerEmpresa;
  end;

implementation

{ TControllerEmpresa }

constructor TControllerEmpresa.Create(ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  FModelEmpresa := TModelEmpresa.New(FDataSource);
end;

destructor TControllerEmpresa.Destroy;
begin
  inherited Destroy;
end;

class function TControllerEmpresa.New(ADataSource: TDataSource): IControllerEmpresa;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerEmpresa.Id: Integer;
begin
  Result := FModelEmpresa.Id;
end;

function TControllerEmpresa.Id(AValue: Integer): IControllerEmpresa;
begin
  Result := Self;
  FModelEmpresa.Id(AValue);
end;

function TControllerEmpresa.RazaoSocial: String;
begin
  Result := FModelEmpresa.RazaoSocial;
end;

function TControllerEmpresa.RazaoSocial(AValue: String): IControllerEmpresa;
begin
  Result := Self;

  if AValue.IsEmpty then
    raise Exception.Create('A Razão Social da Pessoa não pode ser vazia.');

  FModelEmpresa.RazaoSocial(Avalue);
end;

function TControllerEmpresa.CNPJ: String;
begin
  Result := FModelEmpresa.CNPJ;
end;

function TControllerEmpresa.CNPJ(AValue: String): IControllerEmpresa;
begin
  Result := Self;

  if AValue.IsEmpty then
    raise Exception.Create('O CNPJ não pode ser vazio.');

  FModelEmpresa.CNPJ(AValue);
end;

function TControllerEmpresa.BuscarPorId(AValue: Integer): IControllerEmpresa;
begin
  Result := Self;
  FModelEmpresa.BuscarPorId(AValue);
end;

function TControllerEmpresa.ListarTodos: IControllerEmpresa;
begin
  Result := Self;
  FModelEmpresa.ListarTodos;
end;

function TControllerEmpresa.Salvar: IControllerEmpresa;
begin
  Result := Self;
  FModelEmpresa.Salvar;
end;

function TControllerEmpresa.Alterar: IControllerEmpresa;
begin
  Result := Self;
  FModelEmpresa.Alterar;
end;

function TControllerEmpresa.Excluir(AValue: Integer): IControllerEmpresa;
begin
  Result := Self;
  FModelEmpresa.Excluir(AValue);
end;

end.
