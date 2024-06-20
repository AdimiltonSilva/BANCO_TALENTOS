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
      FSqlQryCargo: TSQLQuery;
      FDspCargo: TDataSetProvider;
      FCdsCargo: TClientDataSet;
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

  FSqlQryCargo := TSQLQuery.Create(nil);
  FSqlQryCargo.SQLConnection := FConexao.GetConexao;

  FDspCargo := TDataSetProvider.Create(nil);
  FDspCargo.DataSet := FSqlQryCargo;

  FCdsCargo := TClientDataSet.Create(nil);
  FCdsCargo.SetProvider(FDspCargo);

  ADataSource.DataSet := FCdsCargo;
end;

destructor TDAOCargo.Destroy;
begin
  FreeandNil(FSqlQryCargo);
  FreeandNil(FDspCargo);
  FreeandNil(FCdsCargo);

  inherited Destroy;
end;

class function TDAOCargo.New(var ADataSource: TDataSource): IDAOCargo;
begin
  Result := Self.Create(ADataSource);
end;

function TDAOCargo.BuscarPorId(AValue: Integer): IDAOCargo;
begin
  Result := Self;

  try
    FSqlQryCargo.Close;
    FSqlQryCargo.SQL.Clear;
    FSqlQryCargo.SQL.Add('SELECT c.id, c.descricao');
    FSqlQryCargo.SQL.Add('  FROM CARGOS c');
    FSqlQryCargo.SQL.Add(' WHERE c.id = :idCargo');
    FSqlQryCargo.ParamByName('idCargo').AsInteger := AValue;
    FCdsCargo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao consultar: ' + E.Message);
  end;
end;

function TDAOCargo.ListarTodos: IDAOCargo;
begin
  Result := Self;

  try
    FSqlQryCargo.Close;
    FSqlQryCargo.SQL.Clear;
    FSqlQryCargo.SQL.Add('SELECT c.id, c.descricao');
    FSqlQryCargo.SQL.Add('  FROM CARGOS c');
    FSqlQryCargo.SQL.Add(' ORDER BY c.id');
    FCdsCargo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOCargo.Salvar(ACargo: IModelCargo): IDAOCargo;
begin
  Result := Self;

  try
    FSqlQryCargo.Close;
    FSqlQryCargo.SQL.Clear;
    FSqlQryCargo.SQL.Add('INSERT INTO CARGOS (descricao)');
    FSqlQryCargo.SQL.Add('     VALUES (:descricao)');
    FSqlQryCargo.ParamByName('descricao').AsString := ACargo.Descricao;
    FCdsCargo.Execute;
  except on E: Exception do
    raise Exception.Create('Error ao inserir: ' + E.Message);
  end;
end;

function TDAOCargo.Alterar(ACargo: IModelCargo): IDAOCargo;
begin
  Result := Self;

  try
    FSqlQryCargo.Close;
    FSqlQryCargo.SQL.Clear;
    FSqlQryCargo.SQL.Add('UPDATE CARGOS');
    FSqlQryCargo.SQL.Add('   SET descricao = :descricao');
    FSqlQryCargo.SQL.Add('WHERE id = :idCargo');
    FSqlQryCargo.ParamByName('descricao').AsString := ACargo.Descricao;
    FSqlQryCargo.ParamByName('idCargo').AsInteger := ACargo.Id;
    FCdsCargo.Execute;
  except on E: Exception do
    raise Exception.Create('Error ao atualizar: ' + E.Message);
  end;
end;

function TDAOCargo.Excluir(AValue: Integer): IDAOCargo;
begin
  Result := Self;

  try
    FSqlQryCargo.Close;
    FSqlQryCargo.SQL.Clear;
    FSqlQryCargo.SQL.Add('DELETE FROM CARGOS');
    FSqlQryCargo.SQL.Add(' WHERE id = :idCargo');
    FSqlQryCargo.ParamByName('idCargo').AsInteger := AValue;
    FCdsCargo.Execute;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;
end.

