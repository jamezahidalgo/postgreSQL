SELECT * FROM pasajero WHERE id = 5;
UPDATE pasajero SET nombre = NULL WHERE id = 5
SELECT COALESCE(nombre, 'Nombre en Null') AS nombrenull , * FROM pasajero WHERE id = 5;
SELECT NULLIF(0,0);
SELECT NULLIF(0,1);
SELECT GREATEST(5,5,8,95,75,4225,8,6,9,212,6);
SELECT LEAST(5,5,8,95,75,4225,8,6,9,212,6);
-- Reto
SELECT COALESCE(nombre, 'Nombre en Null') AS nombrenull , *,
CASE WHEN fecha_nacimiento > '2015-01-01' THEN
'Niño' ELSE 'Mayor' END,
CASE WHEN nombre ILIKE 'D%' THEN
'Empieza con D' ELSE 'No empieza con D' END, 
Case WHEN extract(years from age(current_timestamp,fecha_nacimiento::timestamp)) >= 18 THEN
'Mayor de edad.' ELSE 'Menor de edad.' END
FROM pasajero;