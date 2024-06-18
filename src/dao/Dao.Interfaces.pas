unit Dao.Interfaces;

interface

uses
  Model.Interfaces;

type
  IDAOFuncionario = interface
    ['{4BB2CDB8-4044-4A71-B545-F9564942A6BB}']
    function BuscarPorId(AValue: Integer): IDAOFuncionario;
    function Salvar(AFuncionario: IModelFuncionario): IDAOFuncionario;
    function ListarTodos: IDAOFuncionario;
    function Alterar(AFuncionario: IModelFuncionario): IDAOFuncionario;
    function Excluir(AValue: Integer): IDAOFuncionario;
  end;

  IDAOEmpresa = interface
    ['{839A1ED7-912F-4158-8104-840C0EE0FFC8}']
    function BuscarPorId(AValue: Integer): IDAOEmpresa;
    function Salvar(AEmpresa: IModelEmpresa): IDAOEmpresa;
    function ListarTodos: IDAOEmpresa;
    function Alterar(AEmpresa: IModelEmpresa): IDAOEmpresa;
    function Excluir(AValue: Integer): IDAOEmpresa;
  end;

  IDAOCargo = interface
    ['{839A1ED7-912F-4158-8104-840C0EE0FFC8}']
    function BuscarPorId(AValue: Integer): IDAOCargo;
    function Salvar(AEmpresa: IModelEmpresa): IDAOCargo;
    function ListarTodos: IDAOCargo;
    function Alterar(AEmpresa: IModelEmpresa): IDAOCargo;
    function Excluir(AValue: Integer): IDAOCargo;
  end;

  IDAOVinculo = interface
    ['{C0E14600-134D-4D61-AD24-6EF3EBC39916}']
    function Adicionar(AVinculo: IModelVinculo): IDAOVinculo;
    function Remover(AVinculo: IModelVinculo): IDAOVinculo;
    function ListarPorEmpresa(AValue: Integer): IDAOVinculo;
    function ConsultarVinculo(AVinculo: IModelVinculo): IDAOVinculo;
  end;
  
implementation

end.
