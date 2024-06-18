# Projeto de Avaliação de Conhecimento em Delphi

## Introdução

Este projeto tem como objetivo avaliar o conhecimento em Delphi através da implementação de um sistema de cadastro de funcionários, cargos e empresas. O sistema deve permitir a criação, leitura, atualização e exclusão (CRUD) dos funcionários, cargos e empresas, bem como a vinculação entre funcionário/empresa e relatórios.

## Autor

Adimilton Antonio da Silva <br/>
adimilton@gmail.com <br/>
(81) 98837-4804 <br/>
https://github.com/AdimiltonSilva <br/>
https://www.linkedin.com/in/adimilton-antonio-89553522/

## Requisitos do Sistema

### Funcionalidades

1. **Cadastro de Cargos**:
    - Deve conter os seguintes dados:
      (Descrição)
    - Adicionar um novo cargo.
    - Editar um cargo existente.
    - Excluir um cargo.
    - Listar todos os cargos.

2. **Cadastro de Empresas**:
    - Deve conter os seguintes dados:
      (Razão Social, CNPJ)
    - Adicionar uma nova empresa.
    - Editar uma empresa existente.
    - Excluir um empresa.
    - Listar todos as empresas.

3. **Cadastro de Funcionários**:
    - Deve conter os seguintes dados:
      (Nome, Sobre Nome, E-mail, Celular, Linkedin, Github)
    - Adicionar um novo funcionário.
    - Editar um funcionário existente.
    - Excluir um funcionário.
    - Listar todos os funcionários.
    - Listar todos os funcionários por empresa.
    - Associar um funcionário a uma empresa.

3. **Visualização**:
    - Visualizar a lista de cargos.
    - Visualizar a lista de funcionários.
    - Visualizar a lista de funcionários e empresas vinculadas.
    - Visualizar a lista de empresas.
    - Visualizar a lista de empresas e funcionários vinculados.

### Requisitos Técnicos

- O projeto deve ser desenvolvido em Delphi 7 ou superior.
- Utilizar um banco de dados relacional (Firebird).
- Interface gráfica deve ser desenvolvida utilizando os componentes padrão do Delphi.
- Implementar todas as operações CRUD para Cargos, Funcionários e Empresas.

## Estrutura do Projeto

A estrutura sugerida para o projeto é a seguinte: <br/>
```
/
├── .gitignore
├── BancoTalentos.dpr
├── BancoTalentos.dproj
├── BancoTalentos.res
├── BancoTalentos.dof
├── /src
│   ├── /dao # Pasta para arquivos de acesso ao banco de dados 
│   |   ├── UntConexao.pas
│   |   ├── Dao.Interfaces.pas
│   |   ├── Dao.Empresa.pas
│   |   ├── Dao.Funcionario.pas
│   |   └── Dao.Cargo.pas
│   ├── /model # Pasta para arquivos de modelo 
│   |   ├── Model.Interfaces.pas
│   |   ├── Model.Pessoa.pas
│   |   ├── Model.Empresa.pas
│   |   ├── Model.Funcionario.pas
│   |   └── Model.Cargo.pas
│   ├── /view # Pasta para arquivos de interface com o usuário 
│   |   ├── View.Principal.dfm 
│   |   ├── View.Principal.pas
│   |   ├── View.Modelo.dfm
│   |   ├── View.Modelo.pas
│   |   ├── View.Empresa.dfm
│   |   ├── View.Empresa.pas
│   |   ├── View.Funcionario.dfm
│   |   ├── View.Funcionario.pas
│   |   ├── View.Cargo.dfm
│   |   ├── View.Cargo.pas
│   |   ├── View.ListagemEmpresa.dfm
│   |   ├── View.ListagemEmpresa.pas
│   |   ├── View.ListagemFuncionario.dfm
│   |   ├── View.ListagemFuncionario.pas
│   |   ├── View.ListagemCargo.dfm
│   |   └── View.ListagemCargo.pas
│   └── /controller # Pasta para arquivos do controlador 
│       ├── Controller.Interfaces.pas
│       ├── Controller.Empresa.pas
│       ├── Controller.Funcionario.pas
│       └── Controller.Cargo.pas
├── /docs # Documentação do projeto 
│   ├── LICENSE
│   ├── AVALIACAO.md
│   └── README.md # Este arquivo 
└── /sql # Scripts SQL para criação do banco de dados 
    └── create_database.sql 
```
## Licença

Este projeto é licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

**Nota**: Este projeto é uma avaliação de conhecimento e não deve ser utilizado em ambientes de produção.

## Contato

Para mais informações, entre em contato com adimilton@gmail.com (81)98837-4804