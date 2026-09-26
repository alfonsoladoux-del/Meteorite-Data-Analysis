-- 1. Cantidad total de registros
SELECT COUNT(*) AS total_meteoritos FROM meteoritos;

-- 2. Valores nulos en columnas clave
SELECT 
  SUM(CASE WHEN `mass (g)` IS NULL THEN 1 ELSE 0 END) AS mass_nulos,
  SUM(CASE WHEN reclat IS NULL THEN 1 ELSE 0 END) AS reclat_nulos,
  SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS year_nulos
FROM meteoritos;

-- 3. Top 10 meteoritos más pesados
SELECT name, `mass (g)`, recclass 
FROM meteoritos 
ORDER BY `mass (g)` DESC 
LIMIT 10;

-- 3. Top 10 meteoritos más pesados
SELECT name, `mass (g)`, recclass 
FROM meteoritos 
ORDER BY `mass (g)` DESC 
LIMIT 10;

-- 4. Cantidad de meteoritos por tipo de caída (Fell vs Found)
SELECT fall, COUNT(*) AS cantidad 
FROM meteoritos 
GROUP BY fall;

-- 4. Cantidad de meteoritos por tipo de caída (Fell vs Found)
SELECT fall, COUNT(*) AS cantidad 
FROM meteoritos 
GROUP BY fall;

-- 6. Top 10 clases de meteoritos más comunes (recclass)
SELECT recclass, COUNT(*) AS cantidad
FROM meteoritos
GROUP BY recclass
ORDER BY cantidad DESC
LIMIT 10;

-- 7. Masa promedio por tipo de caída
SELECT fall, AVG(`mass (g)`) AS masa_promedio
FROM meteoritos
WHERE `mass (g)` IS NOT NULL
GROUP BY fall;

-- 8. Meteoritos registrados después del año 2000
SELECT name, year, `mass (g)`
FROM meteoritos
WHERE year > 2000
ORDER BY year DESC
LIMIT 20;

-- 9. Años con más caídas registradas
SELECT year, COUNT(*) AS cantidad
FROM meteoritos
WHERE year IS NOT NULL
GROUP BY year
ORDER BY cantidad DESC
LIMIT 10;

-- 10. Meteoritos sin coordenadas geográficas (para limpieza/mapas)
SELECT COUNT(*) AS sin_coordenadas
FROM meteoritos
WHERE reclat IS NULL OR reclong IS NULL;

