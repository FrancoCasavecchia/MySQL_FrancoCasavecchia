Create database Libreria;

use Libreria;

create table Generos
(
IdGenero int primary key not null,
Genero varchar(5) not null
);

create table Libros
(
cod_libro int primary key not null,
Titulo varchar(5) not null,
Tapa varchar(5) not null,
Precio varchar(5) not null,
Fecha varchar(5) not null,
IdGenero varchar(5) not null
);

create table Autores
(
IdAutor int primary key not null,
Nombre_Autor varchar(5)not null,
IdPais int (5) not null,
anio_nac varchar(5)not null,
anio_def varchar(5) not null
);

create table Paises
(
IdPais int primary key not null,
Titulo varchar(5) not null
);








