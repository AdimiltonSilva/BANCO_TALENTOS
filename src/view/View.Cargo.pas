unit View.Cargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, View.Modelo, DB, DBCtrls, Grids, DBGrids, StdCtrls, ComCtrls,
  ExtCtrls,
  Controller.Interfaces, Controller.Cargo, DBXpress, SqlExpr;

type
  TFrmCadastroCargo = class(TFrmCadastroPadrao)
    edtID: TEdit;
    lblId: TLabel;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerCargo: IControllerCargo;
    procedure ConfigurarGrid;
  public
    { Public declarations }
  end;

var
  FrmCadastroCargo: TFrmCadastroCargo;

implementation

{$R *.dfm}

procedure TFrmCadastroCargo.FormCreate(Sender: TObject);
begin
  inherited;

  FControllerCargo := TControllerCargo.New(dsConsultar);
  FControllerCargo.ListarTodos;
  ConfigurarGrid;
end;

procedure TFrmCadastroCargo.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 20;
  dbgConsultar.Columns.Items[1].Width := 280;
  dbgConsultar.Columns.Items[2].Width := 80;
end;

procedure TFrmCadastroCargo.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtDescricao.SetFocus;
end;

procedure TFrmCadastroCargo.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtDescricao.SetFocus;
end;

procedure TFrmCadastroCargo.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerCargo
      .Excluir(StrToIntDef(edtId.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
  end;

  inherited;
end;

procedure TFrmCadastroCargo.btnSalvarClick(Sender: TObject);
begin
  if (FOperacao = opIncluir) then
    FControllerCargo
      .Id(StrToIntDef(edtId.Text, 0))
      .Descricao(edtDescricao.Text)
      .Salvar
      .ListarTodos
  else
    FControllerCargo
      .Id(StrToIntDef(edtId.Text, 0))
      .Descricao(edtDescricao.Text)
      .Alterar
      .ListarTodos;

  ConfigurarGrid;

  inherited;
end;

end.
