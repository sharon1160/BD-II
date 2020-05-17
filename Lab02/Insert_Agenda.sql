insert into Personas
values('1234A','Antonio','Arjona','1970-06-10','Avda. Complutense');
insert into Personas
values('1234B','Carlota','Cerezo','1945-05-01','Cantaro');
insert into Personas
values('1234C','Laura','López','1983-03-17','Diamante');
insert into Personas
values('1234D','Pedro','Pérez','1970-06-10','Carbon');

insert into Teléfonos
values(611111111,'Trabajo fijo');
insert into Teléfonos
values(931111111,'Particular móvil');
insert into Teléfonos
values(913333333,'Particular fijo');
insert into Teléfonos
values(644444444,'Trabajo móvil');

insert into Personas_Teléfonos
values('1234A',611111111);
insert into Personas_Teléfonos
values('1234A',931111111);
insert into Personas_Teléfonos
values('1234B',null);
insert into Personas_Teléfonos
values('1234C',913333333);
insert into Personas_Teléfonos
values('1234D',913333333);
insert into Personas_Teléfonos
values('1234D',644444444);

insert into Correos
values( 'a@hotmail.com','Particular','1234A');
insert into Correos
values( 'a@gmail.com','Trabajo','1234A');
insert into Correos
values( 'c@hotmail.com','Particular','1234B');
insert into Correos
values( 'l@gmail.com','Trabajo','1234C');


