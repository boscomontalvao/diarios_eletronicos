import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import os
from datetime import datetime
from storage import storage_upload

cred = credentials.Certificate(r'C:\Users\bosco\OneDrive\Área de Trabalho\python scipsts\key.json')


db = firestore.client()

caminho = r'C:\Users\bosco\OneDrive\Documentos\Study\Programação para Dispositivo Móveis\Projeto\Pdfs'

def coletando_dados(ano, mes, dia):
    textos = []
    arquivos = os.listdir(os.path.join(caminho, ano, mes, dia))

    for texto in arquivos:
        if texto.endswith(".txt"):
            with open(os.path.join(caminho, ano, mes, dia, texto), 'r') as t:
                tupla = (texto, t.read()) 
                textos.append(tupla)   
    return textos 


def colection_data():
    main_collection = db.collection('diarios')

    for i in range(4):
        meses = os.listdir(os.path.join(caminho, f'202{i}'))
        for j in range(12):    
            diarios = os.listdir(os.path.join(caminho, f'202{i}', f'{meses[j]}'))
            for d in diarios:
                textos = coletando_dados(f'202{i}', meses[j], d)
                diario, data_pub = d.split()

                arquivos = os.listdir(os.path.join(caminho, f'202{i}', f'{meses[j]}', d)) 
                for pdf in arquivos:
                    if pdf.endswith('.pdf'):
                        url = storage_upload(os.path.join(caminho, f'202{i}', f'{meses[j]}', d, pdf),
                                            f'202{i}/{meses[j]}/{pdf}')
                        break
                
                
                
            
                main_collection.document(f'{diario} {data_pub}').set({
                    'data_publicacao': datetime.strptime(data_pub, '%d-%m-%Y'),
                    'pdf': url
                })


                for k, texto in enumerate(textos):
                    sub_collection =  main_collection.document(f'{diario} {data_pub}').collection('texto_dividido')
                    sub_collection.document(f'Parte {k+1}').set({
                        f'data_pub p.{k+1}' : texto[1],
                        
                    })

colection_data()