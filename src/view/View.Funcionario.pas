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
    spbIdCargo: TSpeedButton;
    edtCargo: TEdit;
    lblEmpresa: TLabel;
    edtIdEmpresa: TEdit;
    spbIdEmpresa: TSpeedButton;
    edtEmpresa: TEdit;
    lblDataAdmissao: TLabel;
    dtpDataAdmissao: TDateTimePicker;
    pnlNavegadorVinculo: TPanel;
    dbgVinculo: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsVinculo: TDataSource;
    lblFuncionario: TLabel;
    edtIdFuncionario: TEdit;
    edtNomeCompleto: TEdit;
    btnNovoVinculo: TButton;
    btnSalvarVinculo: TButton;
    dsCargo: TDataSource;
    dsEmpresa: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNovoVinculoClick(Sender: TObject);
    procedure btnSalvarVinculoClick(Sender: TObject);
    procedure spbIdCargoClick(Sender: TObject);
    procedure edtIdCargoChange(Sender: TObject);
    procedure dsVinculoDataChange(Sender: TObject; Field: TField);
    procedure spbIdEmpresaClick(Sender: TObject);
    procedure edtIdEmpresaChange(Sender: TObject);
  private
    { Private declarations }
    FControllerFuncionario: IControllerFuncionario;
    FControllerVinculo: IControllerVinculo;
    FControllerCargo: IControllerCargo;
    FControllerEmpresa: IControllerEmpresa;
    procedure ConfigurarGrid;
    procedure ConfigurarGridVinculo;
    procedure LimparEditsVinculo;
  public
    { Public declarations }
  end;

var
  FrmCadastroFuncionario: TFrmCadastroFuncionario;

implementation

uses
  View.Listagem, View.Pesquisa;

{$R *.dfm}


procedure TFrmCadastroFuncionario.FormCreate(Sender: TObject);
begin
  inherited;

  FControllerCargo := TControllerCargo.New(dsCargo);
  FControllerEmpresa := TControllerEmpresa.New(dsEmpresa);
  FControllerVinculo := TControllerVinculo.New(dsVinculo);
  FControllerFuncionario := TControllerFuncionario.New(dsConsultar);

  FControllerFuncionario
    .ListarTodos;

  FControllerVinculo
    .ListarVinculoPorFuncionario(dsConsultar.DataSet.FieldByName('id').AsInteger);

  ConfigurarGrid;
  ConfigurarGridVinculo;
end;

procedure TFrmCadastroFuncionario.ConfigurarGrid;
begin
  if not (dsConsultar.DataSet.IsEmpty) then
  begin
    dbgConsultar.Columns.Items[0].Width := 40;
    dbgConsultar.Columns.Items[1].Width := 80;
    dbgConsultar.Columns.Items[2].Width := 80;
    dbgConsultar.Columns.Items[3].Width := 120;
    dbgConsultar.Columns.Items[4].Width := 70;
    dbgConsultar.Columns.Items[5].Width := 120;
    dbgConsultar.Columns.Items[6].Width := 120;
  end;
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
  ConfigurarGridVinculo;
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
  if Application.MessageBox('Confirma Exclus�o' , 'Aten��o !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerFuncionario
      .Excluir(StrToIntDef(edtId.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
    ConfigurarGridVinculo;
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
  ConfigurarGridVinculo;

  inherited;
end;

procedure TFrmCadastroFuncionario.dsConsultarDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  edtId.Text   := dsConsultar.DataSet.FieldByName('id').AsString;
  edtNome.Text := dsConsultar.DataSet.FieldByName('nome').AsString;
  edtSobreNome.Text  := dsConsultar.DataSet.FieldByName('SobreNome').AsString;

  edtIdFuncionario.Text := dsConsultar.DataSet.FieldByName('id').AsString;
  edtNomeCompleto.Text := dsConsultar.DataSet.FieldByName('nome').AsString + ' ' +
                          dsConsultar.DataSet.FieldByName('SobreNome').AsString;

  FControllerVinculo
    .ListarVinculoPorFuncionario(StrToInt(edtId.Text));
end;

procedure TFrmCadastroFuncionario.btnImprimirClick(Sender: TObject);
var
  FrmListagem: TFrmListagem;
begin
  FrmListagem := TFrmListagem.Create(nil);

  try
    FrmListagem.qrlTitulo.Caption := 'Listagem de Funcion�rios';
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

procedure TFrmCadastroFuncionario.pgcMainChange(Sender: TObject);
begin
  inherited;
  pnlBottuns.Visible := not (pgcMain.ActivePage = tsVinculo);

  if (pgcMain.ActivePage = tsVinculo) then
  begin
    FControllerVinculo
      .IdEmpresa(StrToIntDef(edtIdEmpresa.Text,0))
      .IdFuncionario(StrToIntDef(edtIdFuncionario.Text, 0))
      .ListarVinculoPorFuncionario(StrToIntDef(edtIdFuncionario.Text, 0));

    btnNovoVinculo.Enabled := True;
    btnSalvarVinculo.Enabled := False;
  end;
end;

procedure TFrmCadastroFuncionario.btnNovoVinculoClick(Sender: TObject);
begin
  inherited;
  FOperacao := opVincular;

  spbIdCargo.Enabled := True;
  spbIdEmpresa.Enabled := True;
  LimparEditsVinculo;
  btnNovoVinculo.Enabled := False;
  btnSalvarVinculo.Enabled := True;
end;

procedure TFrmCadastroFuncionario.btnSalvarVinculoClick(Sender: TObject);
begin
  inherited;

  if ((edtIdCargo.Text = EmptyStr) or (edtIdEmpresa.Text = EmptyStr)) then
  begin
    ShowMessage('Favor informar o Cargo e a Empresa');
    Exit;
  end;

  FControllerVinculo
    .IdFuncionario(StrToIntDef(edtIdFuncionario.Text, 0))
    .IdCargo(StrToIntDef(edtIdCargo.Text, 0))
    .IdEmpresa(StrToIntDef(edtIdEmpresa.Text, 0))
    .DataAdmissao(dtpDataAdmissao.DateTime)
    .ConsultarVinculo;

  if not dsVinculo.DataSet.IsEmpty then
  begin
    ShowMessage('V�nculo j� cadastrado.');
    Exit;
  end;

  FControllerVinculo
    .IdFuncionario(StrToIntDef(edtIdFuncionario.Text, 0))
    .IdCargo(StrToIntDef(edtIdCargo.Text, 0))
    .IdEmpresa(StrToIntDef(edtIdEmpresa.Text, 0))
    .DataAdmissao(dtpDataAdmissao.Date)
    .Adicionar
    .ListarVinculoPorFuncionario(StrToIntDef(edtIdFuncionario.Text, 0));

  FOperacao := opConsultar;
  spbIdCargo.Enabled := False;
  spbIdEmpresa.Enabled := False;
  btnNovoVinculo.Enabled := True;
  btnSalvarVinculo.Enabled := False;
end;

procedure TFrmCadastroFuncionario.spbIdCargoClick(Sender: TObject);
begin
  with TFrmPesquisa.Create(nil) do
  begin
    Caption := 'Pesquisar por Cargo';
    TipoPesquisa := tpCargo;
    ShowModal;

    edtIdCargo.Text := IntToStr(IdRetorno);
    edtCargo.Text := descRetorno;
    Free;
  end;
end;

procedure TFrmCadastroFuncionario.spbIdEmpresaClick(Sender: TObject);
begin
  with TFrmPesquisa.Create(nil) do
  begin
    Caption := 'Pesquisar por Empresa';
    TipoPesquisa := tpEmpresa;
    ShowModal;

    edtIdEmpresa.Text := IntToStr(IdRetorno);
    edtEmpresa.Text := descRetorno;
    Free;
  end;
end;

procedure TFrmCadastroFuncionario.edtIdCargoChange(Sender: TObject);
begin
  inherited;
  if edtIdCargo.Text <> '' then
    FControllerCargo.BuscarPorId(StrToInt(edtIdCargo.Text));
end;

procedure TFrmCadastroFuncionario.dsVinculoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtIdCargo.Text := dsVinculo.DataSet.FieldByName('id_cargo').AsString;
  edtCargo.Text := dsVinculo.DataSet.FieldByName('cargo').AsString;

  edtIdEmpresa.Text := dsVinculo.DataSet.FieldByName('id_empresa').AsString;
  edtEmpresa.Text := dsVinculo.DataSet.FieldByName('razao_social').AsString;
end;

procedure TFrmCadastroFuncionario.edtIdEmpresaChange(Sender: TObject);
begin
  inherited;
  if edtIdEmpresa.Text <> '' then
    FControllerEmpresa.BuscarPorId(StrToInt(edtIdEmpresa.Text));
end;

procedure TFrmCadastroFuncionario.LimparEditsVinculo;
begin
  edtIdCargo.Clear;
  edtCargo.Clear;
  edtIdEmpresa.Clear;
  edtEmpresa.Clear;
  dtpDataAdmissao.Date := Now();
end;

procedure TFrmCadastroFuncionario.ConfigurarGridVinculo;
begin
  if not (dsVinculo.DataSet.IsEmpty) then
  begin
    dbgVinculo.Columns.Items[0].Width := 55;
    dbgVinculo.Columns.Items[1].Width := 180;
    dbgVinculo.Columns.Items[2].Width := 60;
    dbgVinculo.Columns.Items[3].Width := 180;
    dbgVinculo.Columns.Items[4].Width := 90;
  end;
end;

end.
