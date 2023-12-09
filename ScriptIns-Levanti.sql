USE obra_social;


INSERT INTO afiliados (id_afiliado, dni, nombre, apellido, nacimiento, telefono, correo)
VALUES
( NULL, 35123321, "Santiago", "Gonzalez", "1990-10-02", 1122435201, "santiGonzalez@yahoo.com"),
( NULL, 24123445, "Morena", "Paz", "1981-01-10", 1143512014, "PazMore@gmail.com"),
( NULL, 22549875, "Jaime", "Rodriguez", "1981-12-01", 1143579875, "JRodriguez@hotmail.com"),
( NULL, 42002452, "Augusto", "Gimenez", "2000-02-06", 1145624625, "GimenezAgus@live.com"),
( NULL, 18004562, "Federico", "Fernandez", "1985-07-16", 1135734655, "Fedefer@gmail.com"),
( NULL, 4245624, "Graciela", "Gaitan", "1970-02-06", 114564512, "GlaGaitan@yahoo.com"),
( NULL, 42125456, "Cristian", "Gonzalez", "2000-01-20", 1157624625, "Cris2000@hotmail.com"),
( NULL, 34999945, "Carla", "Higgins", "1990-04-27", 1145624625, "GimenezAgus@live.com"),
( NULL, 12564235, "Agustina", "Alvarez", "1980-08-18", 114561535, "GimenezAgus@live.com"),
( NULL, 50045152, "Enzo", "Perez", "2018-12-09", 1202301503, "EnzoCamp@gmail.com"),
( NULL, 45615852, "Rodrigo", "Fernandez","2003-07-02", 1112524154, "RodriF@gmail.com");

SELECT * FROM afiliados;


INSERT INTO usuarios (id_usuario, nombre, apellido, rol)
VALUE
(NULL, "Sergio", "Martinez", "Gerente"),
(NULL, 'Juan', 'Perez', 'Aux Administrativo'),
(NULL, 'Ana', 'Gomez', 'Aux Administrativo'),
(NULL, 'Carlos', 'Rodriguez', 'Aux Administrativo'),
(NULL, 'Laura', 'Lopez', 'Aux Administrativo'),
(NULL, 'Roberto', 'Diaz', 'Sub Gerente'),
(NULL, 'María', 'Martinez', 'Medico Auditor'),
(NULL, 'Sofía', 'Fernandez', 'Medico Auditor'),
(NULL, 'Diego', 'Hernandez', 'Medico Auditor'),
(NULL, 'Valentina', 'Garcia', 'Medico Auditor'),
(NULL, 'Alejandro', 'Ramirez', 'Encargado');

SELECT * FROM usuarios;

INSERT INTO prestaciones (id_prestacion, nombre, precio)
VALUES
( NULL, "Resonancia Magnetica", 30000),
( NULL, "Tomografia Computarizada", 32000),
( NULL, "Radiografía", 5000),
( NULL, "Espinografia", 7000),
( NULL, "EcoDoppler", 12000),
( NULL, "Electrocardiograma", 9000),
( NULL, "Endoscopia Alta/Baja", 50000),
( NULL, "Mamografia", 11000),
( NULL, "Polisomnografia", 45000),
( NULL, "Anatomia Patologica", 6000),
( NULL, "Densitometria", 6000);

SELECT * FROM prestaciones;

INSERT INTO prestadores (id_prestador, nombre, direccion, telefono)
VALUES
( NULL, "Hospital Italiano", "Juan Domingo Perón 4190, CABA", 49590200),
( NULL, "Hospital Britanico", "Perdriel 74, CABA",  43096400),
( NULL, "Sanatorio Otamendi", "Azcuénaga 870, CABA", 49652900),
( NULL, "Hospital Español La Plata", "C. 9 175, B1902 La Plata", 44215350),
( NULL, "Hospital San Juan de Dios", "Calle 27 y 70, La Plata", 44123150),
( NULL, "Clínica Las Heras", "Av. Sta. Fe 1752, CABA", 42815460),
( NULL, "Clínica San Camilo", "Angel Gallardo 899, CABA", 4482000),
( NULL, "Clínica La Sagrada Familia", "José Hernández 1642, CABA", 41823230),
( NULL, "Sanatorio Finochietto", "Av. Córdoba 2678, CABA", 4231320),
( NULL, "Clínica Bazterrica", "Juncal 3002, CABA", 4515640),
( NULL, "Sanatorio Mater Dei", "San Martín de Tours 2952, CABA", 48095555);

SELECT * FROM prestadores;

INSERT INTO autorizaciones (id_aut, id_afiliado, id_prestacion, id_prestador, id_usuario, fecha, vigencia)
VALUES
( NULL, 3, 2, 5, 7, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 3, 2, 5, 8, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 2, 4, 1, 2, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 5, 3, 2, 3, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 11, 3, 2, 4, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 9, 8, 2, 2, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 1, 5, 10, 2, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 8, 2, 8, 10, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 6, 10, 7, 5, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 6, 9, 2, 9, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY)),
( NULL, 1, 2, 11, 7, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 60 DAY));

SELECT * FROM autorizaciones;


INSERT INTO historial_consumo (id_consumo, id_aut, fecha)
VALUES
  (NULL, 1, '2023-12-02'),
  (NULL, 2, '2023-11-22'),
  (NULL, 3, '2023-10-30'),
  (NULL, 4, '2023-10-04'),
  (NULL, 5, '2023-12-27'),
  (NULL, 6, '2023-11-06'),
  (NULL, 7, '2023-12-07'),
  (NULL, 8, '2023-10-08'),
  (NULL, 9, '2023-11-09'),
  (NULL, 10, '2023-10-10');


SELECT * FROM historial_consumo;


INSERT INTO facturas (id_factura, id_prestador, monto, fecha)
VALUES
	(NULL, 2, 128000.00, CURRENT_DATE()),
    (NULL, 9, 45000.00, CURRENT_DATE()),
    (NULL, 5, 12000.00, CURRENT_DATE()),
    (NULL, 8, 11000.00, CURRENT_DATE()),
    (NULL, 3, 10000.00, CURRENT_DATE()),
    (NULL, 4, 7000.00, CURRENT_DATE()),
    (NULL, 10, 6000.00, CURRENT_DATE());
    
SELECT * FROM facturas;


INSERT INTO pagos (id_pago, id_factura, monto, fecha)
VALUES
	(NULL, 2, 128000.00, (CURRENT_DATE + INTERVAL 30 DAY)),
    (NULL, 9, 45000.00, CURRENT_DATE + INTERVAL 30 DAY),
    (NULL, 5, 12000.00, CURRENT_DATE + INTERVAL 30 DAY),
    (NULL, 8, 11000.00, CURRENT_DATE + INTERVAL 30 DAY),
    (NULL, 3, 10000.00, CURRENT_DATE + INTERVAL 30 DAY),
    (NULL, 4, 7000.00, CURRENT_DATE + INTERVAL 30 DAY),
    (NULL, 10, 6000.00, CURRENT_DATE + INTERVAL 30 DAY);
    
SELECT * FROM pagos;
