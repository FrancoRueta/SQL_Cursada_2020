CREATE DATABASE `tp_bdd_28_9`;
USE `tp_bdd_28_9`;

CREATE TABLE `cliente` (
	`ID_CLIENTE` INT(11) NOT NULL,
	`NOMBRE_COMPAÑIA` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`NOMBRE_CONTACTO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CARGO_CONTACTO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`REGION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CODPOSTAL` INT(11) NOT NULL DEFAULT '0',
	`PAIS` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	`TELEFONO` INT(11) NOT NULL DEFAULT '0',
	`FAX` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`ID_CLIENTE`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `compania_envios` (
	`ID_COMPANIA_ENVIOS` INT(11) NOT NULL,
	`NOMBRE_COMPANIA` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`TELEFONO` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`ID_COMPANIA_ENVIOS`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `empleado` (
	`ID_EMPLEADO` INT(11) NOT NULL,
	`APELLIDOS` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CARGO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`TRATAMIENTO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`FECHA_NACIMIENTO` DATE NOT NULL,
	`FECHA_CONTRATACION` DATE NOT NULL,
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`REGION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`COD_POSTAL` INT(11) NOT NULL DEFAULT '0',
	`PAIS` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`EXTENSION` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`TEL_DOMICILIO` INT(11) NOT NULL DEFAULT '0',
	`FOTO` LONGTEXT NOT NULL DEFAULT '0' COLLATE 'utf8mb4_bin',
	`NOTAS` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	`JEFE` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`ID_EMPLEADO`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `producto` (
	`ID_PRODUCTO` INT(11) NOT NULL DEFAULT '0',
	`NOMBRE_PRODUCTO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CANTIDAD_X_UNIDAD` INT(11) NOT NULL DEFAULT '0',
	`PRECIO_UNIDAD` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`ID_PRODUCTO`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `pedido` (
	`ID_PEDIDO` INT(11) NOT NULL,
	`ID_CLIENTE` INT(11) NOT NULL,
	`ID_EMPLEADO` INT(11) NOT NULL,
	`ID_COMPANIA_ENVIOS` INT(11) NOT NULL,
	`FECHA_PEDIDO` DATE NOT NULL,
	`FECHA_ENTREGA` DATE NOT NULL,
	`FECHA_ENVIO` DATE NOT NULL,
	`FORMA_ENVIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CARGO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DESTINATARIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DIRECCION_DESTINATARIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD_DESTINATARIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`REGION_DESTINATARIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`PAIS_DESTINATARIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`COD_POSTAL_DESTINATARIO` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`ID_PEDIDO`) USING BTREE,
	INDEX `FK_pedido_cliente` (`ID_CLIENTE`) USING BTREE,
	INDEX `FK_pedido_empleado` (`ID_EMPLEADO`) USING BTREE,
	INDEX `FK_pedido_compania_envios` (`ID_COMPANIA_ENVIOS`) USING BTREE,
	CONSTRAINT `FK_pedido_cliente` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_pedido_compania_envios` FOREIGN KEY (`ID_COMPANIA_ENVIOS`) REFERENCES `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_pedido_empleado` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `detalle_pedido` (
	`DETALLE_PEDIDO` INT(11) NOT NULL,
	`ID_PEDIDO` INT(11) NOT NULL,
	`ID_PRODUCTO` INT(11) NOT NULL,
	`PRECIO_UNIDAD` INT(11) NOT NULL,
	`CANTIDAD` INT(11) NOT NULL,
	`DESCUENTO` INT(11) NOT NULL,
	PRIMARY KEY (`DETALLE_PEDIDO`) USING BTREE,
	INDEX `FK_detalle_pedido_producto` (`ID_PRODUCTO`) USING BTREE,
	INDEX `FK_detalle_pedido_pedido` (`ID_PEDIDO`) USING BTREE,
	CONSTRAINT `FK_detalle_pedido_pedido` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_detalle_pedido_producto` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;



/*///////////////////////////////////////// populando tabla ///////////////////////////////////////////////////*/

/*clientes*/
INSERT INTO `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`, `NOMBRE_COMPAÑIA`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `DIRECCION`, `CIUDAD`, `REGION`, `CODPOSTAL`, `PAIS`, `TELEFONO`, `FAX`) VALUES ('1', 'arcor', 'eduardo', 'jefe', 'caca 333', 'cordoba', 'norte', '2162', 'ARGENTINA', '46241111', '453');
INSERT INTO `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`, `NOMBRE_COMPAÑIA`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `DIRECCION`, `CIUDAD`, `REGION`, `CODPOSTAL`, `PAIS`, `TELEFONO`, `FAX`) VALUES ('2', 'serenisima', 'pepe', 'empleado', 'sonido 1643', 'buenos aires', 'norte', '4122', 'ARGENTINA', '16241111', '323');
INSERT INTO `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`, `NOMBRE_COMPAÑIA`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `DIRECCION`, `CIUDAD`, `REGION`, `CODPOSTAL`, `PAIS`, `TELEFONO`, `FAX`) VALUES ('3', 'milkaut', 'juan', 'empleado', 'sorora 323', 'buenos aires', 'sur', '2122', 'ARGENTINA', '36241111', '653');
INSERT INTO `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`, `NOMBRE_COMPAÑIA`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `DIRECCION`, `CIUDAD`, `REGION`, `CODPOSTAL`, `PAIS`, `TELEFONO`, `FAX`) VALUES ('4', 'arcor', 'raul', 'empleado', 'dqwe 1234', 'cordoba', 'sur', '9722', 'ARGENTINA', '46241111', '151');
INSERT INTO `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`, `NOMBRE_COMPAÑIA`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `DIRECCION`, `CIUDAD`, `REGION`, `CODPOSTAL`, `PAIS`, `TELEFONO`, `FAX`) VALUES ('5', 'arcor', 'laura', 'jefe', 'avenida qwe 273', 'cordoba', 'este', '2322', 'ARGENTINA', '56241111', '123');
INSERT INTO `tp_bdd_28_9`.`cliente` (`ID_CLIENTE`, `NOMBRE_COMPAÑIA`, `NOMBRE_CONTACTO`, `CARGO_CONTACTO`, `DIRECCION`, `CIUDAD`, `REGION`, `CODPOSTAL`, `PAIS`, `TELEFONO`, `FAX`) VALUES ('6', 'fregaro', 'juana', 'empleado', 'color 13', 'buenos aires', 'oeste', '3222', 'ARGENTINA', '66241111', '163');

/*envios*/
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('1', 'repartos pepelin', '43245323');
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('2', 'repartos juanete', '43234513');
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('3', 'enviosYA', '45123323');
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('4', 'rappi', '43216323');
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('5', 'el superbus', '52316323');
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('6', 'zarate envios', '15374523');
INSERT INTO `tp_bdd_28_9`.`compania_envios` (`ID_COMPANIA_ENVIOS`, `NOMBRE_COMPANIA`, `TELEFONO`) VALUES ('7', 'socotroco plus', '43213323');

/*productos*/
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('1', 'yerba', '10', '60');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('2', 'cigarros', '5', '110');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('3', 'azucar', '20', '35');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('4', 'carne', '10', '100');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('5', 'sushi', '5', '250');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('6', 'arroz', '5', '250');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('7', 'caramelo', '200', '5');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('8', 'mentitas', '50', '15');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('9', 'sugus', '20', '70');
INSERT INTO `tp_bdd_28_9`.`producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `CANTIDAD_X_UNIDAD`, `PRECIO_UNIDAD`) VALUES ('10', 'pera', '10', '100');

/*empleados*/
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('1', 'perez', 'juan', 'gerente', 'señorito', '1964-11-04', '2004-11-04', 'Laprida 11', 'buenos aires', 'oeste', '1231', 'argentina', 'ext', '11624344', '10', 'ninguno');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('2', 'silva', 'agustin', 'empleado', 'señor', '1977-11-04', '2015-11-04', 'Monroe 561', 'cordoba', 'norte', '3231', 'argentina', 'ext', '43243344', '16', 'juan perez');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('3', 'rodriguez', 'rodrigo', 'empleado', 'señor', '1984-11-04', '2009-11-04', 'Brandsen 911', 'cordoba', 'norte', '4131', 'argentina', 'ext', '11544344', '4', 'juan perez');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('4', 'perez', 'minerva', 'gerenta', 'señora', '1984-11-04', '2017-11-04', 'Carabobo 421', 'buenos aires', 'sur', '1131', 'argentina', 'text', '42323344', '1', 'ninguno');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('5', 'dominguez', 'abril', 'empleada', 'señora', '1986-11-04', '2016-11-04', 'Mansilla 911', 'buenos aires', 'sur', '1421', 'argentina', 'text', '11113344', '3', 'ninguno');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('6', 'pastor', 'antonella', 'gerenta', 'señorita', '1994-11-04', '2016-11-04', 'Corrientes 761', 'santa fe', 'oeste', '4431', 'argentina', 'text', '73456344', '3', 'eduardo');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('7', 'lisnu', 'martina', 'barrendera', 'señorita', '2001-11-04', '2010-11-04', 'Rawson 441', 'tierra del fuego', 'este', '3231', 'argentina', 'text', '11324344', '4', 'agustin');
INSERT INTO `tp_bdd_28_9`.`empleado` (`ID_EMPLEADO`, `APELLIDOS`, `NOMBRE`, `CARGO`, `TRATAMIENTO`, `FECHA_NACIMIENTO`, `FECHA_CONTRATACION`, `DIRECCION`, `CIUDAD`, `REGION`, `COD_POSTAL`, `PAIS`, `EXTENSION`, `TEL_DOMICILIO`, `NOTAS`, `JEFE`) VALUES ('8', 'ricardez', 'ricardo', 'corresponsal', 'señor', '2000-11-04', '2011-11-04', 'Cochina 91', 'tierra del fuego', 'oeste', '6531', 'argentina', 'text', '11654244', '7', 'ninguno');


/*pedidos*/
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('1', '1', '7', '1', '2020-11-02', '2020-11-03', '2020-11-04', 'omnibus', '500', 'raul perez', 'casanova 1191', 'corrientes', 'sur', 'argentina', '1323');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('2', '2', '1', '2', '2012-10-02', '2020-11-03', '2020-11-04', 'omnibus', '400', 'sol perez', 'pasanova 1191', 'mendoza', 'oeste', 'argentina', '2233');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('3', '3', '2', '3', '2020-09-02', '2020-11-03', '2020-11-04', 'omnibus', '800', 'ramiro suarez', 'zetanova 1191', 'santa fe', 'sur', 'argentina', '3323');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('4', '4', '3', '7', '2014-08-02', '2020-11-03', '2020-11-04', 'tren', '1200', 'luciano perez', 'ollenova 1191', 'santiago', 'oeste', 'chile', '4323');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('5', '5', '4', '5', '2020-07-02', '2020-11-03', '2020-11-04', 'omnibus', '1500', 'federico suarez', 'qwertynova 1191', 'santiago', 'sur', 'chile', '5323');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('6', '6', '4', '6', '2017-06-02', '2020-11-03', '2020-11-04', 'avion', '1300', 'augusto perez', 'isinova 1191', 'bogota', 'este', 'colombia', '6323');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('7', '3', '7', '7', '2020-05-02', '2020-11-03', '2020-11-04', 'avion', '1000', 'zoe dominguez', 'benova 1191', 'la paz', 'norte', 'peru', '7323');
INSERT INTO `tp_bdd_28_9`.`pedido` (`ID_PEDIDO`, `ID_CLIENTE`, `ID_EMPLEADO`, `ID_COMPANIA_ENVIOS`, `FECHA_PEDIDO`, `FECHA_ENTREGA`, `FECHA_ENVIO`, `FORMA_ENVIO`, `CARGO`, `DESTINATARIO`, `DIRECCION_DESTINATARIO`, `CIUDAD_DESTINATARIO`, `REGION_DESTINATARIO`, `PAIS_DESTINATARIO`, `COD_POSTAL_DESTINATARIO`) VALUES ('8', '1', '8', '1', '2019-04-02', '2020-11-03', '2020-11-04', 'avion', '300', 'juan perez', 'caiman 1191', 'santiago', 'norte', 'chile', '8323');

/*detalle envio*/
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('1', '1', '2', '50', '5000', '0');
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('2', '2', '6', '300', '10', '25');
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('3', '3', '6', '1000', '300', '0');
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('4', '4', '3', '1500', '250', '0');
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('5', '5', '4', '2500', '100', '50');
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('6', '6', '8', '500', '3000', '0');
INSERT INTO `tp_bdd_28_9`.`detalle_pedido` (`DETALLE_PEDIDO`, `ID_PEDIDO`, `ID_PRODUCTO`, `PRECIO_UNIDAD`, `CANTIDAD`, `DESCUENTO`) VALUES ('7', '8', '10', '10', '4000', '100');

ALTER TABLE `empleado`
	CHANGE COLUMN `NOMBRE` `NOMBRE_EMPLEADO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `ID_EMPLEADO`;


ALTER TABLE `empleado`
	CHANGE COLUMN `APELLIDOS` `APELLIDOS_EMPLEADO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci' AFTER `ID_EMPLEADO`;

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*//////////////////////////////////////////////////////////////////// PUNTOS DE TAREA /////////////////////////////////////////////////////////////////////////**/


/*a Listar todos los PEDIDOS (Nombre de Producto y Cantidad) solicitados por los clientes listando de ellos Nombre, Cargo y País y de los empleados
 que llevaron a cabo dicha venta (Apellido, Nombre, Cargo, Ciudad y País) ordenarlos y agruparlas por ciudad de los clientes de manera descendente.*/
 
SELECT cliente.NOMBRE_CONTACTO,cliente.CARGO_CONTACTO,empleado.NOMBRE_EMPLEADO,empleado.CARGO,pedido.ID_PEDIDO,pedido.DESTINATARIO
FROM pedido,cliente,producto,empleado
WHERE cliente.ID_CLIENTE = pedido.ID_CLIENTE
AND empleado.ID_EMPLEADO = pedido.ID_EMPLEADO
ORDER BY cliente.CIUDAD DESC
 
 
 /*b.0 Listar todos los datos de los clientes que viven en la ciudad de Mendoza y de los empleados que han atendido a dichos clientes pero que viven en la ciudad de Córdoba.*/
 
SELECT cliente.*,empleado.*
FROM cliente,empleado,pedido
WHERE pedido.ID_EMPLEADO = empleado.ID_EMPLEADO
AND pedido.ID_CLIENTE = cliente.ID_CLIENTE
AND empleado.CIUDAD = 'cordoba'
AND cliente.CIUDAD = 'mendoza'

/*b.1 Calcular la edad promedio de los empleados que viven en la Ciudad de Salta, que el cargo empiece 
con “J” y que la fecha de nacimiento este entre los años “1956 a 1982” y que hayan atendido a clientes que viven en Santa Fe.*/
SELECT AVG(empleado.COD_POSTAL) /*EL ATRIBUTO EDAD NO EXISTE.*/
FROM cliente,empleado,pedido
WHERE empleado.CARGO LIKE 'J%'
AND empleado.FECHA_NACIMIENTO BETWEEN '1956.01.01' AND '1982.01.01'
AND empleado.ID_EMPLEADO = pedido.ID_EMPLEADO
AND cliente.ID_CLIENTE = pedido.ID_CLIENTE
AND cliente.CIUDAD = 'santa fe'









 /*
 SELECT AVG(EMPLEADO.EDAD)
FROM EMPLEADO, PEDIDO, CLIENTE
WHERE cliente.ID_CLIENTE = pedido.ID_CLIENTE
AND empleado.ID_EMPLEADO = pedido.ID_EMPLEADO
AND empleado.CIUDAD = 'SALTA'
AND empleado.CARGO LIKE 'J%'
*/
 
 
 /*
 select pedido.FECHA_PEDIDO, pedido.DESTINATARIO, pedido.ID_CLIENTE,
detalle_pedido.CANTIDAD
from pedido, detalle_pedido
where pedido.ID_PEDIDO = detalle_pedido.ID_PEDIDO
order by detalle_pedido.cantidad desc
limit 3
*/
 
 
 
 
 
 
 
 
 
 