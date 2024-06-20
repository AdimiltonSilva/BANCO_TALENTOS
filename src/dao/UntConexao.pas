unit UntConexao;

interface

uses
  SysUtils, DB, FMTBcd, SqlExpr, DBClient, Provider;

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
    BANCO_DADOS = '127.0.0.1:C:\Desen\Delphi\BANCO_TALENTOS\db\TESTE.FDB';

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
  with FConn do
  begin
    ConnectionName := 'IBConnection';
    DriverName := 'Interbase';
    GetDriverFunc := 'getSQLDriverINTERBASE';
    LibraryName := 'dbexpint.dll';
    LoginPrompt := False;
    Params.Values['DriverName'] := 'Interbase';
    Params.Values['Database'] := BANCO_DADOS;
    Params.Values['RoleName'] := 'RoleName';
    Params.Values['User_Name'] := 'SYSDBA';
    Params.Values['Password'] := 'masterkey';
    Params.Values['SQLDialect'] := '3';
    Params.Values['LocaleCode'] := '0000';
    Params.Values['BlobSize'] := '-1';
    Params.Values['CommitRetain'] := 'False';
    Params.Values['WaitOnLocks'] := 'True';
    Params.Values['Interbase TransIsolation'] := 'ReadCommited';
    Params.Values['Trim Char'] := 'False';
    VendorLib := 'gds32.dll';
  end;
end;

function TConexao.GetConexao: TSQLConnection;
begin
  Result := FConn;

  try
    FConn.Open;
  except on E:Exception do
    begin
      raise Exception.Create('Falha na conexão com o Banco de Dados. ' + E.Message);
      Exit;
    end;
  end;
end;

end.