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
    dsVinculo: TDataSource;
    dsFuncionario: TDataSource;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
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

    edtId.Text := dsVinculo.DataSet.FieldByName('id').AsString;
    edtRazaoSocial.Text := dsVinculo.DataSet.FieldByName('razao_social').AsString;
    edtCNPJ.Text := dsVinculo.DataSet.FieldByName('cnpj').AsString;
    edtId.SetFocus;
  end;
end;

procedure TFrmCadastroEmpresa.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 20;
  dbgConsultar.Columns.Items[1].Width := 280;
  dbgConsultar.Columns.Items[2].Width := 80;
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
    if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
    begin
      FControllerEmpresa
        .Excluir(StrToIntDef(edtID.Text, 0))
        .ListarTodos;

      ConfigurarGrid;
    end;
  end
  else
    Application.MessageBox('Esta empresa tem vínculos com fucnionários e não pode ser excluida', 'Atenção !!!', MB_ICONWARNING + MB_OK);

  inherited;
end;

procedure TFrmCadastroEmpresa.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  edtId.Text          := dsConsultar.DataSet.FieldByName('id').AsString;
  edtRazaoSocial.Text := dsConsultar.DataSet.FieldByName('razao_social').AsString;
  edtCNPJ.Text        := dsConsultar.DataSet.FieldByName('cnpj').AsString;
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
