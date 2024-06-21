unit Controller.Interfaces;

interface

type
  IControllerFuncionario = interface
    ['{60BD5E84-5523-4198-AD00-C34C5C824E67}']
    function Id(AValue: Integer): IControllerFuncionario; overload;
    function Id: integer; overload;
    function Nome(AValue: string): IControllerFuncionario; overload;
    function Nome: string; overload;
    function SobreNome(AValue: string): IControllerFuncionario; overload;
    function SobreNome: string; overload;
    function EMail(AValue: string): IControllerFuncionario; overload;
    function EMail: string; overload;
    function Celular(AValue: string): IControllerFuncionario; overload;
    function Celular: string; overload;
    function Linkedin(AValue: string): IControllerFuncionario; overload;
    function Linkedin: string; overload;
    function Github(AValue: string): IControllerFuncionario; overload;
    function Github: string; overload;

    function BuscaPorId(AId: Integer): IControllerFuncionario;
    function ListarTodos: IControllerFuncionario;
    function Salvar: IControllerFuncionario;
    function Alterar: IConTrollerFuncionario;
    function Excluir(AValue: Integer): IControllerFuncionario;
    function AgruparPorFuncionario: IControllerFuncionario;
  end;

  IControllerEmpresa = interface
    ['{9DC663B6-F555-4ED4-B6E9-188400E100E5}']
    function Id(AValue: Integer): IControllerEmpresa; overload;
    function Id: integer; overload;
    function RazaoSocial(AValue: string): IControllerEmpresa; overload;
    function RazaoSocial: string; overload;
    function CNPJ(AValue: string): IControllerEmpresa; overload;
    function CNPJ: string; overload;

    function BuscarPorId(AValue: Integer): IControllerEmpresa;
    function Salvar: IControllerEmpresa;
    function ListarTodos: IControllerEmpresa;
    function Alterar: IControllerEmpresa;
    function Excluir(AValue: Integer): IControllerEmpresa;
  end;

  IControllerCargo = interface
    ['{FABEA74E-10CD-4868-AAF4-BB8DC3ED43BE}']
    function Id(AValue: Integer): IControllerCargo; overload;
    function Id: integer; overload;
    function Descricao(AValue: string): IControllerCargo; overload;
    function Descricao: string; overload;

    function BuscarPorId(AValue: Integer): IControllerCargo;
    function Salvar: IControllerCargo;
    function ListarTodos: IControllerCargo;
    function Alterar: IControllerCargo;
    function Excluir(AValue: Integer): IControllerCargo;
  end;

  IControllerVinculo = interface
    ['{29D86FC0-EE73-48CB-82D9-8A7AEA6D8D00}']
    function IdFuncionario: Integer; overload;
    function IdFuncionario(AValue: Integer): IControllerVinculo; overload;
    function IdCargo: Integer; overload;
    function IdCargo(AValue: Integer): IControllerVinculo; overload;
    function IdEmpresa: Integer; overload;
    function IdEmpresa(AValue: Integer): IControllerVinculo; overload;
    function DataAdmissao: TDateTime; overload;
    function DataAdmissao(AValue: TDateTime): IControllerVinculo; overload;

    function Adicionar: IControllerVinculo;
    function Remover: IControllerVinculo;
    function ListarVinculoPorFuncionario(AValue: Integer): IControllerVinculo;
    function ConsultarVinculo: IControllerVinculo;
  end;

implementation

end.
