object FrmPesquisa: TFrmPesquisa
  Left = 529
  Top = 265
  Width = 623
  Height = 326
  Caption = 'Pesquisar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pblFooter: TPanel
    Left = 0
    Top = 246
    Width = 607
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      607
      41)
    object btnSelecionar: TButton
      Left = 456
      Top = 4
      Width = 135
      Height = 29
      Anchors = [akTop, akRight]
      Caption = '&Selecionar e Fechar'
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 41
    Width = 607
    Height = 205
    Align = alClient
    DataSource = dsPesquisa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
  end
  object pnlPesquisar: TPanel
    Left = 0
    Top = 0
    Width = 607
    Height = 41
    Align = alTop
    TabOrder = 2
    DesignSize = (
      607
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
      Width = 462
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 516
      Top = 4
      Width = 75
      Height = 29
      Anchors = [akTop, akRight]
      Caption = '&Pesquisar'
      TabOrder = 1
    end
  end
  object dsPesquisa: TDataSource
    Left = 512
    Top = 184
  end
end
