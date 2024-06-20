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
      FSqlQryVinculo: TSQLQuery;
      FDspVinculo: TDataSetProvider;
      FCdsVinculo: TClientDataSet;
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

  FDspVinculo := TDataSetProvider.Create(nil);
  FDspVinculo.DataSet := FSqlQryVinculo;

  FCdsVinculo := TClientDataSet.Create(nil);
  FCdsVinculo.SetProvider(FDspVinculo);

  ADataSource.DataSet := FCdsVinculo;
end;

destructor TDAOVinculo.Destroy;
begin
  FreeandNil(FSqlQryVinculo);
  FreeandNil(FDspVinculo);
  FreeandNil(FCdsVinculo);

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
    FSQLQryVinculo.SQL.Add('INSERT INTO VINCULOS (id_funcionario, id_idcargo, id_empresa, data_admissao)');
    FSQLQryVinculo.SQL.Add('              VALUES (:idFuncionario, :idCargo, :idEmpresa, :dataAdmissao)');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.idFuncionario;
    FSQLQryVinculo.ParamByName('idCargo').AsInteger := AVinculo.IdCargo;
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('dataAdmissao').AsDateTime := AVinculo.DataAdmissao;
    FCdsVinculo.Execute;
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
    FSQLQryVinculo.SQL.Add('DELETE FROM VINCULOS ');
    FSQLQryVinculo.SQL.Add(' WHERE id_funcionario = :idFuncionario ');
    FSQLQryVinculo.SQL.Add('   AND id_empresa = :idEmpresa');
    FSQLQryVinculo.SQL.Add('   AND id_cargo = :idCargo');
    FSQLQryVinculo.SQL.Add('   AND data_admissao = :dataAdmissao');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.idFuncionario;
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('idCargo').AsInteger := AVinculo.IdCargo;
    FSQLQryVinculo.ParamByName('dataAdmissao').AsDate := AVinculo.DataAdmissao;
    FCdsVinculo.Execute;
  except on E: Exception do
    raise Exception.Create('Error ao excluir um vinculo. ' + E.Message);
  end;
end;

function TDAOVinculo.ListarVinculoPorFuncionario(AValue: Integer): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Close;
    FSQLQryVinculo.Active := False;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('SELECT DISTINCT ');
    FSQLQryVinculo.SQL.Add('       v.id_cargo, c.descricao AS cargo, ');
    FSQLQryVinculo.SQL.Add('       v.id_empresa, e.razao_social, ');
    FSQLQryVinculo.SQL.Add('       v.data_admissao ');
    FSQLQryVinculo.SQL.Add('  FROM VINCULOS v ');
    FSQLQryVinculo.SQL.Add(' INNER JOIN CARGOS c ON c.id = v.id_cargo ');
    FSQLQryVinculo.SQL.Add(' INNER JOIN EMPRESAS e ON e.id = v.id_empresa ');
    FSQLQryVinculo.SQL.Add(' WHERE v.id_funcionario = :idFuncionario ');
    FSQLQryVinculo.SQL.Add(' ORDER BY v.id_funcionario ASC, v.data_admissao DESC');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AValue;
    FSQLQryVinculo.Active := True;
    FCdsVinculo.Active := True;
  except on E: Exception do
    raise Exception.Create('Error ao listar vínculos por funcionário. ' + E.Message);
  end;
end;

function TDAOVinculo.ConsultarVinculo(AVinculo: IModelVinculo): IDAOVinculo;
begin
  Result := Self;

  try
    FSQLQryVinculo.Active := False;
    FSQLQryVinculo.SQL.Clear;
    FSQLQryVinculo.SQL.Add('SELECT DISTINCT ');
    FSQLQryVinculo.SQL.Add('       v.id_funcionario, ');
    FSQLQryVinculo.SQL.Add('       v.id_cargo, ');
    FSQLQryVinculo.SQL.Add('       v.id_empresa, ');
    FSQLQryVinculo.SQL.Add('       v.data_admissao ');
    FSQLQryVinculo.SQL.Add('  FROM VINCULOS v ');
    FSQLQryVinculo.SQL.Add(' WHERE v.id_funcionario = :idFuncionario ');
    FSQLQryVinculo.SQL.Add('   AND v.id_cargo = :idCargo ');
    FSQLQryVinculo.SQL.Add('   AND v.id_empresa = :idEmpresa ');
    FSQLQryVinculo.SQL.Add('   AND v.data_admissao = :dataAdmissao ');
    FSQLQryVinculo.ParamByName('idFuncionario').AsInteger := AVinculo.IdFuncionario;
    FSQLQryVinculo.ParamByName('idCargo').AsInteger := AVinculo.IdCargo;
    FSQLQryVinculo.ParamByName('idEmpresa').AsInteger := AVinculo.IdEmpresa;
    FSQLQryVinculo.ParamByName('dataAdmissao').AsDate := AVinculo.DataAdmissao;
    FSQLQryVinculo.Active := True;
    FCdsVinculo.Active := True;
  except on E: Exception do
    raise Exception.Create('Error ao consultar vínculo ' + E.Message);
  end;
end;

end.
