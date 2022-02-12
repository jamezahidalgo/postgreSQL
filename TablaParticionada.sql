INSERT INTO public.bitacora_viaje(
	id_viaje, fecha)
	VALUES (1, '2010-01-01');
	
CREATE TABLE bitacora_viaje201001 PARTITION OF bitacora_viaje
FOR VALUES FROM ('2010-01-01') TO('2010-01-31');

SELECT * FROM bitacora_viaje;

