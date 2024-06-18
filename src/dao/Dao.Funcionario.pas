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
  FSQLQryFuncionario.SQL.Add('SELECT pf.id, pf.nome, pf.SobreNome');
  FSQLQryFuncionario.SQL.Add('  FROM pfisica pf');
  FSQLQryFuncionario.SQL.Add(' WHERE pf.id = :idFuncionario');
  FSQLQryFuncionario.ParamByName('idFuncionario').AsInteger := AValue;
  FSQLQryFuncionario.Open;

  if FSQLQryFuncionario.IsEmpty then
    raise Exception.Create('Pessoa F�sica n�o existe');
end;

function TDAOFuncionario.ListarTodos: IDAOFuncionario;
begin
  Result := Self;

  try
    FSQLQryFuncionario.Close;
    FSQLQryFuncionario.SQL.Clear;
    FSQLQryFuncionario.SQL.Add('SELECT pf.id, pf.nome, pf.SobreNome');
    FSQLQryFuncionario.SQL.Add('  FROM pfisica pf');
    FSQLQryFuncionario.SQL.Add(' ORDER BY pf.id');
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
    FSQLQryFuncionario.SQL.Add('INSERT INTO pfisica (nome, SobreNome)');
    FSQLQryFuncionario.SQL.Add('             VALUES (:nome, :SobreNome)');
    FSQLQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
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
    FSQLQryFuncionario.SQL.Add('UPDATE pfisica ');
    FSQLQryFuncionario.SQL.Add('   SET nome = :nome, ');
    FSQLQryFuncionario.SQL.Add('        SobreNome = :SobreNome ');
    FSQLQryFuncionario.SQL.Add(' WHERE id = :id');
    FSQLQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FSQLQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
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
    FSQLQryFuncionario.SQL.Add('DELETE FROM pfisica');
    FSQLQryFuncionario.SQL.Add(' WHERE id = :id');
    FSQLQryFuncionario.ParamByName('id').AsInteger := AValue;
    FSQLQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

end.
