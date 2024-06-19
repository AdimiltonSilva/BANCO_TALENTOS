unit View.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Menus, ActnList;

type
  TFrmPrincipal = class(TForm)
    actlstMenu: TActionList;
    mmMenu: TMainMenu;
    actFuncionario: TAction;
    actCargo: TAction;
    actSair: TAction;
    Cadastro: TMenuItem;
    mniCliente: TMenuItem;
    mniFornecedor: TMenuItem;
    mniSair: TMenuItem;
    actEmpresa: TAction;
    Empresas1: TMenuItem;
    procedure actFuncionarioExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actCargoExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actEmpresaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  View.Funcionario, View.Empresa, View.Cargo;


{$R *.dfm}

procedure TFrmPrincipal.actFuncionarioExecute(Sender: TObject);
var
  FrmFuncionario: TFrmCadastroFuncionario;
begin
  FrmFuncionario := TFrmCadastroFuncionario.Create(nil);

  try
    FrmFuncionario.ShowModal;
  finally
    if FrmFuncionario <> nil then
      FreeAndNil(FrmFuncionario);
  end;
end;

procedure TFrmPrincipal.actCargoExecute(Sender: TObject);
var
  FrmCargo: TFrmCadastroCargo;
begin
  FrmCargo := TFrmCadastroCargo.Create(nil);

  try
    FrmCargo.ShowModal;
  finally
    if FrmCargo <> nil then
      FreeAndNil(FrmCargo);
  end;
end;

procedure TFrmPrincipal.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Sair do sistema?', 'Confirmar', MB_YESNO + MB_ICONQUESTION) = mrYes then
    Application.Terminate
  else
    CanClose := False;
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0,0);
  end;
end;

procedure TFrmPrincipal.actEmpresaExecute(Sender: TObject);
var
  FrmEmpresa: TFrmCadastroEmpresa;
begin
  FrmEmpresa := TFrmCadastroEmpresa.Create(nil);

  try
    FrmEmpresa.ShowModal;
  finally
    if FrmEmpresa <> nil then
      FreeAndNil(FrmEmpresa);
  end;
end;

end.
