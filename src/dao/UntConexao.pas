unit UntConexao;

interface

uses
  DB, FMTBcd, SqlExpr, Provider, DBClient, DBXpress;

type
  TConexao = class
    private
      FConn: TSQLConnection;

      procedure ConfigurarConexao;
    public
      constructor Create;
      destructor Destroy; override;

      function GetConexao: TSQLConnection;
  end;

  const
    BANCO_DADOS = 'C:\Desen\Delphi\BancoDeTalentos\db\TALENTOS.FDB';

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConn := TSQLConnection.Create(nil);

  ConfigurarConexao;

  inherited;
end;

destructor TConexao.Destroy;
begin
  inherited Destroy;
end;

procedure TConexao.ConfigurarConexao;
begin
  FConn.DriverName := 'Firebird';
  FConn.Params.Values['Database'] := BANCO_DADOS;
  FConn.Params.Values['User_Name'] := 'sysdba';
  FConn.Params.Values['Password'] := 'masterkey';
  FConn.LoginPrompt := False;
end;

function TConexao.GetConexao: TSQLConnection;
begin
  Result := FConn;
end;

end.
