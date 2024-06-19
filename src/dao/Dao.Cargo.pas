unit Dao.Cargo;

interface

uses
  SysUtils, 
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress,
  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOCargo = class(TInterfacedObject, IDAOCargo)
    private
      FConexao: TConexao;
      FSQLQryCargo: TSQLQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IDAOCargo;

      function BuscarPorId(AValue: Integer): IDAOCargo;
      function Salvar(ACargo: IModelCargo): IDAOCargo;
      function ListarTodos: IDAOCargo;
      function Alterar(ACargo: IModelCargo): IDAOCargo;
      function Excluir(AValue: Integer): IDAOCargo;
  end;

implementation

{ TDAOCargo }

constructor TDAOCargo.Create(var ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FSQLQryCargo := TSQLQuery.Create(nil);
  FSQLQryCargo.SQLConnection := FConexao.GetConexao;
  FDataSource := ADataSource;
  FDataSource.DataSet := TDataSet(FSQLQryCargo);
end;

destructor TDAOCargo.Destroy;
begin
  inherited Destroy;
end;

class function TDAOCargo.New(var ADataSource: TDataSource): IDAOCargo;
begin
  Result := Self.Create(ADataSource);
end;

function TDAOCargo.BuscarPorId(AValue: Integer): IDAOCargo;
begin
  Result := self;

  try
    FSQLQryCargo.Close;
    FSQLQryCargo.SQL.Clear;
    FSQLQryCargo.SQL.Add('SELECT c.id, c.descricao');
    FSQLQryCargo.SQL.Add('  FROM cargos c');
    FSQLQryCargo.SQL.Add(' WHERE c.id = :idCargo');
    FSQLQryCargo.ParamByName('idCargo').AsInteger := AValue;
    FSQLQryCargo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao consultar: ' + E.Message);
  end;
end;

function TDAOCargo.ListarTodos: IDAOCargo;
begin
  Result := Self;

  try
    FSQLQryCargo.Close;
    FSQLQryCargo.SQL.Clear;
    FSQLQryCargo.SQL.Add('SELECT c.id, c.razao_social, c.cnpj');
    FSQLQryCargo.SQL.Add('  FROM cargos c');
    FSQLQryCargo.SQL.Add(' ORDER BY c.id');
    FSQLQryCargo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOCargo.Salvar(ACargo: IModelCargo): IDAOCargo;
begin
  Result := Self;

  try
    FSQLQryCargo.Close;
    FSQLQryCargo.SQL.Clear;
    FSQLQryCargo.SQL.Add('INSERT INTO cargos (descricao');
    FSQLQryCargo.SQL.Add('     VALUES (:descricao)');
    FSQLQryCargo.ParamByName('descricao').AsString := ACargo.Descricao;
    FSQLQryCargo.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao inserir: ' + E.Message);
  end;
end;

function TDAOCargo.Alterar(ACargo: IModelCargo): IDAOCargo;
begin
  Result := Self;

  try
    FSQLQryCargo.Close;
    FSQLQryCargo.SQL.Clear;
    FSQLQryCargo.SQL.Add('UPDATE cargos');
    FSQLQryCargo.SQL.Add('   SET descricao = :descricao');
    FSQLQryCargo.SQL.Add('WHERE id = :idCargo');
    FSQLQryCargo.ParamByName('descricao').AsString := ACargo.Descricao;
    FSQLQryCargo.ParamByName('idCargo').AsInteger := ACargo.Id;
    FSQLQryCargo.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao atualizar: ' + E.Message);
  end;
end;

function TDAOCargo.Excluir(AValue: Integer): IDAOCargo;
begin
  Result := Self;

  try
    FSQLQryCargo.Close;
    FSQLQryCargo.SQL.Clear;
    FSQLQryCargo.SQL.Add('DELETE FROM cargos');
    FSQLQryCargo.SQL.Add(' WHERE id = :idCargo');
    FSQLQryCargo.ParamByName('idCargo').AsInteger := AValue;
    FSQLQryCargo.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;
end.

