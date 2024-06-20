inherited FrmCadastroCargo: TFrmCadastroCargo
  Left = 390
  Top = 215
  Caption = 'FrmCadastro de Cargos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlcontainer: TPanel
    inherited pgcMain: TPageControl
      inherited tsConsulta: TTabSheet
        inherited pnlMainConsultar: TPanel
          inherited pnlNavegador: TPanel
            inherited dbnGridConsultar: TDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited tsEdit: TTabSheet
        inherited pnlMainEditar: TPanel
          object lblId: TLabel
            Left = 10
            Top = 14
            Width = 11
            Height = 13
            Caption = 'ID'
          end
          object lblDescricao: TLabel
            Left = 10
            Top = 60
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
          end
          object edtID: TEdit
            Left = 10
            Top = 30
            Width = 55
            Height = 21
            TabOrder = 0
          end
          object edtDescricao: TEdit
            Left = 10
            Top = 76
            Width = 330
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited pnlBottuns: TPanel
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
  end
end
