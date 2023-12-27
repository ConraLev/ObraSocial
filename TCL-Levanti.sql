SET autocommit = 0;
SELECT @@autocommit;

-- Se crea transacción para la inserción de datos en la tabla de auditoria_aut

START TRANSACTION;

INSERT INTO auditoria_aut VALUES 
(DEFAULT, USER(), 11 , 'Modificacion de autorizacion', CURRENT_DATE(), CURRENT_TIME()),
(DEFAULT, USER(), 9, 'Modificacion de autorizacion', CURRENT_DATE(), CURRENT_TIME());

-- ROLLBACK; -- Deshace los cambios realizados
COMMIT; -- Guarda los cambios realizados dentro de la transaccióm

SELECT * FROM auditoria_aut;

-- Se crea transacción para la inserción de datos en la tabla de prestaciones con sus savepoint

START TRANSACTION;

INSERT INTO prestaciones VALUES 
(DEFAULT, 'Angiografia', 40000),
(DEFAULT, 'Hemograma', 7000),
(DEFAULT, 'Ergometria', 8000),
(DEFAULT, 'Audiometria', 5000);

SAVEPOINT savepoint_1;  -- Se ingresan 4 registros y se crear un savepoint en caso de requerir realizar un Rollback

INSERT INTO prestaciones VALUES 
(DEFAULT, 'Logoaudiometria', 5000),
(DEFAULT, 'Colposcopia', 15000),
(DEFAULT, 'Test de Alergia', 20000),
(DEFAULT, 'PET', 90000);

SAVEPOINT savepoint_2; -- Se genera el segundo savepoint luego de ingresar 4 registros mas

ROLLBACK TO savepoint_1; -- Deshace la segunda inserción de datos

COMMIT; -- Guarda los cambios realizados dentro de la transaccióm

SELECT * FROM prestaciones;
