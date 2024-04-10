import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import assets

meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']

 
options=webdriver.ChromeOptions();


driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()), options=options)


driver.get("https://www4.trf5.jus.br/diarioeletinternet/index.jsp")

sOrgao = Select(driver.find_element(By.XPATH, '//*[@id="frmVisao:orgao"]')).select_by_value('85')
sEdicao = Select(driver.find_element(By.XPATH, '//*[@id="frmVisao:edicao"]')).select_by_value('2')
sAno = Select(driver.find_element(By.XPATH, '//*[@id="frmVisao:periodo"]')).select_by_value('2023')

wait = WebDriverWait(driver, 15)

for j, mes in enumerate(meses):
    try:
        elem = wait.until(EC.visibility_of_element_located((By.XPATH, f'//*[@id="frmVisao:meses"]/option[{j+2}]')))
    finally:
        i_meses = [str(i).zfill(2) for i in range(1, 13)]  
        sAno = Select(driver.find_element(By.XPATH, '//*[@id="frmVisao:meses"]')).select_by_value(f'{i_meses[j]}')


    x = driver.find_element(By.CLASS_NAME, 'form-barra-botoes').find_element(By.TAG_NAME, 'input')
    x.click()

    try:
        qtdSelect = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="frmPesquisa:quantidadeRegistros"]')))
    finally:
        qtdSelectEle = Select(driver.find_element(By.XPATH, '//*[@id="frmPesquisa:quantidadeRegistros"]'))
        qtdSelectEle.select_by_value('50')

    try:
        trs = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'tbody .rich-table-row:nth-child(11)')))
    finally:   
        datas_elems =  driver.find_elements(By.CSS_SELECTOR, '.rich-table-row td:nth-child(3)')
        datas = []
        for ele in datas_elems:
            datas.append(ele.text)
        aTags = driver.find_elements(By.CSS_SELECTOR, '.rich-table-cell center a')
        print(len(aTags))


    datas = assets.substituir_caracteres_lista(datas, "/", "-")

    for a in aTags:
        a.click()
        time.sleep(1.5)

    time.sleep(2)

    old_dir = r'C:\Users\bosco\Downloads'

    new_dir = rf'C:\Users\bosco\OneDrive\Documentos\Study\Programação para Dispositivo Móveis\Projeto\Pdfs\2023\{mes}'

    os.makedirs(new_dir, True)
    


    for k, e in enumerate(datas):
        if k == 0:
            assets.mover_arquivo(old_dir + r'\Diário.pdf', f'Diário {e}.pdf',  new_dir)
        else:
            assets.mover_arquivo(old_dir + rf'\Diário ({k}).pdf', f'Diário {e}.pdf', new_dir)
    time.sleep(1)  
    os.system('cls')          
driver.close()
