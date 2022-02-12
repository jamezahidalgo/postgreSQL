DO $$
BEGIN
	RAISE NOTICE 'Aprendiendo';
END
$$

DO $$
DECLARE
	rec record := NULL;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
		RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
	END LOOP;
END
$$

DO $$
DECLARE
	rec record := NULL;
	contador integer := 0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
		RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
		contador := contador + 1;
	END LOOP;
	RAISE NOTICE 'Total %', contador;
END
$$

-- Crea función
CREATE FUNCTION verPasajeros()
RETURNS void 
AS $$
DECLARE
	rec record := NULL;
	contador integer := 0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
		RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
		contador := contador + 1;
	END LOOP;
	RAISE NOTICE 'Total %', contador;
END
$$
LANGUAGE PLPGSQL;

SELECT verPasajeros();

-- Cambiamos la función para que retorne el contador, pero primero hay que eliminarla;
-- esto es necesario cuando se cambia el tipo o los parámetros

DROP FUNCTION verPasajeros();
CREATE OR REPLACE FUNCTION verPasajeros()
RETURNS integer 
AS $$
DECLARE
	rec record := NULL;
	contador integer := 0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
		RAISE NOTICE 'Un pasajero se llama %', rec.nombre;
		contador := contador + 1;
	END LOOP;
	RAISE NOTICE 'Total %', contador;
	RETURN contador;
END
$$
LANGUAGE PLPGSQL;

-- Llamada de la función
SELECT verPasajeros();



