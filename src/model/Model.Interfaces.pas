unit Model.Interfaces;

interface

type
  IModelFuncionario = interface
    ['{6BD57959-346E-420F-BAE7-E813B7B3F357}']
    function Id(AValue: Integer): IModelFuncionario overload;
    function Id: Integer; overload;
    function Nome(AValue: string): IModelFuncionario overload;
    function Nome: string; overload;
    function SobreNome(AValue: string): IModelFuncionario overload;
    function SobreNome: string; overload;
    function EMail(AValue: string): IModelFuncionario overload;
    function EMail: string; overload;
    function Celular(AValue: string): IModelFuncionario overload;
    function Celular: string; overload;
    function Linkedin(AValue: string): IModelFuncionario overload;
    function Linkedin: string; overload;
    function Github(AValue: string): IModelFuncionario overload;
    function Github: string; overload;

    function Salvar: IModelFuncionario;
    function ListarTodos: IModelFuncionario;
    function BuscarPorId(AValue: Integer) : IModelFuncionario;
    function Alterar: IModelFuncionario;
    function Excluir(AValue: Integer): IModelFuncionario;
  end;

  IModelEmpresa = interface
    ['{2A5AA1BA-0CDE-4668-8EE9-DA79BFC868CF}']
    function Id(AValue: Integer): IModelEmpresa overload;
    function Id: Integer; overload;
    function RazaoSocial(AValue: string): IModelEmpresa overload;
    function RazaoSocial: string; overload;
    function CNPJ(AValue: string): IModelEmpresa overload;
    function CNPJ: string; overload;

    function Salvar: IModelEmpresa;
    function ListarTodos: IModelEmpresa;
    function BuscarPorId(AValue: integer) : IModelEmpresa;
    function Alterar: IModelEmpresa;
    function Excluir(AValue: Integer): IModelEmpresa;
  end;

  IModelCargo = interface
    ['{2A5AA1BA-0CDE-4668-8EE9-DA79BFC868CF}']
    function Id(AValue: Integer): IModelCargo overload;
    function Id: Integer; overload;
    function Descricao(AValue: string): IModelCargo overload;
    function Descricao: string; overload;

    function Salvar: IModelCargo;
    function ListarTodos: IModelCargo;
    function BuscarPorId(AValue: integer) : IModelCargo;
    function Alterar: IModelCargo;
    function Excluir(AValue: Integer): IModelCargo;
  end;

  IModelVinculo = interface
    ['{46B318FF-C6D0-4E9F-AAE2-4EC14C48D9E8}']
    function IdEmpresa(AValue: Integer): IModelVinculo overload;
    function IdEmpresa: Integer; overload;
    function IdFuncionario(AValue: Integer): IModelVinculo overload;
    function IdFuncionario: Integer; overload;
    function IdCargo(AValue: Integer): IModelVinculo overload;
    function IdCargo: Integer; overload;
    function DataAdmissao(AValue: Date): IModelVinculo overload;
    function DataAdmissao: Date; overload;

    function Adicionar: IModelVinculo;
    function Remover(AVinculo: IModelVinculo): IModelVinculo;
    function ListarPorEmpresa(AValue: Integer): IModelVinculo;
    function ConsultarVinculo(AVinculo: IModelVinculo): IModelVinculo;
  end;

implementation

end.
