unit Dao.Funcionario;

interface

uses
  System.SysUtils, System.Generics.Collections,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOFuncionario = class(TInterfacedObject, IDAOFuncionario)
    private
      FConexao: TConexao;
      FDQryFuncionario: TFDQuery;
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

  FDQryFuncionario := TFDQuery.Create(nil);
  FDQryFuncionario.Connection := FConexao.GetConexao;
  FDataSource := ADataSource;
  FDataSource.DataSet := TDataSet(FDQryFuncionario);
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

  FDQryFuncionario.Close;
  FDQryFuncionario.SQL.Clear;
  FDQryFuncionario.SQL.Add('SELECT pf.id, pf.nome, pf.SobreNome');
  FDQryFuncionario.SQL.Add('  FROM pfisica pf');
  FDQryFuncionario.SQL.Add(' WHERE pf.id = :idFuncionario');
  FDQryFuncionario.ParamByName('idFuncionario').AsInteger := AValue;
  FDQryFuncionario.Open;

  if FDQryFuncionario.IsEmpty then
    raise Exception.Create('Pessoa F�sica n�o existe');
end;

function TDAOFuncionario.ListarTodos: IDAOFuncionario;
begin
  Result := Self;

  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('SELECT pf.id, pf.nome, pf.SobreNome');
    FDQryFuncionario.SQL.Add('  FROM pfisica pf');
    FDQryFuncionario.SQL.Add(' ORDER BY pf.id');
    FDQryFuncionario.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOFuncionario.Salvar(AFuncionario: IModelFuncionario): IDAOFuncionario;
begin
  Result := Self;

  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('INSERT INTO pfisica (nome, SobreNome)');
    FDQryFuncionario.SQL.Add('             VALUES (:nome, :SobreNome)');
    FDQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FDQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FDQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao inserir: ' + E.Message);
  end;
end;

function TDAOFuncionario.Alterar(AFuncionario: IModelFuncionario): IDAOFuncionario;
begin
  Result := Self;

  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('UPDATE pfisica ');
    FDQryFuncionario.SQL.Add('   SET nome = :nome, ');
    FDQryFuncionario.SQL.Add('        SobreNome = :SobreNome ');
    FDQryFuncionario.SQL.Add(' WHERE id = :id');
    FDQryFuncionario.ParamByName('nome').AsString := AFuncionario.Nome;
    FDQryFuncionario.ParamByName('SobreNome').AsString := AFuncionario.SobreNome;
    FDQryFuncionario.ParamByName('id').AsInteger := AFuncionario.Id;
    FDQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

function TDAOFuncionario.Excluir(AValue: Integer): IDAOFuncionario;
begin
  Result := Self;

  try
    FDQryFuncionario.Close;
    FDQryFuncionario.SQL.Clear;
    FDQryFuncionario.SQL.Add('DELETE FROM pfisica');
    FDQryFuncionario.SQL.Add(' WHERE id = :id');
    FDQryFuncionario.ParamByName('id').AsInteger := AValue;
    FDQryFuncionario.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

end.
