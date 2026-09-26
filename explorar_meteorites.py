import pandas as pd
import kagglehub
import os

path = kagglehub.dataset_download("nafayunnoor/meteorite-landings-on-earth-data")

archivos = os.listdir(path)
print("Archivos encontrados:", archivos)

df = pd.read_csv(os.path.join(path, archivos[0]))

print(df.head())
print(df.info())
print(df.describe())
