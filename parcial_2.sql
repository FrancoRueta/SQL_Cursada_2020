CREATE DATABASE `PARCIAL_2`;
USE `PARCIAL_2`;

CREATE TABLE `categoria` (
	`COD_CATEGORIA` INT(11) NOT NULL,
	`CATEGORIA` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_CATEGORIA`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `agencia` (
	`COD_AGENCIA` INT(11) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`PROVINCIA` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	`PAIS` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_AGENCIA`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `transporte` (
	`COD_TRANSPORTE` INT(11) NOT NULL,
	`COD_CATEGORIA` INT(11) NOT NULL,
	`COD_AGENCIA` INT(11) NOT NULL,
	`PU` INT(11) NOT NULL,
	`TRANSPORTE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`MARCA` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_TRANSPORTE`) USING BTREE,
	INDEX `FK_transporte_categoria` (`COD_CATEGORIA`) USING BTREE,
	INDEX `FK_transporte_agencia` (`COD_AGENCIA`) USING BTREE,
	CONSTRAINT `FK_transporte_agencia` FOREIGN KEY (`COD_AGENCIA`) REFERENCES `parcial_2`.`agencia` (`COD_AGENCIA`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_transporte_categoria` FOREIGN KEY (`COD_CATEGORIA`) REFERENCES `parcial_2`.`categoria` (`COD_CATEGORIA`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `empleado` (
	`COD_EMPLEADO` INT(11) NOT NULL,
	`EDAD` INT(11) NOT NULL,
	`FECHA_NAC` DATE NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`APELLIDO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`PROVINCIA` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_EMPLEADO`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `CLIENTE` (
	`COD_CLIENTE` INT NOT NULL,
	`EDAD` INT NOT NULL,
	`FECHA_NAC` DATE NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '',
	`APELLIDO` VARCHAR(50) NOT NULL DEFAULT '',
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '',
	`SEXO` VARCHAR(50) NOT NULL DEFAULT '',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '',
	`PROVINCIA` VARCHAR(50) NOT NULL DEFAULT '',
	`PAIS` VARCHAR(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`COD_CLIENTE`)
)
COLLATE='latin1_swedish_ci'
;


CREATE TABLE `documento` (
	`COD_DOCUMENTO` INT(11) NOT NULL,
	`COD_CLIENTE` INT(11) NOT NULL,
	`NUMERO` INT(11) NOT NULL,
	`TIPO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_DOCUMENTO`) USING BTREE,
	INDEX `FK_documento_cliente` (`COD_CLIENTE`) USING BTREE,
	CONSTRAINT `FK_documento_cliente` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `parcial_2`.`cliente` (`COD_CLIENTE`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `compania` (
	`COD_COMPANIA` INT(11) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`PROVINCIA` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`PAIS` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_COMPANIA`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `alquiler` (
	`COD_ALQUILER` INT(11) NOT NULL,
	`COD_CLIENTE` INT(11) NOT NULL,
	`COD_COMPANIA` INT(11) NOT NULL,
	`COD_EMPLEADO` INT(11) NOT NULL,
	`FECHA_ALQUILER` DATE NOT NULL,
	`COMENTARIOS` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`COD_ALQUILER`) USING BTREE,
	INDEX `FK_alquiler_cliente` (`COD_CLIENTE`) USING BTREE,
	INDEX `FK_alquiler_compania` (`COD_COMPANIA`) USING BTREE,
	INDEX `FK_alquiler_empleado` (`COD_EMPLEADO`) USING BTREE,
	CONSTRAINT `FK_alquiler_cliente` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `parcial_2`.`cliente` (`COD_CLIENTE`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_alquiler_compania` FOREIGN KEY (`COD_COMPANIA`) REFERENCES `parcial_2`.`compania` (`COD_COMPANIA`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_alquiler_empleado` FOREIGN KEY (`COD_EMPLEADO`) REFERENCES `parcial_2`.`empleado` (`COD_EMPLEADO`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `alquiler_detalle` (
	`COD_DETALLE` INT(11) NOT NULL,
	`COD_ALQUILER` INT(11) NOT NULL,
	`COD_TRANSPORTE` INT(11) NOT NULL,
	`CANTIDAD` INT(11) NOT NULL,
	PRIMARY KEY (`COD_DETALLE`) USING BTREE,
	INDEX `FK_alquiler_detalle_alquiler` (`COD_ALQUILER`) USING BTREE,
	INDEX `FK_alquiler_detalle_transporte` (`COD_TRANSPORTE`) USING BTREE,
	CONSTRAINT `FK_alquiler_detalle_alquiler` FOREIGN KEY (`COD_ALQUILER`) REFERENCES `parcial_2`.`alquiler` (`COD_ALQUILER`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_alquiler_detalle_transporte` FOREIGN KEY (`COD_TRANSPORTE`) REFERENCES `parcial_2`.`transporte` (`COD_TRANSPORTE`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

/*----------------------------------------------------------------| Inserts |---------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/



/*-----------------------categoria-*/

INSERT INTO `parcial_2`.`categoria` (`COD_CATEGORIA`, `CATEGORIA`) VALUES ('1', 'PESADO');
INSERT INTO `parcial_2`.`categoria` (`COD_CATEGORIA`, `CATEGORIA`) VALUES ('2', 'LIGERO');
INSERT INTO `parcial_2`.`categoria` (`COD_CATEGORIA`, `CATEGORIA`) VALUES ('3', 'MODERADO');
INSERT INTO `parcial_2`.`categoria` (`COD_CATEGORIA`, `CATEGORIA`) VALUES ('4', 'EXTRA PESADO');


/*-----------------------agencia-*/

INSERT INTO `parcial_2`.`agencia` (`COD_AGENCIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('1', 'Papilus', 'papafrita 432', 'Buenos aires', 'GBA', 'ARGENTINA');
INSERT INTO `parcial_2`.`agencia` (`COD_AGENCIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('2', 'Aguagas', 'camacua 432', 'Cordoba', 'Quechuen', 'ARGENTINA');
INSERT INTO `parcial_2`.`agencia` (`COD_AGENCIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('3', 'Rapiflex', 'pedron 432', 'Buenos aires', 'CABA', 'ARGENTINA');
INSERT INTO `parcial_2`.`agencia` (`COD_AGENCIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('4', 'Zenix u', 'la comarca 432', 'Mendoza', 'zadomen', 'ARGENTINA');
INSERT INTO `parcial_2`.`agencia` (`COD_AGENCIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('5', 'ForrinKi', 'aiquile 432', 'Santiago', 'kaikupi', 'CHILE');


/*----------------------transporte-*/

INSERT INTO `parcial_2`.`transporte` (`COD_TRANSPORTE`, `COD_CATEGORIA`, `COD_AGENCIA`, `PU`, `TRANSPORTE`, `MARCA`) VALUES ('1', '1', '5', '10', 'VIA SATELITE', 'TESLA');
INSERT INTO `parcial_2`.`transporte` (`COD_TRANSPORTE`, `COD_CATEGORIA`, `COD_AGENCIA`, `PU`, `TRANSPORTE`, `MARCA`) VALUES ('2', '4', '5', '700', 'VIA AEREA', 'REXONA');
INSERT INTO `parcial_2`.`transporte` (`COD_TRANSPORTE`, `COD_CATEGORIA`, `COD_AGENCIA`, `PU`, `TRANSPORTE`, `MARCA`) VALUES ('3', '2', '4', '1750', 'VIA AEREA', 'DIA');
INSERT INTO `parcial_2`.`transporte` (`COD_TRANSPORTE`, `COD_CATEGORIA`, `COD_AGENCIA`, `PU`, `TRANSPORTE`, `MARCA`) VALUES ('4', '1', '2', '50', 'VIA MICRO', 'HELLMANS');
INSERT INTO `parcial_2`.`transporte` (`COD_TRANSPORTE`, `COD_CATEGORIA`, `COD_AGENCIA`, `PU`, `TRANSPORTE`, `MARCA`) VALUES ('5', '3', '1', '300', 'VIA MICRO', 'TEREPIN');

/*----------------------empleado-*/

INSERT INTO `parcial_2`.`empleado` (`COD_EMPLEADO`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `CIUDAD`, `PROVINCIA`) VALUES ('1', '27', '2020-11-11', 'Eduardo', 'Perez', 'Cosalibre 242', 'GBA', 'Buenos aires');
INSERT INTO `parcial_2`.`empleado` (`COD_EMPLEADO`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `CIUDAD`, `PROVINCIA`) VALUES ('2', '19', '2019-11-11', 'Selena', 'Gomez', 'mariposa 732', 'zadomen', 'Mendoza');
INSERT INTO `parcial_2`.`empleado` (`COD_EMPLEADO`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `CIUDAD`, `PROVINCIA`) VALUES ('3', '21', '2016-11-11', 'Dama', 'Juanez', 'zapallin 432', 'quechen', 'Cordoba');
INSERT INTO `parcial_2`.`empleado` (`COD_EMPLEADO`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `CIUDAD`, `PROVINCIA`) VALUES ('4', '33', '2011-11-11', 'Candelaria', 'Dominguez', 'peren 6432', 'CABA', 'Buenos aires');
INSERT INTO `parcial_2`.`empleado` (`COD_EMPLEADO`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `CIUDAD`, `PROVINCIA`) VALUES ('5', '30', '2014-11-11', 'Leonardo', 'Guitierrez', 'paranor 132', 'CABA', 'Buenos aires');


/*----------------------compañia-*/

INSERT INTO `parcial_2`.`compania` (`COD_COMPANIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('1', 'Monsters inc', 'callefalsa 515', 'CABA', 'buenos aires', 'argentina');
INSERT INTO `parcial_2`.`compania` (`COD_COMPANIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('2', 'Papanicolau', 'yanimiro 441', 'GBA', 'buenos aires', 'argentina');
INSERT INTO `parcial_2`.`compania` (`COD_COMPANIA`, `NOMBRE`, `DIRECCION`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('3', 'Federrex', 'monroe 323', 'zadomen', 'mendoza', 'argentina');


/*----------------------cliente-*/

INSERT INTO `parcial_2`.`cliente` (`COD_CLIENTE`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `SEXO`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('1', '27', '2020-03-11', 'Agustin', 'Fernandez', 'colombia 361', 'Masculino', 'capicua', 'Salta', 'Argentina');
INSERT INTO `parcial_2`.`cliente` (`COD_CLIENTE`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `SEXO`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('2', '31', '2010-01-11', 'Jesus', 'Denassa Ret', 'zapien 33', 'Masculino', 'GBA', 'Buenos aires', 'Argentina');
INSERT INTO `parcial_2`.`cliente` (`COD_CLIENTE`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `SEXO`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('3', '21', '2010-08-11', 'Pappa', 'Gomez', 'finta 431', 'Masculino', 'laweapo', 'Santiago', 'Chile');
INSERT INTO `parcial_2`.`cliente` (`COD_CLIENTE`, `EDAD`, `FECHA_NAC`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `SEXO`, `CIUDAD`, `PROVINCIA`, `PAIS`) VALUES ('4', '37', '2010-12-11', 'Ricardo', 'Aleman', 'wakanda 278', 'Masculino', 'matienzo', 'Montefideo', 'Uruguay');


/*----------------------documento-*/

INSERT INTO `parcial_2`.`documento` (`COD_DOCUMENTO`, `COD_CLIENTE`, `NUMERO`, `TIPO`) VALUES ('1', '4', '41231321', 'NORMAL');
INSERT INTO `parcial_2`.`documento` (`COD_DOCUMENTO`, `COD_CLIENTE`, `NUMERO`, `TIPO`) VALUES ('2', '2', '49838321', 'NORMAL');
INSERT INTO `parcial_2`.`documento` (`COD_DOCUMENTO`, `COD_CLIENTE`, `NUMERO`, `TIPO`) VALUES ('3', '3', '48694821', 'PIOLA');

/*----------------------alquiler-*/

INSERT INTO `parcial_2`.`alquiler` (`COD_ALQUILER`, `COD_CLIENTE`, `COD_COMPANIA`, `COD_EMPLEADO`, `FECHA_ALQUILER`, `COMENTARIOS`) VALUES ('1', '2', '1', '4', '2020-11-11', 'Todo ok');
INSERT INTO `parcial_2`.`alquiler` (`COD_ALQUILER`, `COD_CLIENTE`, `COD_COMPANIA`, `COD_EMPLEADO`, `FECHA_ALQUILER`, `COMENTARIOS`) VALUES ('2', '3', '3', '2', '2020-11-11', 'Todo ok');
INSERT INTO `parcial_2`.`alquiler` (`COD_ALQUILER`, `COD_CLIENTE`, `COD_COMPANIA`, `COD_EMPLEADO`, `FECHA_ALQUILER`, `COMENTARIOS`) VALUES ('3', '2', '2', '2', '2020-11-11', 'MAL');
INSERT INTO `parcial_2`.`alquiler` (`COD_ALQUILER`, `COD_CLIENTE`, `COD_COMPANIA`, `COD_EMPLEADO`, `FECHA_ALQUILER`, `COMENTARIOS`) VALUES ('4', '3', '2', '1', '2020-11-11', 'Todo ok');
INSERT INTO `parcial_2`.`alquiler` (`COD_ALQUILER`, `COD_CLIENTE`, `COD_COMPANIA`, `COD_EMPLEADO`, `FECHA_ALQUILER`, `COMENTARIOS`) VALUES ('5', '4', '3', '5', '2020-11-11', 'MAL');


/*----------------------detalle alquiler-*/

INSERT INTO `parcial_2`.`alquiler_detalle` (`COD_DETALLE`, `COD_ALQUILER`, `COD_TRANSPORTE`, `CANTIDAD`) VALUES ('1', '1', '5', '150');
INSERT INTO `parcial_2`.`alquiler_detalle` (`COD_DETALLE`, `COD_ALQUILER`, `COD_TRANSPORTE`, `CANTIDAD`) VALUES ('2', '2', '4', '5');
INSERT INTO `parcial_2`.`alquiler_detalle` (`COD_DETALLE`, `COD_ALQUILER`, `COD_TRANSPORTE`, `CANTIDAD`) VALUES ('3', '3', '3', '10');
INSERT INTO `parcial_2`.`alquiler_detalle` (`COD_DETALLE`, `COD_ALQUILER`, `COD_TRANSPORTE`, `CANTIDAD`) VALUES ('4', '4', '2', '50');
INSERT INTO `parcial_2`.`alquiler_detalle` (`COD_DETALLE`, `COD_ALQUILER`, `COD_TRANSPORTE`, `CANTIDAD`) VALUES ('5', '5', '1', '30');



/*----------------------------------------------------------------| ejercicios |---------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/



/*1 - Listar todos los alquileres que están registrados en el sistema donde la compañía que los facilitó sea HERTZ, y la agencia
 que disponibiliza los transportes sea LNG, con fecha de alquiler entre los años 1999 y 2013. ordenar por fecha de alquiler de menor a mayor.*/
 
 SELECT alquiler.*,agencia.NOMBRE
 FROM alquiler,compania,agencia,alquiler_detalle,transporte
 WHERE compania.COD_COMPANIA = alquiler.COD_COMPANIA
 AND compania.NOMBRE = 'Federrex' /*seria HERTZ*/
 AND alquiler_detalle.COD_ALQUILER = alquiler.COD_ALQUILER
 AND alquiler_detalle.COD_TRANSPORTE = transporte.COD_TRANSPORTE
 AND transporte.COD_AGENCIA = agencia.COD_AGENCIA
 AND agencia.NOMBRE = 'Aguagas' /*seria LNG*/
 AND alquiler.FECHA_ALQUILER BETWEEN '1999-01-01' AND '2013-01-01'
 ORDER BY alquiler.FECHA_ALQUILER ASC
 
 
 /*2 - Calcular la edad promedio de los clientes que han alquilado transportes de categoría: Sedan 4 puertas, 
 donde los empleados que lo atendieron correspondan a la provincia de San Juan o Mendoza.*/
 
 SELECT TRUNCATE(AVG(cliente.EDAD),0) AS 'EDAD PROMEDIO'
 FROM cliente,alquiler,empleado,alquiler_detalle,transporte,categoria
 WHERE alquiler.COD_CLIENTE = cliente.COD_CLIENTE
 AND alquiler_detalle.COD_ALQUILER = alquiler.COD_ALQUILER
 AND empleado.COD_EMPLEADO = alquiler.COD_EMPLEADO
 AND transporte.COD_TRANSPORTE = alquiler_detalle.COD_TRANSPORTE
 AND categoria.COD_CATEGORIA = transporte.COD_CATEGORIA
 AND categoria.CATEGORIA = 'PESADO' /*aca iria sedan 4 puertas.*/
 AND empleado.PROVINCIA = 'Mendoza'
 
 
 /*3 - Listar el número de clientes almacenado en el sistema los cuales han alquilado transportes de la 
 Agencia: “Olivieri” donde el transporte haya sido “Camión” con la categoría: 5.000 Toneladas.*/
 
 SELECT COUNT(cliente.COD_CLIENTE) AS 'numero de clientes'
 FROM cliente,alquiler,alquiler_detalle,transporte,agencia,categoria
 WHERE alquiler.COD_CLIENTE = cliente.COD_CLIENTE
 AND alquiler_detalle.COD_ALQUILER = alquiler.COD_ALQUILER
 AND transporte.COD_TRANSPORTE = alquiler_detalle.COD_TRANSPORTE
 AND agencia.COD_AGENCIA = transporte.COD_AGENCIA
 AND categoria.COD_CATEGORIA = transporte.COD_CATEGORIA
 AND agencia.NOMBRE = 'ForrinKi' /*seria olivieri*/
 AND transporte.TRANSPORTE = 'VIA SATELITE' /*seria camion*/
 AND categoria.CATEGORIA = 'PESADO' /*seria 5.000 toneladas*/
 
 
 
 
 /*4 - Listar los 3 empleados de mayor edad que trabajan en la compañía, 
 que han atendido a clientes con DNI mayor a 28.000.000, de la provincia de Chubut.*/
 
 SELECT empleado.NOMBRE,empleado.EDAD
 FROM empleado,alquiler,cliente,documento
 WHERE alquiler.COD_CLIENTE = cliente.COD_CLIENTE
 AND alquiler.COD_EMPLEADO = empleado.COD_EMPLEADO
 AND documento.COD_CLIENTE = cliente.COD_CLIENTE
 AND documento.NUMERO > 28000000
 AND cliente.PROVINCIA = 'Buenos Aires' /*Seria chubut*/
 ORDER BY empleado.EDAD DESC
 LIMIT 3
 
 
 
 










