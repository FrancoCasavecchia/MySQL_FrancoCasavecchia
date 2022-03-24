drop database if exists prueba;
CREATE DATABASE prueba;

USE prueba;

CREATE TABLE hotel(
    num_estrellas int(10) not null,
	nombre varchar(255) not null,
	provincia varchar(255),
    calle varchar(255),
    nro int(10) not null
);

CREATE TABLE vuelo(
	origen varchar(255),
    destino varchar(255),
    asiento int(255),
    nombre_aerolinea varchar(255)
	
);

CREATE TABLE reserva(
	valortotal int(255) PRIMARY KEY,
	fecha_entrada date
);

CREATE TABLE agencia(
	nombre_agencia varchar(255) primary key,
    direccion varchar(255)
);

CREATE TABLE reservacion(
	valor_total int(255),
    nombre_agenci varchar(255),
    foreign key(valor_total)REFERENCES reserva(valortotal),
    foreign key(nombre_agenci)REFERENCES agencia(nombre_agencia)
);

CREATE TABLE cliente(
    nombre varchar(255) PRIMARY KEY not null,
    apellido varchar(255)not null,
    sexo varchar(255)not null,
    f_nacimiento date not null
);

CREATE TABLE telefono(
	id int PRIMARY KEY,
    nro_telefono varchar(255),
	cliente varchar(255),
    foreign key(cliente) REFERENCES cliente(nombre)
    
);

INSERT INTO hotel VALUES(2,'Hotel Grand','Cordoba','Av. Rep. De China',1589);
INSERT INTO hotel VALUES(7,'Hotel Casa','BsAs','Alcachofa',8975);

INSERT INTO vuelo VALUES('Argentina','españa',51,'Lan');
INSERT INTO vuelo VALUES('Argentina','londres',4,'Lan');

INSERT INTO reserva VALUES(26500,'2021-12-30');
INSERT INTO reserva VALUES(16000,'2021-1-30');

INSERT INTO agencia VALUES('AS.cop','Altino');
INSERT INTO agencia VALUES('Polt.cop','Tramonter');

INSERT INTO reservacion VALUES(26500,'AS.cop');
INSERT INTO reservacion VALUES(16000,'Polt.cop');

INSERT INTO cliente VALUES('franco','casavecchia','masculino','2003-07-29');
INSERT INTO cliente VALUES('tomas','casavecchia','masculino','2000-05-09');

INSERT INTO telefono VALUES(1,'3512136816','franco');
INSERT INTO telefono VALUES(2,'3518956549','tomas');