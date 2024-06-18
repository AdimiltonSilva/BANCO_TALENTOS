unit View.Funcionario;

interface

uses
  Windows, Messages,
  SysUtils, Variants, Classes,

  Graphics, Controls, Forms, Dialogs, View.Modelo, StdCtrls,
  ComCtrls, ExtCtrls, DB, DBCtrls, Grids, DBGrids,

  Controller.Interfaces, Controller.Funcionario;

type
  TFrmCadastroFuncionario = class(TFrmCadastroPadrao)
    lblDesc: TLabel;
    lblCodigo: TLabel;
    edtId: TEdit;
    edtNome: TEdit;
    lblSobreNome: TLabel;
    edtSobreNome: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerFuncionario: IControllerFuncionario;
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
  if Application.MessageBox('Confirma Exclus�o' , 'Aten��o !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
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
      .Salvar
      .ListarTodos
  else
    FControllerFuncionario
      .Id(StrToIntDef(edtId.Text, 0))
      .Nome(edtNome.Text)
      .SobreNome(edtSobreNome.Text)
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
    FrmListagem.qrlTitulo.Caption := 'Listagem de Pessoas F�sica';
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

end.
