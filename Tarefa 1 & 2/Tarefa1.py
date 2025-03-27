import requests
from bs4 import BeautifulSoup
import zipfile
import os

def baixar_pdf(url_pdf, nome_arquivo):
        page_pdf = requests.get(url_pdf, stream=True)  #ativa o streaming para permitir o download por partes
        if page_pdf.status_code == 200:
            with open(nome_arquivo, 'wb') as file:
                for chunk in page_pdf.iter_content(1024):  #define que cada parte do download tera 1024 bytes
                    file.write(chunk)
            print(f"Download concluído: {nome_arquivo}")
        else:
            print(f"Erro ao baixar {nome_arquivo}")

            
url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

#Recebe todo o codigo HTML da pagina em um texto
page_to_scrape = requests.get(url)

#Parseia o codigo da pagina, para poder acessar tags especificas facilmente
soup = BeautifulSoup(page_to_scrape.text, 'html.parser')

if(page_to_scrape.status_code) == 200:
        
    #Busca pela tag especificada com a string especificada    
    anexo1 = soup.find('a', string ="Anexo I.")
    anexo2 = soup.find('a', string ="Anexo II.")
   
    #busca pelo valor do atributo href(texto com o link para download)    
    link_anexo1 = anexo1["href"]
    link_anexo2 = anexo2["href"]

    print("Link do anexo 1:", link_anexo1)
    print("Link do anexo 2:", link_anexo2)

    pdf1,pdf2 = "Anexo1.pdf","Anexo2.pdf"
    
    baixar_pdf(link_anexo1,pdf1)
    baixar_pdf(link_anexo2,pdf2)

    with zipfile.ZipFile("Anexos.zip",'w') as zipf:
        zipf.write(pdf1)
        zipf.write(pdf2)
else:
    print("Os links nao foram encontrados")

    
