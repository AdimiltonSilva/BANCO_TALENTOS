/******************************************************************************/
/****        Generated by IBExpert 2015.12.21.1 23/02/2024 18:33:21        ****/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1252;

SET CLIENTLIB 'C:\Firebird\Firebird_3_0\fbclient.dll';

CREATE DATABASE 'C:\Desen\Delphi\BancoDeTalentos\db\TALENTOS.FDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_FUNCIONARIOS_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_FUNCIONARIOS_ID TO 4;

CREATE GENERATOR GEN_EMPRESAS_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_EMPRESAS_ID TO 2;

CREATE GENERATOR GEN_CARGOS_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_CARGOS_ID TO 2;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE FUNCIONARIOS (
    ID        INTEGER NOT NULL,
    NOME      VARCHAR(50) NOT NULL,
    SOBRENOME VARCHAR(50) NOT NULL
    EMAIL     VARCHAR(100) NOT NULL
    CELULAR   VARCHAR(20) NOT NULL
    LINKEDIN  VARCHAR(100) NOT NULL
    GITHUB    VARCHAR(100) NOT NULL
);

CREATE TABLE EMPRESAS (
    ID          INTEGER NOT NULL,
    RAZAOSOCIAL VARCHAR(100) NOT NULL,
    CNPJ        VARCHAR(20) NOT NULL
);

CREATE TABLE CARGOS (
    ID        INTEGER NOT NULL,
    DESCRICAO VARCHAR(100) NOT NULL
);

CREATE TABLE VINCULO (
    ID_FUNCIONARIOS INTEGER NOT NULL,
    ID_EMPRESAS     INTEGER NOT NULL
);

INSERT INTO FUNCIONARIOS (ID, NOME, SOBRENOME, EMAIL, CELULAR, LINKEDID, GITHUB) VALUES (1, 'BELTRANO', '123456');
INSERT INTO FUNCIONARIOS (ID, NOME, SOBRENOME, EMAIL, CELULAR, LINKEDID, GITHUB) VALUES (2, 'PATO DONALD', '963');
INSERT INTO FUNCIONARIOS (ID, NOME, SOBRENOME, EMAIL, CELULAR, LINKEDID, GITHUB) VALUES (3, 'PLUTO', '321');

COMMIT WORK;

INSERT INTO EMPRESAS (ID, RAZAOSOCIAL, CNPJ) VALUES (1, 'PATETA', '98049498');
INSERT INTO EMPRESAS (ID, RAZAOSOCIAL, CNPJ) VALUES (2, 'ESQUELETO', '7890');

COMMIT WORK;

INSERT INTO CARGOS (ID, DESCRICAO) VALUES (1, 'PATETA');
INSERT INTO CARGOS (ID, DESCRICAO) VALUES (2, 'ESQUELETO');

COMMIT WORK;



/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE FUNCIONARIOS ADD CONSTRAINT PK_FUNCIONARIOS PRIMARY KEY (ID);
ALTER TABLE EMPRESAS ADD CONSTRAINT PK_EMPRESAS PRIMARY KEY (ID);
ALTER TABLE CARGOS ADD CONSTRAINT PK_CARGOS PRIMARY KEY (ID);


/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: FUNCIONARIOS_BI */
CREATE TRIGGER FUNCIONARIOS_BI FOR FUNCIONARIOS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null) or (new.id = 0))  then
    new.id = gen_id(GEN_FUNCIONARIOS_ID,1);
end
^

/* Trigger: EMPRESAS_BI */
CREATE TRIGGER EMPRESAS_BI FOR EMPRESAS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(GEN_EMPRESAS_ID,1);
end
^

/* Trigger: CARGOS_BI */
CREATE TRIGGER CARGOS_BI FOR CARGOS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id is null) then
    new.id = gen_id(GEN_CARGOS_ID,1);
end
^
SET TERM ; ^

