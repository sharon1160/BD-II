create database Agenda;
use Agenda;

drop table if exists Personas;
create table Personas(
ID varchar(10),
Nombre varchar(20) not null,
Apellidos varchar(150) not null,
Fech_naci date not null,
Domicilio varchar(60) not null,
primary key(ID)
);

drop table if exists Teléfonos;
create table Teléfonos(
Número int,
Tipo varchar(20) not null,
primary key(Número)
);

drop table if exists Personas_Teléfonos ;
create table Personas_Teléfonos(
ID_Personas varchar(10),
Número_Teléfonos int,
constraint foreign key(ID_Personas) references Personas(ID)
on delete cascade
on update cascade,
constraint foreign key(Número_Teléfonos) references Teléfonos(Número)
on delete cascade
on update cascade
);

drop table if exists Correos;
create table Correos(
Correo varchar(150),
Tipo varchar(150) not null,
ID_Personas varchar(10),
primary key(Correo),
constraint foreign key(ID_Personas) references Personas(ID)
on delete cascade
on update cascade
);
