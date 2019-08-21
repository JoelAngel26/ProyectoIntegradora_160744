CREATE DATABASE  IF NOT EXISTS `bd_dawjus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_dawjus`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_dawjus
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `cuenta_fk_admin_idx` (`id_cuenta`),
  CONSTRAINT `cuenta_fk_admin` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Matilde','Reyes','Fuentes','Femenino',2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `idalumno` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(8) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `estatus` enum('Regular','Baja') DEFAULT NULL,
  `cuenta_idcuenta` int(11) NOT NULL,
  `tutor_fam` int(11) DEFAULT NULL,
  PRIMARY KEY (`idalumno`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  KEY `fk_alumno_cuenta_idx` (`cuenta_idcuenta`),
  KEY `fk_alumno_tutor_fam1_idx` (`tutor_fam`),
  CONSTRAINT `fk_alumno_cuenta` FOREIGN KEY (`cuenta_idcuenta`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_tutor_fam1` FOREIGN KEY (`tutor_fam`) REFERENCES `tutor_fam` (`idtutor_fam`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'160271','Julio','Torres','Nicolas','7822097820','La meza','1999-09-10','Masculino','Regular',1,NULL),(2,'160278','Fernando','Morales','Valencia','7864466116','La meza','1998-08-10','Masculino','Regular',11,NULL),(3,'170145','Jose Miguel','Perez','Sampay','7648922101','Xicotepec','1998-09-10','Masculino','Regular',12,NULL),(4,'123456','Juan Carlos','Perez','Meneses','74612033556','La meza','1988-12-18','Masculino','Regular',13,NULL),(5,'160279','Armando','Vazquez','Nicolas','7864466116','La meza','1998-08-10','Masculino','Regular',14,1),(6,'589542','Marcos','Prado','Leyba','746892152','La meza','1997-08-05','Masculino','Regular',15,2),(7,'156412','Ariana','Rosas','Lopez','7761234512','Huachinango, Pueblas','1998-04-17','Femenino','Regular',16,3),(8,'189451','Beatriz','Gaspar','Aranda','','Xicotepec de Juarez','1986-08-15','Femenino','Regular',17,NULL),(9,'160895','Rolando','Rosas','Andres','7864466116','Itzatlan','1998-09-15','Masculino','Regular',23,5),(11,'160854','Josefina','Perez','Leon','76423561452','Xicotepec','1998-07-19','Femenino','Regular',25,6);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nomcarrera` varchar(45) DEFAULT NULL,
  `director_iddirector` int(11) NOT NULL,
  `status` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`idcarrera`),
  KEY `fk_carrera_director1_idx` (`director_iddirector`),
  CONSTRAINT `fk_carrera_director1` FOREIGN KEY (`director_iddirector`) REFERENCES `director` (`iddirector`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Ing. Tecnologias de la informacion',1,'Activo'),(2,'T.S.U Desarrollo Multiplaforma',1,'Activo'),(3,'T.S.U Entornos Virtuales',1,'Activo'),(4,'Redes Virtuales',1,'Inactivo');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `idcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(60) DEFAULT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  `rol_idrol` int(11) NOT NULL,
  PRIMARY KEY (`idcuenta`),
  KEY `fk_cuenta_rol1_idx` (`rol_idrol`),
  CONSTRAINT `fk_cuenta_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'juliotorres.160271@gmail.com','1234',4),(2,'maty.reyes@gmail.com','1234',1),(3,'francisco.garcia@gmail.com','1234',2),(4,'raul.chirinos@gmail.com','1234',3),(10,'esperanza.morales@gmail.com','1234',4),(11,'fer.torres@gmail.com','1234',4),(12,'jose.miguel@gmail.com','1234',4),(13,'juan.perez@gmail.com','1234',4),(14,'armando.torres@gmail.com','1234',4),(15,'marco.juzman@gmail.com','1234',4),(16,'ari.rosas@gmail.com','1234',4),(17,'bety.gaspar@gmail.com','1234',4),(18,'bety.gaspar@gmail.com','1234',2),(21,'rando.santos@gmail.com','1234',2),(22,'rando.santos@gmail.com','1234',2),(23,'rolando_1014@hotmail.com','1234',4),(24,'armando.santost@gmail.com','1234',4),(25,'josefina.perez@gmail.com','1234',4);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `iddirector` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') DEFAULT NULL,
  `cuenta_idcuenta` int(11) NOT NULL,
  PRIMARY KEY (`iddirector`),
  KEY `fk_director_cuenta1_idx` (`cuenta_idcuenta`),
  CONSTRAINT `fk_director_cuenta1` FOREIGN KEY (`cuenta_idcuenta`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'123456','Raul','Chirinos','Lechuga','1996-03-06','Xicotepec','7642134541','Masculino','Activo',4);
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `iddocente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') DEFAULT NULL,
  `tutor` enum('Si','No') DEFAULT NULL,
  `cuenta_idcuenta` int(11) NOT NULL,
  PRIMARY KEY (`iddocente`),
  KEY `fk_docente_cuenta1_idx` (`cuenta_idcuenta`),
  CONSTRAINT `fk_docente_cuenta1` FOREIGN KEY (`cuenta_idcuenta`) REFERENCES `cuenta` (`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'123456','Francisco','Garcia','Romero','1996-06-10','Xicotepec','Masculino','Activo','Si',3),(2,'123456','Beatriz','Gaspar','Aranda','1986-07-04','Xicotepec de Juarez','Femenino','Activo','Si',18),(5,'123456','Randolfo','Santos','Quiroz','1976-07-14','Xicotepec de Juarez','Masculino','Activo','Si',21),(6,'123456','Marco','Santos','Quiroz','1976-07-14','Xicotepec de Juarez','Masculino','Activo','No',22);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_has_materia`
--

DROP TABLE IF EXISTS `docente_has_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente_has_materia` (
  `docente_iddocente` int(11) NOT NULL,
  `materia_idmateria` int(11) NOT NULL,
  PRIMARY KEY (`docente_iddocente`,`materia_idmateria`),
  KEY `fk_docente_has_materia_materia1_idx` (`materia_idmateria`),
  KEY `fk_docente_has_materia_docente1_idx` (`docente_iddocente`),
  CONSTRAINT `fk_docente_has_materia_docente1` FOREIGN KEY (`docente_iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_has_materia_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_has_materia`
--

LOCK TABLES `docente_has_materia` WRITE;
/*!40000 ALTER TABLE `docente_has_materia` DISABLE KEYS */;
INSERT INTO `docente_has_materia` VALUES (1,1);
/*!40000 ALTER TABLE `docente_has_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `grado` varchar(45) DEFAULT NULL,
  `grupo` varchar(45) DEFAULT NULL,
  `sistema` enum('Escolarizado','SemiPresencial') DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') DEFAULT NULL,
  `docente_iddocente` int(11) DEFAULT NULL,
  `carrera_idcarrera` int(11) NOT NULL,
  PRIMARY KEY (`idgrupo`),
  KEY `fk_grupo_docente1_idx` (`docente_iddocente`),
  KEY `fk_grupo_carrera1_idx` (`carrera_idcarrera`),
  CONSTRAINT `fk_grupo_carrera1` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_docente1` FOREIGN KEY (`docente_iddocente`) REFERENCES `docente` (`iddocente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'9','A','Escolarizado','Activo',2,1),(2,'9','B','Escolarizado','Activo',1,1),(3,'9','C','Escolarizado','Activo',6,1),(9,'10','A','Escolarizado','Activo',5,1),(10,'10','B','Escolarizado','Activo',NULL,1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_has_alumno`
--

DROP TABLE IF EXISTS `grupo_has_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_has_alumno` (
  `grupo_idgrupo` int(11) NOT NULL,
  `alumno_idalumno` int(11) NOT NULL,
  PRIMARY KEY (`grupo_idgrupo`,`alumno_idalumno`),
  KEY `fk_grupo_has_alumno_alumno1_idx` (`alumno_idalumno`),
  KEY `fk_grupo_has_alumno_grupo1_idx` (`grupo_idgrupo`),
  CONSTRAINT `fk_grupo_has_alumno_alumno1` FOREIGN KEY (`alumno_idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_has_alumno_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_has_alumno`
--

LOCK TABLES `grupo_has_alumno` WRITE;
/*!40000 ALTER TABLE `grupo_has_alumno` DISABLE KEYS */;
INSERT INTO `grupo_has_alumno` VALUES (2,2),(1,3),(3,4),(1,5),(1,6),(2,7),(2,9),(1,11);
/*!40000 ALTER TABLE `grupo_has_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_has_materia`
--

DROP TABLE IF EXISTS `grupo_has_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_has_materia` (
  `grupo_idgrupo` int(11) NOT NULL,
  `materia_idmateria` int(11) NOT NULL,
  PRIMARY KEY (`grupo_idgrupo`,`materia_idmateria`),
  KEY `fk_grupo_has_materia_materia1_idx` (`materia_idmateria`),
  KEY `fk_grupo_has_materia_grupo1_idx` (`grupo_idgrupo`),
  CONSTRAINT `fk_grupo_has_materia_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_has_materia_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_has_materia`
--

LOCK TABLES `grupo_has_materia` WRITE;
/*!40000 ALTER TABLE `grupo_has_materia` DISABLE KEYS */;
INSERT INTO `grupo_has_materia` VALUES (1,1),(2,1),(1,2),(2,2),(1,4),(2,4);
/*!40000 ALTER TABLE `grupo_has_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justificante`
--

DROP TABLE IF EXISTS `justificante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `justificante` (
  `idjustificante` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_solicitud` datetime DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `motivo` varchar(45) DEFAULT NULL,
  `doc_probatorio` varchar(45) DEFAULT NULL,
  `alumno_idalumno` int(11) NOT NULL,
  `docente_tutor` int(11) NOT NULL,
  `director_iddirector` int(11) NOT NULL,
  `a_tutor` enum('Si','No') DEFAULT NULL,
  `a_director` enum('Si','No') DEFAULT NULL,
  PRIMARY KEY (`idjustificante`),
  KEY `fk_justificante_alumno1_idx` (`alumno_idalumno`),
  KEY `fk_justificante_docente1_idx` (`docente_tutor`),
  KEY `fk_justificante_director1_idx` (`director_iddirector`),
  CONSTRAINT `fk_justificante_alumno1` FOREIGN KEY (`alumno_idalumno`) REFERENCES `alumno` (`idalumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_justificante_director1` FOREIGN KEY (`director_iddirector`) REFERENCES `director` (`iddirector`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_justificante_docente1` FOREIGN KEY (`docente_tutor`) REFERENCES `docente` (`iddocente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justificante`
--

LOCK TABLES `justificante` WRITE;
/*!40000 ALTER TABLE `justificante` DISABLE KEYS */;
/*!40000 ALTER TABLE `justificante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `horas` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `estatus` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`idmateria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Desarrollo de Aplicaciones','45','Materia de Programación','Activo'),(2,'Integradora','45','Materia de complemento','Activo'),(4,'Administración de Proyectos','45','Materia de Proyectos','Activo'),(6,'','','','Activo');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_has_justificante`
--

DROP TABLE IF EXISTS `materia_has_justificante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia_has_justificante` (
  `materia_idmateria` int(11) NOT NULL,
  `justificante_idjustificante` int(11) NOT NULL,
  PRIMARY KEY (`materia_idmateria`,`justificante_idjustificante`),
  KEY `fk_materia_has_justificante_justificante1_idx` (`justificante_idjustificante`),
  KEY `fk_materia_has_justificante_materia1_idx` (`materia_idmateria`),
  CONSTRAINT `fk_materia_has_justificante_justificante1` FOREIGN KEY (`justificante_idjustificante`) REFERENCES `justificante` (`idjustificante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_has_justificante_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_has_justificante`
--

LOCK TABLES `materia_has_justificante` WRITE;
/*!40000 ALTER TABLE `materia_has_justificante` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_has_justificante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(45) DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Activo'),(2,'Docente','Activo'),(3,'Director','Activo'),(4,'Alumno','Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_fam`
--

DROP TABLE IF EXISTS `tutor_fam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_fam` (
  `idtutor_fam` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apaterno` varchar(45) DEFAULT NULL,
  `amaterno` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtutor_fam`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_fam`
--

LOCK TABLES `tutor_fam` WRITE;
/*!40000 ALTER TABLE `tutor_fam` DISABLE KEYS */;
INSERT INTO `tutor_fam` VALUES (1,'Esperanza','Morales','Vazquez','7886133166'),(2,'Armando','Torres','Cruz','74612033556'),(3,'Anastacia','Perez','Meneses','7461235362'),(4,'Anastacia','Andres','Lopez','7461564582'),(5,'Esperanza','Perez','Cruz','7468952145'),(6,'Paco','Perez','Garcia','7648951451');
/*!40000 ALTER TABLE `tutor_fam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_dawjus'
--

--
-- Dumping routines for database 'bd_dawjus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-20 18:22:25
