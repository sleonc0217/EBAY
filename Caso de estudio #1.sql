


--------PUNTO 4 (DBA)------------------------
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER EBAY IDENTIFIED BY ebay;
SELECT default_tablespace,temporary_tablespace, created FROM dba_users WHERE username= 'EBAY';



--------PUNTO 5 (DBA)------------------------

	
CREATE TABLESPACE TS_EBAY
DATAFILE 'C:\USERS\SEBAS\DOCUMENTS\ORADATA\ORCL\TS_EBAY.DBF'
SIZE 400M
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;
ALTER USER EBAY DEFAULT TABLESPACE TS_EBAY;



SELECT
    df.file#,
    df.ts#,
    df.name,
    ts.ts#,
    ts.name
FROM
    v$datafile     df,
    v$tablespace   ts
WHERE
    ts.con_id = 1
    AND df.ts# = ts.ts#
    AND df.con_id = ts.con_id;


---------------------------------CREACION DE LAS ESTRUCTURAS (EBAY)--------
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY,
    nombre varchar2 (20),
    apellidos varchar2 (30),
    email varchar2 (50),
    direccion varchar2 (200)
);
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    categoria VARCHAR2 (30)
);
CREATE TABLE producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR2 (50),
    descripcion VARCHAR2 (100),
    precio_salida DECIMAL (10,3),
    fecha_limite DATE,
    estado VARCHAR2 (10),
    CONSTRAINT estado_producto
    CHECK (estado IN ('nuevo','usado')),
    id_categoria INT,
    id_usuario INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);
CREATE TABLE puja(
    id_puja INT PRIMARY KEY,
    precio_ofrecido DECIMAL (8,3),
    momento TIMESTAMP,
    postor VARCHAR2 (50),
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
);



CREATE TABLE sub_categoria(
    id_sub_categoria INT PRIMARY KEY,
    sub_categoria varchar2 (30),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

--------------------------insertamos datos--------------------------

INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('1','Fernando','Mora Salvador','fernanado@test.com','San Jose, Curridabat');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('2','Sofia','Mora Castillo','sofia@test.com','San Jose, San Pedro');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('3','Andres','Perez Salvador','andres@test.com','San Jose, San Jose');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('4','Marco','Miranda Barquero','marco@test.com','Cartago, La Union');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('5','Maria','Villa Wong','maria@test.com','San Jose, Desamparados');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('6','Raul','Mora Leandro','raul@test.com','San Jose, Desamparados');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('7','Pablo','Quesada Sancho','pablo@test.com','San Jose, Moravia');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('8','Carlos','Escalante Sandro','carlos@test.com','San Jose, Tibas');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('9','Felipe','Tenorio Loza','felipe@test.com','San Jose, Curridabat');
INSERT INTO usuario (id_usuario, nombre, apellidos, email, direccion) 
VALUES ('10','Sebastian','Leon Castro','sebastian@test.com','San Jose, Curridabat');

INSERT INTO categoria (id_categoria, categoria) 
VALUES ('1','Libros');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('2','Autos');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('3','Tecnologia');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('4','Ropa');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('5','Accesorios');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('6','Motocicletas');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('7','Juguetes');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('8','Zapatos');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('9','Herramientas');
INSERT INTO categoria (id_categoria, categoria) 
VALUES ('10','Mascotas');

INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('1','Terror','1');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('2','Hyndai','2');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('3','Celulares','3');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('4','Camisas','4');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('5','Billeteras','5');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('6','Harley','6');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('7','Bolas','7');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('8','Deportivas','8');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('9','Martillos','9');
INSERT INTO sub_categoria (id_sub_categoria, sub_categoria, id_categoria) 
VALUES ('10','Perros','10');

INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('1','9000','25-08-2022 01:00:00','Enrique Sancho', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('2','9500','25-08-2022 02:00:00', 'Antony Lois', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('3','9600','25-08-2022 03:00:00', 'Fabricio Alvarado', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('4','9800','25-08-2022 04:00:00', 'Enrique Perez', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('5','9890','25-08-2022 05:00:00', 'Fernando Villa', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('6','10000','25-08-2022 06:00:00', 'Enrique Hidalgo', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('7','1100','25-08-2022 07:00:00', 'Sofia Mena', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('8','1150','25-08-2022 08:00:00', 'Marta Diaz', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('9','15000','25-08-2022 09:00:00', 'Luis Barquero', '1');
INSERT INTO puja (id_puja, precio_ofrecido, momento, postor, id_producto) 
VALUES ('10','15500','25-08-2022 10:00:00', 'Owen Tencio', '1');


INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('1','Camisa Lacost','color gris talla L', '9000', '12/10/2022', 'nuevo', '4','4');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('2','IT','libro de IT', '20000', '12/10/2022', 'nuevo', '1','1');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('3','Bola Brasil','Bola de mundial', '10000', '12/10/2022', 'usado', '7','7');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('4','Beagle','Beagle de 2 meses', '500000', '12/10/2022', 'nuevo', '10','10');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('5','Tacos Nike','color verde talla 42', '30000', '12/10/2022', 'nuevo', '8','8');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('6','Martillo CAT','color amarillo', '15000', '12/10/2022', 'nuevo', '9','9');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('7','Huawei Nova 9','color negro', '100000', '12/10/2022', 'usado', '3','3');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('8','Iphone 14','color gris', '200000', '12/10/2022', 'usado', '3','3');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('9','Iphone 13','color gris', '170000', '12/10/2022', 'usado', '3','3');
INSERT INTO producto (id_producto, nombre, descripcion, precio_salida, fecha_limite, estado, id_categoria, id_usuario) 
VALUES ('10','Iphone 13','color gris', '160000', '12/10/2022', 'usado', '3','3');

SELECT * FROM DBA_TABLES
WHERE OWNER = 'EBAY'

