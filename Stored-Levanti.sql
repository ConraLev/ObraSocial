-- 1. Procedimiento para generar historial de consumo

DELIMITER $$
CREATE PROCEDURE `generar_historial` (
	IN id_auto INT
    )
BEGIN
	DECLARE fecha_actual DATE;
    
    IF id_auto IS NOT NULL THEN
		SET fecha_actual = CURRENT_DATE();
		INSERT INTO historial_consumo (id_consumo, id_aut, fecha)
		VALUES (NULL, id_auto, fecha_actual);
    END IF;
END$$
DELIMITER ;

CALL obra_social.generar_historial(11);


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

CALL obra_social.ordenar_tabla('autorizaciones', 'fecha', 'asc');

    