CREATE DATABASE `almacen_bdd`;

USE `almacen_bdd`;

CREATE TABLE `CLIENTE` (
	`COD_CLIENTE` INT(11) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`APELLIDO` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_CLIENTE`)
)
COLLATE='latin1_swedish_ci'
ENGINE=INNODB
;


CREATE TABLE `PRODUCTO` (
	`COD_PRODUCTO` INT NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL,
	`MARCA` VARCHAR(50) NOT NULL,
	`PU` INT NOT NULL,
	PRIMARY KEY (`COD_PRODUCTO`)
)
COLLATE='latin1_swedish_ci'
;


CREATE TABLE `VENTA` (
	`COD_VENTA` INT NOT NULL,
	`COD_CLIENTE` INT NOT NULL,
	`COD_PRODUCTO` INT NOT NULL,
	`CANTIDAD` INT NOT NULL,
	`FECHA_VENTA` DATE NOT NULL,
	PRIMARY KEY (`COD_VENTA`),
	CONSTRAINT `FK_venta_cliente` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`),
	CONSTRAINT `FK_venta_producto` FOREIGN KEY (`COD_PRODUCTO`) REFERENCES `producto` (`COD_PRODUCTO`)
)
COLLATE='latin1_swedish_ci'
;



INSERT INTO `almacen_bdd`.`cliente` (`COD_CLIENTE`, `NOMBRE`, `APELLIDO`) VALUES ('1', 'PEPE', 'MULEIRO');
INSERT INTO `almacen_bdd`.`cliente` (`COD_CLIENTE`, `NOMBRE`, `APELLIDO`) VALUES ('2', 'JUAN', 'GILABERT');

INSERT INTO `almacen_bdd`.`producto` (`COD_PRODUCTO`, `NOMBRE`, `MARCA`, `PU`) VALUES ('1', 'SHAMPOO', 'ELVIVE', '130');
INSERT INTO `almacen_bdd`.`producto` (`COD_PRODUCTO`, `NOMBRE`, `MARCA`, `PU`) VALUES ('2', 'JABON', 'LAVALIMP', '35');

INSERT INTO `almacen_bdd`.`venta` (`COD_VENTA`, `COD_CLIENTE`, `COD_PRODUCTO`, `CANTIDAD`, `FECHA_VENTA`) VALUES ('1', '1', '2', '5', '2020-10-27');

SELECT nombre,marca,pu FROM producto
ORDER BY 1,3 DESC 
WHERE producto.PU = 200
AND producto.MARCA = "CARNEUS"

/*
AND marca <> "CARNEUS" 'Los <> significan desigualdad.'

AND pu IS NULL /o es NOT NULL

|WHERE saludo IN ('Ms.','Mrs.');

-- o su equivalente

SELECT saludo, nombre, apellido

FROM RH.Empleados

WHERE saludo = 'Ms.' , 'Mrs.'; */

