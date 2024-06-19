inherited FrmCadastroEmpresa: TFrmCadastroEmpresa
  Caption = 'Cadastro de Empresas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlcontainer: TPanel
    inherited pgcMain: TPageControl
      ActivePage = tsVinculo
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
      object tsVinculo: TTabSheet
        Caption = 'V'#237'nculo'
        ImageIndex = 2
        object pnlVinculo: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 410
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlAdicionarVinculo: TPanel
            Left = 0
            Top = 0
            Width = 496
            Height = 75
            Align = alTop
            TabOrder = 0
            DesignSize = (
              496
              75)
            object lblEmpresa: TLabel
              Left = 10
              Top = 10
              Width = 41
              Height = 13
              Caption = 'Empresa'
            end
            object lblFuncionario: TLabel
              Left = 10
              Top = 42
              Width = 55
              Height = 13
              Caption = 'Funcion'#225'rio'
            end
            object edtIdEmpresa: TEdit
              Left = 72
              Top = 8
              Width = 46
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 0
            end
            object btnAdicionarVinculo: TButton
              Left = 381
              Top = 5
              Width = 99
              Height = 26
              Anchors = [akTop, akRight]
              Caption = '&Adicionar'
              TabOrder = 4
              OnClick = btnAdicionarVinculoClick
            end
            object edtNomeEmpresa: TEdit
              Left = 125
              Top = 8
              Width = 250
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              Enabled = False
              TabOrder = 1
            end
            object edtIdFuncionario: TEdit
              Left = 72
              Top = 40
              Width = 46
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              TabOrder = 2
              OnExit = edtIdFuncionarioExit
            end
            object edtNomeFuncionario: TEdit
              Left = 125
              Top = 39
              Width = 250
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object btnRemoverVinculo: TButton
              Left = 381
              Top = 36
              Width = 99
              Height = 26
              Anchors = [akTop, akRight]
              Caption = '&Remover'
              Enabled = False
              TabOrder = 5
              OnClick = btnRemoverVinculoClick
            end
          end
          object dbgVinculo: TDBGrid
            Left = 0
            Top = 75
            Width = 496
            Height = 294
            Align = alClient
            DataSource = dsVinculo
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnlNavegadorVinculo: TPanel
            Left = 0
            Top = 369
            Width = 496
            Height = 41
            Align = alBottom
            TabOrder = 2
            DesignSize = (
              496
              41)
            object dbnGridVinculo: TDBNavigator
              Left = 256
              Top = 4
              Width = 224
              Height = 27
              DataSource = dsVinculo
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Anchors = [akTop, akRight]
              TabOrder = 0
            end
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
    Left = 552
    Top = 240
  end
  object dsVinculo: TDataSource
    OnDataChange = dsVinculoDataChange
    Left = 552
    Top = 296
  end
  object dsFuncionario: TDataSource
    Left = 552
    Top = 352
  end
end
