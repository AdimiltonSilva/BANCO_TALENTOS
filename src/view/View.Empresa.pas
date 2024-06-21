unit View.Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, View.Modelo,
  DBCtrls, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls,
  DB,
  Controller.Interfaces,
  Controller.Empresa;

type
  TFrmCadastroEmpresa = class(TFrmCadastroPadrao)
    lblId: TLabel;
    lblRazaoSocial: TLabel;
    lblCNPJ: TLabel;
    edtID: TEdit;
    edtRazaoSocial: TEdit;
    edtCNPJ: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresa: IControllerEmpresa;
    procedure ConfigurarGrid;
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

  FControllerEmpresa := TControllerEmpresa.New(dsConsultar);
  FControllerEmpresa.ListarTodos;

  ConfigurarGrid;
end;

procedure TFrmCadastroEmpresa.pgcMainChange(Sender: TObject);
begin
  inherited;

  if (pgcMain.ActivePage = tsConsulta) then
    HabilitarBotoes(True);

  if (pgcMain.ActivePage = tsEdit) then
  begin
    HabilitarBotoes(False);

    edtId.Text := dsConsultar.DataSet.FieldByName('id').AsString;
    edtRazaoSocial.Text := dsConsultar.DataSet.FieldByName('razao_social').AsString;
    edtCNPJ.Text := dsConsultar.DataSet.FieldByName('cnpj').AsString;
  end;
end;

procedure TFrmCadastroEmpresa.ConfigurarGrid;
begin
  if not (dsConsultar.DataSet.IsEmpty) then
  begin
    dbgConsultar.Columns.Items[0].Width := 40;
    dbgConsultar.Columns.Items[1].Width := 300;
    dbgConsultar.Columns.Items[2].Width := 110;
  end;
end;

procedure TFrmCadastroEmpresa.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtID.Enabled := False;
  edtRazaoSocial.SetFocus;
end;

procedure TFrmCadastroEmpresa.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtID.Enabled := False;
  edtRazaoSocial.SetFocus;
end;

procedure TFrmCadastroEmpresa.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão', 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerEmpresa
      .Excluir(StrToIntDef(edtID.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
  end;

  inherited;
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

procedure TFrmCadastroEmpresa.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  edtId.Text := dsConsultar.DataSet.FieldByName('id').AsString;
  edtRazaoSocial.Text := dsConsultar.DataSet.FieldByName('razao_social').AsString;
  edtCNPJ.Text := dsConsultar.DataSet.FieldByName('cnpj').AsString;
end;

procedure TFrmCadastroEmpresa.btnImprimirClick(Sender: TObject);
var
  FrmListagem: TFrmListagem;
begin
  FrmListagem := TFrmListagem.Create(nil);

  try
    FrmListagem.qrlTitulo.Caption := 'Listagem de Empresas';
    FrmListagem.qrListagem.DataSet := dsConsultar.DataSet;
    FrmListagem.qrlColuna1.Caption := 'CNPJ';
    FrmListagem.qrlColuna2.Caption := 'EMPRESA';
    FrmListagem.qrlColuna3.Caption := '';

    FrmListagem.qrdbtCampo1.DataField := 'CNPJ';
    FrmListagem.qrdbtCampo1.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtCampo2.DataField := 'RAZAO_SOCIAL';
    FrmListagem.qrdbtCampo2.DataSet := dsConsultar.DataSet;

    FrmListagem.qrbDetalhe.Enabled := False;
    FrmListagem.qrbFootGroup.Enabled := False;

    FrmListagem.qrListagem.Preview;
  finally
    if FrmListagem <> nil then
      FreeAndNil(FrmListagem);
  end;
end;

end.
