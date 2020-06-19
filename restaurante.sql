create database Restaurante;
use Restaurante;

drop table if exists Categoria;
create table Categoria (
  Id int(11) not null auto_increment,
  Nombre varchar(60) default null,
  primary key (Id),
  unique key Id (Id)
);

drop table if exists Platillos;
create table Platillos (
  Id int(11) not null auto_increment,
  Nombre varchar(60) default null,
  Precio float default null,
  Disponible tinyint(1) default null,
  CategoriaId int(11) default null,
  primary key (Id),
  unique key Id (Id),
  key CategoriaId (CategoriaId),
  constraint Platillos_ibfk_1 foreign key (CategoriaId) references Categoria (Id)
);

drop table if exists Reservaciones;
create table Reservaciones (
  Id int(11) not null auto_increment,
  Nombre varchar(60) not null,
  Apellido varchar(60) not null,
  Hora time default null,
  Fecha date default null,
  CantidadMesa int(11) default null,
  primary key (Id)
);

insert into Categoria (Id, Nombre) values ('1', 'desayunos'),
('2', 'comida'),
('3', 'bebidas'),
('4', 'bebidas con alcohol'),
('5', 'postres'),
('6', 'ensaladas');

insert into Platillos (Id, Nombre, Precio, Disponible, CategoriaId) values ('1', 'pastel de chocolate', '89', '1', '5'),
('2', '400g de rib eye', '199', '1', '2'),
('3', 'refresco', '25', '1', '3'),
('4', 'cafe americano', '35', '1', '3'),
('5', 'tequila', '89', '1', '4'),
('6', 'vodka con jugo', '119', '1', '4'),
('7', 'hot cakes (3)', '119', '1', '1'),
('8', 'omellete', '89', '0', '1'),
('9', 'pastel de zanahoria', '89', '0', '5'),
('10', 'rol de canela', '69', '1', '5'),
('11', 'agua de naranja', '79', '1', '3'),
('12', 'chuletas de cerdo', '179', '1', '2'),
('13', 'costillas bbq', '189', '1', '2'),
('14', 'huevo al gusto', '49', '1', '1'),
('15', 'omellete hiervas finas y queso de cabra', '79', '1', '1'),
('16', 'jugo de zanahoria', '49', '0', '3'),
('17', 'jugo de narnaja', '49', '1', '3'),
('18', 'jugo de toronja', '49', '1', '3'),
('19', 'ensalada violeta', '89', '1', '6'),
('20', 'ensalada de higo', '89', '1', '6'),
('21', 'ensalada cesar', '89', '0', '6'),
('22', 'club sandwich', '99', '1', '1'),
('23', 'sandwich salami', '119', '1', '1'),
('24', 'filete de pescado robalo', '179', '0', '2'),
('25', 'filete de atun ', '179', '1', '2'),
('26', 'milanesa de pollo', '149', '1', '2'),
('27', 'pierna de ternera al horno', '199', '1', '2'),
('28', 'cafe capuchino', '45', '1', '3'),
('29', 'cafe latte', '50', '1', '3'),
('30', 'cafe expresso', '25', '1', '3'),
('31', 'vino tinto francia', '89', '0', '4'),
('32', 'vino tinto chile', '89', '1', '4'),
('33', 'vino tinto mexico', '89', '1', '4'),
('34', 'vino tinto espanha', '89', '0', '4'),
('35', 'vino tinto argentina', '89', '1', '4');

insert into Reservaciones (Id, Nombre, Apellido, Hora, Fecha, CantidadMesa) values ('1', 'juan', 'de la torre', '10:30:00', '2019-06-28', '3'),
('2', 'antonio', 'hernandez', '14:00:00', '2019-07-30', '2'),
('3', 'pedro', 'juarez', '20:00:00', '2019-06-25', '5'),
('4', 'mireya', 'perez', '19:00:00', '2019-06-25', '2'),
('5', 'jose', 'castillo', '14:00:00', '2019-07-30', '3'),
('6', 'maria', 'diaz', '14:30:00', '2019-06-25', '2'),
('7', 'clara', 'duran', '10:00:00', '2019-07-01', '3'),
('8', 'miriam', 'ibanhez', '09:00:00', '2019-07-01', '3'),
('9', 'samuel ', 'reyes', '10:00:00', '2019-07-02', '2'),
('10', 'joaquin', 'munhoz', '19:00:00', '2019-06-28', '3'),
('11', 'julia', 'lopez', '08:00:00', '2019-06-25', '3'),
('12', 'carmen', 'ruiz', '20:00:00', '2019-07-01', '4'),
('13', 'isaac', 'sala', '09:00:00', '2019-07-30', '3'),
('14', 'ana', 'preciado', '14:30:00', '2019-06-28', '4'),
('15', 'sergio', 'iglesias', '10:00:00', '2019-07-02', '2'),
('16', 'aina', 'acosta', '14:00:00', '2019-07-30', '3'),
('17', 'carlos', 'ortiz', '20:00:00', '2019-06-25', '2'),
('18', 'roberto', 'serrano', '10:00:00', '2019-07-30', '4'),
('19', 'carlota', 'perez', '14:00:00', '2019-07-01', '2'),
('20', 'ana maria', 'iglesias', '14:00:00', '2019-07-02', '2'),
('21', 'jaime', 'jimenez', '14:00:00', '2019-07-01', '4'),
('22', 'roberto ', 'torres', '10:00:00', '2019-07-02', '3'),
('23', 'juan', 'cano', '09:00:00', '2019-07-02', '5'),
('24', 'santiago', 'hernandez', '19:00:00', '2019-06-28', '5'),
('25', 'berta', 'gomez', '09:00:00', '2019-07-01', '3'),
('26', 'miriam', 'dominguez', '19:00:00', '2019-06-28', '3'),
('27', 'antonio', 'castro', '14:30:00', '2019-07-02', '2'),
('28', 'hugo', 'alonso', '09:00:00', '2019-06-28', '2'),
('29', 'victoria', 'perez', '10:00:00', '2019-07-02', '1'),
('30', 'jimena', 'leon', '10:30:00', '2019-07-30', '2'),
('31', 'raquel ', 'penha', '20:30:00', '2019-06-25', '3');
