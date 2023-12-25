USE mysql;

-- Se crea usuario de administrador maestro que se encarga de toda la base de datos
CREATE USER 'admin_master' IDENTIFIED BY 'administrador';

-- Se le brinda permisos para lectura, insercion y modificacion de datos en todas las tablas
GRANT SELECT, INSERT, UPDATE ON *.* TO 'admin_master';

-- Se crea usuario encargado para poder corroborar informacion en las tablas
CREATE USER 'encargado' IDENTIFIED BY 'encargado';

-- Se da permiso para lectura de toda la base de datos
GRANT SELECT ON *.* TO 'encargado';

SELECT * FROM USER;


