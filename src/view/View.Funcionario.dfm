inherited FrmCadastroFuncionario: TFrmCadastroFuncionario
  Caption = 'Cadastro de Funcion'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlcontainer: TPanel
    inherited pgcMain: TPageControl
      ActivePage = tsEdit
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
          object lblNome: TLabel
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
            Left = 250
            Top = 58
            Width = 55
            Height = 13
            Caption = 'SobreNome'
          end
          object EMail: TLabel
            Left = 10
            Top = 106
            Width = 28
            Height = 13
            Caption = 'E-Mail'
          end
          object lblCelular: TLabel
            Left = 250
            Top = 106
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object lblLinkedIn: TLabel
            Left = 10
            Top = 156
            Width = 40
            Height = 13
            Caption = 'LinkedIn'
          end
          object lblGitHub: TLabel
            Left = 250
            Top = 154
            Width = 32
            Height = 13
            Caption = 'GitHub'
          end
          object lblCargo: TLabel
            Left = 10
            Top = 204
            Width = 29
            Height = 13
            Caption = 'Cargo'
          end
          object lblEmpresa: TLabel
            Left = 250
            Top = 202
            Width = 41
            Height = 13
            Caption = 'Empresa'
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
            Width = 230
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object edtEmail: TEdit
            Left = 10
            Top = 122
            Width = 230
            Height = 21
            CharCase = ecLowerCase
            TabOrder = 2
          end
          object edtSobreNome: TEdit
            Left = 250
            Top = 76
            Width = 230
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 3
          end
          object edtCelular: TEdit
            Left = 250
            Top = 122
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 4
          end
          object edtLinkedIn: TEdit
            Left = 10
            Top = 172
            Width = 230
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 5
          end
          object edtGitHub: TEdit
            Left = 250
            Top = 172
            Width = 230
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 6
          end
          object DBLookupCombo1: TDBLookupCombo
            Left = 10
            Top = 220
            Width = 230
            Height = 21
            TabOrder = 7
          end
          object DBLookupCombo2: TDBLookupCombo
            Left = 250
            Top = 220
            Width = 230
            Height = 21
            TabOrder = 8
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
