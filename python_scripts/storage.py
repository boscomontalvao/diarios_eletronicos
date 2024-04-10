import firebase_admin
from firebase_admin import credentials
from firebase_admin import storage


cred = credentials.Certificate(r'C:\Users\bosco\OneDrive\Área de Trabalho\python scipsts\key.json')
firebase_admin.initialize_app(cred, {'storageBucket': 'diarios-eletronicos-471b5.appspot.com'})

def storage_upload(path, name):
    bucket = storage.bucket()
    blob = bucket.blob(name)
    blob.upload_from_filename(path)
    blob.make_public()
    url = blob.public_url
    
    return url

