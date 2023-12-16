-- comienzo bd codehrouse AUGUSTO MENAZZI
-- drop SCHEMA curso_coderhouse;
create SCHEMA curso_coderhouse;
use curso_coderhouse;

CREATE TABLE IF NOT EXISTS cliente
(
	id_cliente INT NOT NULL AUTO_INCREMENT, 
	PRIMARY KEY (id_cliente),
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    documento VARCHAR(14) DEFAULT "Sin asignar" UNIQUE,
    INDEX idx_dni(documento),
    INDEX nombre (nombre, apellido)
    
);

CREATE TABLE IF NOT EXISTS contacto_cliente
(
	id_contacto_cliente INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_contacto_cliente),
    telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20) DEFAULT "Sin asignar",
    email VARCHAR(120) NOT NULL,
    CONSTRAINT uni_email UNIQUE (email),
    id_cliente INT,
    CONSTRAINT fk_contacto_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE
    
);  

CREATE TABLE IF NOT EXISTS direccion
(
	id_direccion INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_direccion),
	direccion VARCHAR(30) NOT NULL,
	localidad VARCHAR(30) NOT NULL,
	barrio VARCHAR(30) NOT NULL,
    referencia VARCHAR(50) DEFAULT "Sin asignar",
	codigo_postal NUMERIC(4,0) NOT NULL,
    id_cliente INT,
    CONSTRAINT fk_direccion_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE

);  

CREATE TABLE IF NOT EXISTS envio
(
	id_envio INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_envio),
	forma VARCHAR(10) NOT NULL,
    empresa VARCHAR(20),
    id_cliente INT,
    CONSTRAINT fk_envio_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE
    
);

CREATE TABLE IF NOT EXISTS pedido
(
	id_pedido INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_pedido),
	Articulos VARCHAR(100) NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Pago VARCHAR(20) NOT NULL,
    Promociones VARCHAR(20) DEFAULT "Sin asignar",
    Estado VARCHAR(20) NOT NULL,
    id_envio INT,
    id_cliente INT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (id_envio) REFERENCES envio(id_envio) 
    ON DELETE RESTRICT ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS proveedor
(
	id_proveedor INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_proveedor),
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    documento VARCHAR(14) NOT NULL UNIQUE,
    INDEX idx_dni(documento),
    categoria VARCHAR(20) NOT NULL,
    pedido VARCHAR(100),
    INDEX nombre (nombre, apellido)

);

CREATE TABLE IF NOT EXISTS contacto_proveedor
(
	id_contacto_proveedor INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_contacto_proveedor),
	telefono1 VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20) DEFAULT "Sin asignar",
    email VARCHAR(120) NOT NULL,
    CONSTRAINT uni_email UNIQUE (email),
    id_proveedor INT,
    CONSTRAINT fk_contacto_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
    ON DELETE RESTRICT ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS producto
(
	id_producto INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_producto),
    titulo VARCHAR(50) NOT NULL,
	categoria VARCHAR(20) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    precio_final DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    medidas VARCHAR(20) DEFAULT "Sin asignar",
    peso VARCHAR(15) DEFAULT "Sin asignar",
    descripcion VARCHAR(500) DEFAULT "Sin asignar",
    id_proveedor INT,
    CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) 
    ON DELETE RESTRICT ON UPDATE CASCADE 

);

CREATE TABLE IF NOT EXISTS hechos_ventas
(
	id_cliente INT,
    id_pedido INT,
    id_producto INT,
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_ventas_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
	ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ventas_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto) 
    ON DELETE RESTRICT ON UPDATE CASCADE

);

USE curso_coderhouse;

set SQL_SAFE_UPDATES = 0;



################################################################################################
-- 5 vistas

-- vista1, productos que tienen como proveedor al id1
CREATE OR REPLACE VIEW VISTA1 AS
SELECT P.id_producto, P.titulo, P.categoria, P.precio, A.nombre, A.id_proveedor 
FROM PRODUCTO P 
JOIN proveedor A ON (P.id_proveedor = A.id_proveedor)
WHERE A.documento = 12457865;

SELECT * FROM VISTA1;


################################################################################################
-- vista2, productos que tienen un precio mayor a 1600 con categoria de gabinete

CREATE OR REPLACE VIEW VISTA2 AS
SELECT P.id_producto, P.titulo, P.categoria, P.precio
FROM producto P 
WHERE categoria = "Gabinetes" AND precio > 1600;

select * from VISTA2;


################################################################################################
-- vista3, vista de los datos que se deberian mostrar en la pagina web a los clientes, (precio + 30%)

CREATE OR REPLACE VIEW VISTA3 AS
SELECT P.titulo, P.categoria, P.precio * 1.3 as PRECIO_FINAL
FROM producto P order by precio;

select * from curso_coderhouse.VISTA3;


################################################################################################
-- vista4, una vista que recopile de la tabla pedidos los que sean de pago con debito, a su vez me muestre de la tabla cliente su nombre,apellido,documento
-- y de la tabla contacto_cliente sus contactos

CREATE OR REPLACE VIEW VISTA4 AS
SELECT P.id_pedido, P.Articulos, P.Monto, P.Pago, C.nombre, C.apellido, C.documento, CC.telefono1, CC.telefono2, CC.email
FROM pedido P
JOIN cliente C ON P.id_cliente = C.id_cliente
JOIN contacto_cliente CC ON P.id_cliente = CC.id_cliente
WHERE P.Pago = 'Debito' order by Monto;

select * from VISTA4; 
 
 
################################################################################################
-- vista5 hacer una vista que me muestre al cliente, su contacto, y su pedido sabiendo que su pedido tiene definido el envio por la empresa andreani
-- supuesto caso de que se atrasen los envios y haya que avisar a los clientes

CREATE OR REPLACE VIEW VISTA5 AS
SELECT C.nombre, C.apellido, C.documento, CC.telefono1, CC.telefono2, CC.email, P.id_pedido, P.Articulos, E.id_envio, E.empresa
FROM cliente C
JOIN pedido P ON P.id_cliente = C.id_cliente
JOIN contacto_cliente CC ON P.id_cliente = CC.id_cliente
JOIN envio E ON E.id_envio = P.id_envio
WHERE E.empresa = 'Andreani';

select * from VISTA5;



################################################################################################
-- 2 funciones

-- funcion1, una funcion que le de como parametro un monto de un pedido y me devuelva su monto con promociones

DELIMITER $$
CREATE FUNCTION f_promociones(monto DECIMAL(10,2), promociones INT) RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN

	DECLARE resultado DECIMAL(10,2);
    SET resultado = monto - (monto * (promociones/100));
	

	RETURN resultado;
END$$
DELIMITER ;

SELECT f_promociones(5000,25) AS Preio_final;


################################################################################################
-- funcion2, una funcion para calcular el precio total de un producto dado su precio unitario y la cantidad a comprar, en este caso 5 

DELIMITER $$
CREATE FUNCTION f_precio_final(precio_unitario DECIMAL(10,2), cantidad INT) RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN

	DECLARE total DECIMAL(10,2);
	SET total = precio_unitario * cantidad;
    
    RETURN total;
END$$
DELIMITER ;

SELECT id_producto, titulo, categoria, precio, f_precio_final(precio, 5) AS Precio_total
FROM producto
WHERE titulo like '%Gabinete%';


################################################################################################
/* sp1, este lo hicimos tal cual en clase, no hay mucho que comentar, estaba bastante automatizado para poder 
hacer el proceso para cualquier tabla, se le puede sumar la seguridad de los IF de corroborar que los registros ingresados
esten en las tablas, y que a la vez sea valido el orden pero no lo pedia como requisito*/

drop procedure if exists sp_ordenar_tabla;

DELIMITER $$
CREATE PROCEDURE sp_ordenar_tabla(IN tabla VARCHAR(20), IN campo VARCHAR(30), in orden VARCHAR(4))
BEGIN

	SET @ordenar = CONCAT('SELECT * FROM',' ', tabla, ' ', 'ORDER BY', ' ', campo, ' ', orden);
    
	PREPARE ordenar FROM @ordenar;
    EXECUTE ordenar;
    DEALLOCATE PREPARE ordenar;

END$$

DELIMITER ;

CALL sp_ordenar_tabla('pedido', 'monto', 'ASC');


################################################################################################
/* sp2  sp que inserte registros en la tabla cliente, este sp no tiene como parametro el id ya que este es auto_increment
y se deberia asignar solo, a su vez tiene un IF para corroborar que el DNI del nuevo registro este ya registrado*/

DROP PROCEDURE IF EXISTS sp_insertar_registro_cliente;

DELIMITER $$
CREATE PROCEDURE sp_insertar_registro_cliente(IN n_nombre VARCHAR(30), IN n_apellido VARCHAR(30), IN n_documento VARCHAR(14))
BEGIN

	DECLARE documento_existente INT;
	
    SELECT COUNT(*) INTO documento_existente FROM cliente WHERE documento = n_documento;
    
    IF documento_existente = 0 THEN
		INSERT INTO cliente 
			(id_cliente, nombre, apellido, documento) VALUES (default, n_nombre, n_apellido, n_documento);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El documento ingresado ya esta asignado a otro cliente';
	END IF;

	/* este procedimiento guarda en "documento_existente" el conteo del total de los documentos encontrados iguales al ingresado como parametro en "n_documento"
    si hay algun documento igual al que se ingreso como parametro, "documento_existente" se carga con esa cantidad, que deberia ser 1 maximo ya que documento es UNIQUE
    si es asi, salta error asignado, sino sigue la carga del nuevo registro con ese documento, ya que es valido. */
	 
END$$

DELIMITER ;

-- el primer registro de la tabla cliente tiene como numero de documento 17308014
CALL sp_insertar_registro_cliente('Carlos', 'Menazzi', 17308014);
CALL sp_insertar_registro_cliente('Carlos', 'Menazzi', 99999999);


################################################################################################
/* sp  sp que le mandes como parametro el id del proveedor y te devuelva los productos asignados a el, asi como algunas columnas adicionales, antes corrobore si el numero enviado como parametro es correcto*/

DROP PROCEDURE IF EXISTS sp_busqueda_proveedor;

DELIMITER $$
CREATE PROCEDURE sp_busqueda_proveedor(IN n_id_prov INT)
BEGIN

	DECLARE id_existente INT;
    
    SELECT COUNT(*) INTO id_existente FROM proveedor WHERE id_proveedor = n_id_prov;
    
	IF id_existente = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay ningun proveedor con el ID ingresado';
	ELSE
		SELECT A.id_proveedor, A.nombre, A.apellido, A.documento, A.categoria, P.id_producto, P.titulo, P.precio, P.precio_final, P.cantidad 
        FROM proveedor A
        JOIN producto P ON (P.id_proveedor = A.id_proveedor) 
        WHERE A.id_proveedor = n_id_prov;
	END IF;

END$$

DELIMITER ;

CALL sp_busqueda_proveedor(2); 
CALL sp_busqueda_proveedor(5);  #No hay proveedor con id°5

