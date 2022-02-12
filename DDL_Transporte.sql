CREATE TABLE pasajero(
	id serial NOT NULL,
	nombre character varying(100),
	direccion_residencia character varying(100),
	fecha_nacimiento date,
	CONSTRAINT pasajero_pkey PRIMARY KEY (id)
);

CREATE TABLE tren(
	id serial NOT NULL,
	modelo character varying(30),
	capacidad integer,
	CONSTRAINT tren_pkey PRIMARY KEY (id)
);
CREATE TABLE estacion(
	id serial,
	nombre character varying(30),
	direccion character varying(100),
	CONSTRAINT estacion_pkey PRIMARY KEY (id)
);
CREATE TABLE trayecto(
	id serial NOT NULL,
	id_tren integer,
	id_estacion integer,
	CONSTRAINT trayecto_pkey PRIMARY KEY (id),
	FOREIGN KEY (id_tren) REFERENCES tren(id),
	FOREIGN KEY (id_estacion) REFERENCES estacion(id)
);
CREATE TABLE viaje(
	id serial NOT NULL,
	id_pasajero integer,
	id_trayecto integer,
	inicio date,
	fin date,
	CONSTRAINT viaje_pkey PRIMARY KEY (id),
	FOREIGN KEY (id_pasajero) REFERENCES pasajero (id),
	FOREIGN KEY (id_trayecto) REFERENCES trayecto (id)
);
