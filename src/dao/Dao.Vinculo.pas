unit Dao.Vinculo;

interface

uses
  SysUtils,
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress,
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
      function ListarVinculoPorFuncionario(AValue: Integer): IDAOVinculo;
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
    FSQLQryVinculo.SQL.Add('INSERT INTO vinculo (id_funcionario, id_idcargo, id_empresa, data_admissao)');
    FSQLQryVinculo.SQL.Add('             VALUES (:idFuncionario, :idCargo, :idEmpresa, :dataAdmissao)');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.idFuncionario;
    FSQLQryVinculo.ParamByName('idCargo').AsInteger := AVinculo.IdCargo;
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('dataAdmissao').AsDateTime := AVinculo.DataAdmissao;
    FSQLQryVinculo.ExecSQL;


  except on E: Exception do
    raise Exception.Create('Error ao inserir. ' + E.Message);
  end;
end;

function TDAOVinculo.Remover(AVinculo: IModelVinculo): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('DELETE FROM vinculo ');
    FSQLQryVinculo.SQL.Add(' WHERE id_funcionario = :idFuncionario ');
    FSQLQryVinculo.SQL.Add('   AND id_empresa = :idEmpresa');
    FSQLQryVinculo.SQL.Add('   AND id_cargo = :idCargo');
    FSQLQryVinculo.SQL.Add('   AND data_admissao = :dataAdmissao');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.idFuncionario;
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('idCargo').AsInteger := AVinculo.IdCargo;
    FSQLQryVinculo.ParamByName('dataAdmissao').AsDate := AVinculo.DataAdmissao;
    FSQLQryVinculo.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir um vinculo. ' + E.Message);
  end;
end;

function TDAOVinculo.ListarVinculoPorFuncionario(AValue: Integer): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('SELECT v.id_empresa, e.razao_social, ');
    FSQLQryVinculo.SQL.Add('       v.id_cargo, c.descricao AS cargo, ');
    FSQLQryVinculo.SQL.Add('       v.data_admissao');
    FSQLQryVinculo.SQL.Add('  FROM vinculo v');
    FSQLQryVinculo.SQL.Add(' INNER JOIN cargo c ON v.id_cargo = c.id');
    FSQLQryVinculo.SQL.Add(' INNER JOIN empresa e ON v.id_empresa = e.id');
    FSQLQryVinculo.SQL.Add(' WHERE v.id_funcionario = :idFuncionario');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AValue;
    FSQLQryVinculo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar empresas por funcionário. ' + E.Message);
  end;
end;

function TDAOVinculo.ConsultarVinculo(AVinculo: IModelVinculo): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('SELECT v.id_empresa, e.razao_social,');
    FSQLQryVinculo.SQL.Add('       v.id_cargo, c.descricao AS cargo, ');
    FSQLQryVinculo.SQL.Add('       v.data_admissao');
    FSQLQryVinculo.SQL.Add('  FROM vinculo v');
    FSQLQryVinculo.SQL.Add(' INNER JOIN pjuridica pj ON v.id_empresa = pj.id');
    FSQLQryVinculo.SQL.Add(' INNER JOIN pfisica pf ON v.id_funcionario = pf.id');
    FSQLQryVinculo.SQL.Add(' WHERE v.id_empresa = :idEmpresa');
    FSQLQryVinculo.SQL.Add('   AND v.id_funcionario = :idFuncionario');
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.IdFuncionario;
    FSQLQryVinculo.Open;
  except on E: Exception do
    raise Exception.Create('Error ao consultar vínculo ' + E.Message);
  end;
end;

end.
