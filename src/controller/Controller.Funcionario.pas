unit Controller.Funcionario;

interface

uses SysUtils,
     DB,
     Dao.Funcionario,
     Controller.Interfaces, Model.Interfaces, Model.Funcionario;

type
  TControllerFuncionario = class(TInterfacedObject, IControllerFuncionario)
    private
      FDataSource: TDataSource;
      FModelFuncionario: IModelFuncionario;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IControllerFuncionario;

      function Id(AValue: Integer): IControllerFuncionario; overload;
      function Id: integer; overload;
      function Nome(AValue: string): IControllerFuncionario; overload;
      function Nome: string; overload;
      function SobreNome(AValue: string): IControllerFuncionario; overload;
      function SobreNome: string; overload;
      function Email(AValue: string): IControllerFuncionario; overload;
      function Email: string; overload;
      function Celular(AValue: string): IControllerFuncionario; overload;
      function Celular: string; overload;
      function Linkedin(AValue: string): IControllerFuncionario; overload;
      function Linkedin: string; overload;
      function Github(AValue: string): IControllerFuncionario; overload;
      function Github: string; overload;

      function BuscaPorId(AValue: Integer): IControllerFuncionario;
      function ListarTodos: IControllerFuncionario;
      function Salvar: IControllerFuncionario;
      function Alterar: IControllerFuncionario;
      function Excluir(AValue: Integer): IControllerFuncionario;
  end;

implementation

uses Math;

{ TControllerFuncionario }

constructor TControllerFuncionario.Create(var ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  FModelFuncionario := TModelFuncionario.New(FDataSource);
end;

destructor TControllerFuncionario.Destroy;
begin
  inherited Destroy;
end;

class function TControllerFuncionario.New(var ADataSource: TDataSource): IControllerFuncionario;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerFuncionario.Id: integer;
begin
  Result := FModelFuncionario.Id;
end;

function TControllerFuncionario.Id(AValue: Integer): IControllerFuncionario;
begin
  Result := Self;
  FModelFuncionario.Id(AValue);
end;

function TControllerFuncionario.Nome: string;
begin
  Result := FModelFuncionario.Nome;
end;

function TControllerFuncionario.Nome(AValue: string): IControllerFuncionario;
begin
  Result := Self;

  if AValue = EmptyStr then
    raise Exception.Create('O Nome do funcionário não pode ser vazio.');

  FModelFuncionario.Nome(AValue);
end;

function TControllerFuncionario.SobreNome: string;
begin
  Result := FModelFuncionario.SobreNome;
end;

function TControllerFuncionario.SobreNome(AValue: string): IControllerFuncionario;
begin
  Result := Self;

  if AValue = EmptyStr then
    raise Exception.Create('O Sobre Nome do funcionário não pode ser vazio.');

  FModelFuncionario.SobreNome(AValue);
end;

function TControllerFuncionario.Email: string;
begin
  Result := FModelFuncionario.Email;
end;

function TControllerFuncionario.Email(AValue: string): IControllerFuncionario;
begin
  Result := Self;

  if AValue = EmptyStr then
    raise Exception.Create('O e-mail do funcionário não pode ser vazio.');

  FModelFuncionario.Email(AValue);
end;

function TControllerFuncionario.Celular: string;
begin
  Result := FModelFuncionario.Celular;
end;

function TControllerFuncionario.Celular(AValue: string): IControllerFuncionario;
begin
  Result := Self;

  if AValue = EmptyStr then
    raise Exception.Create('O celular do funcionário não pode ser vazio.');

  FModelFuncionario.Celular(AValue);
end;

function TControllerFuncionario.Linkedin: string;
begin
  Result := FModelFuncionario.Linkedin;
end;

function TControllerFuncionario.Linkedin(AValue: string): IControllerFuncionario;
begin
  Result := Self;

  FModelFuncionario.Linkedin(AValue);
end;

function TControllerFuncionario.Github: string;
begin
  Result := FModelFuncionario.Github;
end;

function TControllerFuncionario.Github(AValue: string): IControllerFuncionario;
begin
  Result := Self;

  FModelFuncionario.Github(AValue);
end;

function TControllerFuncionario.Alterar: IControllerFuncionario;
begin
  Result := Self;
  FModelFuncionario.Alterar;
end;

function TControllerFuncionario.Excluir(AValue: Integer): IControllerFuncionario;
begin
  Result := Self;
  FModelFuncionario.Excluir(AValue);
end;

function TControllerFuncionario.BuscaPorId(AValue: Integer): IControllerFuncionario;
begin
  Result := Self;
  FModelFuncionario.BuscarPorId(AValue);
end;

function TControllerFuncionario.ListarTodos: IControllerFuncionario;
begin
  Result := Self;
  FModelFuncionario.ListarTodos;
end;

function TControllerFuncionario.Salvar: IControllerFuncionario;
begin
  Result := Self;
  FModelFuncionario.Salvar;
end;

end.
