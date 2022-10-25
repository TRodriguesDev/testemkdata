/******************************************************************************/
/***          Generated by IBExpert 2012.02.21 25/10/2022 02:25:06          ***/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES ISO8859_1;

SET CLIENTLIB 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll';

CREATE DATABASE 'd:\MKDATA\BANCO\mkdatateste.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 8192
DEFAULT CHARACTER SET ISO8859_1 COLLATION ISO8859_1;



/******************************************************************************/
/***                                Domains                                 ***/
/******************************************************************************/

CREATE DOMAIN DTHR AS
TIMESTAMP
DEFAULT 'NOW'
NOT NULL;

CREATE DOMAIN TAM30 AS
VARCHAR(30)
NOT NULL;

CREATE DOMAIN TAM60 AS
VARCHAR(60)
NOT NULL;



/******************************************************************************/
/***                               Generators                               ***/
/******************************************************************************/

CREATE GENERATOR GEN_IDCLIENTES;
SET GENERATOR GEN_IDCLIENTES TO 0;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE CAD_CLIENTES (
    IDCLIENTE    INTEGER NOT NULL,
    DTCAD_CLI    DTHR NOT NULL,
    TIPO_CLI     CHAR(1) NOT NULL,
    CPFCNPJ_CLI  VARCHAR(20) NOT NULL,
    NOME_CLI     TAM60 NOT NULL,
    RGIE_CLI     VARCHAR(20),
    ATIVO_CLI    CHAR(1) NOT NULL,
    DTUALT_CLI   DTHR NOT NULL
);


CREATE TABLE CAD_CONTATOS (
    ID_CLIENTE  INTEGER NOT NULL,
    SEQ_CTO     INTEGER NOT NULL,
    DTCAD_CTO   DTHR NOT NULL,
    DESCR_CTO   TAM30 NOT NULL,
    DDD_CTO     VARCHAR(3),
    NUM_CTO     VARCHAR(15),
    EMAIL_CTO   VARCHAR(255),
    DTUALT_CTO  DTHR NOT NULL
);


CREATE TABLE CAD_ENDERECOS (
    ID_CLIENTE  INTEGER NOT NULL,
    SEQ_END     INTEGER NOT NULL,
    DTCAD_END   DTHR NOT NULL,
    DEF_END     CHAR(1) NOT NULL,
    DESCR_END   TAM30 NOT NULL,
    PAIS_END    TAM30 NOT NULL,
    UF_END      CHAR(2) NOT NULL,
    CEP_END     VARCHAR(8) NOT NULL,
    END_END     TAM60 NOT NULL,
    NUM_END     VARCHAR(15) NOT NULL,
    COMPL_END   VARCHAR(30),
    CID_END     TAM60 NOT NULL,
    BAI_END     VARCHAR(40),
    LOGRA_END   VARCHAR(20) NOT NULL,
    DTUALT_END  DTHR NOT NULL
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE CAD_CLIENTES ADD CONSTRAINT PK_CAD_CLIENTES PRIMARY KEY (IDCLIENTE);
ALTER TABLE CAD_CONTATOS ADD CONSTRAINT PK_CAD_CONTATOS PRIMARY KEY (ID_CLIENTE, SEQ_CTO);
ALTER TABLE CAD_ENDERECOS ADD CONSTRAINT PK_CAD_ENDERECOS PRIMARY KEY (ID_CLIENTE, SEQ_END);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE CAD_CONTATOS ADD CONSTRAINT FK_CAD_CONTATOS FOREIGN KEY (ID_CLIENTE) REFERENCES CAD_CLIENTES (IDCLIENTE) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE CAD_ENDERECOS ADD CONSTRAINT FK_CAD_ENDERECOS FOREIGN KEY (ID_CLIENTE) REFERENCES CAD_CLIENTES (IDCLIENTE) ON DELETE CASCADE ON UPDATE CASCADE;


/******************************************************************************/
/***                                Indices                                 ***/
/******************************************************************************/

CREATE INDEX IDXATIVO ON CAD_CLIENTES (ATIVO_CLI);
CREATE INDEX IDXCPFCNPJ ON CAD_CLIENTES (CPFCNPJ_CLI);
CREATE INDEX IDXNOME ON CAD_CLIENTES (NOME_CLI);
CREATE INDEX IDXPRICLIENTE ON CAD_CLIENTES (CPFCNPJ_CLI, NOME_CLI, ATIVO_CLI);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: TRG_BEF_INS_CADCLIENTES */
CREATE TRIGGER TRG_BEF_INS_CADCLIENTES FOR CAD_CLIENTES
ACTIVE BEFORE INSERT POSITION 0
AS BEGIN
 IF ((NEW.IDCLIENTE = 0) OR (NEW.IDCLIENTE IS NULL)) THEN
   NEW.IDCLIENTE = GEN_ID(GEN_IDCLIENTES,1);
END
^


/* Trigger: TRG_BEF_INS_CADCONTATOS */
CREATE TRIGGER TRG_BEF_INS_CADCONTATOS FOR CAD_CONTATOS
ACTIVE BEFORE INSERT POSITION 0
AS
    DECLARE VARIABLE NSEQ INTEGER;
BEGIN
    IF ((NEW.SEQ_CTO IS NULL) OR (NEW.SEQ_CTO = 0)) THEN
    BEGIN
        SELECT MAX(SEQ_CTO)FROM CAD_CONTATOS WHERE ID_CLIENTE = NEW.ID_CLIENTE INTO NSEQ;
        IF (NSEQ IS NULL) THEN
            NEW.SEQ_CTO = 1;
        ELSE
            NEW.SEQ_CTO = NSEQ + 1;
    END
END
^


/* Trigger: TRG_BEF_INS_ENDERECOS */
CREATE TRIGGER TRG_BEF_INS_ENDERECOS FOR CAD_ENDERECOS
ACTIVE BEFORE INSERT POSITION 0
AS
    DECLARE VARIABLE NSEQ INTEGER;
BEGIN
    IF ((NEW.SEQ_END IS NULL) OR (NEW.SEQ_END = 0)) THEN
    BEGIN
        SELECT MAX(SEQ_END)FROM CAD_ENDERECOS WHERE ID_CLIENTE = NEW.ID_CLIENTE INTO NSEQ;
        IF (NSEQ IS NULL) THEN
            NEW.SEQ_END = 1;
        ELSE
            NEW.SEQ_END = NSEQ + 1;
    END
END
^


SET TERM ; ^

