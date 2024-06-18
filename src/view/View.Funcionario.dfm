inherited FrmCadastroFuncionario: TFrmCadastroFuncionario
  Caption = 'Cadastro de Pessoas F'#237'sica'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlcontainer: TPanel
    inherited pgcMain: TPageControl
      inherited tsConsulta: TTabSheet
        inherited pnlMainConsultar: TPanel
          inherited pnlPesquisar: TPanel
            inherited btnPesquisar: TButton
              OnClick = btnPesquisarClick
            end
          end
          inherited pnlNavegador: TPanel
            inherited dbnGridConsultar: TDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited tsEdit: TTabSheet
        inherited pnlMainEditar: TPanel
          object lblDesc: TLabel
            Left = 10
            Top = 60
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object lblCodigo: TLabel
            Left = 10
            Top = 14
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object lblSobreNome: TLabel
            Left = 10
            Top = 106
            Width = 55
            Height = 13
            Caption = 'SobreNome'
          end
          object edtId: TEdit
            Left = 10
            Top = 30
            Width = 60
            Height = 21
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 0
          end
          object edtNome: TEdit
            Left = 10
            Top = 76
            Width = 330
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object edtSobreNome: TEdit
            Left = 10
            Top = 122
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited pnlBottuns: TPanel
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnImprimir: TButton
      OnClick = btnImprimirClick
    end
  end
  inherited dsConsultar: TDataSource
    OnDataChange = dsConsultarDataChange
  end
end
