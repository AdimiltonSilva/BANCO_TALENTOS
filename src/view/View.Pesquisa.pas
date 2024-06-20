unit View.Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB,
  Controller.Empresa, Controller.Interfaces,
  Controller.Cargo;

type
  TTipoPesquisa = (tpCargo, tpEmpresa);

  TFrmPesquisa = class(TForm)
    pblFooter: TPanel;
    dbgPesquisa: TDBGrid;
    pnlPesquisar: TPanel;
    lblPesquisarCodigo: TLabel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    btnSelecionar: TButton;
    dsPesquisa: TDataSource;
    procedure btnSelecionarClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FControllerCargos: IControllerCargo;
    FControllerEmpresa: IControllerEmpresa;
    procedure CarregarDados;
  public
    { Public declarations }
    TipoPesquisa: TTipoPesquisa;
    IdRetorno : Integer;
    descRetorno: string;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

procedure TFrmPesquisa.btnSelecionarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
  IdRetorno := dsPesquisa.DataSet.FieldByName('id').AsInteger;

  case TipoPesquisa of
    tpCargo:
      descRetorno := dsPesquisa.DataSet.FieldByName('descricao').AsString;
    tpEmpresa:
      descRetorno := dsPesquisa.DataSet.FieldByName('razao_social').AsString;
  end;

  Close;
end;

procedure TFrmPesquisa.CarregarDados;
begin
  case TipoPesquisa of
    tpCargo:
    begin
      FControllerCargos := TControllerCargo.New(dsPesquisa);
      FControllerCargos.ListarTodos;
    end;
    tpEmpresa:
    begin
      FControllerEmpresa := TControllerEmpresa.New(dsPesquisa);
      FControllerEmpresa.ListarTodos;
    end;
  end;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  CarregarDados;
end;

end.
