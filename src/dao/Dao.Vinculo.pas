unit Dao.Vinculo;

interface

uses
  SysUtils, SqlExpr, DB,
  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOVinculo = class(TInterfacedObject, IDAOVinculo)
    private
      FConexao: TConexao;
      FSQLQryVinculo: TSQLQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IDAOVinculo;

      function Adicionar(AVinculo: IModelVinculo): IDAOVinculo;
      function Remover(AVinculo: IModelVinculo): IDAOVinculo;
      function ListarPorEmpresa(AValue: Integer): IDAOVinculo;
      function ConsultarVinculo(AVinculo: IModelVinculo): IDAOVinculo;
  end;
  
implementation

{ TDAOVinculo }

constructor TDAOVinculo.Create(var ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FSQLQryVinculo := TSQLQuery.Create(nil);
  FSQLQryVinculo.SQLConnection := FConexao.GetConexao;
  FDataSource := ADataSource;
  FDataSource.DataSet := TDataSet(FSQLQryVinculo);
end;

destructor TDAOVinculo.Destroy;
begin

  inherited Destroy;
end;

class function TDAOVinculo.New(var ADataSource: TDataSource): IDAOVinculo;
begin
  Result := Self.Create(ADataSource);
end;

function TDAOVinculo.Adicionar(AVinculo: IModelVinculo): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('INSERT INTO vinculo (id_pjuridica, id_pfisica)');
    FSQLQryVinculo.SQL.Add('             VALUES (:idEmpresa, :idFuncionario)');
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.IdFuncionario;
    FSQLQryVinculo.ExecSQL;


  except on E: Exception do
    raise Exception.Create('Error ao inserir ' + E.Message);
  end;
end;

function TDAOVinculo.Remover(AVinculo: IModelVinculo): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('DELETE FROM vinculo');
    FSQLQryVinculo.SQL.Add(' WHERE id_pjuridica = :idEmpresa');
    FSQLQryVinculo.SQL.Add('   AND id_pfisica = :idFuncionario');
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.IdFuncionario;
    FSQLQryVinculo.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir um vinculo ' + E.Message);
  end;
end;

function TDAOVinculo.ListarPorEmpresa(AValue: Integer): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('SELECT v.id_pjuridica, pj.nome AS pessoa_juridica,');
    FSQLQryVinculo.SQL.Add('       v.id_pfisica, pf.nome AS pessoa_fisica');
    FSQLQryVinculo.SQL.Add('  FROM vinculo v');
    FSQLQryVinculo.SQL.Add(' INNER JOIN pjuridica pj ON v.id_pjuridica = pj.id');
    FSQLQryVinculo.SQL.Add(' INNER JOIN pfisica pf ON v.id_pfisica = pf.id');
    FSQLQryVinculo.SQL.Add(' WHERE v.id_pjuridica = :idEmpresa');
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AValue;
    FSQLQryVinculo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar ' + E.Message);
  end;
end;

function TDAOVinculo.ConsultarVinculo(AVinculo: IModelVinculo): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('SELECT v.id_pjuridica, pj.nome AS pessoa_juridica,');
    FSQLQryVinculo.SQL.Add('       v.id_pfisica, pf.nome AS pessoa_fisica');
    FSQLQryVinculo.SQL.Add('  FROM vinculo v');
    FSQLQryVinculo.SQL.Add(' INNER JOIN pjuridica pj ON v.id_pjuridica = pj.id');
    FSQLQryVinculo.SQL.Add(' INNER JOIN pfisica pf ON v.id_pfisica = pf.id');
    FSQLQryVinculo.SQL.Add(' WHERE v.id_pjuridica = :idEmpresa');
    FSQLQryVinculo.SQL.Add('   AND v.id_pfisica = :idFuncionario');
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.IdFuncionario;
    FSQLQryVinculo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao consultar v�nculo ' + E.Message);
  end;
end;

end.
