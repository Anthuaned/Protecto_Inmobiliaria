
-- Schema BDInmobiliaria
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Table TIPO-USUARIO
-- -----------------------------------------------------
CREATE TABLE TIPOUSUARIO (
  idTIPOUSUARIO SERIAL NOT NULL PRIMARY KEY,
  nombrecargo VARCHAR(45) NOT NULL)
;



-- -----------------------------------------------------
-- Table USUARIO
-- -----------------------------------------------------
CREATE TABLE USUARIO (
  idUSUARIO SERIAL NOT NULL PRIMARY KEY,
  nombreusuario VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  telefono VARCHAR(14) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  pregunta VARCHAR(45) NOT NULL,
  respuesta VARCHAR(45) NOT NULL,
  contraseña VARCHAR(45) NOT NULL,
  estado BOOLEAN NOT NULL,
  TIPOUSUARIO_idTIPOUSUARIO INT NOT NULL REFERENCES TIPOUSUARIO)
;


-- -----------------------------------------------------
-- Table CLIENTE
-- -----------------------------------------------------
CREATE TABLE CLIENTE (
  idCLIENTE SERIAL NOT NULL PRIMARY KEY,
  dni_ruc VARCHAR(8) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  telefono VARCHAR(14) NOT NULL,
  estado BOOLEAN NOT NULL)
;


-- -----------------------------------------------------
-- Table USUARIO-CLIENTE
-- -----------------------------------------------------
CREATE TABLE USUARIOCLIENTE (
  idUSUARIOCLIENTE SERIAL NOT NULL PRIMARY KEY,
  fecha DATE NULL,
  USUARIO_idUSUARIO INT NOT NULL REFERENCES USUARIO,
  CLIENTE_idCLIENTE INT NOT NULL REFERENCES CLIENTE)
;


-- -----------------------------------------------------
-- Table PAIS
-- -----------------------------------------------------
CREATE TABLE PAIS (
  idPAIS SERIAL NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NULL)
;


-- -----------------------------------------------------
-- Table DEPARTAMENTO
-- -----------------------------------------------------
CREATE TABLE DEPARTAMENTO (
  idDEPARTAMENTO SERIAL NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NULL,
  PAIS_idPAIS INT NOT NULL REFERENCES PAIS)
;


-- -----------------------------------------------------
-- Table PROVINCIA
-- -----------------------------------------------------
CREATE TABLE PROVINCIA (
  idPROVINCIA SERIAL NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  DEPARTAMENTO_idDEPARTAMENTO INT NOT NULL REFERENCES DEPARTAMENTO)
;


-- -----------------------------------------------------
-- Table DISTRITO
-- -----------------------------------------------------
CREATE TABLE DISTRITO (
  idDISTRITO SERIAL NOT NULL   PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  PROVINCIA_idPROVINCIA INT NOT NULL REFERENCES PROVINCIA)
;


-- -----------------------------------------------------
-- Table TIPO
-- -----------------------------------------------------
CREATE TABLE TIPO (
  idTIPO SERIAL NOT NULL PRIMARY KEY ,
  nombre VARCHAR(45) NULL)
;


-- -----------------------------------------------------
-- Table TIPO-SERVICIO
-- -----------------------------------------------------
CREATE TABLE TIPOSERVICIO (
  idTIPOSERVICIO SERIAL NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table PROPIEDAD
-- -----------------------------------------------------
CREATE TABLE PROPIEDAD (
  idPROPIEDAD SERIAL NOT NULL PRIMARY KEY,
  area FLOAT NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  estado BOOLEAN NOT NULL,
  TIPO_idTIPO INT NOT NULL REFERENCES TIPO,
  DISTRITO_idDISTRITO INT NOT NULL REFERENCES DISTRITO)
;


-- -----------------------------------------------------
-- Table SERVICIO
-- -----------------------------------------------------
CREATE TABLE SERVICIO (
  idSERVICE SERIAL NOT NULL PRIMARY KEY,
  fecha DATE NOT NULL,
  total DECIMAL(8,2) NOT NULL,
  igv DECIMAL(8,2) NOT NULL,
  subtotal DECIMAL(8,2) NOT NULL,
  CLIENTE_idCLIENTE INT NOT NULL REFERENCES CLIENTE,
  TIPOSERVICIO_idTIPOSERVICIO INT NOT NULL REFERENCES TIPOSERVICIO,
  PROPIEDAD_idPROPIEDAD INT NOT NULL REFERENCES PROPIEDAD)
;


-- -----------------------------------------------------
-- Table TIPO-PAGO
-- -----------------------------------------------------
CREATE TABLE TIPOPAGO (
  idTIPOPAGO SERIAL NOT NULL PRIMARY KEY,
  descripcion VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table PAGO
-- -----------------------------------------------------
CREATE TABLE PAGO (
  idPAY SERIAL NOT NULL PRIMARY KEY ,
  numero INT NOT NULL,
  monto_total DECIMAL(8,2) NOT NULL,
  TIPOPAGO_idTIPOPAGO INT NOT NULL REFERENCES TIPOPAGO,
  SERVICIO_idSERVICIO INT NOT NULL REFERENCES SERVICIO)
;


-- -----------------------------------------------------
-- Table TIPO-PROVEEDOR
-- -----------------------------------------------------
CREATE TABLE TIPOPROVEEDOR (
  idTIPOPROVEEDOR SERIAL PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL)
;


-- -----------------------------------------------------
-- Table PROVEEDOR
-- -----------------------------------------------------
CREATE TABLE PROVEEDOR (
  idPROVEEDOR SERIAL PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  TIPOPROVEEDOR_idTIPOPROVEEDOR INT NOT NULL REFERENCES TIPOPROVEEDOR)
;


-- -----------------------------------------------------
-- Table COMPRA
-- -----------------------------------------------------
CREATE TABLE COMPRA (
  idSHOP SERIAL NOT NULL PRIMARY KEY,
  fecha DATE NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  PROVEEDOR_idPROVEEDOR INT NOT NULL REFERENCES PROVEEDOR,
  PROPIEDAD_idPROPIEDAD INT NOT NULL REFERENCES PROPIEDAD)
;


-- -----------------------------------------------------
-- Table CUOTA
-- -----------------------------------------------------
CREATE TABLE CUOTA (
  idCUOTA SERIAL NOT NULL PRIMARY KEY,
  numero VARCHAR(45) NOT NULL,
  fecha_programada DATE NOT NULL,
  fecha_pago DATE NOT NULL,
  mora VARCHAR(45) NOT NULL,
  monto VARCHAR(45) NULL,
  PAGO_idPAGO INT NOT NULL REFERENCES PAGO)
;


-- -----------------------------------------------------
-- Inserts
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Insert TIPO-USUARIO
-- -----------------------------------------------------
INSERT INTO public.TIPOUSUARIO(idTIPOUSUARIO, nombrecargo)
VALUES (1, 'vendedor');
INSERT INTO public.TIPOUSUARIO(idTIPOUSUARIO, nombrecargo)
VALUES (2, 'administrador');



-- -----------------------------------------------------
-- Insert USUARIO
-- -----------------------------------------------------
INSERT INTO public.usuario(idusuario, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, contraseña, estado, tipousuario_idtipousuario)
VALUES (1, 'user01', 'Jose', 'Perez Ruiz', 'josep@gmail.com', '986452011', 'Ayacucho 1087', '05-02-1987', '¿Cual es tu edad?', '33', 'Vendedor01', true, 1);

INSERT INTO public.usuario(idusuario, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, "contraseña", estado, tipousuario_idtipousuario)
VALUES (2, 'user02','Luis', 'Bravo Perez', 'luisb@gmail.com', '986532177', 'Mexico 1087', '06-03-1988', '¿Cual es el nombre de tu perro?', 'copito', 'Vendedor02', true, 1);		

INSERT INTO public.usuario(idusuario, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, "contraseña", estado, tipousuario_idtipousuario)
VALUES (3, 'user03','Rosa', 'Montalvan Chiclayo', 'rosam@gmail.com', '978526588', 'Uruguay 8987', '06-03-1988', '¿Color favorito?', 'negro', 'Vendedor03', true, 1);
			
INSERT INTO public.usuario(idusuario, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, "contraseña", estado, tipousuario_idtipousuario)
VALUES (4, 'user04','Karina', 'Mendoza Cuba', 'karinam@gmail.com', '948530144', 'Latina 8879', '16-12-1970', '¿Nombre de la madre?', 'Maria', 'Admin01', false, 2);
			
INSERT INTO public.usuario(idusuario, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, "contraseña", estado, tipousuario_idtipousuario)
VALUES (5, 'user05','Alonso', 'Muro Montalvan', 'alonsom@gmail.com', '936584122', 'Balta 5462', '12-05-1978', '¿Nombre del padre?', 'Segundo', 'Admin02', false, 2);

INSERT INTO public.Usuario(idUSUARIO, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, contraseña, estado, TIPOUSUARIO_idTIPOUSUARIO) 
VALUES (6, 'user06', 'Fernando', 'Luján', 'ferlujan_80@gmail.com', '905253937', 'Manzana 2 Las delicias', '09-05-1980', '¿Cual fue el nombre de tu primera mascota?', 'boby', 'vendedor04', true, 1);

INSERT INTO public.Usuario(idUSUARIO, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, contraseña, estado, TIPOUSUARIO_idTIPOUSUARIO)
VALUES (7, 'user07', 'Camilo', 'Quevedo', 'cquevedo_70@gmail.com', '915253937', 'Lote 4 Los Portales', '19-02-1970', '¿Cual fue su primer trabajo', 'Asistente en ventas', 'admin03', false, 2);

INSERT INTO public.Usuario(idUSUARIO, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, contraseña, estado, TIPOUSUARIO_idTIPOUSUARIO)
VALUES (8, 'user08', 'Julia', 'Taylor', 'jtaylor@gmail.com', '925253937', 'Manzana 7 Las delicias', '29-07-1983', '¿Donde estudió la primaria?', 'Santa Maria Reina', 'admin04', true, 2);

INSERT INTO public.Usuario(idUSUARIO, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, contraseña, estado, TIPOUSUARIO_idTIPOUSUARIO)
VALUES (9, 'user09', 'Enrique', 'Villalobos', 'Enriquev-04-85@gmail.com', '935253937', 'Calle Bagua 172 Satelite', '04-03-1985', '¿Donde estudió la secundaria?', 'San José', 'vendedor05', true, 1);

INSERT INTO public.Usuario(idUSUARIO, nombreusuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, pregunta, respuesta, contraseña, estado, TIPOUSUARIO_idTIPOUSUARIO)
VALUES (10, 'user10', 'José', 'Castañeda', 'jcastañeda@gmail.com', '945253937', 'Calle Progresor Urb Los Mochicas', '10-07-1975', '¿En que universidad estudió?', 'Universidad Tecnologica del Perú', 'vendedor06', true, 1);



-- -----------------------------------------------------
-- Insert CLIENTE
-- -----------------------------------------------------
INSERT INTO public.cliente(idcliente, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (1, '73059470', 'Maria', 'Diaz Torres', 'mariad@gmail.com', '978564122', true);
	
INSERT INTO public.cliente(idcliente, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (2, '42993333', 'Gabriela', 'Lopez Sanchez', 'gabrielal@gmail.com', '963258744', true);
			
INSERT INTO public.cliente(idcliente, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (3, '16757712', 'Rocio', 'Martinez Perez', 'rociom@gmail.com', '978451244', true);

INSERT INTO public.cliente(idcliente, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (4, '51497863', 'Pedro', 'Bravo Vega', 'pedrob@gmail.com', '982457488', false);
			
INSERT INTO public.cliente(idcliente, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (5, '21847946', 'Fabricio', 'Lopez Segundo', 'fabriciol@gmail.com', '936451200', false);

INSERT INTO public.cliente (idCLIENTE, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (6, '95761285', 'Arturo', 'López', 'arturlopez@gmail.com', '925247937', true);

INSERT INTO public.cliente(idCLIENTE, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (7, '92761285', 'Felipe', 'Hernández', 'fhernandez@gmail.com', '925283937', true);

INSERT INTO public.cliente (idCLIENTE, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (8, '95751285', 'Esteban', 'Valdez', 'EstebanVal_19@gmail.com', '926543937', false);

INSERT INTO public.cliente(idCLIENTE, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (9, '95761485', 'Sergio', 'Azalde', 'serazalde@gmail.com', '925248737', false);
 
INSERT INTO public.cliente(idCLIENTE, dni_ruc, nombre, apellido, correo, telefono, estado)
VALUES (10, '10603645', 'Carlos', 'Rodriguez', 'crodriguez@gmail.com', '925789937', false);



-- -----------------------------------------------------
-- Insert USUARIO-CLIENTE
-- -----------------------------------------------------
INSERT INTO public.usuariocliente(idusuariocliente, fecha, usuario_idusuario, cliente_idcliente)
VALUES (1, '2020-03-01', 1, 1);

INSERT INTO public.usuariocliente(idusuariocliente, fecha, usuario_idusuario, cliente_idcliente)
VALUES (2, '2020-02-01', 2, 2);

INSERT INTO public.usuariocliente(idusuariocliente, fecha, usuario_idusuario, cliente_idcliente)
VALUES (3, '2020-03-08', 3, 3);

INSERT INTO public.usuariocliente(idusuariocliente, fecha, usuario_idusuario, cliente_idcliente)
VALUES (4, '2020-03-21', 4, 4);

INSERT INTO public.usuariocliente(idusuariocliente, fecha, usuario_idusuario, cliente_idcliente)
VALUES (5, '2020-03-11', 5, 5);

INSERT INTO public.USUARIOCLIENTE (idUSUARIOCLIENTE, fecha, USUARIO_idUSUARIO, CLIENTE_idCLIENTE)
VALUES (6, '28-03-2019',6 ,6);

INSERT INTO public.USUARIOCLIENTE (idUSUARIOCLIENTE, fecha, USUARIO_idUSUARIO, CLIENTE_idCLIENTE)
VALUES (7, '12-06-2019',8 ,7);

INSERT INTO public.USUARIOCLIENTE (idUSUARIOCLIENTE, fecha, USUARIO_idUSUARIO, CLIENTE_idCLIENTE)
VALUES (8, '08-09-2019',8 ,8);

INSERT INTO public.USUARIOCLIENTE (idUSUARIOCLIENTE, fecha, USUARIO_idUSUARIO, CLIENTE_idCLIENTE)
VALUES (9, '02-03-2020',9 ,8);

INSERT INTO public.USUARIOCLIENTE (idUSUARIOCLIENTE, fecha, USUARIO_idUSUARIO, CLIENTE_idCLIENTE)
VALUES (10, '15-04-2020',10 ,10);



-- -----------------------------------------------------
-- Insert PAIS
-- -----------------------------------------------------
INSERT INTO public.pais(idpais, nombre)
VALUES (1, 'Perú'),(2, 'Mexico'),(3, 'España'),(4, 'Brasil'),(5, 'Chile');



-- -----------------------------------------------------
-- Insert DEPARTAMENTO
-- -----------------------------------------------------
INSERT INTO public.departamento(iddepartamento, nombre, pais_idpais)
VALUES (1, 'Lambayeque', 1),(2, 'Arequipa', 1),(3, 'La Libertad', 1),(4, 'Ica', 1),(5, 'Cajamarca', 1);



-- -----------------------------------------------------
-- Insert PROVINCIA
-- -----------------------------------------------------
INSERT INTO public.provincia(idprovincia, nombre, departamento_iddepartamento)
VALUES (1, 'Lambayeque', 1),(2, 'Arequipa', 2),(3, 'La Libertad', 3),(4, 'Ica', 4),(5, 'Cajamarca', 5);



-- -----------------------------------------------------
-- Insert DISTRITO
-- -----------------------------------------------------
INSERT INTO public.distrito(iddistrito, nombre, provincia_idprovincia)
VALUES (1, 'Lambayeque', 1),(2, 'Arequipa', 2),(3, 'La Libertad', 3),(4, 'Ica', 4),(5, 'Cajamarca', 5);



-- -----------------------------------------------------
-- Insert TIPO
-- -----------------------------------------------------
INSERT INTO public.tipo(idtipo, nombre)
VALUES (1, 'Casa'),(2, 'Departamento'),(3, 'Terreno');



-- -----------------------------------------------------
-- Insert TIPO-SERVICIO
-- -----------------------------------------------------
INSERT INTO public.tiposervicio(idtiposervicio, nombre)
VALUES (1, 'Venta'),(2, 'Alquiler');




-- -----------------------------------------------------
-- Insert PROPIEDAD
-- -----------------------------------------------------
INSERT INTO public.propiedad(idpropiedad, area, precio, direccion,estado, tipo_idtipo, distrito_iddistrito)
VALUES (1, '214', '218085', 'El Palacio',true, 1, 2);

INSERT INTO public.propiedad(idpropiedad, area, precio, direccion,estado, tipo_idtipo, distrito_iddistrito)
VALUES (2, '150.50', '160000', 'Urbanización Antonia Moreno de Caceres',true,  1, 1);

INSERT INTO public.propiedad(idpropiedad, area, precio, direccion,estado, tipo_idtipo, distrito_iddistrito)
VALUES (3, '211', '198985', 'Panamericana Sur', true, 1, 3);

INSERT INTO public.propiedad(idpropiedad, area, precio, direccion,estado, tipo_idtipo, distrito_iddistrito)
VALUES (4, '60', '125000', 'San Borja',true,  2, 4);

INSERT INTO public.propiedad(idpropiedad, area, precio, direccion,estado, tipo_idtipo, distrito_iddistrito)
VALUES (5, '120', '120000', 'Cruce Prolongacion Bolognesi',true,  3, 5);

INSERT INTO PROPIEDAD(idPROPIEDAD, area, precio, direccion,estado,TIPO_idTIPO, DISTRITO_idDISTRITO)
VALUES (6, '245.80', '70000', 'Mexico y Balta 230',true, 1, 5);

INSERT INTO PROPIEDAD(idPROPIEDAD, area, precio, direccion,estado,TIPO_idTIPO, DISTRITO_idDISTRITO)
VALUES (7, '350.35', '76000', 'Grau 101',false, 1, 4);

INSERT INTO PROPIEDAD(idPROPIEDAD, area, precio, direccion,estado,TIPO_idTIPO, DISTRITO_idDISTRITO)
VALUES (8, '500.90', '85000', 'Argentina 113',false, 2, 2);

INSERT INTO PROPIEDAD(idPROPIEDAD, area, precio, direccion,estado,TIPO_idTIPO, DISTRITO_idDISTRITO)
VALUES (9, '890.50', '120000', 'La Primavera',true,3 , 1);

INSERT INTO PROPIEDAD(idPROPIEDAD, area, precio, direccion,estado,TIPO_idTIPO, DISTRITO_idDISTRITO)
VALUES (10, '750.80', '96000', 'Victoria 175',true, 3, 3);



-- -----------------------------------------------------
-- Insert SERVICIO
-- -----------------------------------------------------
INSERT INTO public.servicio(idservice, fecha, total, igv, subtotal, cliente_idcliente, tiposervicio_idtiposervicio, propiedad_idpropiedad)
VALUES (1, '2020-03-02', '219999', '39599.82', '180399.18', 1, 1, 1);

INSERT INTO public.servicio(idservice, fecha, total, igv, subtotal, cliente_idcliente, tiposervicio_idtiposervicio, propiedad_idpropiedad)
VALUES (2, '2020-03-01', '170000', '30600', '139400', 2, 1, 2);

INSERT INTO public.servicio(idservice, fecha, total, igv, subtotal, cliente_idcliente, tiposervicio_idtiposervicio, propiedad_idpropiedad)
VALUES (3, '2020-03-09', '198985', '35817.3', '163167.7', 3, 1, 3);

INSERT INTO public.servicio(idservice, fecha, total, igv, subtotal, cliente_idcliente, tiposervicio_idtiposervicio, propiedad_idpropiedad)
VALUES (4, '2020-03-22', '180000', '32400', '147600', 4, 1, 4);

INSERT INTO public.servicio(idservice, fecha, total, igv, subtotal, cliente_idcliente, tiposervicio_idtiposervicio, propiedad_idpropiedad)
VALUES (5, '2020-03-12', '130000', '23400', '106600', 5, 1, 5);

INSERT INTO SERVICIO(idSERVICE, fecha, total, igv, subtotal, CLIENTE_idCLIENTE, TIPOSERVICIO_idTIPOSERVICIO, PROPIEDAD_idPROPIEDAD)
VALUES (6, '28-03-2019', '70000', '12600', '57400', 6, 1, 6);

INSERT INTO SERVICIO(idSERVICE, fecha, total, igv, subtotal, CLIENTE_idCLIENTE, TIPOSERVICIO_idTIPOSERVICIO, PROPIEDAD_idPROPIEDAD)
VALUES (7, '12-06-2019', '76000', '13680', '62320', 7, 1, 7);

INSERT INTO SERVICIO(idSERVICE, fecha, total, igv, subtotal, CLIENTE_idCLIENTE, TIPOSERVICIO_idTIPOSERVICIO, PROPIEDAD_idPROPIEDAD)
VALUES (8, '08-09-2019', '85000', '15300', '69700', 8, 2, 8);

INSERT INTO SERVICIO(idSERVICE, fecha, total, igv, subtotal, CLIENTE_idCLIENTE, TIPOSERVICIO_idTIPOSERVICIO, PROPIEDAD_idPROPIEDAD)
VALUES (9, '02-03-2020', '120000', '21600', '98400', 8, 1, 9);

INSERT INTO SERVICIO(idSERVICE, fecha, total, igv, subtotal, CLIENTE_idCLIENTE, TIPOSERVICIO_idTIPOSERVICIO, PROPIEDAD_idPROPIEDAD)
VALUES (10, '15-04-2020', '96000', '17280', '78720', 10, 1, 10);




-- -----------------------------------------------------
-- Insert TIPO-PAGO
-- -----------------------------------------------------
INSERT INTO TIPOPAGO(idTIPOPAGO, descripcion)
VALUES (1, 'Tarjeta de crédito');

INSERT INTO TIPOPAGO(idTIPOPAGO, descripcion)
VALUES (2, 'Tarjeta de débito');

INSERT INTO TIPOPAGO(idTIPOPAGO, descripcion)
VALUES (3, 'Al contado');



-- -----------------------------------------------------
-- Insert PAGO
-- -----------------------------------------------------
INSERT INTO public.pago(idpay, numero, monto_total, tipopago_idtipopago, servicio_idservicio)
VALUES (1, 5, '219999', 1, 1);

INSERT INTO public.pago(idpay, numero, monto_total, tipopago_idtipopago, servicio_idservicio)
VALUES (2, 5, '170000', 1, 1);

INSERT INTO public.pago(idpay, numero, monto_total, tipopago_idtipopago, servicio_idservicio)
VALUES (3, 6, '198985', 2, 1);

INSERT INTO public.pago(idpay, numero, monto_total, tipopago_idtipopago, servicio_idservicio)
VALUES (4, 1, '180000', 1, 3);

INSERT INTO public.pago(idpay, numero, monto_total, tipopago_idtipopago, servicio_idservicio)
VALUES (5, 2, '130000', 3, 3);

INSERT INTO PAGO(idPAY, numero, monto_total, TIPOPAGO_idTIPOPAGO, SERVICIO_idSERVICIO)
VALUES (6, 12, '70000', 3, 6);

INSERT INTO PAGO(idPAY, numero, monto_total, TIPOPAGO_idTIPOPAGO, SERVICIO_idSERVICIO)
VALUES (7, 10, '76000', 2, 7);

INSERT INTO PAGO(idPAY, numero, monto_total, TIPOPAGO_idTIPOPAGO, SERVICIO_idSERVICIO) 
VALUES (8, 14, '85000', 2, 8);

INSERT INTO PAGO(idPAY, numero, monto_total, TIPOPAGO_idTIPOPAGO, SERVICIO_idSERVICIO) 
VALUES (9, 24, '120000', 1, 9);

INSERT INTO PAGO(idPAY, numero, monto_total, TIPOPAGO_idTIPOPAGO, SERVICIO_idSERVICIO) 
VALUES (10, 18, '96000', 3, 10);



-- -----------------------------------------------------
-- Insert TIPO-PROVEEDOR
-- -----------------------------------------------------
INSERT INTO public.tipoproveedor(idtipoproveedor, nombre)
VALUES (1, 'Persona natural'),(2, 'Persona juridica');



-- -----------------------------------------------------
-- Insert PROVEEDOR
-- -----------------------------------------------------
INSERT INTO public.proveedor(idproveedor, nombre, apellido, telefono, correo, direccion, tipoproveedor_idtipoproveedor)
VALUES (1, 'Mauricio', 'Castro Martinez', '978451266', 'mauricioc@gmail.com', 'Argentina 147', 1);

INSERT INTO public.proveedor(idproveedor, nombre, apellido, telefono, correo, direccion, tipoproveedor_idtipoproveedor)
VALUES (2, 'Onelia', 'Roldan Hernadez', '974581244', 'onelir@gmail.com', 'Mexico y Balta', 1);
			
INSERT INTO public.proveedor(idproveedor, nombre, apellido, telefono, correo, direccion, tipoproveedor_idtipoproveedor)
VALUES (3, 'Gaby', 'Nuñez Ruiz', '9784510288', 'gabyn@gmail.com', 'Santa Victoria', 1);
			
INSERT INTO public.proveedor(idproveedor, nombre, apellido, telefono, correo, direccion, tipoproveedor_idtipoproveedor)
VALUES (4, 'Miguel', 'Vela Monteza', '978430144', 'miguelv@gmail.com', 'Victoria 895', 2);
			
INSERT INTO public.proveedor(idproveedor, nombre, apellido, telefono, correo, direccion, tipoproveedor_idtipoproveedor)
VALUES (5, 'Cesar', 'Celis Carrasco', '978463288', 'cesarc@gmail.com', 'Grau 712', 2);

INSERT INTO public.proveedor(idproveedor, nombre, apellido, telefono, correo, direccion, tipoproveedor_idtipoproveedor)
VALUES  (6, 'Fabricio', 'Álvarez', '978451222', 'Falvarez@gmail.com', 'Grau 121', 2),
		(7, 'Julián', 'Fernádez', '974581258', 'julianf@gmail.com', 'Juan Cuglivan', 2),
		(8, 'Gabriel', 'Lopez Ruiz', '9784510212', 'gablopezr@gmail.com', 'Calle Lora y Lora', 2),
		(9, 'Raúl', 'Pérez Pérez', '978430184', 'Raulpp_125@gmail.com', 'Victoria 125', 1),
		(10, 'Felix', 'Carrasco', '978463211', 'felix_carrasco@gmail.com', 'Grau 712', 1);




-- -----------------------------------------------------
-- Insert COMPRA
-- -----------------------------------------------------
INSERT INTO public.compra(idshop, fecha, precio, proveedor_idproveedor, propiedad_idpropiedad)
VALUES (1, current_date, '219999', 1, 1);

INSERT INTO public.compra(idshop, fecha, precio, proveedor_idproveedor, propiedad_idpropiedad)
VALUES (2, '2020-04-05', '170000', 1, 2);

INSERT INTO public.compra(idshop, fecha, precio, proveedor_idproveedor, propiedad_idpropiedad)
VALUES (3, '2020-04-15', '198985', 1, 3);

INSERT INTO public.compra(idshop, fecha, precio, proveedor_idproveedor, propiedad_idpropiedad)
VALUES (4, '2020-04-29', '180000', 2, 4);

INSERT INTO public.compra(idshop, fecha, precio, proveedor_idproveedor, propiedad_idpropiedad)
VALUES (5, '2020-05-02', '130000', 3, 5);

INSERT INTO COMPRA(idSHOP, fecha, precio, PROVEEDOR_idPROVEEDOR, PROPIEDAD_idPROPIEDAD)
VALUES(6, '14-03-2019', '68000', 6, 6);

INSERT INTO COMPRA(idSHOP, fecha, precio, PROVEEDOR_idPROVEEDOR, PROPIEDAD_idPROPIEDAD)
VALUES(7, '01-05-2019', '74500', 7, 7);

INSERT INTO COMPRA(idSHOP, fecha, precio, PROVEEDOR_idPROVEEDOR, PROPIEDAD_idPROPIEDAD)
VALUES(8, '20-08-2019', '83450', 8, 8);

INSERT INTO COMPRA(idSHOP, fecha, precio, PROVEEDOR_idPROVEEDOR, PROPIEDAD_idPROPIEDAD)
VALUES(9, '17-01-2020', '110200', 9, 9);

INSERT INTO COMPRA(idSHOP, fecha, precio, PROVEEDOR_idPROVEEDOR, PROPIEDAD_idPROPIEDAD)
VALUES(10, '11-03-2020', '92500', 10, 10);




-- -----------------------------------------------------
-- Insert CUOTA
-- -----------------------------------------------------
INSERT INTO public.cuota(idcuota, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES (1, 2, '2020-05-02', '2020-07-02', 0, '219999', 1);

INSERT INTO public.cuota(idcuota, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES (2, 5, '2020-05-01', '2020-10-01', '34000', '170000', 5);

INSERT INTO public.cuota(idcuota, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES (3, 4, '2020-05-09', '2020-09-09', 0, '198985', 1);

INSERT INTO public.cuota(idcuota, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES (4, 2, '2020-05-22', '2020-07-22', '36000', '180000', 1);

INSERT INTO public.cuota(idcuota, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES (5, 1, '2020-05-12', '2020-05-12', 0, '130000', 2);

INSERT INTO CUOTA(idCUOTA, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES(6, 3, '28-03-2020', '28-06-2019', '7000.8', '5834', 6);

INSERT INTO CUOTA(idCUOTA, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES(7, 2, '12-02-2020', '12-07-2019', '9120', '7600', 7);

INSERT INTO CUOTA(idCUOTA, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES(8, 4, '08-10-2019', '08-12-2019', '7285.2', '6071', 8);

INSERT INTO CUOTA(idCUOTA, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES(9, 6, '02-03-2020', '02-08-2020', '6000', '5000', 9);

INSERT INTO CUOTA(idCUOTA, numero, fecha_programada, fecha_pago, mora, monto, pago_idpago)
VALUES(10, 3, '15-10-2020', '15-06-2020', '6399.6', '5333', 10);



