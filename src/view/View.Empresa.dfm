inherited FrmCadastroEmpresa: TFrmCadastroEmpresa
  Caption = 'Cadastro de Empresas'
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
          object lblRazaoSocial: TLabel
            Left = 10
            Top = 60
            Width = 60
            Height = 13
            Caption = 'Raz'#227'o Social'
          end
          object lblCNPJ: TLabel
            Left = 10
            Top = 106
            Width = 25
            Height = 13
            Caption = 'CNPJ'
          end
          object edtID: TEdit
            Left = 10
            Top = 30
            Width = 55
            Height = 21
            TabOrder = 0
          end
          object edtRazaoSocial: TEdit
            Left = 10
            Top = 76
            Width = 330
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object edtCNPJ: TEdit
            Left = 10
            Top = 122
            Width = 167
            Height = 21
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
    Left = 408
    Top = 312
  end
end
