object FrmCadastroPadrao: TFrmCadastroPadrao
  Left = 520
  Top = 158
  Width = 640
  Height = 480
  Caption = 'Cadastro Padr'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlcontainer: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pgcMain: TPageControl
      Left = 0
      Top = 0
      Width = 504
      Height = 441
      ActivePage = tsConsulta
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = pgcMainChange
      object tsConsulta: TTabSheet
        Caption = '&Consultar'
        object pnlMainConsultar: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 410
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlPesquisar: TPanel
            Left = 0
            Top = 0
            Width = 496
            Height = 41
            Align = alTop
            TabOrder = 0
            DesignSize = (
              496
              41)
            object lblPesquisarCodigo: TLabel
              Left = 8
              Top = 10
              Width = 33
              Height = 13
              Caption = 'C'#243'digo'
            end
            object edtPesquisar: TEdit
              Left = 47
              Top = 8
              Width = 351
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              TabOrder = 0
            end
            object btnPesquisar: TButton
              Left = 405
              Top = 4
              Width = 75
              Height = 29
              Anchors = [akTop, akRight]
              Caption = '&Pesquisar'
              TabOrder = 1
            end
          end
          object dbgConsultar: TDBGrid
            Left = 0
            Top = 41
            Width = 496
            Height = 328
            Align = alClient
            DataSource = dsConsultar
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnlNavegador: TPanel
            Left = 0
            Top = 369
            Width = 496
            Height = 41
            Align = alBottom
            TabOrder = 2
            DesignSize = (
              496
              41)
            object dbnGridConsultar: TDBNavigator
              Left = 256
              Top = 4
              Width = 224
              Height = 27
              DataSource = dsConsultar
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Anchors = [akTop, akRight]
              TabOrder = 0
            end
          end
        end
      end
      object tsEdit: TTabSheet
        Caption = '&Editar'
        ImageIndex = 1
        object pnlMainEditar: TPanel
          Left = 0
          Top = 0
          Width = 496
          Height = 410
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
        end
      end
    end
  end
  object pnlBottuns: TPanel
    Left = 504
    Top = 0
    Width = 120
    Height = 441
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btnIncluir: TButton
      Left = 3
      Top = 26
      Width = 109
      Height = 30
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 3
      Top = 62
      Width = 109
      Height = 30
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 3
      Top = 98
      Width = 109
      Height = 30
      Caption = '&Excluir'
      TabOrder = 2
    end
    object btnCancelar: TButton
      Left = 3
      Top = 134
      Width = 109
      Height = 30
      Caption = '&Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 3
      Top = 170
      Width = 109
      Height = 30
      Caption = '&Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnFechar: TButton
      Left = 3
      Top = 407
      Width = 109
      Height = 30
      Caption = '&Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnImprimir: TButton
      Left = 3
      Top = 206
      Width = 109
      Height = 30
      Caption = '&Imprimir'
      TabOrder = 6
    end
  end
  object dsConsultar: TDataSource
    Left = 304
    Top = 280
  end
end
