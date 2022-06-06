drop table empleado cascade constraints;
drop table coche cascade constraints;
drop table coche_madrid cascade constraints;
drop table coche_barcelona cascade constraints;
drop table cliente cascade constraints;
drop table vende cascade constraints;
drop table tipos_forma_pago cascade constraints;
drop table marcas_coche cascade constraints;
drop table tipos_puesto cascade constraints;

create table empleado(
dni varchar2(9),
nombre varchar2(60),
id_puesto number(3),
telef varchar2(12),
anio_incorporacion number(4),
constraint pk_empleado primary key (dni));

create table coche(
matricula varchar2(7),
descripcion varchar2(60),
id_marca number(3),
precio_compra number(6),
constraint pk_coche primary key (matricula));

CREATE TABLE COCHE_BARCELONA 
(
  MATRICULA VARCHAR2(7), 
  DESCRIPCION VARCHAR2(60),
  ID_MARCA NUMBER(3), 
  PRECIO_COMPRA NUMBER(6),
  constraint pk_coche_bar primary key (matricula));

CREATE TABLE COCHE_MADRID 
(
  MATRICULA VARCHAR2(7), 
  DESCRIPCION VARCHAR2(60),
  ID_MARCA NUMBER(3), 
  PRECIO_COMPRA NUMBER(6),
  constraint pk_coche_mad primary key (matricula));

create table cliente(
dni varchar2(9),
nombre varchar2(60),
telef varchar2(12),
constraint pk_cliente primary key (dni));


create table vende (
dni_empleado varchar2(9),
dni_cliente varchar2(9),
matricula varchar2(7),
fecha date,
id_forma_pago number(3),
precio number(6),
constraint pk_vende primary key (dni_cliente,matricula),
constraint fk_vende_empleado foreign key (dni_empleado) references empleado,
constraint fk_vende_cliente foreign key (dni_cliente) references cliente,
constraint fk_vende_coche foreign key (matricula) references coche
);


create table tipos_forma_pago(
id_forma_pago number(3),
forma_pago varchar2(20),
constraint pk_forma_pago primary key (id_forma_pago));

create table marcas_coche(
id_marca number(3),
marca varchar2(30),
constraint pk_marcas_coche primary key (id_marca));

create table tipos_puesto(
id_puesto number(3),
puesto varchar2(30),
constraint pk_tipos_puesto primary key (id_puesto));

alter table empleado add constraint fk_empleado_tipos_puesto foreign key (id_puesto) references tipos_puesto;
alter table vende add constraint fk_venta_tipos_forma_pago foreign key (id_forma_pago) references tipos_forma_pago;
alter table coche add constraint fk_coche_marcas_coche foreign key (id_marca) references marcas_coche;
alter table coche_madrid add constraint fk_cochem_marcas_coche foreign key (id_marca) references marcas_coche;
alter table coche_barcelona add constraint fk_cocheb_marcas_coche foreign key (id_marca) references marcas_coche;

Insert into TIPOS_PUESTO (ID_PUESTO,PUESTO) values (1,'Vendedor particulares');
Insert into TIPOS_PUESTO (ID_PUESTO,PUESTO) values (2,'Coordinador ventas');
Insert into TIPOS_PUESTO (ID_PUESTO,PUESTO) values (3,'Recepcionista');
Insert into TIPOS_PUESTO (ID_PUESTO,PUESTO) values (4,'Mecánico');
Insert into TIPOS_PUESTO (ID_PUESTO,PUESTO) values (5,'Vendedor empresas');


Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (1,'Renault');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (2,'Ford');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (3,'Citroen');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (4,'Audi');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (5,'Mercedes');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (6,'Kia');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (7,'Volkswagen');
Insert into MARCAS_COCHE (ID_MARCA,MARCA) values (8,'Opel');


Insert into TIPOS_FORMA_PAGO (ID_FORMA_PAGO,FORMA_PAGO) values (1,'Contado');
Insert into TIPOS_FORMA_PAGO (ID_FORMA_PAGO,FORMA_PAGO) values (2,'Tarjeta');
Insert into TIPOS_FORMA_PAGO (ID_FORMA_PAGO,FORMA_PAGO) values (3,'Talón');
Insert into TIPOS_FORMA_PAGO (ID_FORMA_PAGO,FORMA_PAGO) values (4,'Transferencia');
Insert into TIPOS_FORMA_PAGO (ID_FORMA_PAGO,FORMA_PAGO) values (5,'Financiado');


Insert into EMPLEADO (DNI,NOMBRE,ID_PUESTO,TELEF, ANIO_INCORPORACION) values ('05678245B','García Gómez, Andrés',3,'694532211', 2000);
Insert into EMPLEADO (DNI,NOMBRE,ID_PUESTO,TELEF, ANIO_INCORPORACION) values ('90774536C','Pérez Pérez, Luisa',1,'676885643', 2016);
Insert into EMPLEADO (DNI,NOMBRE,ID_PUESTO,TELEF, ANIO_INCORPORACION) values ('45327865A','Gómez Rubio, Ana',5,'654772134', 2014);
Insert into EMPLEADO (DNI,NOMBRE,ID_PUESTO,TELEF, ANIO_INCORPORACION) values ('05789494D','Martínez Alberca, José',4,null, 2002);


Insert into CLIENTE (DNI,NOMBRE,TELEF) values ('07541212F','Fernández Arco, Cristina','926227345');
Insert into CLIENTE (DNI,NOMBRE,TELEF) values ('05478218A','Gracia Soler, Luis Alberto','676443789');
Insert into CLIENTE (DNI,NOMBRE,TELEF) values ('04787675D','Ruiz Morales, Fernando','654332211');


Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('3345GVF','A5 modelo alta gama',4, 6000);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('3346GVA','C4 Exclusive',3, NULL);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('4446GCN','C4 Gran Picasso',3, NULL);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('3287GVA','Zafira Año 2015',8, 3000);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('1290ASX','Kouga',2, NULL);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('5487NDA','DS C4',3, NULL);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('8666KKK','Kangoo',3, 9000);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('5689ADD','Golf GTI',7, 3000);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('7894AAA','A4 básico',4, 3000);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('1212BAD','Astra Año 2014',8, NULL);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('4569GVA','C4 Exclusive',3, 5000);
Insert into COCHE (MATRICULA,DESCRIPCION,ID_MARCA, PRECIO_COMPRA) values ('9876AFF','C4 Exclusive',3, 5000);


Insert into VENDE (DNI_EMPLEADO,DNI_CLIENTE,MATRICULA,FECHA,ID_FORMA_PAGO, PRECIO) values ('90774536C','07541212F','3345GVF',to_date('19/03/18','DD/MM/RR'),1, 7000);
Insert into VENDE (DNI_EMPLEADO,DNI_CLIENTE,MATRICULA,FECHA,ID_FORMA_PAGO, PRECIO) values ('90774536C','07541212F','7894AAA',to_date('09/03/16','DD/MM/RR'),5, 12000);
Insert into VENDE (DNI_EMPLEADO,DNI_CLIENTE,MATRICULA,FECHA,ID_FORMA_PAGO, PRECIO) values ('45327865A','04787675D','1290ASX',to_date('06/02/18','DD/MM/RR'),5, 9000);
Insert into VENDE (DNI_EMPLEADO,DNI_CLIENTE,MATRICULA,FECHA,ID_FORMA_PAGO, PRECIO) values ('45327865A','04787675D','8666KKK',to_date('12/12/17','DD/MM/RR'),3, 16000);


Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('3345GVF','A5 modelo alta gama','4','6000');
Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('3287GVA','Zafira Año 2015','8','3000');
Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('8666KKK','Kangoo','3','9000');
Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('5689ADD','Golf GTI','7','3000');
Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('7894AAA','A4 básico','4','3000');
Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('4569GVA','C4 Exclusive','3','5000');
Insert into COCHE_BARCELONA (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('9876AFF','C4 Exclusive','3','5000');

Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('3346GVA','C4 Exclusive','3',null);
Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('4446GCN','C4 Gran Picasso','3',null);
Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('1290ASX','Kouga','2',null);
Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('5487NDA','DS C4','3',null);
Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('1212BAD','Astra Año 2014','8',null);
Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('4569GVA','C4 Exclusive','3','5000');
Insert into COCHE_MADRID (MATRICULA,DESCRIPCION,ID_MARCA,PRECIO_COMPRA) values ('9876AFF','C4 Exclusive','3','5000');

commit;