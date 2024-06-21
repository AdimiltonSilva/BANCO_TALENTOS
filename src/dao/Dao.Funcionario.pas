unit Dao.Funcionario;

interface

uses
  SysUtils,
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress,
  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOFuncionario = class(TInterfacedObject, IDAOFuncionario)
    private
      FConexao: TConexao;
      FSqlQryFuncionario: TSQLQuery;
      FDspFuncionario: TDataSetProvider;
      FCdsFuncionario: TClientDataSet;
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
      function AgruparPorFuncionario: IDAOFuncionario;
  end;

implementation

{ TDAOFuncionario }

constructor TDAOFuncionario.Create(var ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FSQLQryFuncionario := TSQLQuery.Create(nil);
  FSQLQryFuncionario.SQLConnection := FConexao.GetConexao;

  FDspFuncionario := TDataSetProvider.Create(nil);
  FDspFuncionario.DataSet := FSqlQryFuncionario;

  FCdsFuncionario := TClientDataSet.Create(nil);
  FCdsFuncionario.SetProvider(FDspFuncionario);

  ADataSource.DataSet := FCdsFuncionario;
end;

destructor TDAOFuncionario.Destroy;
begin
  FreeandNil(FSqlQryFuncionario);
  FreeandNil(FDspFuncionario);
  FreeandNil(FCdsFuncionario);

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
  FSQLQryFuncionario.SQL.Add('SELECT f.id, f.nome, f.sobrenome, ');
  FSQLQryFuncionario.SQL.Add('       f.nome || '' '' || f.sobrenome AS funcionario, ');
  FSQLQryFuncionario.SQL.Add('       f.email, f.celular, f.linkedin, f.github ');
  FSQLQryFuncionario.SQL.Add('  FROM FUNCIONARIOS f');
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
    FSQLQryFuncionario.SQL.Add('SELECT f.id, f.nome, f.sobrenome, ');
    FSQLQryFuncionario.SQL.Add('       f.nome || '' '' || f.sobrenome AS funcionario, ');
    FSQLQryFuncionario.SQL.Add('       f.email, f.celular, f.linkedin, f.github ');
    FSQLQryFuncionario.SQL.Add('  FROM FUNCIONARIOS f');
    FSQLQryFuncionario.SQL.Add(' ORDER BY f.id');
    FCdsFuncionario.Open;
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
    FSQLQryFuncionario.SQL.Add('INSERT INTO FUNCIONARIOS (nome, sobrenome, email, celular, ');
    FSQLQryFuncionario.SQL.Add('                         linkedin, github, dataadmissao, ');
    FSQLQryFuncionario.SQL.Add('                         idcargo, idempresa');
    FSQLQryFuncionario.SQL.Add('                  VALUES (:nome, :SobreNome, :eMail, :celular, :LinkedIn, ');
    FSQLQryFuncionario.SQL.Add('                         :GitHub, :idCargo, :idEmpresa, :dataAdmissao)');
    FSQLQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('eMail').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('celular').AsString := AFuncionario.Celular;
    FSQLQryFuncionario.ParamByName('LinkedIn').AsString := AFuncionario.Linkedin;
    FSQLQryFuncionario.ParamByName('GitHub').AsString := AFuncionario.Github;
    FCdsFuncionario.Open;
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
    FSQLQryFuncionario.SQL.Add('UPDATE FUNCIONARIOS ');
    FSQLQryFuncionario.SQL.Add('   SET nome = :nome, ');
    FSQLQryFuncionario.SQL.Add('       SobreNome = :SobreNome, ');
    FSQLQryFuncionario.SQL.Add('       email = :eMail, ');
    FSQLQryFuncionario.SQL.Add('       celular = :celular, ');
    FSQLQryFuncionario.SQL.Add('       linkedin = :LinkedIn, ');
    FSQLQryFuncionario.SQL.Add('       github = :GitHub ');
    FSQLQryFuncionario.SQL.Add(' WHERE id = :id');
    FSQLQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('eMail').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('celular').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('LinkedIn').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('GitHub').AsString := AFuncionario.SobreNome;
    FSQLQryFuncionario.ParamByName('id').AsInteger := AFuncionario.Id;
    FCdsFuncionario.Open;
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
    FSQLQryFuncionario.SQL.Add('DELETE FROM FUNCIONARIOS');
    FSQLQryFuncionario.SQL.Add(' WHERE id = :id');
    FSQLQryFuncionario.ParamByName('id').AsInteger := AValue;
    FCdsFuncionario.Open;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;

function TDAOFuncionario.ListarEmpresaPorFuncionario(AValue: Integer): IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('SELECT DISTINCT ');
    FSQLQryFuncionario.SQL.Add('       v.id_cargo, c.descricao, ');
    FSQLQryFuncionario.SQL.Add('       v.id_empresa, e.razao_social, ');
    FSQLQryFuncionario.SQL.Add('       v.data_admissao ');
    FSQLQryFuncionario.SQL.Add('  FROM vinculos v ');
    FSQLQryFuncionario.SQL.Add(' INNER JOIN cargos c on c.id = v.id_cargo ');
    FSQLQryFuncionario.SQL.Add(' INNER JOIN empresas e on e.id = v.id_empresa ');
    FSQLQryFuncionario.SQL.Add(' WHERE v.id_funcionario = :idFuncionario');
    FSQLQryFuncionario.SQL.Add(' ORDER BY v.id_funcionario ASC, v.data_admissao DESC');
    FSQLQryFuncionario.ParamByName('idFuncionario').AsInteger := AValue;
    FCdsFuncionario.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar vínculos: ' + E.Message);
  end;
end;

function TDAOFuncionario.AgruparPorFuncionario: IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('SELECT DISTINCT f.id, ');
    FSQLQryFuncionario.SQL.Add('       f.nome || '' '' || f.sobrenome AS nome_completo, ');
    FSQLQryFuncionario.SQL.Add('       f.email, f.celular, f.linkedin, f.github, ');
    FSQLQryFuncionario.SQL.Add('       e.razao_social AS empresa, ');
    FSQLQryFuncionario.SQL.Add('       c.descricao AS cargo, v.data_admissao ');
    FSQLQryFuncionario.SQL.Add('  FROM FUNCIONARIOS f ');
    FSQLQryFuncionario.SQL.Add('  LEFT JOIN VINCULOS v ON v.id_funcionario = f.id ');
    FSQLQryFuncionario.SQL.Add('  LEFT JOIN CARGOS c ON c.id = v.id_cargo ');
    FSQLQryFuncionario.SQL.Add('  LEFT JOIN EMPRESAS e ON e.id = v.id_empresa ');
    FSQLQryFuncionario.SQL.Add(' ORDER BY f.id ASC, v.data_admissao DESC ');
    FCdsFuncionario.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar funcionários: ' + E.Message);
  end;
end;

end.
