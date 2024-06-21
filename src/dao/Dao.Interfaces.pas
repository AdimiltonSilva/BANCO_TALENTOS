unit Dao.Interfaces;

interface

uses
  Model.Interfaces;

type
  IDAOFuncionario = interface
    ['{1DE8098E-7EEB-46C6-B26B-DF71FFFF1821}']
    function BuscarPorId(AValue: Integer): IDAOFuncionario;
    function Salvar(AFuncionario: IModelFuncionario): IDAOFuncionario;
    function ListarTodos: IDAOFuncionario;
    function Alterar(AFuncionario: IModelFuncionario): IDAOFuncionario;
    function Excluir(AValue: Integer): IDAOFuncionario;
    function AgruparPorFuncionario: IDAOFuncionario;
  end;

  IDAOEmpresa = interface
    ['{9FB74186-3AA9-407D-8C5D-3C45DEC27D70}']
    function BuscarPorId(AValue: Integer): IDAOEmpresa;
    function Salvar(AEmpresa: IModelEmpresa): IDAOEmpresa;
    function ListarTodos: IDAOEmpresa;
    function Alterar(AEmpresa: IModelEmpresa): IDAOEmpresa;
    function Excluir(AValue: Integer): IDAOEmpresa;
  end;

  IDAOCargo = interface
    ['{3DA2E67B-5E6A-475C-A626-CCFC8EC8A5C5}']
    function BuscarPorId(AValue: Integer): IDAOCargo;
    function Salvar(ACargo: IModelCargo): IDAOCargo;
    function ListarTodos: IDAOCargo;
    function Alterar(ACargo: IModelCargo): IDAOCargo;
    function Excluir(AValue: Integer): IDAOCargo;
  end;

  IDAOVinculo = interface
    ['{FB8322C6-DCD7-472E-BEA6-2D1A99707728}']
    function Adicionar(AVinculo: IModelVinculo): IDAOVinculo;
    function Remover(AVinculo: IModelVinculo): IDAOVinculo;
    function ListarVinculoPorFuncionario(AValue: Integer): IDAOVinculo;
    function ConsultarVinculo(AVinculo: IModelVinculo): IDAOVinculo;
  end;

implementation

end.
