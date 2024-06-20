unit View.Funcionario;

interface

uses
  Windows, Messages,
  SysUtils, Variants, Classes,

  Graphics, Controls, Forms, Dialogs, View.Modelo, StdCtrls,
  ComCtrls, ExtCtrls, DB, DBCtrls, Grids, DBGrids, Buttons,

  Controller.Interfaces,
  Controller.Funcionario,
  Controller.Empresa,
  Controller.Cargo,
  Controller.Vinculo;

type
  TFrmCadastroFuncionario = class(TFrmCadastroPadrao)
    lblNome: TLabel;
    lblCodigo: TLabel;
    edtId: TEdit;
    edtNome: TEdit;
    lblSobreNome: TLabel;
    edtEmail: TEdit;
    edtSobreNome: TEdit;
    EMail: TLabel;
    lblCelular: TLabel;
    edtCelular: TEdit;
    lblLinkedIn: TLabel;
    edtLinkedIn: TEdit;
    lblGitHub: TLabel;
    edtGitHub: TEdit;
    tsVinculo: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    lblCargo: TLabel;
    edtIdCargo: TEdit;
    SpeedButton1: TSpeedButton;
    edtCargo: TEdit;
    lblEmpresa: TLabel;
    edtIdEmpresa: TEdit;
    spbEmpresa: TSpeedButton;
    edtEmpresa: TEdit;
    lblDataAdmissao: TLabel;
    dtpDataAdmissao: TDateTimePicker;
    pnlNavegadorVinculo: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsVinculo: TDataSource;
    lblFuncionario: TLabel;
    edtIdFuncionario: TEdit;
    Edit2: TEdit;
    btnNovoVinculo: TButton;
    btnSalvarVinculo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalvarVinculoClick(Sender: TObject);
  private
    { Private declarations }
    FControllerFuncionario: IControllerFuncionario;
    FControllerVinculo: IControllerVinculo;
    procedure ConfigurarGrid;
  public
    { Public declarations }
  end;

var
  FrmCadastroFuncionario: TFrmCadastroFuncionario;

implementation

uses
  View.Listagem;

{$R *.dfm}


procedure TFrmCadastroFuncionario.FormCreate(Sender: TObject);
begin
  inherited;

  FControllerFuncionario := TControllerFuncionario.New(dsConsultar);
  FControllerFuncionario.ListarTodos;

  FControllerVinculo := TControllerVinculo.New(dsConsultar);
  FControllerVinculo.ListarVinculoPorFuncionario(dsConsultar.DataSet.FieldByName('id').AsInteger);

  ConfigurarGrid;
end;

procedure TFrmCadastroFuncionario.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 40;
  dbgConsultar.Columns.Items[1].Width := 280;
  dbgConsultar.Columns.Items[2].Width := 120;
end;

procedure TFrmCadastroFuncionario.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  if StrToIntDef(edtPesquisar.Text, 0) > 0 then
    FControllerFuncionario
      .BuscaPorId(StrToIntDef(edtPesquisar.Text, 0))
  else
    FControllerFuncionario
      .ListarTodos;

  ConfigurarGrid;
end;

procedure TFrmCadastroFuncionario.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroFuncionario.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroFuncionario.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerFuncionario
      .Excluir(StrToIntDef(edtId.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
  end;

  inherited;
end;

procedure TFrmCadastroFuncionario.btnSalvarClick(Sender: TObject);
begin
  if (FOperacao = opIncluir) then
    FControllerFuncionario
      .Id(StrToIntDef(edtId.Text, 0))
      .Nome(edtNome.Text)
      .SobreNome(edtSobreNome.Text)
      .EMail(edtEmail.Text)
      .Celular(edtCelular.Text)
      .Linkedin(edtLinkedIn.Text)
      .Github(edtGitHub.Text)
      .Salvar
      .ListarTodos
  else
    FControllerFuncionario
      .Id(StrToIntDef(edtId.Text, 0))
      .Nome(edtNome.Text)
      .SobreNome(edtSobreNome.Text)
      .EMail(edtEmail.Text)
      .Celular(edtCelular.Text)
      .Linkedin(edtLinkedIn.Text)
      .Github(edtGitHub.Text)
      .Alterar
      .ListarTodos;

  ConfigurarGrid;

  inherited;
end;

procedure TFrmCadastroFuncionario.dsConsultarDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  edtId.Text   := dsConsultar.DataSet.FieldByName('id').AsString;
  edtNome.Text := dsConsultar.DataSet.FieldByName('nome').AsString;
  edtSobreNome.Text  := dsConsultar.DataSet.FieldByName('SobreNome').AsString;
end;

procedure TFrmCadastroFuncionario.btnImprimirClick(Sender: TObject);
var
  FrmListagem: TFrmListagem;
begin
  FrmListagem := TFrmListagem.Create(nil);

  try
    FrmListagem.qrlTitulo.Caption := 'Listagem de Funcionários';
    FrmListagem.qrListagem.DataSet := dsConsultar.DataSet;
    FrmListagem.qrlTipoDoc.Caption := 'SobreNome';
    FrmListagem.qrdbtDocumento.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtDocumento.DataField := 'SobreNome';
    FrmListagem.qrdbtNome.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtNome.DataField := 'NOME';

    FrmListagem.qrListagem.Preview;
  finally
    if FrmListagem <> nil then
      FreeAndNil(FrmListagem);
  end;
end;

procedure TFrmCadastroFuncionario.btnSalvarVinculoClick(Sender: TObject);
begin
  inherited;
{
procedure TFrmCadastroEmpresa.HabilitarEditsVinculo(AValue: Boolean);
begin
  edtId.Enabled := False;
  edtRazaoSocial.Enabled := AValue;
  edtCNPJ.Enabled := AValue;
end;

procedure TFrmCadastroEmpresa.btnAdicionarVinculoClick(Sender: TObject);
begin
  inherited;

  FOperacao := opVincular;

  FControllerVinculo
    .IdEmpresa(StrToIntDef(edtIdEmpresa.Text, 0))
    .IdFuncionario(StrToIntDef(edtIdFuncionario.Text, 0))
    .ConsultarVinculo;

  if not dsVinculo.DataSet.IsEmpty then
  begin
    ShowMessage('Vinculo jï¿½ cadastrado.');
    Exit
  end;

  FControllerVinculo
    .IdEmpresa(StrToIntDef(edtIdEmpresa.Text,0))
    .IdFuncionario(StrToIntDef(edtIdFuncionario.Text, 0))
    .Adicionar
    .ListarPorEmpresa(StrToIntDef(edtIdEmpresa.Text,0));

  ConfigurarGridVinculo;
end;

procedure TFrmCadastroEmpresa.btnRemoverVinculoClick(Sender: TObject);
begin
  inherited;

//  FControllerVinculo
//    .ListarPorEmpresa(StrToIntDef(edtIdEmpresa.Text, 0));

  FControllerVinculo
    .IdEmpresa(StrToIntDef(edtIdEmpresa.Text,0))
    .IdFuncionario(StrToIntDef(edtIdFuncionario.Text, 0))
    .Remover
    .ListarPorEmpresa(StrToIntDef(edtIdEmpresa.Text,0));

  ConfigurarGridVinculo;
end;

}
end;

end.
