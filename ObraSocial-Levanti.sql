
CREATE SCHEMA obra_social;
USE obra_social;


CREATE TABLE planes (
	id_plan INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    precio DECIMAL(8,2),
    porcentaje DECIMAL(4,2),
    PRIMARY KEY (id_plan)
);


CREATE TABLE usuarios (
	id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    rol VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_usuario)
);


CREATE TABLE afiliados (
	 id_afiliado INT NOT NULL AUTO_INCREMENT,
	 dni INT NOT NULL,
	 nombre VARCHAR(30) NOT NULL,
	 apellido VARCHAR(30) NOT NULL,
	 id_plan INT NOT NULL,
	 nacimiento DATE NOT NULL,
	 telefono VARCHAR(15),
	 correo VARCHAR(30),
	 PRIMARY KEY (id_afiliado),
	 FOREIGN KEY (id_plan) REFERENCES planes(id_plan)
);

CREATE TABLE afiliados_baja (
	id_baja_af INT NOT NULL AUTO_INCREMENT,
	id_afiliado INT NOT NULL,
	dni INT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	id_plan INT NOT NULL,
	nacimiento DATE NOT NULL,
	telefono VARCHAR(15),
	correo VARCHAR(30),
	PRIMARY KEY (id_baja_af)
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
    copago INT NOT NULL,
	PRIMARY KEY (id_aut),
	FOREIGN KEY (id_afiliado) REFERENCES afiliados(id_afiliado),
	FOREIGN KEY (id_prestacion) REFERENCES prestaciones(id_prestacion),
	FOREIGN KEY (id_prestador) REFERENCES prestadores(id_prestador),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE aut_eliminadas (
	id_aut INT NOT NULL,
	id_afiliado INT NOT NULL,
	id_prestacion INT NOT NULL,
    cantidad INT NOT NULL,
	id_prestador INT NOT NULL,
	id_usuario INT NOT NULL,
	fecha DATE NOT NULL,
	vigencia DATE NOT NULL,
    copago INT NOT NULL,
    PRIMARY KEY (id_aut)
);

CREATE TABLE historial_consumo (
	id_consumo INT NOT NULL AUTO_INCREMENT,
    id_afiliado INT NOT NULL,
	id_aut INT NOT NULL,
	fecha DATE,
	PRIMARY KEY (id_consumo),
	FOREIGN KEY (id_aut) REFERENCES autorizaciones(id_aut),
    FOREIGN KEY (id_afiliado) REFERENCES afiliados(id_afiliado)
);


CREATE TABLE factura_prest (
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
	FOREIGN KEY (id_factura) REFERENCES factura_prest(id_factura)
);


CREATE TABLE factura_af (
	id_fac_af INT NOT NULL AUTO_INCREMENT,
	id_af INT NOT NULL,
	monto DECIMAL(8,2) NOT NULL,
	monto_copago DECIMAL(8,2),
	total INT NOT NULL,
	PRIMARY KEY (id_fac_af),
	FOREIGN KEY (id_af) REFERENCES afiliados(id_afiliado)
);


CREATE TABLE auditoria_af (
	id_mov_af INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    accion VARCHAR(50),
    fecha DATE NOT NULL,
    horario TIME NOT NULL,
    PRIMARY KEY (id_mov_af)
);


CREATE TABLE auditoria_aut (
	id_mov_aut INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    id_aut INT NOT NULL,
    accion VARCHAR(50),
    fecha DATE NOT NULL,
    horario TIME NOT NULL,
    PRIMARY KEY (id_mov_aut),
    FOREIGN KEY (id_aut) REFERENCES autorizaciones(id_aut)
);

