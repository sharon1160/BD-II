CREATE DATABASE RESTAURANTE;

USE RESTAURANTE;

-- ---
-- Table 'Sucursal'
-- 
-- ---

DROP TABLE IF EXISTS Sucursal;
CREATE TABLE Sucursal (
  Id VARCHAR(10),
  Nombre VARCHAR(10) NOT NULL,
  Direccion VARCHAR(30) NOT NULL,
  Telefono INTEGER NOT NULL,
  PRIMARY KEY (Id)
);

-- ---
-- Table 'Cliente'
-- 
-- ---

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(
  Id VARCHAR(10),
  Nombre VARCHAR(10) NOT NULL,
  Apellido VARCHAR(30) NOT NULL,
  Direccion VARCHAR(30),
  Telefono INTEGER NOT NULL,
  PRIMARY KEY (Id)
);

-- ---
-- Table 'Empleado'
-- 
-- ---

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado(
  Id VARCHAR(10),
  Nombre VARCHAR(10) NOT NULL,
  Apellido VARCHAR(30) NOT NULL,
  Direccion VARCHAR(30),
  Telefono INTEGER NOT NULL,
  Vale INTEGER,
  Jefe VARCHAR(10),
  Id_Sucursal VARCHAR(10),
  PRIMARY KEY (Id),
  CONSTRAINT FOREIGN KEY(Jefe) REFERENCES Empleado(Id)
  on delete restrict
  on update cascade,
  CONSTRAINT FOREIGN KEY(Id_Sucursal) REFERENCES Sucursal(Id)
  on delete restrict
  on update cascade
);

-- ---
-- Table 'Factura'
-- 
-- ---

DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura(
  Id VARCHAR(10),
  Fecha DATE NOT NULL,
  Descuento INTEGER,
  Id_Cliente VARCHAR(10),
  Id_Empleado VARCHAR(10),
  PRIMARY KEY (Id),
  CONSTRAINT FOREIGN KEY(Id_Cliente) REFERENCES Cliente(Id)
  on delete restrict
  on update cascade,
  CONSTRAINT FOREIGN KEY(Id_Empleado) REFERENCES Empleado(Id)
  on delete restrict
  on update cascade
);

-- ---
-- Table 'Reservacion'
-- 
-- ---

DROP TABLE IF EXISTS Reservacion;
CREATE TABLE Reservacion(
  Id VARCHAR(10),
  Id_Cliente VARCHAR(10),
  Id_Sucursal VARCHAR(10),
  PRIMARY KEY (Id),
  CONSTRAINT FOREIGN KEY(Id_Cliente) REFERENCES Cliente(Id)
  on delete restrict
  on update cascade,
  CONSTRAINT FOREIGN KEY(Id_Sucursal) REFERENCES Sucursal(Id)
  on delete restrict
  on update cascade
);

-- ---
-- Table 'Mesa'
-- 
-- ---

DROP TABLE IF EXISTS Mesa;
CREATE TABLE Mesa(
  Id VARCHAR(10),
  NroMesa INTEGER NOT NULL,
  PRIMARY KEY (Id)
);

-- ---
-- Table 'Gasto'
-- 
-- ---

DROP TABLE IF EXISTS Gasto;
CREATE TABLE Gasto (
  Id VARCHAR(10),
  Recurso VARCHAR(20) NOT NULL,
  Costo NUMERIC(10,2) NOT NULL,
  Id_Sucursal VARCHAR(10),
  PRIMARY KEY (Id),
  CONSTRAINT FOREIGN KEY(Id_Sucursal) REFERENCES Sucursal(Id)
  on delete restrict
  on update cascade
);

-- ---
-- Table 'LineaFactura'
-- 
-- ---

DROP TABLE IF EXISTS LineaFactura;
CREATE TABLE LineaFactura (
  Id VARCHAR(10),
  Cantidad INTEGER NOT NULL,
  Id_Factura VARCHAR(10),
  Id_Platillo VARCHAR(10),
  PRIMARY KEY (Id,Id_Factura),
  CONSTRAINT FOREIGN KEY(Id_Factura) REFERENCES Factura(Id)
  on delete cascade
  on update cascade
);

-- ---
-- Table 'Platillo'
-- 
-- ---

DROP TABLE IF EXISTS Platillo;
CREATE TABLE Platillo(
  Id VARCHAR(10),
  Nombre VARCHAR(50) NOT NULL,
  Precio NUMERIC(10,2) NOT NULL,
  Disponible INTEGER NOT NULL,
  Id_LineaFactura VARCHAR(10),
  PRIMARY KEY (Id),
  CONSTRAINT FOREIGN KEY(Id_LineaFactura) REFERENCES LineaFactura(Id)
  on delete cascade
  on update cascade
);

-- ---
-- Table 'Horario'
-- 
-- ---

DROP TABLE IF EXISTS Horario;
		
CREATE TABLE Horario(
  Id VARCHAR(10),
  Entrada TIME NOT NULL,
  Salida TIME NOT NULL,
  PRIMARY KEY (Id)
);

-- ---
-- Table 'Reservacion_Mesa'
-- 
-- ---

DROP TABLE IF EXISTS Reservacion_Mesa;
CREATE TABLE Reservacion_Mesa(
  Id_Reservacion VARCHAR(10),
  Fecha DATE NOT NULL,
  Hora TIME NOT NULL,
  Id_Mesa VARCHAR(10),
  PRIMARY KEY (Id_Reservacion,Id_Mesa),
  CONSTRAINT FOREIGN KEY(Id_Reservacion) REFERENCES Reservacion(Id)
  on delete cascade
  on update cascade,
  CONSTRAINT FOREIGN KEY(Id_Mesa) REFERENCES Mesa(Id)
  on delete cascade
  on update cascade
);

-- ---
-- Table 'Platillo_Sucursal'
-- 
-- ---

DROP TABLE IF EXISTS Platillo_Sucursal;
CREATE TABLE Platillo_Sucursal (
  Id_Sucursal VARCHAR(10),
  Id_Platillo VARCHAR(10),
  PRIMARY KEY (Id_Sucursal,Id_Platillo),
  CONSTRAINT FOREIGN KEY(Id_Sucursal) REFERENCES Sucursal(Id)
  on delete restrict
  on update cascade,
  CONSTRAINT FOREIGN KEY(Id_Platillo) REFERENCES Platillo(Id)
  on delete cascade
  on update cascade
);

-- ---
-- Table 'Empleado_Horario'
-- 
-- ---

DROP TABLE IF EXISTS Empleado_Horario;
		
CREATE TABLE Empleado_Horario (
  Id_Horario VARCHAR(10),
  Id_Empleado VARCHAR(10),
  PRIMARY KEY (Id_Horario,Id_Empleado),
  CONSTRAINT FOREIGN KEY(Id_Horario) REFERENCES Horario(Id)
  on delete cascade
  on update cascade,
  CONSTRAINT FOREIGN KEY(Id_Empleado) REFERENCES Empleado(Id)
  on delete cascade
  on update cascade
);

ALTER TABLE LineaFactura ADD FOREIGN KEY (Id_Platillo) REFERENCES Platillo (Id);

-- INSERTS

INSERT INTO Sucursal (Id,Nombre,Direccion,Telefono) VALUES ('1111S','Sucursal1','Av. Complutense','987654321'),
('1112S','Sucursal2','Av. Alameda','987654322'),
('1113S','Sucursal3','Av. Arica','987654333'),
('1114S','Sucursal4','Av. Las Flores','987654444');

INSERT INTO Cliente (Id,Nombre,Apellido,Direccion,Telefono) VALUES ('1111C','Mirtha','Alarcon','Av. Aviacion','998877661'),
('1112C','Rodrigo','Mendoza','Urb. Miraflores','987654320'),
('1113C','Luis','Aragon','Urb. Las Malvinas','999777666'),
('1114C','Fabricio','Paredes','Av. Arequipa','959595956');

INSERT INTO Empleado (Id,Nombre,Apellido,Direccion,Telefono,Vale,Jefe,Id_Sucursal) VALUES ('1111E','Maritza','Ramos','Av. Lima','999988883','20','1111E','1111S'),
('1112E','Ana','Ope','Urb. San Malaquias','999988880','15','1112E','1112S'),
('1113E','Marco','Gilardi','Urb. Ortencias','999988881','5','1113E','1113S'),
('1114E','Mauricio','Bengoa','Av. Jauregui','999988882','10','1114E','1114S');

INSERT INTO Factura (Id,Fecha,Descuento,Id_Cliente,Id_Empleado) VALUES ('1111F','2018-03-23','25','1111C','1111E'),
('1112F','2018-06-20','10','1112C','1112E'),
('1113F','2018-05-16','5','1113C','1113E'),
('1114F','2018-06-08','0','1114C','1114E');

INSERT INTO Reservacion (Id,Id_Cliente,Id_Sucursal) VALUES ('1111R','1111C','1111S'),
('1112R','1112C','1112S'),
('1113R','1113C','1113S'),
('1114R','1114C','1114S');

INSERT INTO Mesa (Id,NroMesa) VALUES ('1111M','1'),
('1112M','2'),
('1113M','3'),
('1114M','4');

INSERT INTO Gasto (Id,Recurso,Costo,Id_Sucursal) VALUES ('1111G','Recurso 1',456,'1111S'),
('1112G','Recurso 2',320,'1112S'),
('1113G','Recurso 3',220,'1113S'),
('1114G','Recurso 4',820,'1114S');

INSERT INTO LineaFactura (Id,Id_Factura,Cantidad,Id_Platillo) VALUES ('1111LF','1111F','3',null),
('1112LF','1112F','2',null),
('1113LF','1113F','3',null),
('1114LF','1114F','2',null);

INSERT INTO Platillo (Id,Nombre,Precio,Disponible,Id_LineaFactura) VALUES ('1111P','Costillas BBQ',50,'5','1111LF'),
('1112P','Chuletas de Cerdo',29,'6','1112LF'),
('1113P','Omellete',29,'3','1113LF'),
('1114P','Filete de Pescado Róbalo',49,'5','1114LF');

INSERT INTO Horario (Id, Entrada, Salida) VALUES ('1111H','07:00:00','10:00:00'),
('1112H','10:00:00','13:00:00'),
('1113H','13:00:00','16:00:00'),
('1114H','16:00:00','19:00:00');

INSERT INTO Reservacion_Mesa (Id_Reservacion,Id_Mesa,Fecha,Hora) VALUES ('1111R','1111M','2018-06-03','13:30'),
('1112R','1112M','2018-05-14','12:30'),
('1113R','1113M','2018-06-26','14:00'),
('1114R','1114M','2018-01-15','13:00');

INSERT INTO Platillo_Sucursal (Id_Sucursal,Id_Platillo) VALUES ('1111S','1111P'),
('1112S','1112P'),
('1113S','1113P'),
('1114S','1114P');

INSERT INTO Empleado_Horario (Id_Horario,Id_Empleado) VALUES ('1111H','1111E'),
('1112H','1112E'),
('1113H','1113E'),
('1114H','1114E');










