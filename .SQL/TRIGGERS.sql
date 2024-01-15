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

DROP TABLE IF EXISTS auditoria_contacto;  -- tabla auxiliar contacto

CREATE TABLE IF NOT EXISTS auditoria_contacto
(
	id_contacto INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (id_contacto),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20) DEFAULT "Sin asignar",
    email VARCHAR(120) NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    id_empleado INT,
   FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
	id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    usuario VARCHAR(100),  -- user() usuario que hizo el cambio
    fecha_hora DATETIME,   -- now() momento que se hizo el cambio
    tipo_mov VARCHAR(100)
    
);

##########################################################################################

DROP TABLE IF EXISTS auditoria_producto; -- tabla auxiliar producto

CREATE TABLE IF NOT EXISTS auditoria_producto
(
	id_producto INT NOT NULL AUTO_INCREMENT, PRIMARY KEY (id_producto),
    titulo VARCHAR(50) NOT NULL,
	categoria VARCHAR(20) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    precio_final DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    medidas VARCHAR(20) DEFAULT "Sin asignar",
    peso VARCHAR(15) DEFAULT "Sin asignar",
    descripcion VARCHAR(500) DEFAULT "Sin asignar",
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
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

-- INSERT INTO cliente VALUES (NULL, 'carlos', 'maria', 5555);
-- DELETE FROM cliente WHERE id_cliente=13;

SELECT * FROM auditoria_cliente;


##########################################################################################
/* EJEMPLO3 UPDATE, actualizar o modificar la informacion de contacto de un cliente, este trigger de actualizacion, luego de hacer el update por eso el BEFORE
se fija que es lo que se actualizo con distintos IF, lo actualizado se ve reflejado en la tabla "auditoria_contacto" mostrando el movimiento que se hizo y su nuevo registro
así como el id_cliente al que se le hicieron los cambios.
*/

DROP TRIGGER IF EXISTS t_update_contacto;

DELIMITER $$ 
CREATE TRIGGER t_update_contacto BEFORE UPDATE ON contacto FOR EACH ROW
BEGIN

	DECLARE cliente_id INT;
    DECLARE empleado_id INT;
    DECLARE proveedor_id INT;
    
    SET cliente_id = OLD.id_cliente;
    SET empleado_id = OLD.id_empleado;
    SET proveedor_id = OLD.id_proveedor;

	IF OLD.telefono1 <> NEW.telefono1 THEN
		INSERT INTO auditoria_contacto VALUES
			(DEFAULT, NEW.telefono1, OLD.telefono2, OLD.email, cliente_id, empleado_id, proveedor_id, USER(), NOW(), 'Actualización de Telefono1');
            
	END IF;
    
    IF OLD.telefono2 <> NEW.telefono2 THEN
		INSERT INTO auditoria_contacto VALUES
			(DEFAULT, OLD.telefono1, NEW.telefono2, OLD.email, cliente_id, empleado_id, proveedor_id, USER(), NOW(), 'Actualización de Telefono2');
            
	END IF;
    
    IF OLD.email <> NEW.email THEN
		INSERT INTO auditoria_contacto VALUES
		(DEFAULT, OLD.telefono1, OLD.telefono2, NEW.email, cliente_id, empleado_id, proveedor_id, USER(), NOW(), 'Actualización de Email');
        
	END IF;

END$$
DELIMITER ;

SELECT * FROM auditoria_contacto;

/* los ejemplos de update de abajo  si ves la tabla contacto_cliente no estan realizados todavia, al ejecutarlos los vas a ver reflejados dentro de la tabla contacto_cliente y su registro
en la tabla auditoria_contacto*/

UPDATE contacto set telefono1 = '444-444-4444', telefono2 = '222-222-2222' where id_contacto = 7;
UPDATE contacto set email = 'ddddd@gmail.com' where id_contacto = 3;
UPDATE contacto set telefono1 = '444-444-4444' where id_contacto = 1;


##########################################################################################
/* Trigger, actualizar o modificar la informacion de tabla producto, este trigger es similar al de arriba pero para la tabla "producto", luego de hacer el update por eso el BEFORE
se fija que es lo que se actualizo con distintos IF, lo actualizado se ve reflejado en la tabla "auditoria_producto" mostrando el movimiento que se hizo y su nuevo registro*/

DROP TRIGGER IF EXISTS t_update_producto;

DELIMITER $$
CREATE TRIGGER t_update_producto BEFORE UPDATE ON producto FOR EACH ROW
BEGIN

	DECLARE proveedor_id INT;
    SET proveedor_id = OLD.id_proveedor;
	
	IF OLD.titulo <> NEW.titulo THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, NEW.titulo, OLD.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización de Titulo');
            
	END IF;
    
    IF OLD.categoria <> NEW.categoria THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, NEW.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización de Categoria');
            
	END IF;
    
    IF OLD.precio <> NEW.precio THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, OLD.categoria, NEW.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización de Precio');
	
    END IF;
	
     IF OLD.precio_final <> NEW.precio_final THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, OLD.categoria, OLD.precio, NEW.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización del Precio Final');
	
	END IF;
    
    IF OLD.cantidad <> NEW.cantidad OR OLD.medidas <> NEW.medidas OR OLD.peso <> NEW.peso OR OLD.descripcion <> NEW.descripcion THEN
        INSERT INTO auditoria_producto VALUES 
			(DEFAULT, OLD.titulo, OLD.categoria, OLD.precio, OLD.precio_final, NEW.cantidad, NEW.medidas, NEW.peso, NEW.descripcion, proveedor_id, USER(), NOW(), 'Actualización del Stock');
    
    END IF;
    
    IF OLD.id_proveedor <> NEW.id_proveedor THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, OLD.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, NEW.id_proveedor, USER(), NOW(), 'Actualización del Precio Final');
	
	END IF;

END$$
DELIMITER ;

SELECT * FROM producto;
UPDATE producto set titulo = 'RTX 4090 24GB ROG STRIX GAMING OC' WHERE id_producto =2;


##########################################################################################
/* Trigger, Insertar registros en la tabla producto*/

DROP TRIGGER IF EXISTS t_insercion_producto;

CREATE TRIGGER t_insercion_producto
AFTER INSERT ON producto 
FOR EACH ROW 
INSERT INTO auditoria_producto VALUES
	(NEW.id_producto, NEW.titulo, NEW.categoria, NEW.precio, NEW.precio_final, NEW.cantidad, NEW.medidas, NEW.peso, NEW.descripcion, NEW.id_proveedor, USER(), NOW(), 'Se inserto un nuevo producto');


##########################################################################################
-- EJEMPLO2 DELETE, despues de eliminarlo se guarda en la auxiliar

DROP TRIGGER IF EXISTS t_eliminacion_producto;

CREATE TRIGGER t_eliminacion_producto
BEFORE DELETE ON producto
FOR EACH ROW
INSERT INTO auditoria_producto VALUES
	(OLD.id_producto, OLD.titulo, OLD.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, OLD.id_proveedor, USER(), NOW(), 'Se elimina un producto');
    
    
    