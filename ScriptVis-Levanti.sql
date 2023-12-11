-- 1. Vista de autorizaciones

CREATE VIEW v_DetalleAutorizacion AS
	SELECT 
		A.id_aut,
		AF.nombre AS nombre_afiliado,
		AF.apellido AS apellido_afiliado,
		P.nombre AS practica,
        A.cantidad AS cantidad,
		PR.nombre AS prestador,
        U.apellido AS autorizado_por,
        A.fecha,
		A.vigencia,
        A.copago
	 FROM autorizaciones A
	 JOIN afiliados AF ON A.id_afiliado = AF.id_afiliado
	 JOIN prestaciones P ON  A.id_prestacion = P.id_prestacion
     JOIN usuarios U ON A.id_usuario = U.id_usuario
	 JOIN prestadores PR ON A.id_prestador = PR.id_prestador;
	
SELECT * FROM v_DetalleAutorizacion;
    
    
-- 2. Vista de autorizaciones y deuda con prestadores

CREATE VIEW v_pagoPrestadores AS
	SELECT
		PR.id_prestador,
		PR.nombre AS NombrePrestador,
        COUNT(A.id_aut) AS TotalAutorizaciones,
		SUM(P.precio) AS MontoTotal
	FROM prestadores PR
    JOIN prestaciones P ON PR.id_prestador = P.id_prestacion
	JOIN autorizaciones A ON P.id_prestacion = A.id_prestacion
	GROUP BY PR.id_prestador, PR.nombre
	ORDER BY MontoTotal DESC;
    
SELECT * FROM v_pagoPrestadores;


-- 3.   Vista de costo financiero afiliado

CREATE VIEW v_costoAfiliado AS
	SELECT
		AF.id_afiliado,
		AF.nombre AS Nombre,
		AF.apellido AS Apellido,
		COUNT(A.id_aut) AS TotalAutorizaciones,
		SUM(P.precio) AS MontoTotal
	FROM afiliados AF
	LEFT JOIN autorizaciones A ON AF.id_afiliado = A.id_afiliado
	LEFT JOIN prestaciones P ON A.id_prestacion = P.id_prestacion
	GROUP BY AF.id_afiliado, AF.nombre, AF.apellido
	ORDER BY MontoTotal DESC;

SELECT * FROM v_costoAfiliado;


-- 4. Vista de monto abonado por practica 

CREATE VIEW v_ConsumoPrestaciones AS
SELECT
	P.id_prestacion,
    P.nombre AS Nombre,
    COUNT(A.id_aut) AS TotalAutorizadas,
    SUM(P.precio) AS MontoTotal
FROM prestaciones P
JOIN autorizaciones A ON A.id_prestacion = P.id_prestacion
GROUP BY P.id_prestacion, P.nombre
ORDER BY MontoTotal DESC; 

SELECT * FROM v_ConsumoPrestaciones;


-- 5.  Vista de cantidad de autorizaciones realizadas por usuarios

CREATE OR REPLACE VIEW v_autPorUsuario AS
SELECT
	U.id_usuario,
    U.nombre,
	U.apellido,
    COUNT(A.id_aut) AS TotalAutorizaciones
FROM usuarios U
LEFT JOIN autorizaciones A ON A.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nombre, U.apellido
ORDER BY TotalAutorizaciones DESC;
    
SELECT * from v_autPorUsuario;

