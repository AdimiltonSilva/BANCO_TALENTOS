unit Dao.Funcionario;

interface

uses
  SysUtils, SqlExpr, DB,
  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOFuncionario = class(TInterfacedObject, IDAOFuncionario)
    private
      FConexao: TConexao;
      FSQLQryFuncionario: TSQLQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IDAOFuncionario;

      function BuscarPorId(AValue: Integer): IDAOFuncionario;
      function Salvar(AFuncionario: IModelFuncionario): IDAOFuncionario;
      function ListarTodos: IDAOFuncionario;
      function ListarEmpresaPorFuncionario(AValue: Integer): IDAOFuncionario;
      function Alterar(AFuncionario: IModelFuncionario): IDAOFuncionario;
      function Excluir(AValue: Integer): IDAOFuncionario;
  end;

implementation

{ TDAOFuncionario }

constructor TDAOFuncionario.Create(var ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FSQLQryFuncionario := TSQLQuery.Create(nil);
  FSQLQryFuncionario.SQLConnection := FConexao.GetConexao;
  
  FDataSource := ADataSource;
  FDataSource.DataSet := TDataSet(FSQLQryFuncionario);
end;

destructor TDAOFuncionario.Destroy;
begin

  inherited Destroy;
end;

class function TDAOFuncionario.New(var ADataSource: TDataSource): IDAOFuncionario;
begin
  Result := Self.Create(ADataSource)
end;

function TDAOFuncionario.BuscarPorId(AValue: Integer): IDAOFuncionario;
begin
  Result := Self;

  FSQLQryFuncionario.Close;
  FSQLQryFuncionario.SQL.Clear;
  FSQLQryFuncionario.SQL.Add('SELECT f.id, f.nome, f.sobrenome, f.email, ');
  FSQLQryFuncionario.SQL.Add('       f.celular, f.linkedin, f.github, f.dataadmissao ');
  FSQLQryFuncionario.SQL.Add('  FROM funcionarios f');
  FSQLQryFuncionario.SQL.Add(' WHERE f.id = :idFuncionario');
  FSQLQryFuncionario.ParamByName('idFuncionario').AsInteger := AValue;
  FSQLQryFuncionario.Open;

  if FSQLQryFuncionario.IsEmpty then
    raise Exception.Create('Funcionário não existe');
end;

function TDAOFuncionario.ListarTodos: IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('SELECT f.id, f.nome, f.sobrenome, f.email, ');
    FSQLQryFuncionario.SQL.Add('       f.celular, f.linkedin, f.github, f.dataadmissao ');
    FSQLQryFuncionario.SQL.Add('  FROM funcionarios f');
    FSQLQryFuncionario.SQL.Add(' ORDER BY pf.id');
    FSQLQryFuncionario.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOFuncionario.ListarEmpresaPorFuncionario(AValue: Integer): IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('SELECT e.id, e.razao_social, e.cnpj ');
    FSQLQryFuncionario.SQL.Add('  FROM empresas e');
    FSQLQryFuncionario.SQL.Add(' WHERE e.id = :idFuncionario');
    FSQLQryFuncionario.ParamByName('idFuncionario').AsInteger := AValue;
    FSQLQryFuncionario.SQL.Add(' ORDER BY e.id');
    FSQLQryFuncionario.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOFuncionario.Salvar(AFuncionario: IModelFuncionario): IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('INSERT INTO funcionarios (nome, sobrenome, email, celular, ');
    FSQLQryFuncionario.SQL.Add('                         linkedin, github, dataadmissao, ');
    FSQLQryFuncionario.SQL.Add('                         idcargo, idempresa');
    FSQLQryFuncionario.SQL.Add('                 VALUES (:nome, :SobreNome, :eMail, :celular, :LinkedIn, ');
    FSQLQryFuncionario.SQL.Add('                         :GitHub, :idCargo, :idEmpresa, :dataAdmissao)');
    FSQLQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('eMail').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('celular').AsString := AFuncionario.Celular;
    FSQLQryFuncionario.ParamByName('LinkedIn').AsString := AFuncionario.Linkedin;
    FSQLQryFuncionario.ParamByName('GitHub').AsString := AFuncionario.Github;
    FSQLQryFuncionario.ParamByName('idCargo').AsInteger := AFuncionario.IdCargo;
    FSQLQryFuncionario.ParamByName('idEmpresa').AsInteger := AFuncionario.IdEmpresa;
    FSQLQryFuncionario.ParamByName('dataAdmissao').AsDate := AFuncionario.DataAdmissao;
    FSQLQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao inserir: ' + E.Message);
  end;
end;

function TDAOFuncionario.Alterar(AFuncionario: IModelFuncionario): IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('UPDATE funcionarios ');
    FSQLQryFuncionario.SQL.Add('   SET nome = :nome, ');
    FSQLQryFuncionario.SQL.Add('       SobreNome = :SobreNome, ');
    FSQLQryFuncionario.SQL.Add('       email = :eMail, ');
    FSQLQryFuncionario.SQL.Add('       celular = :celular, ');
    FSQLQryFuncionario.SQL.Add('       linkedin = :LinkedIn, ');
    FSQLQryFuncionario.SQL.Add('       github = :GitHub, ');
    FSQLQryFuncionario.SQL.Add('       idcargo = :idCargo, ');
    FSQLQryFuncionario.SQL.Add('       idempresa = :idEmpresa, ');
    FSQLQryFuncionario.SQL.Add('       dataadmissao = :dataAdmissao ');
    FSQLQryFuncionario.SQL.Add(' WHERE id = :id');
    FSQLQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('eMail').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('celular').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('LinkedIn').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('GitHub').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('id').AsInteger := AFuncionario.Id;
    FSQLQryFuncionario.ParamByName('id').AsInteger := AFuncionario.Id;
    FSQLQryFuncionario.ParamByName('id').AsInteger := AFuncionario.Id;
    FSQLQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

function TDAOFuncionario.Excluir(AValue: Integer): IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('DELETE FROM funcionarios');
    FSQLQryFuncionario.SQL.Add(' WHERE id = :id');
    FSQLQryFuncionario.ParamByName('id').AsInteger := AValue;
    FSQLQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;

end.
