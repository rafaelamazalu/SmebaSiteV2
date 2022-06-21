CREATE DATABASE  IF NOT EXISTS `wamasdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wamasdb`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: wamasdb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barrera`
--

DROP TABLE IF EXISTS `barrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrera` (
  `idbarrera` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`idbarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrera`
--

LOCK TABLES `barrera` WRITE;
/*!40000 ALTER TABLE `barrera` DISABLE KEYS */;
INSERT INTO `barrera` VALUES (1,'Imágenes ricas que carecen de un texto equivalente'),(2,'Videos sin subtítulos'),(3,'El color es necesario'),(4,'Marcos innaccesibles'),(5,'Contenido móvil'),(6,'Mapas de imágenes sin texto'),(7,'Imágenes funcionales embebidas en el fondo'),(8,'Imágenes funcionales que carecen de texto'),(9,'Enlaces genéricos'),(10,'Enlaces ambiguos'),(11,'Menús dinámicos en Javascript'),(12,'Eventos de mouse'),(13,'Objetos opacos'),(14,' Trampas de teclado'),(15,'Arte ASCII'),(16,'Títulos espaceados'),(17,'Demasiados enlaces'),(18,'Formulario con redirección'),(19,'Nuevas ventanas'),(20,'Formularios sin etiquetas LABEL'),(21,'Formularios que están mal secuenciados'),(22,'Tiempos demasiados cortos'),(23,'Tablas de datos que no tienen relaciones estructurales'),(24,'Tablas de disposición'),(25,'Páginas sin títulos'),(26,'Marcos sin títulos'),(27,'Lenguaje de marcado'),(28,'Sin encabezados de página'),(29,'Imágenes usadas como títulos'),(30,'Sin atajos de teclado'),(31,'Saltar enlaces no implementados'),(32,'Ventana sin controles de navegador'),(33,'Cambios Dinámicos'),(34,'Imágenes ricas que están mal posicionadas'),(35,'Contraste visual insuficiente'),(36,'Mapas de imagen'),(37,'Controles de formulario rellenados automáticamente'),(38,'Ventanas solapadas'),(39,'Texto no redimensionable'),(40,'Disposición de contenido inflexible'),(41,'Página con contenido intermitente o parpadeante'),(42,'Validación de campos');
/*!40000 ALTER TABLE `barrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barreras_estereotipos`
--

DROP TABLE IF EXISTS `barreras_estereotipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barreras_estereotipos` (
  `idbarrera` int(11) NOT NULL,
  `idestereotipo` int(11) NOT NULL,
  `idwcag` int(11) NOT NULL,
  PRIMARY KEY (`idbarrera`,`idestereotipo`,`idwcag`),
  KEY `fk_estereotipoid_idx` (`idestereotipo`),
  KEY `fk_wcagid_idx` (`idwcag`),
  CONSTRAINT `fk_barreraid` FOREIGN KEY (`idbarrera`) REFERENCES `barrera` (`idbarrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_estereotipoid` FOREIGN KEY (`idestereotipo`) REFERENCES `estereotipo` (`idestereotipo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_wcagid` FOREIGN KEY (`idwcag`) REFERENCES `wcag` (`idwcag`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barreras_estereotipos`
--

LOCK TABLES `barreras_estereotipos` WRITE;
/*!40000 ALTER TABLE `barreras_estereotipos` DISABLE KEYS */;
INSERT INTO `barreras_estereotipos` VALUES (3,2,13),(3,2,17),(4,2,43),(4,2,77),(5,2,35),(5,2,42),(6,2,1),(7,2,1),(7,2,11),(8,2,1),(8,2,21),(11,2,30),(11,2,32),(11,2,77),(17,2,52),(18,2,34),(18,2,69),(22,2,34),(22,2,37),(22,2,69),(29,2,21),(30,2,43),(31,2,43),(32,2,43),(32,2,45),(33,2,70),(33,2,71),(33,2,72),(33,2,77),(34,2,11),(34,2,12),(35,2,19),(35,2,22),(35,2,27),(36,2,1),(38,2,69),(39,2,20),(39,2,26),(40,2,20),(40,2,26),(1,3,11),(1,3,12),(3,3,13),(3,3,17),(4,3,43),(4,3,77),(35,3,19),(35,3,22),(35,3,27),(41,4,40),(41,4,41),(1,5,11),(1,5,12),(3,5,13),(3,5,17),(4,5,43),(4,5,77),(35,5,19),(35,5,22),(35,5,27),(1,6,1),(2,6,2),(2,6,3),(2,6,4),(2,6,5),(2,6,6),(2,6,7),(2,6,8),(2,6,9),(2,6,10),(2,6,69),(3,6,13),(3,6,17),(4,6,43),(4,6,77),(5,6,35),(5,6,42),(6,6,1),(7,6,1),(7,6,11),(8,6,1),(8,6,21),(9,6,46),(9,6,51),(10,6,46),(10,6,51),(11,6,30),(11,6,32),(11,6,77),(12,6,30),(12,6,77),(13,6,1),(14,6,31),(14,6,33),(15,6,1),(16,6,21),(16,6,25),(17,6,52),(18,6,34),(18,6,69),(19,6,65),(19,6,69),(20,6,11),(20,6,15),(20,6,49),(20,6,55),(21,6,12),(21,6,45),(22,6,34),(22,6,37),(23,6,11),(24,6,11),(24,6,12),(25,6,44),(26,6,43),(26,6,77),(27,6,60),(27,6,61),(28,6,11),(28,6,52),(29,6,21),(30,6,43),(31,6,43),(32,6,43),(32,6,45),(33,6,70),(33,6,71),(33,6,72),(33,6,77),(1,7,1),(2,7,2),(2,7,3),(2,7,4),(2,7,5),(2,7,6),(2,7,7),(2,7,8),(2,7,9),(2,7,10),(4,7,43),(4,7,77),(5,7,35),(5,7,42),(6,7,1),(7,7,1),(7,7,11),(8,7,1),(8,7,21),(9,7,46),(9,7,51),(10,7,46),(10,7,51),(11,7,30),(11,7,32),(11,7,77),(12,7,30),(12,7,77),(13,7,1),(14,7,31),(14,7,33),(16,7,21),(16,7,25),(19,7,65),(19,7,69),(25,7,44),(26,7,43),(26,7,77),(29,7,21),(37,7,16),(37,7,18),(37,7,31),(37,7,35),(37,7,77),(42,7,18),(42,7,31),(42,7,35),(42,7,77);
/*!40000 ALTER TABLE `barreras_estereotipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionario` (
  `idcuestionario` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `usalentes` bit(1) DEFAULT NULL,
  `ididioma` int(11) NOT NULL,
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sistemaoperativo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lectorpantalla` bit(1) DEFAULT NULL,
  `magnificador` bit(1) DEFAULT NULL,
  `reconocedorvoz` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idcuestionario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `ididioma_UNIQUE` (`ididioma`),
  CONSTRAINT `fk_idioma` FOREIGN KEY (`ididioma`) REFERENCES `idioma` (`ididioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` VALUES (5,1,'2019-08-18 00:00:00',_binary '',3,'Firefox 68.0','Ubuntu',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estereotipo`
--

DROP TABLE IF EXISTS `estereotipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estereotipo` (
  `idestereotipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`idestereotipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estereotipo`
--

LOCK TABLES `estereotipo` WRITE;
/*!40000 ALTER TABLE `estereotipo` DISABLE KEYS */;
INSERT INTO `estereotipo` VALUES (1,'Visión normal','El usuario no presenta ninguna discapacidad.'),(2,'Deficiencia de agudeza visual','El usuario tiene problemas para identificar las letras del test de snellen. La deficiencia puede tener varios niveles, dependiendo del tamaño de la letra que el usuario no puede distinguir.'),(3,'Daltonismo (rojo-verde)','El usuario tiene dificultad para diferenciar el color rojo del verde. Puede ser por insensibilidad al color rojo (protanopia o protanomalía) o insensibilidad al color  verde (deuteranopia y deuteranomalía)'),(4,'Epilepsia Fotosensible','El usuario puede combulsionar ante estimulos parpadeantes.'),(5,'Monocromatismo','El usuario no distingue ningún color. Ve las imágenes en blanco, negro y tonos de gris.'),(6,'Ceguera','El usuario no responde a estímulos visuales'),(7,'Tecnología limitante','el usuario utiliza tecnológia limitante que le causa problemas para identificar imágenes, colores, etc.');
/*!40000 ALTER TABLE `estereotipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evalua`
--

DROP TABLE IF EXISTS `evalua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evalua` (
  `idevalua` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `uri` varchar(100) NOT NULL,
  `totalevaluado` int(11) DEFAULT '0',
  `totalerrores` int(11) DEFAULT '0',
  PRIMARY KEY (`idevalua`),
  KEY `fk_usuarioid_idx` (`idusuario`),
  CONSTRAINT `fk_usuarioid` FOREIGN KEY (`idusuario`) REFERENCES `usuario_estereotipado` (`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evalua`
--

LOCK TABLES `evalua` WRITE;
/*!40000 ALTER TABLE `evalua` DISABLE KEYS */;
/*!40000 ALTER TABLE `evalua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `abreviatura` varchar(3) NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Femenino','F'),(2,'Masculino','M');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_pregunta`
--

DROP TABLE IF EXISTS `grupo_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_pregunta` (
  `idgrupopregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idgrupopregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_pregunta`
--

LOCK TABLES `grupo_pregunta` WRITE;
/*!40000 ALTER TABLE `grupo_pregunta` DISABLE KEYS */;
INSERT INTO `grupo_pregunta` VALUES (1,'Cuestionario 1'),(2,'Cuestionario 2'),(3,'Cuestionario 3'),(4,'sin cuestionari asignado');
/*!40000 ALTER TABLE `grupo_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `ididioma` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  PRIMARY KEY (`ididioma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Spanish (España)','es-ES'),(2,'Español de Argentina','es-AR'),(3,'Ingles/Estados Unidos','en-US');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `textopredefinido` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rutaimagen` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sentenciapredeterminada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sentenciapredeterminada_asl` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `idtiporespuesta` int(11) NOT NULL,
  `idgrupopregunta` int(11) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_pregunta_grupo_pregunta_idx` (`idgrupopregunta`),
  KEY `fk_pregunta_tipo_respuesta_idx` (`idtiporespuesta`),
  CONSTRAINT `fk_pregunta_grupo_pregunta` FOREIGN KEY (`idgrupopregunta`) REFERENCES `grupo_pregunta` (`idgrupopregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pregunta_tipo_respuesta` FOREIGN KEY (`idtiporespuesta`) REFERENCES `tipo_respuesta` (`idtiporespuesta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'¿Declara ceguera total?','','declaraCeguera(1)','{\"predicate\" : \"declara_ceguera\", \"value\":1}',4,1),(2,'¿Declara ceguera total?','','declaraCeguera(1)','{\"predicate\" : \"declara_ceguera\", \"value\" :1}',4,2),(3,'¿Declara ceguera total?','','declaraCeguera(1)','{\"predicate\": \"declara_ceguera\", \"value\":1}',4,3),(6,'¿Declara epilepsia fotosensible?','','declaraPoseerEpilepsiaFotosensible(1)','{\"predicate\":\"declara_epilepsia_fotosensible\" , \"value\":1}',4,1),(7,'¿Declara epilepsia fotosensible?','','declaraPoseerEpilepsiaFotosensible(1)','{\"predicate\":\"declara_epilepsia_fotosensible\" , \"value\":1}',4,2),(8,'¿Declara epilepsia fotosensible?','','declaraPoseerEpilepsiaFotosensible(1)','{\"predicate\":\"declara_epilepsia_fotosensible\" , \"value\":1}',4,3),(11,'¿Qué letra está seleccionada?','imagenes/snellen_1.jpg','','',1,1),(12,'¿Qué letra está seleccionada?','imagenes/snellen_2.jpg','','',1,1),(13,'¿Qué letra está seleccionada?','imagenes/snellen_3.jpg','','',1,1),(14,'¿Qué letra está seleccionada?','imagenes/snellen_4.jpg','','',1,1),(15,'¿Qué letra está seleccionada?','imagenes/snellen_5.jpg','','',1,1),(16,'¿Qué letra está seleccionada?','imagenes/snellen_6.jpg','','',1,1),(17,'¿Qué letra está seleccionada?','imagenes/snellen_7.jpg','','',1,1),(19,'¿Qué número ve?','images/Plate2.jpg','ishihara2(1,1)','{\"predicate\" : \"ishihara2\", \"value1\":1, \"value2\":1}',1,1),(20,'¿Qué número ve?','images/Plate3.jpg','ishihara3(1,1)','{\"predicate\" : \"ishihara3\", \"value1\":1, \"value2\":1}',1,1),(21,'¿Qué número ve?','images/Plate4.jpg','ishihara4(1,1)','{\"predicate\" : \"ishihara4\", \"value1\":1, \"value2\":1}',1,1),(22,'¿Qué número ve?','images/Plate5.jpg','ishihara5(1,1)','{\"predicate\" : \"ishihara5\", \"value1\":1, \"value2\":1}',1,1),(23,'¿Qué número ve?','images/Plate6.jpg','ishihara6(1,1)','{\"predicate\" : \"ishihara6\", \"value1\":1, \"value2\":1}',1,1),(24,'¿Qué número ve?','images/Plate7.jpg','ishihara7(1,1)','{\"predicate\" : \"ishihara7\", \"value1\":1, \"value2\":1}',1,1),(25,'¿Qué número ve?','images/Plate8.jpg','ishihara8(1,1)','{\"predicate\" : \"ishihara8\", \"value1\":1, \"value2\":1}',1,1),(26,'¿Qué número ve?','images/Plate9.jpg','ishihara9(1,1)','{\"predicate\" : \"ishihara9\", \"value1\":1, \"value2\":1}',1,1),(27,'¿Qué número ve?','images/Plate10.jpg','ishihara10(1,1)','{\"predicate\" : \"ishihara10\", \"value1\":1, \"value2\":1}',1,1),(28,'¿Qué número ve?','images/Plate11.jpg','ishihara11(1,1)','{\"predicate\" : \"ishihara11\", \"value1\":1, \"value2\":1}',1,1),(29,'¿Qué número ve?','images/Plate12.jpg','ishihara12(1,1)','{\"predicate\" : \"ishihara12\", \"value1\":1, \"value2\":1}',1,1),(30,'¿Qué número ve?','images/Plate13.jpg','ishihara13(1,1)','{\"predicate\" : \"ishihara13\", \"value1\":1, \"value2\":1}',1,1),(31,'¿Qué número ve?','images/Plate14.jpg','ishihara14(1,1)','{\"predicate\" : \"ishihara14\", \"value1\":1, \"value2\":1}',1,1),(32,'¿Qué número ve?','images/Plate15.jpg','ishihara15(1,1)','{\"predicate\" : \"ishihara15\", \"value1\":1, \"value2\":1}',1,1),(33,'¿Qué número ve?','images/Plate16.jpg','ishihara16(1,1)','{\"predicate\" : \"ishihara16\", \"value1\":1, \"value2\":1}',1,1),(34,'¿Qué número ve?','images/Plate17.jpg','ishihara17(1,1)','{\"predicate\" : \"ishihara17\", \"value1\":1, \"value2\":1}',1,1),(35,'¿Qué número ve?','images/Plate18.jpg','ishihara18(0,0)','{\"predicate\" : \"ishihara18\", \"value1\":0, \"value2\":0}',1,1),(36,'¿Qué número ve?','images/Plate19.jpg','ishihara19(0,0)','{\"predicate\" : \"ishihara19\", \"value1\":0, \"value2\":0}',1,1),(37,'¿Qué número ve?','images/Plate20.jpg','ishihara20(0,0)','{\"predicate\" : \"ishihara20\", \"value1\":0, \"value2\":0}',1,1),(38,'¿Qué número ve?','images/Plate21.jpg','ishihara21(0,0)','{\"predicate\" : \"ishihara21\", \"value1\":0, \"value2\":0}',1,1),(39,'¿Qué número ve?','images/Plate22.jpg','ishihara22(1,1)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":1}',1,1),(40,'¿Qué número ve?','images/Plate23.jpg','ishihara23(1,1)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":1}',1,1),(41,'¿Qué número ve?','images/Plate24.jpg','ishihara24(1,1)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":1}',1,1),(42,'¿Qué número ve?','images/Plate25.jpg','ishihara25(1,1)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":1}',1,1),(43,'¿Qué letra está seleccionada?','images/snellen_1.jpg','','',1,2),(44,'¿Qué letra está seleccionada?','images/snellen_2.jpg','','',1,2),(45,'¿Qué letra está seleccionada?','images/snellen_3.jpg','','',1,2),(46,'¿Qué letra está seleccionada?','images/snellen_4.jpg','','',1,2),(47,'¿Qué letra está seleccionada?','images/snellen_5.jpg','','',1,2),(48,'¿Qué letra está seleccionada?','images/snellen_6.jpg','','',1,2),(49,'¿Qué letra está seleccionada?','images/snellen_7.jpg','','',1,2),(51,'¿Qué número ve?','images/Plate2.jpg','ishihara2(1,1)','{\"predicate\" : \"ishihara2\", \"value1\":1, \"value2\":1}',1,2),(52,'¿Qué número ve?','images/Plate3.jpg','ishihara3(1,1)','{\"predicate\" : \"ishihara3\", \"value1\":1, \"value2\":1}',1,2),(53,'¿Qué número ve?','images/Plate4.jpg','ishihara4(1,1)','{\"predicate\" : \"ishihara4\", \"value1\":1, \"value2\":1}',1,2),(54,'¿Qué número ve?','images/Plate5.jpg','ishihara5(1,1)','{\"predicate\" : \"ishihara5, \"value1\":1, \"value2\":1}',1,2),(55,'¿Qué número ve?','images/Plate6.jpg','ishihara6(1,1)','{\"predicate\" : \"ishihara6\", \"value1\":1, \"value2\":1}',1,2),(56,'¿Qué número ve?','images/Plate7.jpg','ishihara7(1,1)','{\"predicate\" : \"ishihara7\", \"value1\":1, \"value2\":1}',1,2),(57,'¿Qué número ve?','images/Plate8.jpg','ishihara8(1,1)','{\"predicate\" : \"ishihara8\", \"value1\":1, \"value2\":1}',1,2),(58,'¿Qué número ve?','images/Plate9.jpg','ishihara9(1,1)','{\"predicate\" : \"ishihara9\", \"value1\":1, \"value2\":1}',1,2),(59,'¿Qué número ve?','images/Plate10.jpg','ishihara10(1,1)','{\"predicate\" : \"ishihara10\", \"value1\":1, \"value2\":1}',1,2),(60,'¿Qué número ve?','images/Plate11.jpg','ishihara11(1,1)','{\"predicate\" : \"ishihara11\", \"value1\":1, \"value2\":1}',1,2),(61,'¿Qué número ve?','images/Plate12.jpg','ishihara12(1,1)','{\"predicate\" : \"ishihara12\", \"value1\":1, \"value2\":1}',1,2),(62,'¿Qué número ve?','images/Plate13.jpg','ishihara13(1,1)','{\"predicate\" : \"ishihara13\", \"value1\":1, \"value2\":1}',1,2),(63,'¿Qué número ve?','images/Plate14.jpg','ishihara14(1,1)','{\"predicate\" : \"ishihara14\", \"value1\":1, \"value2\":1}',1,2),(64,'¿Qué número ve?','images/Plate15.jpg','ishihara15(1,1)','{\"predicate\" : \"ishihara15\", \"value1\":1, \"value2\":1}',1,2),(65,'¿Qué número ve?','images/Plate16.jpg','ishihara16(1,1)','{\"predicate\" : \"ishihara16\", \"value1\":1, \"value2\":1}',1,2),(66,'¿Qué número ve?','images/Plate17.jpg','ishihara17(1,1)','{\"predicate\" : \"ishihara17\", \"value1\":1, \"value2\":1}',1,2),(67,'¿Qué número ve?','images/Plate18.jpg','ishihara18(0,0)','{\"predicate\" : \"ishihara18\", \"value1\":0, \"value2\":0}',1,2),(68,'¿Qué número ve?','images/Plate19.jpg','ishihara19(0,0)','{\"predicate\" : \"ishihara19\", \"value1\":0, \"value2\":0}',1,2),(69,'¿Qué número ve?','images/Plate20.jpg','ishihara20(0,0)','{\"predicate\" : \"ishihara20\", \"value1\":0, \"value2\":0}',1,2),(70,'¿Qué número ve?','images/Plate21.jpg','ishihara21(0,0)','{\"predicate\" : \"ishihara21\", \"value1\":0, \"value2\":0}',1,2),(71,'¿Qué número ve?','images/Plate22.jpg','ishihara22(1,1)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":1}',1,2),(72,'¿Qué número ve?','images/Plate23.jpg','ishihara23(1,1)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":1}',1,2),(73,'¿Qué número ve?','images/Plate24.jpg','ishihara24(1,1)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":1}',1,2),(74,'¿Qué número ve?','images/Plate25.jpg','ishihara25(1,1)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":1}',1,2),(96,'¿Qué letra está seleccionada?','images/snellen_1.jpg','','',1,3),(97,'¿Qué letra está seleccionada?','images/snellen_2.jpg','','',1,3),(98,'¿Qué letra está seleccionada?','images/snellen_3.jpg','','',1,3),(99,'¿Qué letra está seleccionada?','images/snellen_4.jpg','','',1,3),(100,'¿Qué letra está seleccionada?','images/snellen_5.jpg','','',1,3),(101,'¿Qué letra está seleccionada?','images/snellen_6.jpg','','',1,3),(102,'¿Qué letra está seleccionada?','images/snellen_7.jpg','','',1,3),(104,'¿Qué número ve?','images/Plate2.jpg','ishihara2(1,1)','{\"predicate\" : \"ishihara2\", \"value1\":1, \"value2\":1}',1,3),(105,'¿Qué número ve?','images/Plate3.jpg','ishihara3(1,1)','{\"predicate\" : \"ishihara3\", \"value1\":1, \"value2\":1}',1,3),(106,'¿Qué número ve?','images/Plate4.jpg','ishihara4(1,1)','{\"predicate\" : \"ishihara4\", \"value1\":1, \"value2\":1}',1,3),(107,'¿Qué número ve?','images/Plate5.jpg','ishihara5(1,1)','{\"predicate\" : \"ishihara5\", \"value1\":1, \"value2\":1}',1,3),(108,'¿Qué número ve?','images/Plate6.jpg','ishihara6(1,1)','{\"predicate\" : \"ishihara6\", \"value1\":1, \"value2\":1}',1,3),(109,'¿Qué número ve?','images/Plate7.jpg','ishihara7(1,1)','{\"predicate\" : \"ishihara7\", \"value1\":1, \"value2\":1}',1,3),(110,'¿Qué número ve?','images/Plate8.jpg','ishihara8(1,1)','{\"predicate\" : \"ishihara8\", \"value1\":1, \"value2\":1}',1,3),(111,'¿Qué número ve?','images/Plate9.jpg','ishihara9(1,1)','{\"predicate\" : \"ishihara9\", \"value1\":1, \"value2\":1}',1,3),(112,'¿Qué número ve?','images/Plate10.jpg','ishihara10(1,1)','{\"predicate\" : \"ishihara10\", \"value1\":1, \"value2\":1}',1,3),(113,'¿Qué número ve?','images/Plate11.jpg','ishihara11(1,1)','{\"predicate\" : \"ishihara11\", \"value1\":1, \"value2\":1}',1,3),(114,'¿Qué número ve?','images/Plate12.jpg','ishihara12(1,1)','{\"predicate\" : \"ishihara12\", \"value1\":1, \"value2\":1}',1,3),(115,'¿Qué número ve?','images/Plate13.jpg','ishihara13(1,1)','{\"predicate\" : \"ishihara13\", \"value1\":1, \"value2\":1}',1,3),(116,'¿Qué número ve?','images/Plate14.jpg','ishihara14(1,1)','{\"predicate\" : \"ishihara14\", \"value1\":1, \"value2\":1}',1,3),(117,'¿Qué número ve?','images/Plate15.jpg','ishihara15(1,1)','{\"predicate\" : \"ishihara15\", \"value1\":1, \"value2\":1}',1,3),(118,'¿Qué número ve?','images/Plate16.jpg','ishihara16(1,1)','{\"predicate\" : \"ishihara16\", \"value1\":1, \"value2\":1}',1,3),(119,'¿Qué número ve?','images/Plate17.jpg','ishihara17(1,1)','{\"predicate\" : \"ishihara17\", \"value1\":1, \"value2\":1}',1,3),(120,'¿Qué número ve?','images/Plate18.jpg','ishihara18(0,0)','{\"predicate\" : \"ishihara18\", \"value1\":0, \"value2\":0}',1,3),(121,'¿Qué número ve?','images/Plate19.jpg','ishihara19(0,0)','{\"predicate\" : \"ishihara19\", \"value1\":0, \"value2\":0}',1,3),(122,'¿Qué número ve?','images/Plate20.jpg','ishihara20(0,0)','{\"predicate\" : \"ishihara20\", \"value1\":0, \"value2\":0}',1,3),(123,'¿Qué número ve?','images/Plate21.jpg','ishihara21(0,0)','{\"predicate\" : \"ishihara21\", \"value1\":0, \"value2\":0}',1,3),(124,'¿Qué número ve?','images/Plate22.jpg','ishihara22(1,1)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":1}',1,3),(125,'¿Qué número ve?','images/Plate23.jpg','ishihara23(1,1)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":1}',1,3),(126,'¿Qué número ve?','images/Plate24.jpg','ishihara24(1,1)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":1}',1,3),(127,'¿Qué número ve?','images/Plate25.jpg','ishihara25(1,1)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":1}',1,3);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `resultado` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `sentencia` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `sentencia_asl` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuesta_pregunta_idx` (`idpregunta`),
  CONSTRAINT `fk_respuesta_pregunta` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,11,'E','snellen(1)','{\"predicate\" : \"snellen\", \"value1\":1}'),(2,12,'F','snellen(2)','{\"predicate\" : \"snellen\", \"value1\":2}'),(3,13,'Z','snellen(3)','{\"predicate\" : \"snellen\", \"value1\":3}'),(4,14,'P','snellen(4)','{\"predicate\" : \"snellen\", \"value1\":4}'),(5,15,'E','snellen(5)','{\"predicate\" : \"snellen\", \"value1\":5}'),(6,16,'D','snellen(6)','{\"predicate\" : \"snellen\", \"value1\":6}'),(7,17,'C','snellen(7)','{\"predicate\" : \"snellen\", \"value1\":7}'),(9,19,'8','ishihara2(0,0)','{\"predicate\" : \"ishihara2\", \"value1\":0, \"value2\":0}'),(10,19,'3','ishihara2(1,0)','{\"predicate\" : \"ishihara2\", \"value1\":1, \"value2\":0}'),(11,20,'6','ishihara3(0,0)','{\"predicate\" : \"ishihara3\", \"value1\":0, \"value2\":0}'),(12,20,'5','ishihara3(1,0)','{\"predicate\" : \"ishihara3\", \"value1\":1, \"value2\":0}'),(13,21,'29','ishihara4(0,0)','{\"predicate\" : \"ishihara4\", \"value1\":0, \"value2\":0}'),(14,21,'70','ishihara4(1,0)','{\"predicate\" : \"ishihara4\", \"value1\":1, \"value2\":0}'),(15,22,'35','ishihara5(1,0)','{\"predicate\" : \"ishihara5\", \"value1\":1, \"value2\":0}'),(16,23,'5','ishihara6(0,0)','{\"predicate\" : \"ishihara6\", \"value1\":0, \"value2\":0}'),(17,23,'2','ishihara6(1,0)','{\"predicate\" : \"ishihara6\", \"value1\":1, \"value2\":0}'),(18,22,'57','ishihara5(0,0)','{\"predicate\" : \"ishihara5\", \"value1\":0, \"value2\":0}'),(19,24,'3','ishihara7(0,0)','{\"predicate\" : \"ishihara7\", \"value1\":0, \"value2\":0}'),(20,24,'5','ishihara7(1,0)','{\"predicate\" : \"ishihara7\", \"value1\":1, \"value2\":0}'),(21,25,'15','ishihara8(0,0)','{\"predicate\" : \"ishihara8\", \"value1\":0, \"value2\":0}'),(22,25,'17','ishihara8(1,0)','{\"predicate\" : \"ishihara8\", \"value1\":1, \"value2\":0}'),(23,26,'74','ishihara9(0,0)','{\"predicate\" : \"ishihara9\", \"value1\":0, \"value2\":0}'),(24,26,'21','ishihara9(1,0)','{\"predicate\" : \"ishihara9\", \"value1\":1, \"value2\":0}'),(25,27,'2','ishihara10(0,0)','{\"predicate\" : \"ishihara10\", \"value1\":0, \"value2\":0}'),(26,28,'6','ishihara11(0,0)','{\"predicate\" : \"ishihara11\", \"value1\":0, \"value2\":0}'),(27,29,'97','ishihara12(0,0)','{\"predicate\" : \"ishihara12\", \"value1\":0, \"value2\":0}'),(28,30,'45','ishihara13(0,0)','{\"predicate\" : \"ishihara13\", \"value1\":0, \"value2\":0}'),(29,31,'5','ishihara14(0,0)','{\"predicate\" : \"ishihara14\", \"value1\":0, \"value2\":0}'),(30,32,'7','ishihara15(0,0)','{\"predicate\" : \"ishihara15\", \"value1\":0, \"value2\":0}'),(31,33,'16','ishihara16(0,0)','{\"predicate\" : \"ishihara16\", \"value1\":0, \"value2\":0}'),(32,34,'73','ishihara17(0,0)','{\"predicate\" : \"ishihara17\", \"value1\":0, \"value2\":0}'),(33,35,'5','ishihara18(1,0)','{\"predicate\" : \"ishihara18\", \"value1\":1, \"value2\":0}'),(34,36,'2','ishihara19(1,0)','{\"predicate\" : \"ishihara19\", \"value1\":1, \"value2\":0}'),(35,37,'45','ishihara20(1,0)','{\"predicate\" : \"ishihara20\", \"value1\":1, \"value2\":0}'),(36,38,'73','ishihara21(1,0)','{\"predicate\" : \"ishihara21\", \"value1\":1, \"value2\":0}'),(37,39,'26','ishihara22(0,0)','{\"predicate\" : \"ishihara22\", \"value1\":0, \"value2\":0}'),(38,39,'6','ishihara22(1,0)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":0}'),(39,39,'2','ishihara22(1,0)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":0}'),(44,40,'42','ishihara23(0,0)','{\"predicate\" : \"ishihara23\", \"value1\":0, \"value2\":0}'),(45,40,'2','ishihara23(1,0)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":0}'),(46,40,'4','ishihara23(1,0)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":0}'),(47,41,'35','ishihara24(0,0)','{\"predicate\" : \"ishihara24\", \"value1\":0, \"value2\":0}'),(48,41,'5','ishihara24(1,0)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":0}'),(49,41,'3','ishihara24(1,0)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":0}'),(50,42,'96','ishihara25(0,0)','{\"predicate\" : \"ishihara25\", \"value1\":0, \"value2\":0}'),(51,42,'6','ishihara25(1,0)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":0}'),(52,42,'9','ishihara25(1,0)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":0}'),(53,43,'E','snellen(1)','{\"predicate\" : \"snellen\", \"value1\":1}'),(54,44,'F','snellen(2)','{\"predicate\" : \"snellen\", \"value1\":2}'),(55,45,'Z','snellen(3)','{\"predicate\" : \"snellen\", \"value1\":3}'),(56,46,'P','snellen(4)','{\"predicate\" : \"snellen\", \"value1\":4}'),(57,47,'E','snellen(5)','{\"predicate\" : \"snellen\", \"value1\":5}'),(58,48,'D','snellen(6)','{\"predicate\" : \"snellen\", \"value1\":6}'),(59,49,'C','snellen(7)','{\"predicate\" : \"snellen\", \"value1\":7}'),(61,51,'3','ishihara2(1,0)','{\"predicate\" : \"ishihara2\", \"value1\":1, \"value2\":0}'),(62,51,'8','ishihara2(0,0)','{\"predicate\" : \"ishihara2\", \"value1\":0, \"value2\":0}'),(63,52,'6','ishihara3(0,0)','{\"predicate\" : \"ishihara3\", \"value1\":0, \"value2\":0}'),(64,52,'5','ishihara3(1,0)','{\"predicate\" : \"ishihara3\", \"value1\":1, \"value2\":0}'),(65,53,'70','ishihara4(1,0)','{\"predicate\" : \"ishihara4\", \"value1\":1, \"value2\":0}'),(66,53,'29','ishihara4(0,0)','{\"predicate\" : \"ishihara4\", \"value1\":0, \"value2\":0}'),(67,54,'57','ishihara5(0,0)','{\"predicate\" : \"ishihara5\", \"value1\":0, \"value2\":0}'),(68,54,'35','ishihara5(1,0)','{\"predicate\" : \"ishihara5\", \"value1\":1, \"value2\":0}'),(69,55,'5','ishihara6(0,0)','{\"predicate\" : \"ishihara6\", \"value1\":0, \"value2\":0}'),(70,55,'2','ishihara6(1,0)','{\"predicate\" : \"ishihara6\", \"value1\":1, \"value2\":0}'),(71,56,'5','ishihara7(1,0)','{\"predicate\" : \"ishihara7\", \"value1\":1, \"value2\":0}'),(72,56,'3','ishihara7(0,0)','{\"predicate\" : \"ishihara7\", \"value1\":0, \"value2\":0}'),(73,57,'17','ishihara8(1,0)','{\"predicate\" : \"ishihara8\", \"value1\":1, \"value2\":0}'),(74,57,'15','ishihara8(0,0)','{\"predicate\" : \"ishihara8\", \"value1\":0, \"value2\":0}'),(75,58,'74','ishihara9(0,0)','{\"predicate\" : \"ishihara9\", \"value1\":0, \"value2\":0}'),(76,58,'21','ishihara9(1,0)','{\"predicate\" : \"ishihara9\", \"value1\":1, \"value2\":0}'),(77,59,'2','ishihara10(0,0)','{\"predicate\" : \"ishihara10\", \"value1\":0, \"value2\":0}'),(78,60,'6','ishihara11(0,0)','{\"predicate\" : \"ishihara11\", \"value1\":0, \"value2\":0}'),(79,61,'97','ishihara12(0,0)','{\"predicate\" : \"ishihara12\", \"value1\":0, \"value2\":0}'),(80,62,'45','ishihara13(0,0)','{\"predicate\" : \"ishihara13\", \"value1\":0, \"value2\":0}'),(81,63,'5','ishihara14(0,0)','{\"predicate\" : \"ishihara14\", \"value1\":0, \"value2\":0}'),(82,64,'7','ishihara15(0,0)','{\"predicate\" : \"ishihara15\", \"value1\":0, \"value2\":0}'),(83,65,'16','ishihara16(0,0)','{\"predicate\" : \"ishihara16\", \"value1\":0, \"value2\":0}'),(84,66,'73','ishihara17(0,0)','{\"predicate\" : \"ishihara17\", \"value1\":0, \"value2\":0}'),(85,67,'5','ishihara18(1,0)','{\"predicate\" : \"ishihara18\", \"value1\":1, \"value2\":0}'),(86,68,'2','ishihara19(1,0)','{\"predicate\" : \"ishihara19\", \"value1\":1, \"value2\":0}'),(87,69,'45','ishihara20(1,0)','{\"predicate\" : \"ishihara20\", \"value1\":1, \"value2\":0}'),(88,70,'73','ishihara21(1,0)','{\"predicate\" : \"ishihara21\", \"value1\":1, \"value2\":0}'),(89,71,'2','ishihara22(1,0)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":0}'),(90,71,'6','ishihara22(1,0)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":0}'),(91,71,'26','ishihara22(0,0)','{\"predicate\" : \"ishihara22\", \"value1\":0, \"value2\":0}'),(92,72,'2','ishihara23(1,0)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":0}'),(93,72,'42','ishihara23(0,0)','{\"predicate\" : \"ishihara23\", \"value1\":0, \"value2\":0}'),(94,72,'4','ishihara23(1,0)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":0}'),(95,73,'3','ishihara24(1,0)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":0}'),(96,73,'5','ishihara24(1,0)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":0}'),(97,73,'35','ishihara24(0,0)','{\"predicate\" : \"ishihara24\", \"value1\":0, \"value2\":0}'),(98,74,'96','ishihara25(0,0)','{\"predicate\" : \"ishihara25\", \"value1\":0, \"value2\":0}'),(99,74,'9','ishihara25(1,0)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":0}'),(100,74,'6','ishihara25(1,0)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":0}'),(116,96,'E','snellen(1)','{\"predicate\" : \"snellen\", \"value1\":1}'),(117,97,'F','snellen(2)','{\"predicate\" : \"snellen\", \"value1\":2}'),(118,98,'Z','snellen(3)','{\"predicate\" : \"snellen\", \"value1\":3}'),(119,99,'P','snellen(4)','{\"predicate\" : \"snellen\", \"value1\":4}'),(120,100,'E','snellen(5)','{\"predicate\" : \"snellen\", \"value1\":5}'),(121,101,'D','snellen(6)','{\"predicate\" : \"snellen\", \"value1\":6}'),(122,102,'C','snellen(7)','{\"predicate\" : \"snellen\", \"value1\":7}'),(124,104,'3','ishihara2(1,0)','{\"predicate\" : \"ishihara2\", \"value1\":1, \"value2\":0}'),(125,104,'8','ishihara2(0,0)','{\"predicate\" : \"ishihara2\", \"value1\":0, \"value2\":0}'),(126,105,'6','ishihara3(0,0)','{\"predicate\" : \"ishihara3\", \"value1\":0, \"value2\":0}'),(127,105,'5','ishihara3(1,0)','{\"predicate\" : \"ishihara3\", \"value1\":1, \"value2\":0}'),(128,106,'70','ishihara4(1,0)','{\"predicate\" : \"ishihara4\", \"value1\":1, \"value2\":0}'),(129,106,'29','ishihara4(0,0)','{\"predicate\" : \"ishihara4\", \"value1\":0, \"value2\":0}'),(130,107,'35','ishihara5(1,0)','{\"predicate\" : \"ishihara5\", \"value1\":1, \"value2\":0}'),(131,107,'57','ishihara5(0,0)','{\"predicate\" : \"ishihara5\", \"value1\":0, \"value2\":0}'),(132,108,'2','ishihara6(1,0)','{\"predicate\" : \"ishihara6\", \"value1\":1, \"value2\":0}'),(133,108,'5','ishihara6(0,0)','{\"predicate\" : \"ishihara6\", \"value1\":0, \"value2\":0}'),(134,109,'5','ishihara7(1,0)','{\"predicate\" : \"ishihara7\", \"value1\":1, \"value2\":0}'),(135,109,'3','ishihara7(0,0)','{\"predicate\" : \"ishihara7\", \"value1\":0, \"value2\":0}'),(136,110,'17','ishihara8(1,0)','{\"predicate\" : \"ishihara8\", \"value1\":1, \"value2\":0}'),(137,110,'15','ishihara8(0,0)','{\"predicate\" : \"ishihara8\", \"value1\":0, \"value2\":0}'),(138,111,'74','ishihara9(0,0)','{\"predicate\" : \"ishihara9\", \"value1\":0, \"value2\":0}'),(139,111,'21','ishihara9(1,0)','{\"predicate\" : \"ishihara9\", \"value1\":1, \"value2\":0}'),(140,112,'2','ishihara10(0,0)','{\"predicate\" : \"ishihara10\", \"value1\":0, \"value2\":0}'),(141,113,'6','ishihara11(0,0)','{\"predicate\" : \"ishihara11\", \"value1\":0, \"value2\":0}'),(142,114,'97','ishihara12(0,0)','{\"predicate\" : \"ishihara12\", \"value1\":0, \"value2\":0}'),(143,115,'45','ishihara13(0,0)','{\"predicate\" : \"ishihara13\", \"value1\":0, \"value2\":0}'),(144,116,'5','ishihara14(0,0)','{\"predicate\" : \"ishihara14\", \"value1\":0, \"value2\":0}'),(145,117,'7','ishihara15(0,0)','{\"predicate\" : \"ishihara15\", \"value1\":0, \"value2\":0}'),(146,118,'16','ishihara16(0,0)','{\"predicate\" : \"ishihara16\", \"value1\":0, \"value2\":0}'),(147,119,'73','ishihara17(0,0)','{\"predicate\" : \"ishihara17\", \"value1\":0, \"value2\":0}'),(148,120,'5','ishihara18(1,0)','{\"predicate\" : \"ishihara18\", \"value1\":0, \"value2\":0}'),(149,121,'2','ishihara19(1,0)','{\"predicate\" : \"ishihara19\", \"value1\":0, \"value2\":0}'),(150,122,'45','ishihara20(1,0)','{\"predicate\" : \"ishihara20\", \"value1\":1, \"value2\":0}'),(151,123,'73','ishihara21(1,0)','{\"predicate\" : \"ishihara21\", \"value1\":1, \"value2\":0}'),(152,124,'2','ishihara22(1,0)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":0}'),(153,124,'6','ishihara22(1,0)','{\"predicate\" : \"ishihara22\", \"value1\":1, \"value2\":0}'),(154,124,'26','ishihara22(0,0)','{\"predicate\" : \"ishihara202, \"value1\":0, \"value2\":0}'),(155,125,'2','ishihara23(1,0)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":0}'),(156,125,'42','ishihara23(0,0)','{\"predicate\" : \"ishihara23\", \"value1\":0, \"value2\":0}'),(157,125,'4','ishihara23(1,0)','{\"predicate\" : \"ishihara23\", \"value1\":1, \"value2\":0}'),(158,126,'3','ishihara24(1,0)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":0}'),(159,126,'5','ishihara24(1,0)','{\"predicate\" : \"ishihara24\", \"value1\":1, \"value2\":0}'),(160,126,'35','ishihara24(0,0)','{\"predicate\" : \"ishihara24\", \"value1\":0, \"value2\":0}'),(161,127,'96','ishihara25(0,0)','{\"predicate\" : \"ishihara25\", \"value1\":0, \"value2\":0}'),(162,127,'9','ishihara25(1,0)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":0}'),(163,127,'6','ishihara25(1,0)','{\"predicate\" : \"ishihara25\", \"value1\":1, \"value2\":0}'),(164,1,'No','declaraCeguera(0)','{\"predicate\" : \"declara_ceguera\", \"value\":0}'),(165,6,'No','declaraPoseerEpilepsiaFotosensible(0)','{\"predicate\":\"declara_epilepsia_fotosensible\" , \"value\":0}'),(166,2,'No','declaraCeguera(0)','{\"predicate\" : \"declara_ceguera\", \"value\":0}'),(167,3,'No','declaraCeguera(0)','{\"predicate\" : \"declara_ceguera\", \"value\":0}'),(168,7,'No','declaraPoseerEpilepsiaFotosensible(0)','{\"predicate\":\"declara_epilepsia_fotosensible\" , \"value\":0}'),(169,8,'No','declaraPoseerEpilepsiaFotosensible(0)','{\"predicate\":\"declara_epilepsia_fotosensible\" , \"value\":0}');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_cuestionario`
--

DROP TABLE IF EXISTS `respuesta_cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta_cuestionario` (
  `idrespuesta_cuestionario` int(11) NOT NULL AUTO_INCREMENT,
  `idcuestionario` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `resultado` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idrespuesta_cuestionario`),
  KEY `fk_respuesta_cuestionario_cuestionario_idx` (`idcuestionario`),
  KEY `fk_respuesta_cuestionario_pregunta_idx` (`idpregunta`),
  CONSTRAINT `fk_respuesta_cuestionario_cuestionario` FOREIGN KEY (`idcuestionario`) REFERENCES `cuestionario` (`idcuestionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_respuesta_cuestionario_pregunta` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_cuestionario`
--

LOCK TABLES `respuesta_cuestionario` WRITE;
/*!40000 ALTER TABLE `respuesta_cuestionario` DISABLE KEYS */;
INSERT INTO `respuesta_cuestionario` VALUES (1,5,3,'NO'),(2,5,3,'NO'),(3,5,8,'NO'),(4,5,96,'t'),(5,5,97,'F'),(6,5,98,'z'),(7,5,99,'b'),(8,5,100,'t'),(9,5,101,''),(10,5,102,''),(11,5,102,''),(12,5,104,'8'),(13,5,105,'6'),(14,5,106,'29'),(15,5,107,'57'),(16,5,108,'5'),(17,5,109,'3'),(18,5,110,'15'),(19,5,111,'74'),(20,5,112,'2'),(21,5,113,'6'),(22,5,114,'97'),(23,5,115,'45'),(24,5,116,'5'),(25,5,117,'7'),(26,5,118,'16'),(27,5,119,'73'),(28,5,120,''),(29,5,121,''),(30,5,122,''),(31,5,123,''),(32,5,124,'26'),(33,5,125,'42'),(34,5,126,'35'),(35,5,127,'96');
/*!40000 ALTER TABLE `respuesta_cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_respuesta`
--

DROP TABLE IF EXISTS `tipo_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_respuesta` (
  `idtiporespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  PRIMARY KEY (`idtiporespuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_respuesta`
--

LOCK TABLES `tipo_respuesta` WRITE;
/*!40000 ALTER TABLE `tipo_respuesta` DISABLE KEYS */;
INSERT INTO `tipo_respuesta` VALUES (1,'Cadena','A-0'),(2,'Entero','0'),(3,'Letra',''),(4,'Si/No','S/N');
/*!40000 ALTER TABLE `tipo_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `idgenero` int(11) NOT NULL,
  `nombreusuario` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idgenero_idx` (`idgenero`),
  CONSTRAINT `idgenero` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Fabian','Huenuman','1981-05-02',2,'fhuenuman','12345678'),(2,'Rafaela','Mazalu','1981-05-03',1,'rmazalu','12345678');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_estereotipado`
--

DROP TABLE IF EXISTS `usuario_estereotipado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_estereotipado` (
  `idusuarioestereotipado` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idestereotipo` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`idusuarioestereotipado`),
  UNIQUE KEY `idestereotipo_UNIQUE` (`idestereotipo`),
  KEY `idusuario_index` (`idusuario`),
  CONSTRAINT `idestereotipo` FOREIGN KEY (`idestereotipo`) REFERENCES `estereotipo` (`idestereotipo`),
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_estereotipado`
--

LOCK TABLES `usuario_estereotipado` WRITE;
/*!40000 ALTER TABLE `usuario_estereotipado` DISABLE KEYS */;
INSERT INTO `usuario_estereotipado` VALUES (1,1,2,1),(5,1,3,1),(6,1,4,1);
/*!40000 ALTER TABLE `usuario_estereotipado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wcag`
--

DROP TABLE IF EXISTS `wcag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wcag` (
  `idwcag` int(11) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `descripcion` varchar(650) DEFAULT NULL,
  `nivel` varchar(3) NOT NULL,
  `uri` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idwcag`),
  UNIQUE KEY `numero_UNIQUE` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wcag`
--

LOCK TABLES `wcag` WRITE;
/*!40000 ALTER TABLE `wcag` DISABLE KEYS */;
INSERT INTO `wcag` VALUES (1,'1.1.1','Contenido no textual','Todo contenido no textual que se presenta al usuario tiene una alternativa textual que cumple el mismo propósito, excepto en las situaciones enumeradas a continuación.','A','https://www.w3.org/WAI/WCAG21/quickref/#non-text-content'),(2,'1.2.1','Sólo audio y sólo vídeo (grabado)','Para contenido sólo audio grabado y contenido sólo vídeo grabado, se cumple lo siguiente, excepto cuando el audio o el vídeo es un contenido multimedia alternativo al texto y está claramente identificado como tal.','A','https://www.w3.org/WAI/WCAG21/quickref/#audio-only-and-video-only-prerecorded'),(3,'1.2.2','Subtítulos (grabados)','Se proporcionan subtítulos para el contenido de audio grabado dentro de contenido multimedia sincronizado, excepto cuando la presentación es un contenido multimedia alternativo al texto y está claramente identificado como tal. ','A','https://www.w3.org/WAI/WCAG21/quickref/#captions-prerecorded'),(4,'1.2.3','Audiodescripción o Medio Alternativo (grabado)','Se proporciona una alternativa para los medios tempodependientes o una audiodescripción para el contenido de vídeo grabado en los multimedia sincronizados, excepto cuando ese contenido es un contenido multimedia alternativo al texto y está claramente identificado como tal.','A','https://www.w3.org/WAI/WCAG21/quickref/#audio-description-or-media-alternative-prerecorded'),(5,'1.2.4','Subtítulos (en directo)','Se proporcionan subtítulos para todo el contenido de audio en directo de los multimedia sincronizados.','AA','https://www.w3.org/WAI/WCAG21/quickref/#captions-live'),(6,'1.2.5','Audiodescripción (grabado)','Se proporciona una audiodescripción para todo el contenido de vídeo grabado dentro de contenido multimedia sincronizado.','AA','https://www.w3.org/WAI/WCAG21/quickref/#audio-description-prerecorded'),(7,'1.2.6','Lengua de señas (grabado)','Se proporciona una interpretación en lengua de señas para todo el contenido de audio grabado dentro de contenido multimedia sincronizado.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#sign-language-prerecorded'),(8,'1.2.7','Audiodescripción ampliada (grabada)','Cuando las pausas en el audio de primer plano son insuficientes para permitir que la audiodescripción comunique el significado del vídeo, se proporciona una audiodescripción ampliada para todos los contenidos de vídeo grabado dentro de contenido multimedia sincronizado.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#extended-audio-description-prerecorded<'),(9,'1.2.8','Medio alternativo (grabado)','Se proporciona una alternativa para los medios tempodependientes, tanto para todos los contenidos multimedia sincronizados grabados como para todos los medios de sólo vídeo grabado.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#media-alternative-prerecorded'),(10,'1.2.9','Sólo audio (en directo)','Se proporciona una alternativa para los medios tempodependientes que presenta información equivalente para el contenido de sólo audio en directo.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#audio-only-live'),(11,'1.3.1','Información y relaciones','La información, estructura y relaciones comunicadas a través de la presentación pueden ser determinadas por software o están disponibles como texto.','A','https://www.w3.org/WAI/WCAG21/quickref/#info-and-relationships'),(12,'1.3.2','Secuencia significativa','Cuando la secuencia en que se presenta el contenido afecta a su significado, se puede determinar por software la secuencia correcta de lectura.','A','https://www.w3.org/WAI/WCAG21/quickref/#meaningful-sequence'),(13,'1.3.3','Características sensoriales','Las instrucciones proporcionadas para entender y operar el contenido no dependen exclusivamente en las características sensoriales de los componentes como su forma, tamaño, ubicación visual, orientación o sonido.','A','https://www.w3.org/WAI/WCAG21/quickref/#sensory-characteristics'),(14,'1.3.4','Orientación','El contenido no restringe su visualización y funcionamiento a una única orientación de visualización, como vertical u horizontal, a menos que sea esencial una orientación de visualización específica.','AA','https://www.w3.org/WAI/WCAG21/quickref/#orientation'),(15,'1.3.5','Identificar el propósito de entrada','El propósito de cada campo de entrada que recopila información sobre el usuario se puede determinar mediante programación.','AA','https://www.w3.org/WAI/WCAG21/quickref/#identify-input-purpose'),(16,'1.3.6','Identificar el propósito','En el contenido implementado mediante lenguajes de marcado, el propósito de los componentes, iconos y regiones de la interfaz de usuario se puede determinar mediante programación.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#identify-purpose'),(17,'1.4.1','Uso del color','El color no se usa como único medio visual para transmitir la información, indicar una acción, solicitar una respuesta o distinguir un elemento visual.','A','https://www.w3.org/WAI/WCAG21/quickref/#use-of-color'),(18,'1.4.2','Control del audio','Si el audio de una página web suena automáticamente durante más de 3 segundos, se proporciona ya sea un mecanismo para pausar o detener el audio, o un mecanismo para controlar el volumen del sonido que es independiente del nivel de volumen global del sistema.','A','https://www.w3.org/WAI/WCAG21/quickref/#audio-control'),(19,'1.4.3','Contraste (mínimo)','La presentación visual de texto e imágenes de texto tiene una relación de contraste de, al menos, 4.5:1, excepto en los siguientes casos: textos grandes, incidental, logotipos','AA','https://www.w3.org/WAI/WCAG21/quickref/#contrast-minimum'),(20,'1.4.4','Cambio de tamaño del texto','A excepción de los subtítulos y las imágenes de texto, todo el texto puede ser ajustado sin ayudas técnicas hasta un 200 por ciento sin que se pierdan el contenido o la funcionalidad.','AA','https://www.w3.org/WAI/WCAG21/quickref/#resize-text'),(21,'1.4.5','Imágenes de texto','Si con las tecnologías que se están utilizando se puede conseguir la presentación visual deseada, se utiliza texto para transmitir la información en vez de imágenes de texto, excepto en los siguientes casos: configurable, esencial','AA','https://www.w3.org/WAI/WCAG21/quickref/#images-of-text'),(22,'1.4.6','Contraste (mejorado)','La presentación visual de texto e imágenes de texto tiene una relación de contraste de, al menos, 7:1, excepto en los siguientes casos: textos grandes, incidental, logotipos.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#contrast-enhanced'),(23,'1.4.7','Sonido de fondo bajo o ausente','Para el contenido de sólo audio grabado que (1) contiene habla en primer plano, (2) no es un CAPTCHA sonoro o un audiologo, y (3) que no es una vocalización cuya intención principal es servir como expresión musical (como el canto o el rap), se cumple al menos uno de los siguientes casos: ningún sonido de fondo, apagar, 20 dB','AAA','https://www.w3.org/WAI/WCAG21/quickref/#low-or-no-background-audio'),(24,'1.4.8','Presentación visual','En la presentación visual de bloques de texto, se proporciona algún mecanismo para lograr lo siguiente.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#visual-presentation'),(25,'1.4.9','Imágenes de texto (sin excepciones)','Las imágenes de texto sólo se utilizan como simple decoración o cuando una forma de presentación particular del texto resulta esencial para la información transmitida.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#images-of-text-no-exception'),(26,'1.4.10','Reflujo','El contenido se puede presentar sin pérdida de información o funcionalidad, y sin necesidad de desplazarse en dos dimensiones. Excepto por partes del contenido que requieren un diseño bidimensional para su uso o significado.','AA','https://www.w3.org/WAI/WCAG21/quickref/#reflow'),(27,'1.4.11','Contraste sin texto','La presentación visual de lo siguiente tiene una relación de contraste de al menos 3:1 frente a los colores adyacentes: Componentes de interfaz de usuario y objetos gráficos','AA','https://www.w3.org/WAI/WCAG21/quickref/#non-text-contrast'),(28,'1.4.12','Espaciado de texto','En el contenido implementado mediante lenguajes de marcado que admiten las siguientes propiedades de estilo de texto, no se produce pérdida de contenido o funcionalidad al configurar todo lo siguiente y no cambiar ninguna otra propiedad de estilo:  Altura de línea (interlineado) a al menos 1,5 veces el tamaño de fuente; Espaciar los siguientes párrafos al menos 2 veces el tamaño de la fuente; Espaciado entre letras (seguimiento) de al menos 0,12 veces el tamaño de la fuente; Espaciado entre palabras de al menos 0,16 veces el tamaño de la fuente.','AA','https://www.w3.org/WAI/WCAG21/quickref/#text-spacing'),(29,'1.4.13','Contenido al pasar el mouse o enfocar','Donde recibir y luego quitar el puntero o el foco del teclado desencadena contenido adicional para que se vuelva visible y luego se oculte.','AA','https://www.w3.org/WAI/WCAG21/quickref/#content-on-hover-or-focus'),(30,'2.1.1','Teclado','Toda la funcionalidad del contenido es operable a través de una interfaz de teclado sin que se requiera una determinada velocidad para cada pulsación individual de las teclas, excepto cuando la función interna requiere de una entrada que depende del trayecto de los movimientos del usuario y no sólo de los puntos inicial y final.','A','https://www.w3.org/WAI/WCAG21/quickref/#keyboard'),(31,'2.1.2','Sin trampas para el foco del teclado','Si es posible mover el foco a un componente de la página usando una interfaz de teclado, entonces el foco se puede quitar de ese componente usando sólo la interfaz de teclado y, si se requiere algo más que las teclas de dirección o de tabulación, se informa al usuario el método apropiado para mover el foco.','A','https://www.w3.org/WAI/WCAG21/quickref/#no-keyboard-trapping'),(32,'2.1.3','Teclado (sin excepciones)','Toda la funcionalidad del contenido se puede operar a través de una interfaz de teclado sin requerir una determinada velocidad en la pulsación de las teclas.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#keyboard-no-exception'),(33,'2.1.4','Atajo de teclas de caracteres','Si se implementa un atajo de teclado en el contenido usando solo letras (incluidas letras mayúsculas y minúsculas), signos de puntuación, números o símbolos, entonces al menos uno de los siguientes es verdadero: desactivar el atajo, reasignar el mecanismo para el atajo, o activar solo cuando el usuario tiene foco en el componente. ','A','https://www.w3.org/WAI/WCAG21/quickref/#character-key-shortcuts'),(34,'2.2.1','Tiempo ajustable','Para cada límite de tiempo impuesto por el contenido, se cumple al menos uno de los siguientes casos: apagar, ajustar, extender, excepción de tiempo real, excepción por ser esencial, excepción de 20 horas','A','https://www.w3.org/WAI/WCAG21/quickref/#timing-adjustable'),(35,'2.2.2','Poner en pausa, detener, ocultar','Para la información que tiene movimiento, parpadeo, se desplaza o se actualiza automáticamente, se cumplen todos los casos siguientes: Movimiento, parpadeo, desplazamiento, actualización automática','A','https://www.w3.org/WAI/WCAG21/quickref/#pause-stop-hide'),(36,'2.2.3','Sin tiempo','El tiempo no es parte esencial del evento o actividad presentada por el contenido, exceptuando los multimedia sincronizados no interactivos y los eventos en tiempo real.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#no-timing'),(37,'2.2.4','Interrupciones','El usuario puede postergar o suprimir las interrupciones, excepto cuando las interrupciones implican una emergencia.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#interruptions'),(38,'2.2.5','Re-autentificación','Cuando expira una sesión autentificada, el usuario puede continuar la actividad sin pérdida de datos tras volver a identificarse.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#re-authenticating'),(39,'2.2.6','Tiempos de espera','Se advierte a los usuarios sobre la duración de cualquier inactividad del usuario que pueda causar la pérdida de datos, a menos que los datos se conserven durante más de 20 horas cuando el usuario no realiza ninguna acción.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#timeouts'),(40,'2.3.1','Umbral de tres destellos o menos','Las páginas web no contienen nada que destelle más de tres veces en un segundo, o el destello está por debajo del umbral de destello general y de destello rojo.','A','https://www.w3.org/WAI/WCAG21/quickref/#three-flashes-or-below-threshold'),(41,'2.3.2','Tres destellos','Las páginas web no contienen nada que destelle más de tres veces por segundo.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#three-flashes'),(42,'2.3.3','Animación de interacciones','La animación de movimiento desencadenada por la interacción se puede desactivar, a menos que la animación sea esencial para la funcionalidad o la información que se transmite.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#animation-from-interactions'),(43,'2.4.1','Evitar bloques','Existe un mecanismo para evitar los bloques de contenido que se repiten en múltiples páginas web.','A','https://www.w3.org/WAI/WCAG21/quickref/#bypass-blocks'),(44,'2.4.2','Titulado de páginas','Las páginas web tienen títulos que describen su temática o propósito.','A','https://www.w3.org/WAI/WCAG21/quickref/#page-titled'),(45,'2.4.3','Orden del foco','Si se puede navegar secuencialmente por una página web y la secuencia de navegación afecta su significado o su operación, los componentes que pueden recibir el foco lo hacen en un orden que preserva su significado y operabilidad.','A','https://www.w3.org/WAI/WCAG21/quickref/#focus-order'),(46,'2.4.4','Propósito de los enlaces (en contexto)','El propósito de cada enlace puede ser determinado con sólo el texto del enlace o a través del texto del enlace sumado al contexto del enlace determinado por software, excepto cuando el propósito del enlace resultara ambiguo para los usuarios en general.','A','https://www.w3.org/WAI/WCAG21/quickref/#link-purpose-in-context'),(47,'2.4.5','Múltiples vías','Se proporciona más de un camino para localizar una página web dentro de un conjunto de páginas web, excepto cuando la página es el resultado, o un paso intermedio, de un proceso.','AA','https://www.w3.org/WAI/WCAG21/quickref/#multiple-ways'),(48,'2.4.6','Encabezados y etiquetas','Los encabezados y etiquetas describen el tema o propósito','AA','https://www.w3.org/WAI/WCAG21/quickref/#headings-and-labels'),(49,'2.4.7','Foco visible','Cualquier interfaz de usuario operable por teclado tiene una forma de operar en la cuál el indicador del foco del teclado resulta visible.','AA','https://www.w3.org/WAI/WCAG21/quickref/#focus-visible'),(50,'2.4.8','Ubicación','Se proporciona información acerca de la ubicación del usuario dentro de un conjunto de páginas web.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#location'),(51,'2.4.9','Propósito de los enlaces (sólo enlaces)','Hay un mecanismo disponible para permitir que el propósito de cada enlace se identifique solo a partir del texto del enlace, excepto cuando el propósito del enlace sea ambiguo para los usuarios en general. ','AAA','https://www.w3.org/WAI/WCAG21/quickref/#link-purpose-link-only'),(52,'2.4.10','Encabezados de sección','Se usan encabezados de sección para organizar el contenido.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#section-headings'),(53,'2.5.1','Gestos de puntero','Toda la funcionalidad que utiliza gestos multipunto o basados en rutas para la operación se puede operar con un solo puntero sin un gesto basado en rutas, a menos que sea esencial un gesto multipunto o basado en rutas.','A','https://www.w3.org/WAI/WCAG21/quickref/#pointer-gestures'),(54,'2.5.2','Cancelación de puntero','Para la funcionalidad que se puede operar usando un solo puntero, al menos uno de los siguientes es verdadero: sin evento descendente, abortar o deshacer, reversión hacia arriba o esencial (Completar la función en el evento down es esencial).','A','https://www.w3.org/WAI/WCAG21/quickref/#pointer-cancellation'),(55,'2.5.3','Etiqueta en nombre','Para los componentes de la interfaz de usuario con etiquetas que incluyen texto o imágenes de texto, el nombre contiene el texto que se presenta visualmente. ','A','https://www.w3.org/WAI/WCAG21/quickref/#label-in-name'),(56,'2.5.4','Actuación de movimiento','La funcionalidad que puede ser operada por el movimiento del dispositivo o el movimiento del usuario también puede ser operada por los componentes de la interfaz de usuario y la respuesta al movimiento puede desactivarse para evitar la activación accidental, excepto cuando: el movimiento se utiliza para operar la funcionalidad a través de una interfaz compatible con accesibilidad; El movimiento es esencial para la función y hacerlo invalidaría la actividad. ','A','https://www.w3.org/WAI/WCAG21/quickref/#motion-actuation'),(57,'2.5.5','Tamaño objetivo','El tamaño del objetivo para las entradas del puntero es de al menos 44 por 44 píxeles CSS, excepto cuando: el objetivo está disponible a través de un enlace o control equivalente en la misma página que tiene al menos 44 por 44 píxeles CSS;  el objetivo está en una oración o bloque de texto; el tamaño del objetivo lo determina el agente de usuario y el autor no lo modifica; o una presentación particular del objetivo es esencial para la información que se transmite.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#target-size'),(58,'2.5.6','Mecanismos de entrada concurrentes','El contenido web no restringe el uso de las modalidades de entrada disponibles en una plataforma, excepto cuando la restricción sea esencial, necesaria para garantizar la seguridad del contenido o necesaria para respetar la configuración del usuario.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#concurrent-input-mechanisms'),(59,'3.1.1','Idioma de la página','El idioma predeterminado de cada página web puede ser determinado por software.','A','https://www.w3.org/WAI/WCAG21/quickref/#language-of-page'),(60,'3.1.2','Idioma de las partes','El idioma de cada pasaje o frase en el contenido puede ser determinado por software, excepto los nombres propios, términos técnicos, palabras en un idioma indeterminado y palabras o frases que se hayan convertido en parte natural del texto que las rodea.','AA','https://www.w3.org/WAI/WCAG21/quickref/#language-of-parts'),(61,'3.1.3','Palabras inusuales','Se proporciona un mecanismo para identificar las definiciones específicas de palabras o frases usadas de modo inusual o restringido, incluyendo expresiones idiomáticas y jerga.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#unusual-words'),(62,'3.1.4','Abreviaturas','Se proporciona un mecanismo para identificar la forma expandida o el significado de las abreviaturas.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#abbreviations'),(63,'3.1.5','Nivel de lectura','Cuando un texto requiere un nivel de lectura más avanzado que el nivel mínimo de educación secundaria una vez que se han eliminado nombres propios y títulos, se proporciona un contenido suplementario o una versión que no requiere un nivel de lectura mayor a ese nivel educativo.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#reading-level'),(64,'3.1.6','Pronunciación','Se proporciona un mecanismo para identificar la pronunciación específica de las palabras cuando el significado de esas palabras, dentro del contexto, resulta ambiguo si no se conoce su pronunciación.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#pronunciation'),(65,'3.2.1','Al recibir el foco','Cuando cualquier componente recibe el foco, no inicia ningún cambio en el contexto.','A','https://www.w3.org/WAI/WCAG21/quickref/#on-focus'),(66,'3.2.2','Al recibir entradas','El cambio de estado en cualquier componente de la interfaz de usuario no provoca automáticamente un cambio en el contexto a menos que el usuario haya sido advertido de ese comportamiento antes de usar el componente.','AA','https://www.w3.org/WAI/WCAG21/quickref/#on-input'),(67,'3.2.3','Navegación coherente','Los mecanismos de navegación que se repiten en múltiples páginas web dentro de un conjunto de páginas web aparecen siempre en el mismo orden relativo cada vez que se repiten, a menos que el cambio sea provocado por el propio usuario.','AA','https://www.w3.org/WAI/WCAG21/quickref/#consistent-navigation'),(68,'3.2.4','Identificación coherente','Los componentes que tienen la misma funcionalidad dentro de un conjunto de páginas web son identificados de manera coherente.','AA','https://www.w3.org/WAI/WCAG21/quickref/#consistent-identification'),(69,'3.2.5','Cambios a petición','Los cambios en el contexto son iniciados únicamente a solicitud del usuario o se proporciona un mecanismo para detener tales cambios.','AAA','https://www.w3.org/WAI/WCAG21/quickref/#change-on-request'),(70,'3.3.1','Identificación de errores','Si se detecta automáticamente un error en la entrada de datos, el elemento erróneo es identificado y el error se describe al usuario mediante un texto.','A','https://www.w3.org/WAI/WCAG21/quickref/#error-identification'),(71,'3.3.2','Etiquetas o instrucciones','Se proporcionan etiquetas o instrucciones cuando el contenido requiere la introducción de datos por parte del usuario.','A','https://www.w3.org/WAI/WCAG21/quickref/#labels-or-instructions'),(72,'3.3.3','Sugerencias ante errores','Si se detecta automáticamente un error en la entrada de datos y se dispone de sugerencias para hacer la corrección, entonces se presentan las sugerencias al usuario, a menos que esto ponga en riesgo la seguridad o el propósito del contenido.','AA','https://www.w3.org/WAI/WCAG21/quickref/#error-suggestion'),(73,'3.3.4','Prevención de errores (legales, financieros, datos)','Para las páginas web que representan para el usuario compromisos legales o transacciones financieras; que modifican o eliminan datos controlables por el usuario en sistemas de almacenamiento de datos; o que envían las respuestas del usuario a una prueba, se cumple al menos uno de los siguientes casos: reversible, revisado, confirmado.','AA','https://www.w3.org/WAI/WCAG21/quickref/#error-prevention-legal-financial-data'),(74,'3.3.5','Ayuda','Se proporciona ayuda dependiente del contexto','AAA','https://www.w3.org/WAI/WCAG21/quickref/#help'),(75,'3.3.6','Prevención de errores (todos)','Para las páginas web que requieren al usuario el envío de información, se cumple al menos uno de los siguientes casos: reversible, revisado, confirmado','AAA','https://www.w3.org/WAI/WCAG21/quickref/#error-prevention-all'),(76,'4.1.1','Procesamiento','En los contenidos implementados mediante el uso de lenguajes de marcas, los elementos tienen las etiquetas de apertura y cierre completas; los elementos están anidados de acuerdo a sus especificaciones; los elementos no contienen atributos duplicados y los ID son únicos, excepto cuando las especificaciones permitan estas características.','A','https://www.w3.org/WAI/WCAG21/quickref/#parsing'),(77,'4.1.2','Nombre, función, valor','Para todos los componentes de la interfaz de usuario (incluyendo pero no limitado a: elementos de formulario, enlaces y componentes generados por scripts), el nombre y la función pueden ser determinados por software; los estados, propiedades y valores que pueden ser asignados por el usuario pueden ser especificados por software; y los cambios en estos elementos se encuentran disponibles para su consulta por las aplicaciones de usuario, incluyendo las ayudas técnicas.','A','https://www.w3.org/WAI/WCAG21/quickref/#name-role-value'),(78,'4.1.3','Mensajes de estado','En el contenido implementado mediante lenguajes de marcado, los mensajes de estado se pueden determinar mediante programación a través de roles o propiedades, de modo que se puedan presentar al usuario mediante tecnologías de asistencia sin recibir atención.','AA','https://www.w3.org/WAI/WCAG21/quickref/#status-messages');
/*!40000 ALTER TABLE `wcag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wamasdb'
--

--
-- Dumping routines for database 'wamasdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 10:39:00
