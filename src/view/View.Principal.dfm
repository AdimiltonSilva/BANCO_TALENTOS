object FrmPrincipal: TFrmPrincipal
  Left = 189
  Top = 119
  Width = 543
  Height = 301
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mmMenu
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object actlstMenu: TActionList
    Left = 256
    Top = 128
    object actFuncionario: TAction
      Category = 'Cadastros'
      Caption = '&Funcion'#225'rios'
      OnExecute = actFuncionarioExecute
    end
    object actCargo: TAction
      Category = 'Cadastros'
      Caption = '&Cargos'
      OnExecute = actCargoExecute
    end
    object actSair: TAction
      Caption = '&Sair'
      OnExecute = actSairExecute
    end
    object actEmpresa: TAction
      Category = 'Cadastros'
      Caption = '&Empresas'
      OnExecute = actEmpresaExecute
    end
  end
  object mmMenu: TMainMenu
    Left = 192
    Top = 128
    object Cadastro: TMenuItem
      Caption = '&Cadastros'
      object mniCliente: TMenuItem
        Action = actFuncionario
      end
      object mniFornecedor: TMenuItem
        Action = actCargo
      end
    end
    object mniSair: TMenuItem
      Action = actSair
    end
  end
end
