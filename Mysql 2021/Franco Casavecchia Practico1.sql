#Trabajo Practico DDL Y DML 1

drop database if exists Practico1;
create database Practico1;

use Practico1;

drop table if exists peliculas;

  create table peliculas(
   titulo varchar(20),
   actor varchar(20),
   duracion integer,
   cantidad integer
  );
  
  describe peliculas;
  
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',180,2);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mujer bonita','Julia R.',90,3);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',90,2);

select titulo,actor from peliculas;
select titulo,duracion from peliculas;
select titulo,cantidad from peliculas;


drop table if exists agenda;

create table agenda(
	nombre varchar(30),
    domicilio varchar(30),
    telefono varchar(11)
);

describe agenda;

insert into agenda(nombre,domicilio,telefono) values ('Alberto Mores','Colon 123','4234567');
insert into agenda(nombre,domicilio,telefono) values('Juan Torres','Avellaneda 135','4458787');
insert into agenda(nombre,domicilio,telefono) values(  'Mariana Lopez','Urquiza 333','4545454');
insert into agenda(nombre,domicilio,telefono) values('Fernando Lopez','Urquiza 333','4545454');

select * from agenda;
select * from agenda where nombre like 'Juan Torres';
select * from agenda where domicilio like 'Colon 123';
select * from agenda where telefono like '4545454';

drop table agenda;


drop table if exists articulos;

  create table articulos(
   codigo integer,
   nombre varchar(20),
   descripcion varchar(30),
   precio float,
   cantidad integer
  );
  
  describe articulos;
  
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50);
  
select * from articulos;
select * from articulos where nombre like 'impresora';
select * from articulos where precio >= 500;
select * from articulos where precio <30;
select * from articulos where precio > 100;


drop table if exists empleados;

create table empleados(
	nombre varchar(30),
    documento int(8) primary key,
    sexo varchar(30),
    domicilio varchar(30),
    sueldobasico decimal(4.2),
    hijos int(100)
);

insert into empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Juan Perez','22333444','m',300,1);
insert into empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Ana Acosta','21333444','f',400,2);
insert into empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Alberto Lopez','24333444','m',600,0);
insert into empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Carlos Sanchez','30333444','m',550,3);
insert into empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Mariana Torres','23444555','f',600,1);
insert into empleados (nombre,documento,sexo,sueldobasico,hijos) values ('Marcos Garcia','23664555','m',1500,2);

SELECT (sueldobasico * 1.1) AS "Sueldo Aumentado" FROM empleados;
select nombre, sueldobasico,hijos,(200*hijos),sueldobasico+(200*hijos)  from empleados;


drop table if exists empleados;

create table empleados(
   documento char(8) not null,
   nombre varchar(30) not null,
   sexo char(1),
   domicilio varchar(30),
   fechaIngreso date,
   fechaNacimiento date,
   sueldoBasico decimal(5,2) unsigned,
   primary key(documento)
   );
   
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390);
insert into empleados (documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico) values ('30615426','Federico Gonzalez','m','Peru 390','1996-08-15','1985-05-01',580);

SELECT nombre, fechaNacimiento FROM empleados WHERE MONTH(fechaNacimiento) = 5;

SELECT nombre, fechaIngreso AS "Sueldo aumentado", sueldobasico FROM empleados WHERE MONTH(fechaIngreso) = 8;

SELECT (-YEAR(fechaIngreso) + YEAR(NOW())) FROM empleados WHERE MONTH(fechaIngreso) = 8;


drop table if exists medicamentos;
create table medicamentos(
   codigo int unsigned auto_increment,
   nombre varchar(20),
   laboratorio varchar(20),
   precio decimal(5,2),
   cantidad int unsigned,
   primary key(codigo)
  );

describe table medicamentos;

  insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
  insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
  insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
  insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
  insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150); 
  insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250);
  
  select * from medicamentos order by precio asc;
  
  select * from medicamentos order by cantidad asc;
  
  select * from medicamentos order by laboratorio desc,cantidad asc;


drop table if exists medicamentos;

create table medicamentos(codigo int unsigned auto_increment, 
nombre varchar(20), 
laboratorio varchar(20), 
precio decimal(5,2) unsigned, 
cantidad int unsigned, 
primary key(codigo)
);

describe medicamentos;

insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250);

select codigo,nombre from medicamentos where laboratorio like 'Roche' and precio < 5;
select * from medicamentos where laboratorio not like 'Bayer';
select * from medicamentos where laboratorio not like 'Bayer' and cantidad = 100;

delete from medicamentos where laboratorio like 'Bayer' and precio > 10;

update medicamentos set cantidad = 200 where laboratorio like 'Roche' and precio > 5;

delete from medicamentos where laboratorio like 'Bayer' and precio < 3;


drop table if exists medicamentos;

  create table medicamentos(
   codigo int unsigned auto_increment,
   nombre varchar(20),
   laboratorio varchar(20),
   precio decimal(5,2) unsigned,
   cantidad int unsigned,
   primary key(codigo)
  );
  describe medicamentos;
  
	insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
	insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
	insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
	insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
	insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150); 
	insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250);



























