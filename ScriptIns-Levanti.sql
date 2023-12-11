USE obra_social;

INSERT INTO planes (id_plan, nombre, precio, porcentaje)
VALUES
(NULL, "JOVEN", 15000, 15),
(NULL, "BASICO", 20000, 10),
(NULL, "MEDIO", 30000, 8),
(NULL, "PLUS", 50000, 3),
(NULL, "JUBILADO", 35000, 6);

SELECT * FROM planes;

INSERT INTO afiliados (id_afiliado, dni, nombre, apellido, id_plan, nacimiento, telefono, correo)
VALUES
( NULL, 35123321, "Santiago", "Gonzalez", 1, "1990-10-02", 1122435201, "santiGonzalez@yahoo.com"),
( NULL, 24123445, "Morena", "Paz", 3, "1981-01-10", 1143512014, "PazMore@gmail.com"),
( NULL, 22549875, "Jaime", "Rodriguez", 3, "1981-12-01", 1143579875, "JRodriguez@hotmail.com"),
( NULL, 42002452, "Augusto", "Gimenez", 1, "2011-02-06", 1145624625, "GimenezAgus@live.com"),
( NULL, 18004562, "Federico", "Fernandez", 4, "1985-07-16", 1135734655, "Fedefer@gmail.com"),
( NULL, 4245624, "Graciela", "Gaitan", 5, "1970-02-06", 114564512, "GlaGaitan@yahoo.com"),
( NULL, 42125456, "Cristian", "Gonzalez", 1, "2000-01-20", 1157624625, "Cris2000@hotmail.com"),
( NULL, 34999945, "Carla", "Higgins", 2, "1990-04-27", 1145624625, "Higca@live.com.ar"),
( NULL, 12564235, "Agustina", "Alvarez", 3, "1980-08-18", 114561535, "AAlvarez@gov.com"),
( NULL, 50045152, "Enzo", "Perez", 4, "2018-12-09", 1202301503, "EnzoCamp@gmail.com"),
( NULL, 45615852, "Rodrigo", "Fernandez", 2, "2010-07-02", 1112524154, "RodriF@gmail.com");


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

INSERT INTO autorizaciones (id_aut, id_afiliado, id_prestacion, cantidad, id_prestador, id_usuario, fecha, vigencia, copago)
VALUES
( NULL, 3, 2, 1, 5, 7, '2023-12-02', ('2023-12-02' + INTERVAL 60 DAY), 320),
( NULL, 3, 2, 1, 5, 8, '2023-11-22', ('2023-11-22' + INTERVAL 60 DAY), 320),
( NULL, 2, 4, 2, 1, 2, '2023-10-30', ('2023-10-30' + INTERVAL 45 DAY), 140),
( NULL, 5, 3, 1, 2, 3, '2023-10-04', ('2023-10-04' + INTERVAL 45 DAY), 50),
( NULL, 11, 3, 2, 2, 4, '2023-12-27', ('2023-12-27' + INTERVAL 45 DAY), 100),
( NULL, 9, 8, 1, 2, 2, '2023-11-06', ('2023-11-06' + INTERVAL 45 DAY), 220),
( NULL, 1, 5, 1, 10, 2, '2023-12-07', ('2023-12-07' + INTERVAL 45 DAY), 120),
( NULL, 8, 2, 2, 8, 10, '2023-10-08', ('2023-10-08' + INTERVAL 45 DAY), 640),
( NULL, 6, 10, 1, 7, 5, '2023-11-09', ('2023-11-09' + INTERVAL 45 DAY), 600),
( NULL, 6, 9, 1, 2, 9, '2023-10-10', ('2023-10-10' + INTERVAL 45 DAY), 450),
( NULL, 1, 2, 1, 11, 7, '2023-09-18', ('2023-09-18' + INTERVAL 45 DAY), 320);

SELECT * FROM autorizaciones;



INSERT INTO historial_consumo (id_consumo, id_afiliado,  id_aut, fecha)
VALUES
  (NULL, 3, 1, '2023-12-02'),
  (NULL, 3, 2, '2023-11-22'),
  (NULL, 2, 3, '2023-10-30'),
  (NULL, 5, 4, '2023-10-04'),
  (NULL, 11, 5, '2023-12-27'),
  (NULL, 9, 6, '2023-11-06'),
  (NULL, 1, 7, '2023-12-07'),
  (NULL, 8, 8, '2023-10-08'),
  (NULL, 6, 9, '2023-11-09'),
  (NULL, 6, 10, '2023-10-10'),
  (NULL, 1, 11, '2023-09-18');

SELECT * FROM historial_consumo;


INSERT INTO factura_prest (id_factura, id_prestador, monto, fecha_emision)
VALUES
	(NULL, 2, 128000.00, '2023-12-01'),
    (NULL, 9, 45000.00, '2023-12-05'),
    (NULL, 5, 12000.00, '2023-12-01'),
    (NULL, 8, 11000.00, '2023-12-01'),
    (NULL, 3, 10000.00, '2023-12-10'),
    (NULL, 4, 7000.00, '2023-11-30'),
    (NULL, 10, 6000.00, '2023-12-03');
    
SELECT * FROM factura_prest;


INSERT INTO pagos (id_pago, id_factura, monto, fecha_pago)
VALUES
	(NULL, 1, 128000.00, ('2023-12-01' + INTERVAL 35 DAY)),
    (NULL, 2, 45000.00, ('2023-12-05' + INTERVAL 35 DAY)),
    (NULL, 3, 12000.00, ('2023-12-01' + INTERVAL 35 DAY)),
    (NULL, 4, 11000.00, ('2023-12-01' + INTERVAL 35 DAY)),
    (NULL, 5, 10000.00, ('2023-12-10' + INTERVAL 35 DAY)),
    (NULL, 6, 7000.00, ('2023-11-30' + INTERVAL 35 DAY)),
    (NULL, 7, 6000.00, ('2023-12-03' + INTERVAL 35 DAY));
    
SELECT * FROM pagos;

