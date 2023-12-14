-- triggers

DROP TABLE IF EXISTS auditoria_cliente;  -- tabla auxiliar cliente 

CREATE TABLE IF NOT EXISTS auditoria_cliente
(
	id_cliente INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (id_cliente),
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    documento VARCHAR(14) DEFAULT "Sin asignar" UNIQUE,
    usuario VARCHAR(100),  -- user() usuario que hizo el cambio
    fecha_hora DATETIME,   -- now() momento que se hizo el cambio
    tipo_mov VARCHAR(100)
    
);
##########################################################################################

DROP TABLE IF EXISTS auditoria_c_cliente;  -- tabla auxiliar contacto_cliente 

CREATE TABLE IF NOT EXISTS auditoria_c_cliente
(
	id_contacto_cliente INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (id_contacto_cliente),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20) DEFAULT "Sin asignar",
    email VARCHAR(120) NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    usuario VARCHAR(100),  -- user() usuario que hizo el cambio
    fecha_hora DATETIME,   -- now() momento que se hizo el cambio
    tipo_mov VARCHAR(100)
    
);

##########################################################################################
-- EJEMPLO1 INSERT, antes de insertar se guarda en la auxiliar

DROP TRIGGER IF EXISTS t_insercion_cliente;

CREATE TRIGGER t_insercion_cliente
AFTER INSERT ON cliente 
FOR EACH ROW 
INSERT INTO auditoria_cliente VALUES
(NEW.id_cliente, NEW.nombre, NEW.apellido, NEW.documento, USER(), NOW(), 'Se inserto un nuevo cliente');

##########################################################################################
-- EJEMPLO2 DELETE, despues de eliminarlo se guarda en la auxiliar

DROP TRIGGER IF EXISTS t_eliminacion_cliente;

CREATE TRIGGER t_eliminacion_cliente
BEFORE DELETE ON cliente
FOR EACH ROW
INSERT INTO auditoria_cliente VALUES
(OLD.id_cliente, OLD.nombre, OLD.apellido, OLD.documento, USER(), NOW(), 'Se elimina un cliente');

INSERT INTO cliente VALUES (NULL, 'carlos', 'maria', 5555);
DELETE FROM cliente WHERE id_cliente=13;

SELECT * FROM auditoria_cliente;

##########################################################################################
/* EJEMPLO3 UPDATE, actualizar o modificar la informacion de contacto de un cliente, este trigger de actualizacion, luego de hacer el update por eso el BEFORE
se fija que es lo que se actualizo con distintos IF, lo actualizado se ve reflejado en la tabla "auditoria_c_cliente" mostrando el movimiento que se hizo y su nuevo registro
así como el id_cliente al que se le hicieron los cambios.
*/

DROP TRIGGER IF EXISTS t_update_c_cliente;

DELIMITER $$
CREATE TRIGGER t_update_c_cliente BEFORE UPDATE ON contacto_cliente FOR EACH ROW
BEGIN

	DECLARE cliente_id INT;
    SET cliente_id = OLD.id_cliente;

	IF OLD.telefono1 <> NEW.telefono1 THEN
		INSERT INTO auditoria_c_cliente VALUES
			(default, NEW.telefono1, OLD.telefono2, OLD.email, cliente_id, USER(), NOW(), 'Actualización de Telefono1');
            
	END IF;
    
    IF OLD.telefono2 <> NEW.telefono2 THEN
		INSERT INTO auditoria_c_cliente VALUES
			(DEFAULT, OLD.telefono1, NEW.telefono2, OLD.email, cliente_id, USER(), NOW(), 'Actualización de Telefono2');
            
	END IF;
    
    IF OLD.email <> NEW.email THEN
		INSERT INTO auditoria_c_cliente VALUES
		(DEFAULT, OLD.telefono1, OLD.telefono2, NEW.email, cliente_id, USER(), NOW(), 'Actualización de Email');
        
	END IF;

END$$
DELIMITER ;

SELECT * FROM auditoria_c_cliente;

/* los ejemplos de update de abajo  si ves la tabla contacto_cliente no estan realizados todavia, al ejecutarlos los vas a ver reflejados dentro de la tabla contacto_cliente y su registro
en la tabla auditoria_c_cliente*/

UPDATE contacto_cliente set telefono1 = '444-444-4444', telefono2 = '222-222-2222' where id_contacto_cliente = 7;
UPDATE contacto_cliente set email = 'ddddd@gmail.com' where id_contacto_cliente = 3;
UPDATE contacto_cliente set telefono1 = '444-444-4444' where id_contacto_cliente = 1;

