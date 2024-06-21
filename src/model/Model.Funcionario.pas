unit Model.Funcionario;

interface

uses
  Model.Interfaces, Dao.Interfaces, Dao.Funcionario, DB;

type
  TModelFuncionario = class(TInterfacedObject, IModelFuncionario)
    private
      FId: integer;
      FNome: string;
      FSobreNome: string;
      FEmail: string;
      FCelular: string;
      FLinkedin: string;
      FGithub: string;
      FIdCargo: Integer;
      FIdEmpresa: Integer;
      FDataAdmissao: TDateTime;
      FDAOFuncionario: IDAOFuncionario;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IModelFuncionario;

      function Id(AValue: Integer): IModelFuncionario; overload;
      function Id: Integer; overload;
      function Nome(AValue: string): IModelFuncionario; overload;
      function Nome: string; overload;
      function SobreNome(AValue: string): IModelFuncionario; overload;
      function SobreNome: string; overload;
      function Email(AValue: string): IModelFuncionario; overload;
      function Email: string; overload;
      function Celular(AValue: string): IModelFuncionario; overload;
      function Celular: string; overload;
      function Linkedin(AValue: string): IModelFuncionario; overload;
      function Linkedin: string; overload;
      function Github(AValue: string): IModelFuncionario; overload;
      function Github: string; overload;
      function IdCargo(AValue: Integer): IModelFuncionario; overload;
      function IdCargo: Integer; overload;
      function IdEmpresa(AValue: Integer): IModelFuncionario; overload;
      function IdEmpresa: Integer; overload;
      function DataAdmissao(AValue: TDateTime): IModelFuncionario; overload;
      function DataAdmissao: TDateTime; overload;

      function Salvar: IModelFuncionario;
      function ListarTodos: IModelFuncionario;
      //function ListarEmpresaPorFuncionario(AValue: Integer): IModelFuncionario;
      function BuscarPorId(AValue: Integer): IModelFuncionario;
      function Alterar: IModelFuncionario;
      function Excluir(AValue: Integer): IModelFuncionario;
      function AgruparPorFuncionario: IModelFuncionario;
  end;

implementation

{ TModelFuncionario }

constructor TModelFuncionario.Create(var ADataSource: TDataSource);
begin
  Self.FDataSource := ADataSource;
  FDAOFuncionario := TDAOFuncionario.New(FDataSource);
end;

destructor TModelFuncionario.Destroy;
begin

  inherited Destroy;
end;

class function TModelFuncionario.New(var ADataSource: TDataSource): IModelFuncionario;
begin
  Result := Self.Create(ADataSource);
end;

function TModelFuncionario.Id: Integer;
begin
  Result := Self.FId;
end;

function TModelFuncionario.Id(AValue: Integer): IModelFuncionario;
begin
  Result := Self;
  Self.FId := AValue;
end;

function TModelFuncionario.Nome: string;
begin
  Result := Self.FNome;
end;

function TModelFuncionario.Nome(AValue: string): IModelFuncionario;
begin
  Result := Self;
  Self.FNome := AValue;
end;

function TModelFuncionario.SobreNome: string;
begin
  Result := Self.FSobreNome;
end;

function TModelFuncionario.SobreNome(AValue: string): IModelFuncionario;
begin
  Result := Self;
  Self.FSobreNome := AValue;
end;

function TModelFuncionario.Email: string;
begin
  Result := Self.FEmail;
end;

function TModelFuncionario.Email(AValue: string): IModelFuncionario;
begin
  Result := Self;
  Self.FEmail := AValue;
end;

function TModelFuncionario.Celular: string;
begin
  Result := Self.FCelular;
end;

function TModelFuncionario.Celular(AValue: string): IModelFuncionario;
begin
  Result := Self;
  Self.FCelular := AValue;
end;

function TModelFuncionario.Linkedin: string;
begin
  Result := Self.FLinkedin;
end;

function TModelFuncionario.Linkedin(AValue: string): IModelFuncionario;
begin
  Result := Self;
  Self.FLinkedin := AValue;
end;

function TModelFuncionario.Github: string;
begin
  Result := Self.FGithub;
end;

function TModelFuncionario.Github(AValue: string): IModelFuncionario;
begin
  Result := Self;
  Self.FGithub := AValue;
end;

function TModelFuncionario.IdCargo: Integer;
begin
  Result := Self.FIdCargo;
end;

function TModelFuncionario.IdCargo(AValue: Integer): IModelFuncionario;
begin
  Result := Self;
  Self.FIdCargo := AValue;
end;

function TModelFuncionario.IdEmpresa: Integer;
begin
  Result := Self.FIdEmpresa;
end;

function TModelFuncionario.IdEmpresa(AValue: Integer): IModelFuncionario;
begin
  Result := Self;
  Self.FIdEmpresa := AValue;
end;

function TModelFuncionario.DataAdmissao: TDateTime;
begin
   Result := Self.FDataAdmissao;
end;

function TModelFuncionario.DataAdmissao(AValue: TDateTime): IModelFuncionario;
begin
  Result := Self;
  Self.FDataAdmissao := AValue;
end;

function TModelFuncionario.BuscarPorId(AValue: Integer): IModelFuncionario;
begin
  Result := Self;
  FDAOFuncionario.BuscarPorId(AValue);
end;

function TModelFuncionario.ListarTodos: IModelFuncionario;
begin
  Result := Self;
  FDAOFuncionario.ListarTodos;
end;

function TModelFuncionario.Alterar: IModelFuncionario;
begin
  Result := Self;
  FDAOFuncionario.Alterar(Self);
end;

function TModelFuncionario.Excluir(AValue: Integer): IModelFuncionario;
begin
  Result := Self;
  FDAOFuncionario.Excluir(AValue);
end;

function TModelFuncionario.Salvar: IModelFuncionario;
begin
  Result := Self;
  FDAOFuncionario.Salvar(Self);
end;

function TModelFuncionario.AgruparPorFuncionario: IModelFuncionario;
begin
  Result := Self;
  FDAOFuncionario.AgruparPorFuncionario;
end;

end.
