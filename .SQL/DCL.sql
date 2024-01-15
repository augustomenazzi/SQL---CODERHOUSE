-- SUBLENGUAJE DCL

USE mysql;
select * from USER;

drop user 'empleado'@'localhost';

CREATE USER 'usuario1'@'localhost' identified BY '1234';
CREATE USER 'usuario2'@'localhost' identified BY '12345';
CREATE USER 'empleado'@'localhost' identified by 'abcde';


SHOW GRANTS FOR 'usuario1'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost';
SHOW GRANTS FOR 'empleado'@'localhost';



GRANT SELECT ON curso_coderhouse.* TO 'usuario1'@'localhost';

GRANT SELECT, UPDATE, INSERT ON curso_coderhouse.* TO 'usuario2'@'localhost';

GRANT ALL ON curso_coderhouse TO 'empleado'@'localhost';


GRANT ALL ON curso_coderhouse.empleado TO 'empleado'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON curso_coderhouse.empleado FROM 'empleado'@'localhost';

/* cree lo que seria un perfil empleado el cual tiene permiso para todo sobre la BD curso_coderhuse MENOS la tabla "empleado".*/


SHOW GRANTS FOR 'usuario1'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost';

FLUSH privileges;