
-- 1. Trigger Afiliaciones
/* Se encarga de generar un registro de la carga de afiliados */

DELIMITER $$
CREATE TRIGGER incorporar_afiliado
AFTER INSERT ON afiliados
FOR EACH ROW
	INSERT INTO auditoria_af VALUES
	(DEFAULT, USER(), 'Incorporacion de afiliado', CURRENT_DATE(), CURRENT_TIME);
$$
DELIMITER ;

/* Se encarga de generar un registro de la modificacion de la afiliacion */

DELIMITER $$
CREATE TRIGGER modificacion_afiliado
AFTER UPDATE ON afiliados
FOR EACH ROW
    INSERT INTO auditoria_af VALUES
    (DEFAULT, USER(), 'Modificacion de afiliacion', CURRENT_DATE(), CURRENT_TIME);
$$
DELIMITER ;

/* Se encarga de crear una copia de los datos a eliminar en una tabla dedicada y
 se genera registro de la eliminacion para su auditoria  */

DELIMITER $$
CREATE TRIGGER eliminacion_afiliado
BEFORE DELETE ON afiliados
FOR EACH ROW
BEGIN

	INSERT INTO afiliados_baja VALUES
	(DEFAULT, old.id_afiliado, old.dni, old.nombre, old.apellido, old.id_plan, old.nacimiento, old.telefono, old.correo);
    
	INSERT INTO auditoria_af VALUES
	(DEFAULT, USER(), 'Eliminacion de afiliado', CURRENT_DATE(), CURRENT_TIME);
    
END$$
DELIMITER ;


-- 2. Triggers Autorizaciones
/* Deja registro de la cargar de una autorizacion */

DELIMITER $$
CREATE TRIGGER auditoria_aut_insert
AFTER INSERT ON autorizaciones
FOR EACH ROW
    INSERT INTO auditoria_aut VALUES
    (DEFAULT, USER(), 'Generacion de autorizacion', new.id_aut, CURRENT_DATE(), CURRENT_TIME);
$$
DELIMITER ;

/* Deja registro de updates de una autorizacion */

DELIMITER $$
CREATE TRIGGER auditoria_aut_update
AFTER UPDATE ON autorizaciones
FOR EACH ROW
    INSERT INTO auditoria_aut VALUES
    (DEFAULT, USER(), 'Generacion de autorizacion', id_aut, CURRENT_DATE(), CURRENT_TIME);
$$
DELIMITER ;

/* Se encarga de crear una copia de la autorizacion eliminar en una tabla dedicada y
 se genera registro de la eliminacion para su auditoria  */


DELIMITER $$
CREATE TRIGGER eliminacion_aut
BEFORE DELETE ON autorizaciones
FOR EACH ROW
BEGIN

	INSERT INTO aut_eliminadas VALUES
	(OLD.id_aut, OLD.id_afiliado, OLD.id_prestacion, OLD.cantidad, OLD.id_prestador, OLD.id_usuario, OLD.fecha, OLD.vigencia, OLD.copago);
    
	INSERT INTO auditoria_aut VALUES
	(DEFAULT, USER(), OLD.id_aut,  'Eliminacion de afiliado', CURRENT_DATE(), CURRENT_TIME);
    
END$$
DELIMITER ;



