import os

def mover_arquivo(caminho_arquivo, novo_nome, novo_diretorio):
    try:
        # Verifica se o arquivo existe
        if os.path.isfile(caminho_arquivo):
            # Extrai o nome do arquivo a partir do caminho completo
            nome_arquivo = os.path.basename(caminho_arquivo)
            
            # Renomeia o arquivo
            os.rename(caminho_arquivo, os.path.join(os.path.dirname(caminho_arquivo), novo_nome))

            # Move o arquivo para o novo diretório
            os.replace(os.path.join(os.path.dirname(caminho_arquivo), novo_nome), os.path.join(novo_diretorio, novo_nome))
            print("Arquivo movido com sucesso!")
        else:
            print("O arquivo especificado não existe.")
    except Exception as e:
        print(f"Ocorreu um erro: {e}")


def substituir_caracteres_lista(lista, caractere_alvo, caractere_substituto):
    nova_lista = []
    for data in lista:
        nova_data = data.replace(caractere_alvo, caractere_substituto)
        nova_lista.append(nova_data)
    return nova_lista



