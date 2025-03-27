CREATE DATABASE `Planos_de_saude`;
USE `Planos_de_saude`;

CREATE TABLE operadoras_ativas (
	REGISTRO_OPERADORA VARCHAR(6) PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL,
    Razao_Social VARCHAR(140) NOT NULL,
    Nome_Fantasia VARCHAR(140),
    Modalidade VARCHAR(50) NOT NULL,
    Logradouro VARCHAR(40) NOT NULL,
    Numero VARCHAR(20),
    Complemento VARCHAR(40),
    Bairro VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    DDD VARCHAR(4),
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(50) NOT NULL,
    Cargo_Representante VARCHAR(40),
    Regiao_de_Comercializacao TINYINT,
    Data_Registro_ANS DATE NOT NULL
    );
    
    CREATE TABLE demonstracoes_contabeis (
    DATA DATE NOT NULL,
    REG_ANS VARCHAR(8) NOT NULL,
    CD_CONTA_CONTABIL INT ,
    DESCRICAO VARCHAR(150),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

