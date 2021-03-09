

CREATE DATABASE `modeloparcialbiblioteca`;
USE `modeloparcialbiblioteca`;


/*---------------------------------------| Biblioteca |-----------------------------------------------*/
CREATE TABLE `biblioteca` (
	`ID_BIBLIOTECA` INT(11) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DIRECCION` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`FECHA_FUNDACION` DATE NOT NULL,
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`ID_BIBLIOTECA`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


/*---------------------------------------| Bibliotecario |-----------------------------------------------*/
CREATE TABLE `bibliotecario` (
	`ID_BIBLIOTECARIO` INT(11) NOT NULL,
	`ID_BIBLIOTECA` INT(11) NOT NULL,
	`APELLIDO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`FECHA_NACIMIENTO` DATE NOT NULL,
	`FECHA_INICIO_ACTIVIDAD` DATE NOT NULL,
	PRIMARY KEY (`ID_BIBLIOTECARIO`) USING BTREE,
	INDEX `FK_bibliotecario_biblioteca` (`ID_BIBLIOTECA`) USING BTREE,
	CONSTRAINT `FK_bibliotecario_biblioteca` FOREIGN KEY (`ID_BIBLIOTECA`) REFERENCES `modeloparcialbiblioteca`.`biblioteca` (`ID_BIBLIOTECA`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


/*---------------------------------------| Obra |-----------------------------------------------*/
CREATE TABLE `obra` (
	`CLASIFICACION_DECIMAL` INT(11) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`AUTOR` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`CLASIFICACION_DECIMAL`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;



/*---------------------------------------| Ejemplar |-----------------------------------------------*/
CREATE TABLE `ejemplar` (
	`NRO_INVENTARIO` INT(11) NOT NULL,
	`ID_BIBLIOTECA` INT(11) NOT NULL,
	`CLASIFICACION_DECIMAL` INT(11) NOT NULL,
	`ESTADO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`NRO_EJEMPLAR` INT(11) NOT NULL,
	PRIMARY KEY (`NRO_INVENTARIO`) USING BTREE,
	INDEX `FK_ejemplar_biblioteca` (`ID_BIBLIOTECA`) USING BTREE,
	INDEX `FK_ejemplar_obra` (`CLASIFICACION_DECIMAL`) USING BTREE,
	CONSTRAINT `FK_ejemplar_biblioteca` FOREIGN KEY (`ID_BIBLIOTECA`) REFERENCES `modeloparcialbiblioteca`.`biblioteca` (`ID_BIBLIOTECA`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK_ejemplar_obra` FOREIGN KEY (`CLASIFICACION_DECIMAL`) REFERENCES `modeloparcialbiblioteca`.`obra` (`CLASIFICACION_DECIMAL`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


/*---------------------------------------| Socio |-----------------------------------------------*/
CREATE TABLE `socio` (
	`ID_SOCIO` INT(11) NOT NULL,
	`APELLIDO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`NOMBRE` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`DOMICILIO` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`CIUDAD` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'latin1_swedish_ci',
	`TELEFONO` INT(11) NOT NULL,
	`FECHA_NACIMIENTO` DATE NOT NULL,
	PRIMARY KEY (`ID_SOCIO`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;




/*---------------------------------------| Prestamo |-----------------------------------------------*/
CREATE TABLE `prestamo` (
	`ID_PRESTAMO` INT(11) NOT NULL,
	`NRO_INVENTARIO` INT(11) NOT NULL,
	`ID_SOCIO` INT(11) NOT NULL,
	`ID_BIBLIOTECARIO` INT(11) NOT NULL,
	`FECHA_INICIO` DATE NOT NULL,
	`FECHA_FIN` DATE NOT NULL,
	PRIMARY KEY (`ID_PRESTAMO`) USING BTREE,
	INDEX `FK__ejemplar` (`NRO_INVENTARIO`) USING BTREE,
	INDEX `FK__socio` (`ID_SOCIO`) USING BTREE,
	INDEX `FK__bibliotecario` (`ID_BIBLIOTECARIO`) USING BTREE,
	CONSTRAINT `FK__bibliotecario` FOREIGN KEY (`ID_BIBLIOTECARIO`) REFERENCES `modeloparcialbiblioteca`.`bibliotecario` (`ID_BIBLIOTECARIO`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK__ejemplar` FOREIGN KEY (`NRO_INVENTARIO`) REFERENCES `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `FK__socio` FOREIGN KEY (`ID_SOCIO`) REFERENCES `modeloparcialbiblioteca`.`socio` (`ID_SOCIO`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------|         INSERTS        |------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


/*---------OBRAS---*/
INSERT INTO `modeloparcialbiblioteca`.`obra` (`CLASIFICACION_DECIMAL`, `NOMBRE`, `AUTOR`) VALUES ('1', 'El mio sid', 'Homero');
INSERT INTO `modeloparcialbiblioteca`.`obra` (`CLASIFICACION_DECIMAL`, `NOMBRE`, `AUTOR`) VALUES ('2', 'La naranja mecanica', 'Westercire');
INSERT INTO `modeloparcialbiblioteca`.`obra` (`CLASIFICACION_DECIMAL`, `NOMBRE`, `AUTOR`) VALUES ('3', 'El psicoanalista', 'Hausenbach');
INSERT INTO `modeloparcialbiblioteca`.`obra` (`CLASIFICACION_DECIMAL`, `NOMBRE`, `AUTOR`) VALUES ('4', 'El naufrago', 'Viernes');
INSERT INTO `modeloparcialbiblioteca`.`obra` (`CLASIFICACION_DECIMAL`, `NOMBRE`, `AUTOR`) VALUES ('5', 'Surf', 'Richard hayles');


/*---------Bibliotecas---*/
INSERT INTO `modeloparcialbiblioteca`.`biblioteca` (`ID_BIBLIOTECA`, `NOMBRE`, `DIRECCION`, `FECHA_FUNDACION`, `CIUDAD`) VALUES ('1', 'Ciencias publicas', 'Martiniano 911', '2000-01-08', 'Moron');
INSERT INTO `modeloparcialbiblioteca`.`biblioteca` (`ID_BIBLIOTECA`, `NOMBRE`, `DIRECCION`, `FECHA_FUNDACION`, `CIUDAD`) VALUES ('2', 'Artes magicas', 'Bertiniano 311', '2010-08-08', 'Castelar');
INSERT INTO `modeloparcialbiblioteca`.`biblioteca` (`ID_BIBLIOTECA`, `NOMBRE`, `DIRECCION`, `FECHA_FUNDACION`, `CIUDAD`) VALUES ('3', 'Universidad Ituzaingo', 'Juliano 964', '2012-11-08', 'Ituzaingo');
INSERT INTO `modeloparcialbiblioteca`.`biblioteca` (`ID_BIBLIOTECA`, `NOMBRE`, `DIRECCION`, `FECHA_FUNDACION`, `CIUDAD`) VALUES ('4', 'Fundacion riquelme', 'Bertuliano 51', '2000-11-08', 'Haedo');


/*---------Bibliotecarios---*/
INSERT INTO `modeloparcialbiblioteca`.`bibliotecario` (`ID_BIBLIOTECARIO`, `ID_BIBLIOTECA`, `APELLIDO`, `NOMBRE`, `FECHA_NACIMIENTO`, `FECHA_INICIO_ACTIVIDAD`) VALUES ('1', '1', 'Perez', 'Juanicio', '2020-11-08', '2010-07-04');
INSERT INTO `modeloparcialbiblioteca`.`bibliotecario` (`ID_BIBLIOTECARIO`, `ID_BIBLIOTECA`, `APELLIDO`, `NOMBRE`, `FECHA_NACIMIENTO`, `FECHA_INICIO_ACTIVIDAD`) VALUES ('2', '1', 'Juanez', 'Donicio', '2020-11-08', '2015-03-02');
INSERT INTO `modeloparcialbiblioteca`.`bibliotecario` (`ID_BIBLIOTECARIO`, `ID_BIBLIOTECA`, `APELLIDO`, `NOMBRE`, `FECHA_NACIMIENTO`, `FECHA_INICIO_ACTIVIDAD`) VALUES ('3', '2', 'Dominguez', 'Bernacio', '2020-11-08', '2009-01-15');
INSERT INTO `modeloparcialbiblioteca`.`bibliotecario` (`ID_BIBLIOTECARIO`, `ID_BIBLIOTECA`, `APELLIDO`, `NOMBRE`, `FECHA_NACIMIENTO`, `FECHA_INICIO_ACTIVIDAD`) VALUES ('4', '3', 'Gomez', 'Mauricio', '2020-11-08', '2001-12-22');
INSERT INTO `modeloparcialbiblioteca`.`bibliotecario` (`ID_BIBLIOTECARIO`, `ID_BIBLIOTECA`, `APELLIDO`, `NOMBRE`, `FECHA_NACIMIENTO`, `FECHA_INICIO_ACTIVIDAD`) VALUES ('5', '4', 'Perez', 'Ignacio', '2020-11-08', '2018-09-11');

/*---------Ejemplar----*/
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('1', '4', '5', 'Impecable', '50');
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('2', '4', '4', 'Impecable', '3');
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('3', '1', '4', 'Deteriorado', '43');
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('4', '1', '2', 'Roto', '23');
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('5', '2', '1', 'Impecable', '213');
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('6', '2', '3', 'Impecable', '413');
INSERT INTO `modeloparcialbiblioteca`.`ejemplar` (`NRO_INVENTARIO`, `ID_BIBLIOTECA`, `CLASIFICACION_DECIMAL`, `ESTADO`, `NRO_EJEMPLAR`) VALUES ('7', '3', '1', 'Bueno', '53');

/*--------Socio----*/
INSERT INTO `modeloparcialbiblioteca`.`socio` (`ID_SOCIO`, `APELLIDO`, `NOMBRE`, `DOMICILIO`, `CIUDAD`, `TELEFONO`, `FECHA_NACIMIENTO`) VALUES ('1', 'Juanisimo', 'Juan', 'papa 123', 'Buenos aires', '11223344', '2000-01-12');
INSERT INTO `modeloparcialbiblioteca`.`socio` (`ID_SOCIO`, `APELLIDO`, `NOMBRE`, `DOMICILIO`, `CIUDAD`, `TELEFONO`, `FECHA_NACIMIENTO`) VALUES ('2', 'Olimpio', 'Diones', 'caca 123', 'Buenos aires', '21223344', '2003-04-11');
INSERT INTO `modeloparcialbiblioteca`.`socio` (`ID_SOCIO`, `APELLIDO`, `NOMBRE`, `DOMICILIO`, `CIUDAD`, `TELEFONO`, `FECHA_NACIMIENTO`) VALUES ('3', 'Aradia', 'Zenta', 'zapato 123', 'Buenos aires', '31223344', '1987-11-10');
INSERT INTO `modeloparcialbiblioteca`.`socio` (`ID_SOCIO`, `APELLIDO`, `NOMBRE`, `DOMICILIO`, `CIUDAD`, `TELEFONO`, `FECHA_NACIMIENTO`) VALUES ('4', 'Zebato', 'Raul', 'remolacha 123', 'Buenos aires', '41223344', '1994-02-10');
INSERT INTO `modeloparcialbiblioteca`.`socio` (`ID_SOCIO`, `APELLIDO`, `NOMBRE`, `DOMICILIO`, `CIUDAD`, `TELEFONO`, `FECHA_NACIMIENTO`) VALUES ('5', 'Rock', 'Brock', 'ancas 123', 'Buenos aires', '51223344', '1958-11-15');

/*-------Prestamo---*/
INSERT INTO `modeloparcialbiblioteca`.`prestamo` (`ID_PRESTAMO`, `NRO_INVENTARIO`, `ID_SOCIO`, `ID_BIBLIOTECARIO`, `FECHA_INICIO`, `FECHA_FIN`) VALUES ('1', '7', '5', '5', '2020-11-08', '2020-11-08');
INSERT INTO `modeloparcialbiblioteca`.`prestamo` (`ID_PRESTAMO`, `NRO_INVENTARIO`, `ID_SOCIO`, `ID_BIBLIOTECARIO`, `FECHA_INICIO`, `FECHA_FIN`) VALUES ('2', '4', '1', '4', '2020-11-08', '2020-11-08');
INSERT INTO `modeloparcialbiblioteca`.`prestamo` (`ID_PRESTAMO`, `NRO_INVENTARIO`, `ID_SOCIO`, `ID_BIBLIOTECARIO`, `FECHA_INICIO`, `FECHA_FIN`) VALUES ('3', '4', '3', '4', '2020-11-08', '2020-11-08');
INSERT INTO `modeloparcialbiblioteca`.`prestamo` (`ID_PRESTAMO`, `NRO_INVENTARIO`, `ID_SOCIO`, `ID_BIBLIOTECARIO`, `FECHA_INICIO`, `FECHA_FIN`) VALUES ('4', '2', '2', '2', '2020-11-08', '2020-11-08');
INSERT INTO `modeloparcialbiblioteca`.`prestamo` (`ID_PRESTAMO`, `NRO_INVENTARIO`, `ID_SOCIO`, `ID_BIBLIOTECARIO`, `FECHA_INICIO`, `FECHA_FIN`) VALUES ('5', '1', '4', '1', '2020-11-08', '2020-11-08');

/*--------------------------------------Ejercicios-| */


/*1.   Generar el listado completo de ejemplares, indicando su nombre de obra, autor, y en qué biblioteca se encuentra almacenado.*/

SELECT ejemplar.*,obra.NOMBRE,obra.AUTOR,biblioteca.NOMBRE AS 'SE ENCUENTRA EN'
FROM ejemplar,obra,biblioteca
WHERE obra.CLASIFICACION_DECIMAL = ejemplar.CLASIFICACION_DECIMAL
AND biblioteca.ID_BIBLIOTECA = ejemplar.ID_BIBLIOTECA

/*2.   Generar el listado completo de préstamos, indicando el nombre de la obra prestada, el nombre y apellido tanto del socio que lo solicitó, y el bibliotecario que la efectuó*/

SELECT prestamo.ID_PRESTAMO,obra.NOMBRE,socio.NOMBRE,socio.APELLIDO,bibliotecario.NOMBRE,bibliotecario.APELLIDO
FROM prestamo,obra,socio,bibliotecario
WHERE socio.ID_SOCIO = prestamo.ID_SOCIO
AND bibliotecario.ID_BIBLIOTECARIO = prestamo.ID_BIBLIOTECARIO


/*3.   Mostrar los 2 bibliotecarios que más tiempo llevan trabajando en la red de bibliotecas, indicando su nombre y apellido, y en qué biblioteca trabajan. */

SELECT bibliotecario.NOMBRE,bibliotecario.APELLIDO,biblioteca.NOMBRE,DATEDIFF('2020-11-8',bibliotecario.FECHA_INICIO_ACTIVIDAD) AS DIAS
FROM bibliotecario,biblioteca
WHERE biblioteca.ID_BIBLIOTECA = bibliotecario.ID_BIBLIOTECARIO
ORDER BY DIAS DESC
LIMIT 2


/*4.   Calcular el promedio de edad de los socios registrados*/

SELECT TRUNCATE(AVG(DATEDIFF('2020-11-8',socio.FECHA_NACIMIENTO) / 365),0) AS 'EDAD PROMEDIO'
FROM socio

/*5.   Generar el listado de bibliotecas junto con la cantidad de bibliotecarios que trabajan en ella.*/

SELECT biblioteca.NOMBRE,COUNT(bibliotecario.ID_BIBLIOTECA) AS 'CANT. EMPLEADOS'
FROM bibliotecario,biblioteca
WHERE bibliotecario.ID_BIBLIOTECA = biblioteca.ID_BIBLIOTECA
GROUP BY bibliotecario.ID_BIBLIOTECA
ORDER BY COUNT(*) DESC

/*6.   Mostrar el listado de obras (nombre y autor) con la cantidad de ejemplares de cada una.*/

SELECT obra.NOMBRE,obra.AUTOR,COUNT(ejemplar.CLASIFICACION_DECIMAL) AS 'CANT. COPIAS'
FROM obra,ejemplar
WHERE ejemplar.CLASIFICACION_DECIMAL = obra.CLASIFICACION_DECIMAL
GROUP BY ejemplar.CLASIFICACION_DECIMAL
ORDER BY COUNT(*) DESC

/*7.   Generar el listado de obras con la cantidad de préstamos en la que aparece. */
SELECT obra.NOMBRE AS 'NOMBRE OBRA',obra.AUTOR,prestamo.ID_PRESTAMO,COUNT(prestamo.NRO_INVENTARIO) AS 'CANT. PRESTAMOS'
FROM obra,prestamo,ejemplar
WHERE prestamo.NRO_INVENTARIO = ejemplar.NRO_INVENTARIO
AND ejemplar.CLASIFICACION_DECIMAL = obra.CLASIFICACION_DECIMAL
GROUP BY prestamo.NRO_INVENTARIO
ORDER BY COUNT(*) DESC

/*8. Listar las bibliotecas cuyo nombre empieza con C o U; Al igual que el nombre de aquellos empleados cuyo nombre contenga 'nacio' o 'nicio'.  */

SELECT biblioteca.*,bibliotecario.NOMBRE
FROM biblioteca,bibliotecario
WHERE biblioteca.NOMBRE LIKE 'C%' OR biblioteca.NOMBRE LIKE 'U%'
AND bibliotecario.NOMBRE LIKE '%N%CIO'
AND bibliotecario.ID_BIBLIOTECA = biblioteca.ID_BIBLIOTECA








