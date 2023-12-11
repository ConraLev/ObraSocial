-- 1. Procedimiento para generar historial de consumo

DELIMITER $$
CREATE PROCEDURE `generar_historial` (
	IN id_af INT,
	IN id_auto INT
    )
BEGIN
	DECLARE fecha_actual DATE;
    
    IF id_auto IS NOT NULL AND id_af IS NOT NULL THEN
		SET fecha_actual = CURRENT_DATE();
		INSERT INTO historial_consumo (id_consumo, id_afiliado, id_aut, fecha)
		VALUES (NULL, id_af, id_auto, fecha_actual);
    END IF;
END$$
DELIMITER ;


-- 2. Procedimiento para ordenar tabla segun columna informada

DELIMITER $$
CREATE PROCEDURE `ordenar_tabla` (
	IN tabla VARCHAR(30),
    IN columna VARCHAR(30),
    IN orden VARCHAR(5)
    )
BEGIN
	SET @ordenar = CONCAT('SELECT * FROM ', tabla, ' ORDER BY ', columna, ' ', orden);
	PREPARE tabla FROM @ordenar;
	EXECUTE tabla;
	DEALLOCATE PREPARE tabla;
END$$
DELIMITER ;

CALL obra_social.ordenar_tabla('afiliados', 'dni', 'asc');


-- 3. Procedimiento para cargar autorizacion y generar historial de consumo 

DELIMITER $$
CREATE PROCEDURE `cargar_aut` (
	IN id_af INT,
	IN id_pract INT,
	IN cant INT,
	IN id_prest INT,
	IN id_usu INT
)
BEGIN
	DECLARE	fecha_actual DATE;
    DECLARE fecha_vig DATE;
    DECLARE id_generado INT;
    DECLARE plan INT;
	DECLARE plan_af INT;
    DECLARE porc INT;
    DECLARE copago INT;
    
    SET fecha_actual = CURRENT_DATE();
    SET fecha_vig = CURRENT_DATE() + INTERVAL 45 DAY;
    
    
    IF id_af IS NOT NULL AND id_pract IS NOT NULL AND id_prest IS NOT NULL AND id_usu IS NOT NULL THEN
    
		SELECT id_plan INTO plan_af
        FROM afiliados
        WHERE id_af = id_afiliado;
			
		SELECT id_plan, porcentaje INTO plan, porc
        FROM planes
        WHERE plan_af = id_plan;

		INSERT INTO autorizaciones (id_aut, id_afiliado, id_prestacion, cantidad, id_prestador, id_usuario, fecha, vigencia, copago)
		VALUES (NULL, id_af, id_pract, cant, id_prest, id_usu, fecha_actual, fecha_vig, calcular_copagos(id_pract, cant, porc) );
        
        SET id_generado = LAST_INSERT_ID();
        CALL generar_historial(id_af, id_generado);
        
	ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Un campo ingresado no es valido';
        
    END IF;
    
END$$
DELIMITER ;

CALL obra_social.cargar_aut(7, 8, 1, 4, 3);

