
-- 1- Funcion para calcular valor de copago segun practica, ingresando cantidad y porcentaje 

DELIMITER $$
CREATE FUNCTION `calcular_copagos` (id_prest INT, cantidad INT, porcentaje DECIMAL(4,2)) RETURNS DECIMAL(8,2) 
READS SQL DATA
BEGIN
	DECLARE precioPrestacion DECIMAL (8,2);
    DECLARE copago DECIMAL (8,2);
    DECLARE precioPrestacionFinal DECIMAL (8,2);
    
    SELECT precio INTO precioPrestacion
    FROM prestaciones 
    WHERE id_prest = id_prestacion
    LIMIT 1;
    
    SET precioPrestacionFinal =  precioPrestacion * cantidad;
    SET copago = (precioPrestacionFinal * porcentaje) / 100;
    RETURN copago;
END$$
DELIMITER ;

SELECT obra_social.calcular_copagos(3, 2, 15) AS valor_copago;


-- 2. Funcion para calcular si el afiliado es mayor de edad

DELIMITER $$
CREATE FUNCTION `descuento_menores` (id_af INT) RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE fecha_nacimiento DATE;
    
	SELECT nacimiento INTO fecha_nacimiento
    FROM afiliados
    WHERE id_af = id_afiliado
    LIMIT 1;
	
    IF fecha_nacimiento > DATE_SUB(CURRENT_DATE(), INTERVAL 18 YEAR) THEN
		RETURN TRUE;
    ELSE
		RETURN FALSE;
	END IF;
    END$$
DELIMITER ;

-- Resultado afiliado menor de edad:
SELECT obra_social.descuento_menores(4) AS Afiliado_Menor;

-- Resultado afiliado mayor de edad: 
SELECT obra_social.descuento_menores(1) AS Afiliado_Menor;

-- 3. Funcion para contar cantidad de autorizaciones vencidas

DELIMITER $$
CREATE FUNCTION `auto_vencidas`() RETURNS INT
READS SQL DATA
BEGIN
	DECLARE cant_aut_venc INT;
    
    SELECT COUNT(*)
    INTO cant_aut_venc
    FROM autorizaciones
    WHERE vigencia < CURRENT_DATE();
    
    RETURN cant_aut_venc;
END$$
DELIMITER ;

SELECT obra_social.auto_vencidas() AS Autorizaciones_vencidas;


-- 4. Funcion para calcular edad del afilaido 


DELIMITER $$
CREATE FUNCTION `calcular_edad`(id_af INT) RETURNS INT
READS SQL DATA
BEGIN
	DECLARE fecha_nacimiento DATE;
    DECLARE edad INT;
    
    SELECT nacimiento INTO fecha_nacimiento
    FROM afiliados
    WHERE id_af = id_afiliado;
    
    SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURRENT_DATE());
    
    RETURN edad;
END$$
DELIMITER ;

SELECT obra_social.calcular_edad(4) AS edad_afiliado;
