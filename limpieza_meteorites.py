import pandas as pd
import kagglehub
import os

path = kagglehub.dataset_download("nafayunnoor/meteorite-landings-on-earth-data")
archivos = os.listdir(path)
df = pd.read_csv(os.path.join(path, archivos[0]))

print("Antes de limpiar:", df.shape)


df = df.drop(columns=["Unnamed: 10"])

print("\nNulos por columna:")
print(df.isnull().sum())

df = df.dropna(subset=["mass (g)"])

df["year"] = pd.to_numeric(df["year"], errors="coerce")


print("\nDespués de limpiar:", df.shape)
print(df.info())

df.to_csv("meteoritos_limpio.csv", index=False)
print("\nArchivo limpio guardado como meteoritos_limpio.csv")