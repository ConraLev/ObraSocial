
CREATE SCHEMA obra_social;
USE obra_social;

CREATE TABLE planes (
	id_plan INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    precio DECIMAL(8,2),
    PRIMARY KEY (id_plan)
);
    
CREATE TABLE usuarios (
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    rol VARCHAR (30) NOT NULL,
    PRIMARY KEY (id_usuario)
);
 

CREATE TABLE afiliados (
	 id_afiliado INT NOT NULL AUTO_INCREMENT,
	 dni INT NOT NULL,
	 nombre VARCHAR (30) NOT NULL,
	 apellido VARCHAR (30) NOT NULL,
	 id_plan VARCHAR (20) NOT NULL,
	 nacimiento DATE NOT NULL,
	 telefono INT,
	 correo VARCHAR (30),
	 PRIMARY KEY (id_afiliado),
	 FOREIGN KEY (id_plan) REFERENCES planes(id_plan)
);
 

 
CREATE TABLE prestaciones( 
	 id_prestacion INT NOT NULL AUTO_INCREMENT,
	 nombre VARCHAR (30) NOT NULL,
	 precio DECIMAL(8,2),
	 PRIMARY KEY (id_prestacion)
 );
 
 
 CREATE TABLE prestadores (
	 id_prestador INT NOT NULL AUTO_INCREMENT,
	 nombre VARCHAR (30) NOT NULL,
	 direccion VARCHAR (30) NOT NULL,
	 telefono INT,
	 PRIMARY KEY (id_prestador)
 );
 
 
CREATE TABLE autorizaciones (
	id_aut INT NOT NULL AUTO_INCREMENT,
	id_afiliado INT NOT NULL,
	id_prestacion INT NOT NULL,
    cantidad INT NOT NULL,
	id_prestador INT NOT NULL,
	id_usuario INT NOT NULL,
	fecha DATE NOT NULL,
	vigencia DATE NOT NULL,
	PRIMARY KEY (id_aut),
	FOREIGN KEY (id_afiliado) REFERENCES afiliados(id_afiliado),
	FOREIGN KEY (id_prestacion) REFERENCES prestaciones(id_prestacion),
	FOREIGN KEY (id_prestador) REFERENCES prestadores(id_prestador),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE historial_consumo (
	id_consumo INT NOT NULL AUTO_INCREMENT,
	id_aut INT NOT NULL,
	fecha DATE,
	PRIMARY KEY (id_consumo),
	FOREIGN KEY (id_aut) REFERENCES autorizaciones(id_aut) 
);


CREATE TABLE facturas (
	id_factura INT NOT NULL AUTO_INCREMENT,
	id_prestador INT NOT NULL,
	monto DECIMAL(8,2),
	fecha_emision DATE,
	PRIMARY KEY (id_factura),
	FOREIGN KEY (id_prestador) REFERENCES prestadores(id_prestador)
);


CREATE TABLE pagos (
	id_pago INT NOT NULL AUTO_INCREMENT,
	id_factura INT NOT NULL, 
	monto DECIMAL (8,2),
	fecha_pago DATE,
	PRIMARY KEY (id_pago),
	FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);


CREATE TABLE  descuentos (
id_desc INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR (300) DEFAULT 'Sin informacion',
porcentaje_descuento INT,
PRIMARY KEY (id_desc)
);


CREATE TABLE factura_af (
id_fac_af INT NOT NULL AUTO_INCREMENT,
id_afiliado INT NOT NULL,

