USE `Planos_de_saude`;

SELECT -- Busca pelo ultimo trimestre informado no arquivo
    o.Razao_Social, 
    SUM(d.VL_SALDO_FINAL) AS Total_Despesas
FROM 
    demonstracoes_contabeis as d
JOIN 
    operadoras_ativas as o ON d.REG_ANS = o.REGISTRO_OPERADORA
WHERE 
    d.DESCRICAO = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR " and
    d.DATA BETWEEN "2024-07-01" and "2024-10-01"
GROUP BY
	o.Razao_Social
ORDER BY 
	Total_Despesas DESC
LIMIT 10;

SELECT -- Busca pelo ultimo ano(2024)
    o.Razao_Social, 
    SUM(d.VL_SALDO_FINAL) AS Total_Despesas
FROM 
    demonstracoes_contabeis as d
JOIN 
    operadoras_ativas as o ON d.REG_ANS = o.REGISTRO_OPERADORA
WHERE 
    d.DESCRICAO = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR " and
    d.DATA LIKE "2024%"
GROUP BY
	o.Razao_Social
ORDER BY 
	Total_Despesas DESC
LIMIT 10;


