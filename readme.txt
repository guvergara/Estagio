Este é um repositório dedicado aos programas referentes ao processo de estágio da IntuitiveCare

Tarefa 1 - Programa em Python que realizada o download dos pdfs presentes no site: https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos e zipa os mesmos.
Requisitos para o funcionamento: Apenas o programa em python "Tarefa1.py" (que exige o python e as bibliotecas indicadas no inicio do programa).

Tarefa 2 - Programa em Python que extrai as tabelas presentes no arquivo "Anexo1", baixados pelo programa "Tarefa 1", as transforma em um arquivo .csv e zipa o mesmo.
Requisitos para o funcionamento: Programa em python "Tarefa2.py" (que exige o python e as bibliotecas indicadas no inicio do programa) e o pdf "Anexo1.pdf", caso o pdf e o programa ja estajam na mesma pasta, nada precisará ser alterado, se nao estiverem, será necessario indicar o caminho do pdf na variavel "pdf_name"

Tarefa 3 - Scripts .sql que realizam:
-estruturar_tabelas.sql: cria o database e as tabelas necessarias para a insercao dos dados no programa "importar_dados.sql"
-importar_dados.sql: importa os dados presentes nos arquivos da pasta "Arquivos.csv utilizados" para as tabelas criadas anteriormente
-busca_seletiva.sql: busca por informacoes especificas nas tabelas com os dados importados
Requisitos para o funcionamento: MySQL 8, que executara os scrips da pasta "Queries SQL", e todos os arquivos presentes na pasta "Arquivos.csv utilizados". É importante ressaltar que no programa "importar_dados.sql" a querie esta puxando os arquivos da pasta Uploads do MySQL, portanto é necessario verificar se o caminho é o mesmo ou será necessário mudar.
