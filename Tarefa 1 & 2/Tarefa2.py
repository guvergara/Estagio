import pdfplumber
import pandas as pd

pdf_name = "Anexo1.pdf"

tables_filename = ""

csv_filename = "tabelas_extraidas.csv"

tables = []

#Dicionario para substituir as abreviações
substituicoes = {
    "OD": "Seg. Odontológica",
    "AMB": "Seg. Ambulatorial"
}

#Função para remover quebras de linha dentro das celulas
def limpar_celula(valor):
    if isinstance(valor, str):  
        return valor.replace("\n", " ")
    return valor  

#Abre o PDF e extrai as tabelas
with pdfplumber.open(pdf_name) as pdf:
    for page in pdf.pages:  
        extracted_tables = page.extract_tables()

        for table in extracted_tables:
            #Aplica a limpeza das células da tabela
            tabela_limpa = []

            for linha in table:
                linha_processada = []
                
                for celula in linha:
                    linha_processada.append(limpar_celula(celula))
                tabela_limpa.append(linha_processada)
            #Transforma a tabela limpa em um dataframe e o adiciona a lista de tabelas finais    
            df = pd.DataFrame(tabela_limpa)
            tables.append(df)

if tables:
    #Concatena todas as tabelas em um único DataFrame
    final_df = pd.concat(tables, ignore_index=True)

    #Substitui as abreviações pelas legendas descritas no dicionario
    final_df.replace(substituicoes, inplace=True)

    #Salva os dados no formato CSV corrigido
    final_df.to_csv(csv_filename, index=False, encoding="utf-8-sig", sep=";")

    print(f"As tabelas foram salvas corretamente em '{csv_filename}'.")
else:
    print("Nenhuma tabela encontrada.")
