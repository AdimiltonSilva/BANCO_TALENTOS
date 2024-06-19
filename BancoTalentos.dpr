program BancoTalentos;

uses
  Forms,
  View.Principal in 'src\view\View.Principal.pas' {FrmPrincipal},
  View.Modelo in 'src\view\View.Modelo.pas' {FrmCadastroPadrao},
  Model.Funcionario in 'src\model\Model.Funcionario.pas',
  Model.Empresa in 'src\model\Model.Empresa.pas',
  Model.Vinculo in 'src\model\Model.Vinculo.pas',
  View.Funcionario in 'src\view\View.Funcionario.pas' {FrmCadastroFuncionario},
  UntConexao in 'src\dao\UntConexao.pas',
  Dao.Funcionario in 'src\dao\Dao.Funcionario.pas',
  Controller.Funcionario in 'src\controller\Controller.Funcionario.pas',
  Controller.Empresa in 'src\controller\Controller.Empresa.pas',
  Dao.Empresa in 'src\dao\Dao.Empresa.pas',
  Model.Interfaces in 'src\model\Model.Interfaces.pas',
  Controller.Interfaces in 'src\controller\Controller.Interfaces.pas',
  View.Empresa in 'src\view\View.Empresa.pas' {FrmCadastroEmpresa},
  Dao.Interfaces in 'src\dao\Dao.Interfaces.pas',
  View.Listagem in 'src\view\View.Listagem.pas' {FrmListagem},
  Dao.Vinculo in 'src\dao\Dao.Vinculo.pas',
  Controller.Vinculo in 'src\controller\Controller.Vinculo.pas',
  View.Cargo in 'src\view\View.Cargo.pas' {FrmCadastroCargo},
  Model.Cargo in 'src\model\Model.Cargo.pas',
  Controller.Cargo in 'src\controller\Controller.Cargo.pas',
  Dao.Cargo in 'src\dao\Dao.Cargo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
