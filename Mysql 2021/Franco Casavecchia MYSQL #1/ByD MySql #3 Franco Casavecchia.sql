create database ejercicio3;
use ejercicio3;

create table tarjeta(numero int primary key not null,
banco varchar(50) not null,
codSeguridad int(15) not null,
vencimiento date not null
);

INSERT into tarjeta values('1',"Galicia",'5656','2007-7-7');
insert into tarjeta values('2',"Melocoton",'89454','2021-1-7');
insert into tarjeta values('3',"Aleli",'74685','2021-7-5');
insert into tarjeta values('4',"Galer",'9857','2001-7-7');
insert into tarjeta values('5',"Bancor",'32156','2011-8-15');

create table cliente(codigo int primary key not null,
nombre varchar(50) not null,
fecNac date not null,
dni varchar(50)not null,
telefono varchar(50)not null,
numeroTarjeta int not null,
foreign key (numeroTarjeta) references tarjeta(numero)
);

INSERT into cliente values('1',"Franco",'2007-7-7',"66787454",3512136946);
insert into cliente values('2',"Melocoton",'2021-1-7',"22656898",3512136856);
insert into cliente values('3',"Casa",'2021-7-5',"88569265",7894561123);
insert into cliente values('4',"Casovich",'2001-7-7',44898346,"4561234789");
insert into cliente values('5',"Tomas",'2011-8-15',"56789321","4897596412");

create table producto(codigo int primary key not null,
descripcion varchar(50) not null,
costo int(50)not null
);

INSERT into producto values('166787454',"Produccion",'60000');
insert into producto values('266787454',"Desplazamiento",'98565');
insert into producto values('366787454',"Embalamiento",'745625');
insert into producto values('444898346',"Materia Prima","631251");
insert into producto values('556789321',"Organizacion oficinal","489256");

create table fabrica(cuit int primary key not null,
RazonSocial varchar(50) not null,
direccion varchar(50)not null,
telefono varchar(50)not null,
codigoProducto int not null,
foreign key (codigoProducto) references producto(codigo)
);

INSERT into fabrica values('166787454',"Produccion",'D1 P5',3512136946);
insert into fabrica values('266787454',"Desplazamiento",'Cartera Coltera',3512136856);
insert into fabrica values('366787454',"Embalamiento",'Arrow naiz',7894561123);
insert into fabrica values('444898346',"Materia Prima",'Voltera esquina',"4561234789");
insert into fabrica values('556789321',"Organizacion oficinal",'Lolenandia',"4897596412");

create table empleado(legajo varchar(50) primary key not null,
nombre varchar(50) not null,
dni varchar(50)not null,
calle varchar(50) not null,
altura varchar(10) not null,
ciudad varchar(10) not null
);

INSERT into empleado values('1',"Franco","caretila",351,'Cordoba');
insert into empleado values('2',"Melocoton",'ellchofa',3266,'Cordoba');
insert into empleado values('3',"Casa",'mondi',7823,'Cordoba');
insert into empleado values('4',"Casovich",'alberto fernandez',"1239"'Cordoba');
insert into empleado values('5',"Tomas",'lolinatania',"7412",'Cordoba');

create table sucursal(numero int primary key not null,
domicilio varchar(50) not null,
ciudad varchar(50)not null,
legajoEmpleado varchar(50),
foreign key(legajoEmpleado)references empleado(legajo)
);

INSERT into sucursal values('1',"caretila",'Cordoba');
insert into sucursal values('2','ellchofa','Cordoba');
insert into sucursal values('3','mondi','Cordoba');
insert into sucursal values('4','alberto fernandez','Cordoba');
insert into sucursal values('5','lolinatania','Cordoba');

create table vende(cantidad int not null,
PrecioVenta int not null,
numero int not null,
codigo int not null,
foreign key(numero) references sucursal(numero),
foreign key(codigo)references producto(codigo)
);

insert into vende values('1','25');
insert into vende values('2','632');
insert into vende values('3','158');
insert into vende values('4','89');
insert into vende values('5','56');




