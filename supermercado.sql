create database Supermercado;
use Supermercado;

create table Provincia(
  codpro varchar(2) not null,
  nombre varchar(30) not null,
  primary key(codpro)
);

create table Pueblo(
  codpue varchar(5) not null,
  nombre varchar(40) not null,
  codpro varchar(2) not null,
  primary key(codpue),
  constraint foreign key(codpro) references Provincia(codpro)
  on delete cascade
  on update cascade
);

create table Cliente(
  codcli int not null,
  nombre varchar(50) not null,
  direccion varchar(50) not null,
  codpostal varchar(5),
  codpue varchar(5) not null,
  primary key(codcli),
  constraint foreign key(codpue) references Pueblo(codpue)
  on delete restrict
  on update cascade
);

create table Vendedor(
  codven int not null,
  nombre varchar(50) not null,
  direccion varchar(50) not null,
  codpostal varchar(6),
  codpue varchar(5) not null,
  codjefe int not null,
  primary key(codven),
  constraint foreign key(codpue) references Pueblo(codpue)
  on delete restrict
  on update cascade,
  constraint foreign key(codjefe) references Vendedor(codven)
  on delete restrict
  on update cascade
);

create table Articulo(
  codart varchar(8) not null,
  descrip varchar(40) not null,
  precio decimal(7,2) not null,
  stock int,
  stockmin int,
  primary key(codart)
);

create table Factura(
  codfac int not null,
  fecha date not null,
  codcli int,
  codven int,
  iva int,
  dto int,
  primary key(codfac),
  constraint foreign key(codcli) references Cliente(codcli)
  on delete restrict
  on update cascade,
  constraint foreign key(codven) references Vendedor(codven)
  on delete restrict
  on update cascade
);

create table LineasFac(
  codfac int not null,
  linea int not null,
  cant int,
  codart varchar(8) not null,
  precio decimal(7,2),
  dto int,
  primary key(codfac, linea),
  constraint foreign key(codfac) references Factura(codfac)
  on delete cascade
  on update cascade,
  constraint foreign key(codart) references Articulo(codart)
  on delete restrict
  on update cascade
);