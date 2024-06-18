unit Dao.Empresa;

interface

uses
  System.SysUtils, System.Generics.Collections,
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress,
  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOEmpresa = class(TInterfacedObject, IDAOEmpresa)
    private
      FConexao: TConexao;
      FSQLQryEmpresa: TSQLQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IDAOEmpresa;

      function BuscarPorId(AValue: Integer): IDAOEmpresa;
      function Salvar(AEmpresa: IModelEmpresa): IDAOEmpresa;
      function ListarTodos: IDAOEmpresa;
      function Alterar(AEmpresa: IModelEmpresa): IDAOEmpresa;
      function Excluir(AValue: Integer): IDAOEmpresa;
  end;

implementation

{ TDAOEmpresa }

constructor TDAOEmpresa.Create(var ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FSQLQryEmpresa := TFDQuery.Create(nil);
  FSQLQryEmpresa.Connection := FConexao.GetConexao;
  FDataSource := ADataSource;
  FDataSource.DataSet := TDataSet(FSQLQryEmpresa);
end;

destructor TDAOEmpresa.Destroy;
begin
  inherited Destroy;
end;

class function TDAOEmpresa.New(var ADataSource: TDataSource): IDAOEmpresa;
begin
  Result := Self.Create(ADataSource);
end;

function TDAOEmpresa.BuscarPorId(AValue: Integer): IDAOEmpresa;
begin
  Result := self;

  try
    FSQLQryEmpresa.Close;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('SELECT e.id, e.razao_social, e.cnpj');
    FSQLQryEmpresa.SQL.Add('  FROM empresas e');
    FSQLQryEmpresa.SQL.Add(' WHERE e.id = :idEmpresa');
    FSQLQryEmpresa.ParamByName('idEmpresa').AsInteger := AValue;
    FSQLQryEmpresa.Open;
  except on E: Exception do
    raise Exception.Create('Error ao consultar: ' + E.Message);
  end;
end;

function TDAOEmpresa.ListarTodos: IDAOEmpresa;
begin
  Result := Self;

  try
    FSQLQryEmpresa.Close;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('SELECT e.id, e.razao_social, e.cnpj');
    FSQLQryEmpresa.SQL.Add('  FROM empresas e');
    FSQLQryEmpresa.SQL.Add(' ORDER BY e.id');
    FSQLQryEmpresa.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOEmpresa.Salvar(AEmpresa: IModelEmpresa): IDAOEmpresa;
begin
  Result := Self;

  try
    FSQLQryEmpresa.Close;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('INSERT INTO empresas (razao_social, cnpj');
    FSQLQryEmpresa.SQL.Add('     VALUES (:razao_social, :cnpj)');
    FSQLQryEmpresa.ParamByName('razao_social').AsString := AEmpresa.RazaoSocial;
    FSQLQryEmpresa.ParamByName('cnpj').AsString := AEmpresa.CNPJ;
    FSQLQryEmpresa.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao inserir: ' + E.Message);
  end;
end;

function TDAOEmpresa.Alterar(AEmpresa: IModelEmpresa): IDAOEmpresa;
begin
  Result := Self;

  try
    FSQLQryEmpresa.Close;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('UPDATE empresas');
    FSQLQryEmpresa.SQL.Add('   SET razao_social = :razao_social,');
    FSQLQryEmpresa.SQL.Add('       cnpj = :cnpj');
    FSQLQryEmpresa.SQL.Add('WHERE id = :idEmpresa');
    FSQLQryEmpresa.ParamByName('razao_social').AsString := AEmpresa.Nome;
    FSQLQryEmpresa.ParamByName('cnpj').AsString := AEmpresa.CNPJ;
    FSQLQryEmpresa.ParamByName('idEmpresa').AsInteger := AEmpresa.Id;
    FSQLQryEmpresa.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao atualizar: ' + E.Message);
  end;
end;

function TDAOEmpresa.Excluir(AValue: Integer): IDAOEmpresa;
begin
  Result := Self;

  try
    FSQLQryEmpresa.Close;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('DELETE FROM empresas');
    FSQLQryEmpresa.SQL.Add(' WHERE id = :idEmpresa');
    FSQLQryEmpresa.ParamByName('idEmpresa').AsInteger := AValue;
    FSQLQryEmpresa.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;
end.

