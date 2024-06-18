unit UntConexao;

interface

uses
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress;

type
  TConexao = class
    private
      FConn: TFDConnection;
      FDPhysFBDriverLink: TFDPhysDriverLink;

      procedure ConfigurarConexao;
    public
      constructor Create;
      destructor Destroy; override;

      function GetConexao: TFDConnection;
  end;

  const
    BANCO_DADOS = 'C:\Desen\Delphi\BancoDeTalentos\db\TALENTOS.FDB';

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  ConfigurarConexao;

  inherited;
end;

destructor TConexao.Destroy;
begin
  inherited Destroy;
end;

procedure TConexao.ConfigurarConexao;
begin
  FConn.Params.Database := BANCO_DADOS;
  FConn.Params.DriverID := 'FB';
  FConn.Params.UserName := 'sysdba';
  FConn.Params.Password := 'masterkey';
  FConn.LoginPrompt := False;
end;

function TConexao.GetConexao: TFDConnection;
begin
  Result := FConn;
end;

end.
