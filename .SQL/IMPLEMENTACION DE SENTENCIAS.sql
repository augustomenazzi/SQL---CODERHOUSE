-- DESAFIO COMPLEMENTARIO SUBLENGUAJE DCL

USE mysql;

CREATE USER 'usuario1'@'localhost';
CREATE USER 'usuario2'@'localhost';

SHOW GRANTS FOR 'usuario1'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost';


GRANT SELECT ON curso_coderhouse.* TO 'usuario1'@'localhost';

GRANT SELECT, UPDATE, INSERT ON curso_coderhouse.* TO 'usuario2'@'localhost';

SHOW GRANTS FOR 'usuario1'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost';

FLUSH privileges;