unit View.Modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  DB, DBCtrls, Grids, DBGrids;

type
  TOperacao = (opConsultar, opIncluir, opAlterar, opExcluir, opSalvar, opVincular);

  TFrmCadastroPadrao = class(TForm)
    pnlcontainer: TPanel;
    pnlBottuns: TPanel;
    pgcMain: TPageControl;
    tsConsulta: TTabSheet;
    tsEdit: TTabSheet;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnFechar: TButton;
    pnlMainConsultar: TPanel;
    pnlMainEditar: TPanel;
    pnlPesquisar: TPanel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    dbgConsultar: TDBGrid;
    pnlNavegador: TPanel;
    dbnGridConsultar: TDBNavigator;
    lblPesquisarCodigo: TLabel;
    dsConsultar: TDataSource;
    btnImprimir: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pgcMainChange(Sender: TObject);
    procedure HabilitarBotoes(estado: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    FOperacao: TOperacao;
  private
    { Private declarations }
    procedure LimparCampos;
    procedure HabilitarCampos(estado: Boolean);
  public
    { Public declarations }
  end;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TFrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  FOperacao := opConsultar;
end;

procedure TFrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  FOperacao := opIncluir;

  LimparCampos;
  HabilitarBotoes(False);
  HabilitarCampos(True);
  pgcMain.ActivePage := tsEdit;
end;

procedure TFrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  
  HabilitarBotoes(False);
  HabilitarCampos(True);
  pgcMain.ActivePage := tsEdit;
end;

procedure TFrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  HabilitarBotoes(True);
  HabilitarCampos(False);
end;

procedure TFrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroPadrao.btnSalvarClick(Sender: TObject);
begin
  HabilitarBotoes(True);
  HabilitarCampos(False);
  pgcMain.ActivePage := tsConsulta;

  FOperacao := opConsultar;
end;

procedure TFrmCadastroPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0,0);
  end;
end;

procedure TFrmCadastroPadrao.FormShow(Sender: TObject);
begin
  pgcMain.ActivePage := tsConsulta;
  HabilitarCampos(False);
  HabilitarBotoes(True);
end;

procedure TFrmCadastroPadrao.HabilitarBotoes(estado: Boolean);
begin
  btnIncluir.Enabled  := estado;
  btnAlterar.Enabled  := estado;
  btnExcluir.Enabled  := estado;
  btnCancelar.Enabled := not estado;
  btnSalvar.Enabled   := not estado;
end;

procedure TFrmCadastroPadrao.LimparCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) then TEdit(Components[i]).Clear;
    if (Components[i] is TCheckBox) then TCheckBox(Components[i]).Checked := False;
  end;
end;

procedure TFrmCadastroPadrao.pgcMainChange(Sender: TObject);
begin
  if (pgcMain.ActivePage = tsConsulta) then
    edtPesquisar.SetFocus;
end;

procedure TFrmCadastroPadrao.HabilitarCampos(estado: Boolean);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ( (Components[i] is TEdit) or (Components[i] is TCheckBox) ) then
      TWinControl(Components[i]).Enabled := estado;
  end;

  edtPesquisar.Enabled := True;
end;

end.

