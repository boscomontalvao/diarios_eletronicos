from pypdf import PdfReader
import os 


def split_file(pdf, output_prefix, lines_per_file):
    reader = PdfReader(pdf)

    arquivo = "texto.txt"

    with open(arquivo, 'a') as f:
        for page in reader.pages:   
            f.write(page.extract_text())
    
    
    with open(arquivo, 'r') as f:
        data = f.readlines()

    total_lines = len(data)
    num_files = total_lines // lines_per_file
    if total_lines % lines_per_file:
        num_files += 1

    for i in range(num_files):
        output_file = f"{output_prefix}_parte{i+1}.txt"
        with open(output_file, 'w') as f:
            start = i * lines_per_file
            end = start + lines_per_file
            f.writelines(data[start:end])
    
    os.remove(arquivo)




caminho = r'C:\Users\bosco\OneDrive\Documentos\Study\Programação para Dispositivo Móveis\Projeto\Pdfs'



for i in range(4):
    meses = os.listdir(os.path.join(caminho, f'202{i}'))
    for j in range(12):
        pdfs = os.listdir(os.path.join(caminho, f'202{i}', f'{meses[j]}'))
        for pdf in pdfs:
            nome_arquivo, _ = os.path.splitext(pdf)
            os.mkdir(os.path.join(caminho, f'202{i}', f'{meses[j]}', f'{nome_arquivo}'))
            
            os.replace(os.path.join(caminho, f'202{i}', meses[j], pdf),
                       os.path.join(caminho, f'202{i}', meses[j], nome_arquivo, pdf))
            
            split_file(os.path.join(caminho, f'202{i}', meses[j], nome_arquivo, pdf),
                       os.path.join(caminho, f'202{i}', meses[j], nome_arquivo, nome_arquivo), 30)

