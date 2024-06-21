unit Model.Interfaces;

interface

type
  IModelFuncionario = interface
    ['{DB0FD080-0369-4C82-984E-C2F4BB33BDFD}']
    function Id(AValue: Integer): IModelFuncionario; overload;
    function Id: Integer; overload;
    function Nome(AValue: string): IModelFuncionario; overload;
    function Nome: string; overload;
    function SobreNome(AValue: string): IModelFuncionario; overload;
    function SobreNome: string; overload;
    function EMail(AValue: string): IModelFuncionario; overload;
    function EMail: string; overload;
    function Celular(AValue: string): IModelFuncionario; overload;
    function Celular: string; overload;
    function Linkedin(AValue: string): IModelFuncionario; overload;
    function Linkedin: string; overload;
    function Github(AValue: string): IModelFuncionario; overload;
    function Github: string; overload;
    function IdCargo(AValue: Integer): IModelFuncionario; overload;
    function IdCargo: Integer; overload;
    function IdEmpresa(AValue: Integer): IModelFuncionario; overload;
    function IdEmpresa: Integer; overload;
    function DataAdmissao(AValue: TDateTime): IModelFuncionario; overload;
    function DataAdmissao: TDateTime; overload;

    function Salvar: IModelFuncionario;
    function ListarTodos: IModelFuncionario;
    //function ListarEmpresaPorFuncionario(AValue: Integer): IModelFuncionario;
    function BuscarPorId(AValue: Integer) : IModelFuncionario;
    function Alterar: IModelFuncionario;
    function Excluir(AValue: Integer): IModelFuncionario;
    function AgruparPorFuncionario: IModelFuncionario;
  end;

  IModelEmpresa = interface
    ['{920B84F8-DBA6-470D-BED5-B7FE036E99CE}']
    function Id(AValue: Integer): IModelEmpresa; overload;
    function Id: Integer; overload;
    function RazaoSocial(AValue: string): IModelEmpresa; overload;
    function RazaoSocial: string; overload;
    function CNPJ(AValue: string): IModelEmpresa; overload;
    function CNPJ: string; overload;

    function Salvar: IModelEmpresa;
    function ListarTodos: IModelEmpresa;
    function BuscarPorId(AValue: integer) : IModelEmpresa;
    function Alterar: IModelEmpresa;
    function Excluir(AValue: Integer): IModelEmpresa;
  end;

  IModelCargo = interface
    ['{289A1044-B3A2-461A-8D93-AC0D9C7F0B06}']
    function Id(AValue: Integer): IModelCargo; overload;
    function Id: Integer; overload;
    function Descricao(AValue: string): IModelCargo; overload;
    function Descricao: string; overload;

    function Salvar: IModelCargo;
    function ListarTodos: IModelCargo;
    function BuscarPorId(AValue: integer) : IModelCargo;
    function Alterar: IModelCargo;
    function Excluir(AValue: Integer): IModelCargo;
  end;

  IModelVinculo = interface
    ['{C511A652-74DD-4B04-ABA8-76298BF91E7B}']
    function IdFuncionario(AValue: Integer): IModelVinculo; overload;
    function IdFuncionario: Integer; overload;
    function IdCargo(AValue: Integer): IModelVinculo; overload;
    function IdCargo: Integer; overload;
    function IdEmpresa(AValue: Integer): IModelVinculo; overload;
    function IdEmpresa: Integer; overload;
    function DataAdmissao(AValue: TDateTime): IModelVinculo; overload;
    function DataAdmissao: TDateTime; overload;

    function Adicionar: IModelVinculo;
    function Remover(AVinculo: IModelVinculo): IModelVinculo;
    function ListarVinculoPorFuncionario(AValue: Integer): IModelVinculo;
    function ConsultarVinculo(AVinculo: IModelVinculo): IModelVinculo;
  end;

implementation

end.
