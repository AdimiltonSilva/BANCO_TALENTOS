inherited FrmCadastroFuncionario: TFrmCadastroFuncionario
  Caption = 'Cadastro de Funcion'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlcontainer: TPanel
    inherited pgcMain: TPageControl
      ActivePage = tsVinculo
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
            Top = 60
            Width = 58
            Height = 13
            Caption = 'Sobre Nome'
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
            Top = 152
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
            Top = 125
            Width = 230
            Height = 21
            CharCase = ecLowerCase
            TabOrder = 3
          end
          object edtSobreNome: TEdit
            Left = 250
            Top = 76
            Width = 230
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object edtCelular: TEdit
            Left = 250
            Top = 125
            Width = 120
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 4
          end
          object edtLinkedIn: TEdit
            Left = 10
            Top = 171
            Width = 230
            Height = 21
            TabOrder = 5
          end
          object edtGitHub: TEdit
            Left = 250
            Top = 171
            Width = 230
            Height = 21
            TabOrder = 6
          end
        end
      end
      object tsVinculo: TTabSheet
        Caption = '&V'#237'nculo'
        ImageIndex = 2
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 410
          Align = alClient
          TabOrder = 0
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 494
            Height = 136
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object lblCargo: TLabel
              Left = 10
              Top = 52
              Width = 29
              Height = 13
              Caption = 'Cargo'
            end
            object spbIdCargo: TSpeedButton
              Left = 70
              Top = 67
              Width = 23
              Height = 22
              Caption = '...'
              Enabled = False
              OnClick = spbIdCargoClick
            end
            object lblEmpresa: TLabel
              Left = 10
              Top = 91
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object spbIdEmpresa: TSpeedButton
              Left = 70
              Top = 106
              Width = 23
              Height = 22
              Caption = '...'
              Enabled = False
              OnClick = spbIdEmpresaClick
            end
            object lblDataAdmissao: TLabel
              Left = 395
              Top = 4
              Width = 71
              Height = 13
              Caption = 'Data Admiss'#227'o'
            end
            object lblFuncionario: TLabel
              Left = 10
              Top = 10
              Width = 55
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object edtIdCargo: TEdit
              Left = 10
              Top = 68
              Width = 60
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 0
              OnChange = edtIdCargoChange
            end
            object edtCargo: TEdit
              Left = 95
              Top = 68
              Width = 282
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 1
            end
            object edtIdEmpresa: TEdit
              Left = 10
              Top = 107
              Width = 60
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 2
              OnChange = edtIdEmpresaChange
            end
            object edtEmpresa: TEdit
              Left = 95
              Top = 107
              Width = 282
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 3
            end
            object dtpDataAdmissao: TDateTimePicker
              Left = 395
              Top = 25
              Width = 87
              Height = 21
              Date = 45462.925335532410000000
              Time = 45462.925335532410000000
              TabOrder = 4
            end
            object edtIdFuncionario: TEdit
              Left = 10
              Top = 25
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 5
            end
            object edtNomeCompleto: TEdit
              Left = 95
              Top = 25
              Width = 285
              Height = 21
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 6
            end
          end
          object pnlNavegadorVinculo: TPanel
            Left = 1
            Top = 368
            Width = 494
            Height = 41
            Align = alBottom
            TabOrder = 1
            DesignSize = (
              494
              41)
            object DBNavigator1: TDBNavigator
              Left = 320
              Top = 5
              Width = 164
              Height = 30
              DataSource = dsVinculo
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Anchors = [akTop, akRight]
              TabOrder = 0
            end
            object btnNovoVinculo: TButton
              Left = 8
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Novo'
              Enabled = False
              TabOrder = 1
              OnClick = btnNovoVinculoClick
            end
            object btnSalvarVinculo: TButton
              Left = 88
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Salvar'
              Enabled = False
              TabOrder = 2
              OnClick = btnSalvarVinculoClick
            end
          end
          object dbgVinculo: TDBGrid
            Left = 1
            Top = 137
            Width = 494
            Height = 231
            Align = alClient
            DataSource = dsVinculo
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
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
    Left = 432
    Top = 192
  end
  object dsVinculo: TDataSource
    OnDataChange = dsVinculoDataChange
    Left = 436
    Top = 347
  end
  object dsCargo: TDataSource
    Left = 436
    Top = 243
  end
  object dsEmpresa: TDataSource
    Left = 436
    Top = 291
  end
end
