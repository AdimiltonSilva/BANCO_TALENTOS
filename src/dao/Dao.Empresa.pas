unit Dao.Empresa;

interface

uses
  SysUtils,
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress, MidasLib,
  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOEmpresa = class(TInterfacedObject, IDAOEmpresa)
    private
      FConexao: TConexao;
      FSqlQryEmpresa: TSQLQuery;
      FDspEmpresa: TDataSetProvider;
      FCdsEmpresa: TClientDataSet;
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

  FSQLQryEmpresa := TSQLQuery.Create(nil);
  FSQLQryEmpresa.SQLConnection := FConexao.GetConexao;

  FDspEmpresa := TDataSetProvider.Create(nil);
  FDspEmpresa.DataSet := FSqlQryEmpresa;
  FDspEmpresa.Options := [poAllowCommandText];

  FCdsEmpresa := TClientDataSet.Create(nil);
  FCdsEmpresa.SetProvider(FDspEmpresa);

  ADataSource.DataSet := FCdsEmpresa;
end;

destructor TDAOEmpresa.Destroy;
begin
  FreeandNil(FSqlQryEmpresa);
  FreeandNil(FDspEmpresa);
  FreeandNil(FCdsEmpresa);

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
    FSQLQryEmpresa.Active := False;
    FSQLQryEmpresa.Close;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('SELECT e.id, e.razao_social, e.cnpj');
    FSQLQryEmpresa.SQL.Add('  FROM EMPRESAS e');
    FSQLQryEmpresa.SQL.Add(' WHERE e.id = :idEmpresa');
    FSQLQryEmpresa.ParamByName('idEmpresa').AsInteger := AValue;
    FSqlQryEmpresa.Active := True;
  except on E: Exception do
    raise Exception.Create('Error ao consultar: ' + E.Message);
  end;
end;

function TDAOEmpresa.ListarTodos: IDAOEmpresa;
begin
  Result := Self;

  try
    FSQLQryEmpresa.Active := False;
    FSQLQryEmpresa.SQL.Clear;
    FSQLQryEmpresa.SQL.Add('SELECT e.id, e.razao_social, e.cnpj');
    FSQLQryEmpresa.SQL.Add('  FROM EMPRESAS e');
    FSQLQryEmpresa.SQL.Add(' ORDER BY e.id');
    FSqlQryEmpresa.Active := True;
    FCdsEmpresa.Active := True;
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
    FSQLQryEmpresa.SQL.Add('INSERT INTO EMPRESAS (razao_social, cnpj) ');
    FSQLQryEmpresa.SQL.Add('     VALUES (:razao_social, :cnpj)');
    FSQLQryEmpresa.ParamByName('razao_social').AsString := AEmpresa.RazaoSocial;
    FSQLQryEmpresa.ParamByName('cnpj').AsString := AEmpresa.CNPJ;
    FCdsEmpresa.Execute;
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
    FSQLQryEmpresa.SQL.Add('UPDATE EMPRESAS');
    FSQLQryEmpresa.SQL.Add('   SET razao_social = :razaoSocial,');
    FSQLQryEmpresa.SQL.Add('       cnpj = :cnpj');
    FSQLQryEmpresa.SQL.Add('WHERE id = :idEmpresa');
    FSQLQryEmpresa.ParamByName('razaoSocial').AsString := AEmpresa.RazaoSocial;
    FSQLQryEmpresa.ParamByName('cnpj').AsString := AEmpresa.CNPJ;
    FSQLQryEmpresa.ParamByName('idEmpresa').AsInteger := AEmpresa.Id;
    FSqlQryEmpresa.ExecSql;
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
    FSQLQryEmpresa.SQL.Add('DELETE FROM EMPRESAS');
    FSQLQryEmpresa.SQL.Add(' WHERE id = :idEmpresa');
    FSQLQryEmpresa.ParamByName('idEmpresa').AsInteger := AValue;
    FCdsEmpresa.Execute;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;

end.

