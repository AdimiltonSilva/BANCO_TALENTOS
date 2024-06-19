unit View.Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, View.Modelo,
  DBCtrls, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls,
  DB,
  Controller.Interfaces,
  Controller.Vinculo,
  Controller.Empresa,
  Controller.Funcionario;

type
  TFrmCadastroEmpresa = class(TFrmCadastroPadrao)
    lblId: TLabel;
    lblRazaoSocial: TLabel;
    lblCNPJ: TLabel;
    edtID: TEdit;
    edtRazaoSocial: TEdit;
    edtCNPJ: TEdit;
    tsVinculo: TTabSheet;
    pnlVinculo: TPanel;
    pnlAdicionarVinculo: TPanel;
    lblEmpresa: TLabel;
    edtIdEmpresa: TEdit;
    btnAdicionarVinculo: TButton;
    dbgVinculo: TDBGrid;
    pnlNavegadorVinculo: TPanel;
    dbnGridVinculo: TDBNavigator;
    edtNomeEmpresa: TEdit;
    edtIdFuncionario: TEdit;
    lblFuncionario: TLabel;
    edtNomeFuncionario: TEdit;
    dsVinculo: TDataSource;
    btnRemoverVinculo: TButton;
    dsFuncionario: TDataSource;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAdicionarVinculoClick(Sender: TObject);
    procedure edtIdFuncionarioExit(Sender: TObject);
    procedure dsVinculoDataChange(Sender: TObject; Field: TField);
    procedure btnRemoverVinculoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresa: IControllerEmpresa;
    FControllerVinculo: IControllerVinculo;
    FControllerFuncionario: IControllerFuncionario;
    procedure HabilitarEditsVinculo(AValue: Boolean);
    procedure ConfigurarGrid;
    procedure ConfigurarGridVinculo;
  public
    { Public declarations }
  end;

var
  FrmCadastroEmpresa: TFrmCadastroEmpresa;

implementation

uses
  View.Listagem;

{$R *.dfm}

procedure TFrmCadastroEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  
  FControllerFuncionario := TControllerFuncionario.New(dsFuncionario);

  FControllerEmpresa := TControllerEmpresa.New(dsConsultar);
  FControllerEmpresa.ListarTodos;

  FControllerVinculo := TControllerVinculo.New(dsVinculo);
  FControllerVinculo
    .ListarPorEmpresa(dsConsultar.DataSet.FieldByName('id').AsInteger);

  ConfigurarGrid;
  ConfigurarGridVinculo;
end;

procedure TFrmCadastroEmpresa.pgcMainChange(Sender: TObject);
begin
  inherited;

  if (pgcMain.ActivePage = tsConsulta) then
    HabilitarBotoes(True);

  if (pgcMain.ActivePage = tsVinculo) then
  begin
    HabilitarBotoes(False);
    HabilitarEditsVinculo(False);

    edtIdFuncionario.Text := dsVinculo.DataSet.FieldByName('id_pfisica').AsString;
    edtNomeFuncionario.Text := dsVinculo.DataSet.FieldByName('pessoa_juridica').AsString;
    edtIdFuncionario.SetFocus;
  end;
end;

procedure TFrmCadastroEmpresa.HabilitarEditsVinculo(AValue: Boolean);
begin
  edtIdEmpresa.Enabled   := AValue;
  edtNomeEmpresa.Enabled := AValue;
  edtIdFuncionario.Enabled     := not AValue;
  edtNomeFuncionario.Enabled   := AValue;
end;

procedure TFrmCadastroEmpresa.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 20;
  dbgConsultar.Columns.Items[1].Width := 280;
  dbgConsultar.Columns.Items[2].Width := 80;
end;

procedure TFrmCadastroEmpresa.ConfigurarGridVinculo;
begin
  dbgVinculo.Columns.Items[0].Width := 80;
  dbgVinculo.Columns.Items[1].Width := 280;
  dbgVinculo.Columns.Items[2].Width := 80;
end;

procedure TFrmCadastroEmpresa.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtID.Enabled := False;
  edtRazaoSocial.SetFocus;
end;

procedure TFrmCadastroEmpresa.btnSalvarClick(Sender: TObject);
begin
  if FOperacao = opIncluir then
    FControllerEmpresa
      .Id(0)
      .RazaoSocial(edtRazaoSocial.Text)
      .CNPJ(edtCNPJ.Text)
      .Salvar
      .ListarTodos
  else
    FControllerEmpresa
      .Id(StrToIntDef(edtID.Text, 0))
      .RazaoSocial(edtRazaoSocial.Text)
      .CNPJ(edtCNPJ.Text)
      .Alterar
      .ListarTodos;

  ConfigurarGrid;

  inherited;
end;

procedure TFrmCadastroEmpresa.btnExcluirClick(Sender: TObject);
begin
  if (dsVinculo.DataSet.IsEmpty) then
  begin
    ConfigurarGridVinculo;
    if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
    begin
      FControllerEmpresa
        .Excluir(StrToIntDef(edtID.Text, 0))
        .ListarTodos;

      ConfigurarGrid;
    end;
  end
  else
    Application.MessageBox('Esta pessoa tem vínculos e não pode ser excluida', 'Atenïção !!!', MB_ICONWARNING + MB_OK);

  inherited;
end;

procedure TFrmCadastroEmpresa.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  edtIdEmpresa.Text   := dsConsultar.DataSet.FieldByName('id').AsString;
  edtNomeEmpresa.Text := dsConsultar.DataSet.FieldByName('raza_social').AsString;

  edtId.Text          := dsConsultar.DataSet.FieldByName('id').AsString;
  edtRazaoSocial.Text := dsConsultar.DataSet.FieldByName('raza_social').AsString;
  edtCNPJ.Text        := dsConsultar.DataSet.FieldByName('cnpj').AsString;

  FControllerVinculo  := TControllerVinculo.New(dsVinculo);
  FControllerVinculo
    .ListarPorEmpresa(dsConsultar.DataSet.FieldByName('id').AsInteger);
  ConfigurarGridVinculo;
end;

procedure TFrmCadastroEmpresa.dsVinculoDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  if pgcMain.ActivePage = tsVinculo then
  begin
    btnRemoverVinculo.Enabled := not dsVinculo.DataSet.IsEmpty;
    if FOperacao <> opVincular then
    begin
      edtIdFuncionario.Text    := dsVinculo.DataSet.FieldByName('id_pfisica').AsString;
      edtNomeFuncionario.Text  := dsVinculo.DataSet.FieldByName('pessoa_fisica').AsString;
    end;
  end;
end;

procedure TFrmCadastroEmpresa.edtIdFuncionarioExit(Sender: TObject);
begin
  inherited;

  if (StrToIntDef(edtIdFuncionario.Text, -1) > 0) then
  begin
    FControllerFuncionario
      .BuscaPorId(StrToIntDef(edtIdFuncionario.Text, 0));

    edtNomeFuncionario.Text := dsFuncionario.DataSet.FieldByName('nome').AsString;
  end;
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

procedure TFrmCadastroEmpresa.btnImprimirClick(Sender: TObject);
var
  FrmListagem: TFrmListagem;
begin
  FrmListagem := TFrmListagem.Create(nil);

  try
    FrmListagem.qrlTitulo.Caption := 'Listagem de Pessoas Jurï¿½dicas';
    FrmListagem.qrListagem.DataSet := dsConsultar.DataSet;
    FrmListagem.qrlTipoDoc.Caption := 'CNPJ';
    FrmListagem.qrdbtDocumento.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtDocumento.DataField := 'CNPJ';
    FrmListagem.qrdbtNome.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtNome.DataField := 'NOME';

    FrmListagem.qrListagem.Preview;
  finally
    if FrmListagem <> nil then
      FreeAndNil(FrmListagem);
  end;
end;

end.
