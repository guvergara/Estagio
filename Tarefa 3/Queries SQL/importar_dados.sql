USE `Planos_de_saude`;

TRUNCATE TABLE operadoras_ativas;
TRUNCATE TABLE demonstracoes_contabeis;
SHOW COLUMNS FROM operadoras_ativas;
select*from operadoras_ativas;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv' INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@REGISTRO_OPERADORA, @CNPJ, @Razao_Social, @Nome_Fantasia, @Modalidade, @Logradouro, @Numero, 
@Complemento, @Bairro, @Cidade, @UF, @CEP, @DDD, @Telefone, @Fax, @Endereco_eletronico, @Representante, 
@Cargo_Representante, @Regiao_de_Comercializacao, @Data_Registro_ANS)
SET 	
    REGISTRO_OPERADORA = @REGISTRO_OPERADORA,
    CNPJ = @CNPJ,
    Razao_Social = @Razao_Social,
    Nome_Fantasia = @Nome_Fantasia,
    Modalidade = @Modalidade,
    Logradouro = @Logradouro,
    Numero = @Numero,
    Complemento = @Complemento,
    Bairro = @Bairro,
    Cidade = @Cidade,
    UF = @UF,
    CEP = @CEP,
    DDD = @DDD,
    Telefone = @Telefone,
    Fax = @Fax,
    Endereco_eletronico = @Endereco_eletronico,
    Representante = @Representante,
    Cargo_Representante = @Cargo_Representante,
    Regiao_de_Comercializacao = NULLIF(@Regiao_de_Comercializacao, ''),
    Data_Registro_ANS = @Data_Registro_ANS;
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
 
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'),
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2t2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@DATA, @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
	DATA = @DATA,
    REG_ANS = @REG_ANS,
    CD_CONTA_CONTABIL = @CD_CONTA_CONTABIL,
    DESCRICAO = @DESCRICAO,
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

