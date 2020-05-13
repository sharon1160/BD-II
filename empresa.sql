create database Empresa;
use Empresa;

create table Empleado(
Dni varchar(9),
Nombre varchar(50) not null,
Sueldo bigint not null,
primary key(Dni)
);

create table Telefono(
Dni varchar(9),
tnum varchar(9) not null,
constraint foreign key(Dni) references Empleado(Dni)
on delete cascade
on update cascade
);

create table CodigoPostal(
Cnum varchar(5),
Poblacion varchar(50) not null,
Provincia varchar(50) not null,
primary key (Cnum)
);

create table Domicilio(
Dni varchar(9),
Cnum varchar(5),
Calle varchar(50) not null,
constraint foreign key(Dni) references Empleado(Dni)
on delete restrict
on update cascade,
constraint foreign key(Cnum) references CodigoPostal(Cnum)
on delete restrict
on update cascade
);

insert into Empleado
values('12345678A','Antonio Arjona',5000);
insert into Empleado
values('12345678C','Carlota Cerezo',1000);
insert into Empleado
values('12345678L','Laura Lopez',1500);
insert into Empleado
values('12345678P','Pedro Perez',2000);

insert into CodigoPostal
values('08050','Parets','Barcelona');
insert into CodigoPostal
values('14200','Penarroya','Cordoba');
insert into CodigoPostal
values('14900','Lucena','Cordoba');
insert into CodigoPostal
values('28040','Madrid','Madrid');
insert into CodigoPostal
values('50008','Zaragoza','Zaragoza');
insert into CodigoPostal
values('28004','Arganda','Madrid');
insert into CodigoPostal
values('28000','Madrid','Madrid');

insert into Domicilio
values('12345678A',28040,'Avda. Complutense');
insert into Domicilio
values('12345678A',28004,'Cantaro');
insert into Domicilio
values('12345678P',14200,'Diamante');
insert into Domicilio
values('12345678P',14900,'Carbon');
insert into Domicilio
values('12345678L',14200,'Diamante');

insert into Telefono
values('12345678C','611111111');
insert into Telefono
values('12345678C','931111111');
insert into Telefono
values('12345678L','913333333');
insert into Telefono
values('12345678P','913333333');
insert into Telefono
values('12345678P','644444444');
