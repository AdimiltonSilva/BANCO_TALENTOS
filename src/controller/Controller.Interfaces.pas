unit Controller.Interfaces;

interface

type
  IControllerFuncionario = interface
    ['{898C7EC0-09E1-4C12-B561-4FFC0603E0C4}']
    function Id(AValue: Integer): IControllerFuncionario overload;
    function Id: integer; overload;
    function Nome(AValue: string): IControllerFuncionario overload;
    function Nome: string; overload;
    function SobreNome(AValue: string): IControllerFuncionario overload;
    function SobreNome: string; overload;
    function EMail(AValue: string): IControllerFuncionario overload;
    function EMail: string; overload;
    function Celular(AValue: string): IControllerFuncionario overload;
    function Celular: string; overload;
    function Linkedin(AValue: string): IControllerFuncionario overload;
    function Linkedin: string; overload;
    function Github(AValue: string): IControllerFuncionario overload;
    function Github: string; overload;

    function BuscaPorId(AId: Integer): IControllerFuncionario;
    function ListarTodos: IControllerFuncionario;
    function Salvar: IControllerFuncionario;
    function Alterar: IConTrollerFuncionario;
    function Excluir(AValue: Integer): IControllerFuncionario;
  end;

  IControllerEmpresa = interface
    ['{DC5C0C7B-633F-4B84-B70B-1E3086CB299C}']
    function Id(AValue: Integer): IControllerEmpresa overload;
    function Id: integer; overload;
    function Nome(AValue: string): IControllerEmpresa overload;
    function Nome: string; overload;
    function CNPJ(AValue: string): IControllerEmpresa overload;
    function CNPJ: string; overload;

    function BuscarPorId(AValue: Integer): IControllerEmpresa;
    function Salvar: IControllerEmpresa;
    function ListarTodos: IControllerEmpresa;
    function Alterar: IControllerEmpresa;
    function Excluir(AValue: Integer): IControllerEmpresa;
  end;

  IControllerCargo = interface
    ['{DC5C0C7B-633F-4B84-B70B-1E3086CB299C}']
    function Id(AValue: Integer): IControllerCargo overload;
    function Id: integer; overload;
    function Descricao(AValue: string): IControllerCargo overload;
    function Descricao: string; overload;

    function BuscarPorId(AValue: Integer): IControllerCargo;
    function Salvar: IControllerCargo;
    function ListarTodos: IControllerCargo;
    function Alterar: IControllerCargo;
    function Excluir(AValue: Integer): IControllerCargo;
  end;

  IControllerVinculo = interface
    ['{ACB2201A-8C86-4A53-9FA0-D6EC735F5B79}']
    function IdEmpresa: Integer overload;
    function IdEmpresa(AValue: Integer): IControllerVinculo overload;
    function IdFuncionario: Integer; overload;
    function IdFuncionario(AValue: Integer): IControllerVinculo overload;

    function Adicionar: IControllerVinculo;
    function Remover: IControllerVinculo;
    function ListarPorEmpresa(AValue: Integer): IControllerVinculo;
    function ConsultarVinculo: IControllerVinculo;
  end;

implementation

end.
