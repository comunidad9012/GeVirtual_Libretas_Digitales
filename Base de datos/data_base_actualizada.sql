-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `ID_Alum` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `DNI` int NOT NULL,
  `Domicilio` varchar(50) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Edad` int NOT NULL,
  `Género` varchar(45) NOT NULL,
  `id_carre_corresp` int NOT NULL,
  `anio` int NOT NULL,
  PRIMARY KEY (`ID_Alum`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `id_carre_corresp_idx` (`id_carre_corresp`),
  CONSTRAINT `id_carre_corresp` FOREIGN KEY (`id_carre_corresp`) REFERENCES `carrera` (`ID_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (4,'Ramiro Gabriel','Corra',44878600,'Castelli','corraramiro02@gmail.com',20,'Masculino',1,1),(5,'Valentina','Vargas',42897123,'Rio negro','valevar@gmail.com',18,'Femenino',2,3),(6,'Julian','Galdamez',44765901,'San Juan','galdamez10@gamil.com',22,'Masculino',3,1),(13,'Valentin','Beron',44554120,'Tierra del Fuego','beroonn067@gmail.com',22,'Masculino',1,0),(14,'Bautista','Riveira',41564321,'Valentin Asina','riveria1000@gmail.com',19,'Masculino',1,1),(15,'Joaquin','Garcia',44725211,'Iselin','joaco@gamil.com',20,'Masculino',3,3),(16,'Luciano','Martinez',44112321,'Los Andes','lucho9213@gmail.com',22,'Masculino',2,2),(17,'Maria','Gonzalez',41342900,'Jujuy','mariagon231@gmail.com',23,'Femenino',2,0),(18,'Mailen','Silvera',46722101,'La Rioja','Mailen983@gamil.com',18,'Femenino',2,0),(19,'Vanesa','Lucero',39301120,'Entre Rios','vaneeeee@gamil.com',27,'Masculino',3,0),(22,'Alejandro ','Corra',22134011,'Salta','Alecorra02222@gmail.com',55,'Masculino',14,2),(24,'Bruno','Ramirez',44560111,'La cerelito','brunoo21@gmail.com',21,'Masculino',1,1),(26,'Agustín','Zolorza',34521321,'Rama Caida','aguzzz03@gmail.com',21,'Masculino',1,2),(27,'Gabriel','Rojas',44300912,'Maipú','gabrielq@gmail.com',24,'Masculino',1,3),(28,'Delfina','Moya',20989213,'Los andes 111','delfgon900@gmail.com',22,'Femenino',1,3),(29,'Matias','Suarez',29890124,'Carricondo','mattt@gmail.com',26,'Masculino',1,3),(30,'Lucia','Meltran',44780123,'Sarmiento','luciii199@gmail.com',20,'Femenino',1,2),(31,'Germán','Rinaldi',32109871,'Rawson 933','rinaldiger00@gmail.com',27,'Masculino',1,2),(32,'Nahuel','Zanabria',45671209,'Buenos Aires','zzanabria13@gmail.com',23,'Masculino',2,1),(33,'Malena','Sosa',44568902,'Libertad','malensosa@gmail.com',21,'Femenino',2,1),(34,'Mailen','Lucero',44879012,'Santa Cruz','maiii901@gmail.com',20,'Femenino',2,1),(35,'Julieta','Alonso',44567123,'Bartolomé Mitre','julii98@gmail.com',24,'Femenino',2,2),(36,'Martina','Quiroga',44879603,'Entre Rios','martiiiQ10@gmail.com',21,'Femenino',2,2),(37,'Josefina','Moya',44768901,'Capdeville 390','josssss@gmail.com',26,'Femenino',2,3),(38,'Ludmila','Barros',22190342,'Santiago del Estero','ludbarr21@gmail.com',21,'Femenino',2,3),(39,'Oscar Romero','Pavez',44878650,'Barcala','potyy@gmail.com',20,'Masculino',3,1),(40,'Mauro','Gonzales',34980011,'Ortubia','mauroG1222@gmail.com',27,'Masculino',3,1),(41,'Elias ','Ahumada',43212456,'Agustín Olivares','eliaassshh12@gmail.com',22,'Masculino',3,2),(42,'Dulce','Rosales',44123000,'Cabildo','duuulr10@gmail.com',20,'Femenino',3,3),(43,'Suyai','Corvalan',44300983,'Emilio Civit','suyaic90@gmail.com',20,'Femenino',3,2),(44,'Nicolas','Martinengo',44231389,'Juan Sat','nicoooo1923@gmail.com',23,'Masculino',3,3),(45,'Franco ','Quesada',44567891,'Ballofet','julii.at10@gmail.com',21,'Masculino',3,2),(46,'Lorena ','Caminos',33212093,'Cardonato','lorecam12@gmail.com',34,'Femenino',15,1),(47,'Lujan','Sosa',23403122,'Perú','Lujiiiisss122@gmail.com',22,'Femenino',15,1),(48,'Julian ','Astudillo',44342112,'Francia','julianqq23@gmail.com',24,'Masculino',15,1),(49,'Paula','Astudillo',54329012,'Tierra del Fuego','pauliii2301@gmail.com',24,'Femenino',15,2),(50,'Daniel','Colombo',12330111,'Los andes 231','danicor10@gmail.com',29,'Masculino',15,2),(51,'Gustavo','Figueroa',32341120,'Necochea','gustriiisa23@gmail.com',23,'Masculino',15,2),(52,'Cintia','Tisera',22344111,'Fincañales','cintiiaa1203@gmail.com',24,'Femenino',15,3),(53,'Alejandro','Medina',44342000,'Los andes 983','alegames10@gmail.com',21,'Masculino',15,3),(54,'Belen','Carretero',23431120,'Los andes 983','belenyale@gmail.com',21,'Masculino',15,3),(55,'Joaquin','Condori',23099999,'Monte','joacocon12@gmail.com',18,'Masculino',14,1),(56,'Laura','Rodriguez',44590812,'Federico Gárcia','laurrr.10@gmail.com',21,'Femenino',14,1),(57,'Malena ','Perez',46872311,'Cabral','malenp.12@gmail.com',19,'Femenino',14,1),(58,'Santiago','Perez',46780122,'Sauces','santip.1093@gmail.com',21,'Masculino',14,2),(59,'Lautaro','Vega',45434555,'San Lorenzo','lautivega27@gmail.com',20,'Masculino',14,2),(60,'Valentina','Vega',33450221,'Los manseros','valess23@gmail.com',26,'Femenino',14,3),(61,'Dario','Enrique',22123000,'Castelli','darioenrique10@gmail.com',27,'Masculino',14,3),(62,'Federico','Corra',23123004,'Banco Mendoza','federicocorra12@gmail.com',25,'Femenino',14,3),(63,'Juan','Alvarez',32400921,'montaña','alvarezpablito6@gmail.com',26,'Masculino',16,3),(64,'Valentin','Zuñega',34509831,'Barracas','valentinzuñega60.@gmail.com',20,'Masculino',16,1),(65,'Joaquin','De vicente',56879012,'Tierra del Fuego','joacppppp@gmail.com',21,'Otro',16,2),(66,'David','Medina',92384211,'Juan Sat','david@gmail.com',22,'Masculino',16,1),(67,'Valentina','Vargas',49130597,'Capdeville','gordibella@gmail.com',19,'Otro',1,1),(68,'Gabriel','Rosendorn',45378980,'barrio altaterra','rosendorn@gmail.com',20,'Otro',1,3),(69,'Eduardo','Perez',10902301,'Real del Padre','eduardoperez1000@gmail.com',20,'Masculino',1,3),(70,'Cristian','Chávez ',93202112,'Mexico 342','cristian@gmail.com',24,'Masculino',1,3),(72,'julio','ramirez',20987132,'Savedra 333','julio@gmail.com',21,'Masculino',1,3);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `ID_carrera` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Resolucion` varchar(45) NOT NULL,
  `Modalidad` varchar(45) NOT NULL,
  `Duracion` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_carrera`),
  UNIQUE KEY `Resolucion_UNIQUE` (`Resolucion`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Desarrollo de Software','501','Presencial','3 años'),(2,'Seguridad e Higiene','0695','Presencial','3 años'),(3,'Computación y Redes','123','Presencial','3 años'),(14,'Obras viales','0701','Presencial','3 años'),(15,'Administracion de Empresas','0800','Presencial','3 años'),(16,'Biomedicina','983','Presencial','3 años');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluaciones` (
  `ID_evaluaciones` int NOT NULL AUTO_INCREMENT,
  `id_alum` int NOT NULL,
  `Id_materia` int NOT NULL,
  `Curso` int NOT NULL,
  `Evaluación_id` int NOT NULL,
  `Calificación` int NOT NULL,
  PRIMARY KEY (`ID_evaluaciones`),
  UNIQUE KEY `ID_evaluaciones_UNIQUE` (`ID_evaluaciones`),
  KEY `Id_materia_idx` (`Id_materia`),
  KEY `Id_alum_idx` (`id_alum`),
  KEY `Evaluación_id_idx` (`Evaluación_id`),
  CONSTRAINT `Evaluación_id` FOREIGN KEY (`Evaluación_id`) REFERENCES `tipo_evaluación` (`ID_Tipo_evaluacion`),
  CONSTRAINT `Id_alum` FOREIGN KEY (`id_alum`) REFERENCES `alumnos` (`ID_Alum`),
  CONSTRAINT `Id_materia` FOREIGN KEY (`Id_materia`) REFERENCES `materias` (`ID_materias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (3,4,2,1,2,9),(4,6,3,3,1,7);
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreta`
--

DROP TABLE IF EXISTS `libreta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreta` (
  `Materia_id` int NOT NULL,
  `Evaluacion_id` int NOT NULL,
  `Calificacion` int NOT NULL,
  `alum_id` int NOT NULL,
  KEY `FK_Evaluación_id_idx` (`Evaluacion_id`),
  KEY `FK_alum_id_idx` (`alum_id`),
  CONSTRAINT `FK_alum_id` FOREIGN KEY (`alum_id`) REFERENCES `alumnos` (`ID_Alum`),
  CONSTRAINT `FK_Evaluación_id` FOREIGN KEY (`Evaluacion_id`) REFERENCES `tipo_evaluación` (`ID_Tipo_evaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreta`
--

LOCK TABLES `libreta` WRITE;
/*!40000 ALTER TABLE `libreta` DISABLE KEYS */;
INSERT INTO `libreta` VALUES (2,1,8,4),(5,1,10,4),(6,1,9,4),(2,3,7,4),(5,3,6,4),(6,1,10,4),(2,1,9,4),(2,1,2,4),(2,3,5,4),(2,1,4,4),(5,1,8,14),(1,1,6,26),(15,1,5,26),(5,1,10,4),(19,1,8,29),(18,1,10,29),(44,1,10,47),(6,1,8,4),(1,1,9,26),(2,1,8,14),(2,1,9,24),(6,3,2,4),(52,4,3,64),(6,6,9,4),(60,4,7,63),(5,6,10,14),(5,4,7,14),(2,5,5,67),(2,6,10,4),(61,5,10,4),(18,1,8,70),(18,3,7,70),(19,6,6,70),(9,5,10,70),(18,1,8,70),(9,1,8,70),(9,4,6,70),(5,6,10,4),(5,5,7,4);
/*!40000 ALTER TABLE `libreta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `ID_materias` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `id_prof_corresp` int NOT NULL,
  `anio` int NOT NULL,
  `id_carre_corresp` int NOT NULL,
  PRIMARY KEY (`ID_materias`),
  UNIQUE KEY `ID_materias_UNIQUE` (`ID_materias`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`),
  KEY `id_prof_corresp_idx` (`id_prof_corresp`),
  KEY `id_carre_corresp_idx` (`id_carre_corresp`),
  CONSTRAINT `id_prof_corresp` FOREIGN KEY (`id_prof_corresp`) REFERENCES `profesor` (`ID_Profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Análisis Matemático',25,2,1),(2,'Ingles I',18,1,1),(3,'Modelado de software',27,2,1),(4,'Programación II',1,2,1),(5,'Programación I',23,1,1),(6,'Practicas Profesionalizantes I',19,1,1),(7,'Ética Laboral',20,3,0),(8,'Comunicaciones',21,1,0),(9,'Ingles III',22,3,1),(10,'Quimica I',23,1,0),(11,'Comunicaciones y Redes',26,2,1),(15,'Ingles II',18,2,1),(18,'Seguridad Informática',32,3,1),(19,'Arquitectura y Diseño de interfaces ',33,3,1),(20,'Higiene Laboral I',34,1,2),(21,'Teoría de Organizaciones',35,1,2),(23,'Ingles ',36,1,2),(24,'Higiene Laboral II',37,2,2),(25,'Interpretación de Planos',38,2,2),(26,'Seguridad Laboral II',39,2,2),(27,'Derecho Laboral',40,3,2),(28,'Higiene Y Seguridad Minera ',41,3,2),(29,'Seguridad Contra Incendios',41,3,2),(30,'Comprensión de Textos',42,1,3),(31,'Ingles 1',18,1,3),(32,'Logica Computacional',25,1,3),(33,'Ética Profesional',43,2,3),(34,'Fundamentos de Programación',26,2,3),(35,'Sistemas Operativos II',33,2,3),(36,'Practica Profesionalizante 3',32,3,3),(37,'Soporte de Infraestructura',1,3,3),(38,'Seguridad en Redes',44,3,3),(43,'Ingles 1°',45,1,15),(44,'Matemática ',46,1,15),(45,'Contabilidad',47,1,15),(46,'Calculo Financiero ',48,2,15),(47,'Desarrollo Territorial',49,2,15),(48,'Comercialización ',50,2,15),(49,'Practica Profesionalizante III',51,3,15),(50,'Gestión de la calidad',52,3,15),(51,'Derecho Laboral I',53,3,15),(52,'Matemática Aplicada',54,1,16),(53,'Física Aplicada',55,1,16),(54,'Tecnología de Materiales',56,1,16),(55,'Practica Profesionalizante 2',58,2,16),(56,'Equipamientos Biomédicos ',59,2,16),(57,'Instalaciones y Maquinas Eléctricas ',60,2,16),(58,'Proyecto final',62,3,16),(59,'Instrumentación Médica ',63,3,16),(60,'Legislación ',64,3,16),(61,'Sistemas Administrativos',70,1,1);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `ID_Profesor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `DNI` int NOT NULL,
  `Domicilio` varchar(50) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Edad` int NOT NULL,
  `Genero` varchar(45) NOT NULL,
  `Cuil` varchar(45) NOT NULL,
  `id_carrerac` int NOT NULL,
  `anio` int NOT NULL,
  `docente` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Profesor`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `ID_Profesor_UNIQUE` (`ID_Profesor`),
  UNIQUE KEY `Cuil_UNIQUE` (`Cuil`),
  KEY `id_carrerac_idx` (`id_carrerac`),
  KEY `anio_idx` (`anio`,`id_carrerac`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'David','Veisaga',27478612,'Alberdi','davidveisaga09@gmail.com',40,'Masculino','9987645',1,2,''),(2,'Jorge','Garcia',21347182,'Emilio Civit','Jorgegar21@gmail.com',35,'Masculino','4759231',1,2,''),(18,'Renata','Macovaz',27412003,'Libertador','renataa2339@gmail.com',40,'Femenino','44576811',1,2,''),(19,'Luciana','Gimenez',21447882,'Alberdi','luciana111@gmail.com',55,'Femenino','95433220',1,2,''),(20,'Lourdes','Guizzardi',2712112,'Solano','louuu000@gmail.com',39,'Femenino','77645123',1,1,''),(21,'Alejandro','Pringles',27645111,'Lombardi','aleep23@gmail.com',40,'Masculino','4487860',1,1,''),(22,'David','Perez',21222320,'Rawson','perezz1@gmail.com',35,'Masculino','82310912',1,1,''),(23,'Enrique','Visedo',21347184,'Las Heras','visedoenriq@gmail.com',35,'Masculino','4759232',1,1,''),(25,'Sergio','Fuentes',23098123,'Capdeville','fuentes@gmail.com',43,'Masculino','12239088',1,2,''),(26,'Adrian','Martinez',26543109,'La Rioja y Salta','adrianM@gmail.com',49,'Masculino','220098321',1,2,''),(27,'Enrique','Martinez',21980361,'Maipú','emartinez@gmail.com',56,'Masculino','21345100',1,2,''),(28,'Iris','De vicente',23120981,'9 de julio ','irissdvic10@gmail.com',50,'Femenino','2398',1,1,''),(32,'Daniela','Gomez',32412098,'La cerelito','danii73@gmail.com',34,'Femenino','234545332',1,3,''),(33,'Carlos ','Privitera',34521092,'Tierra del Fuego','carlossss89@gmail.com',50,'Masculino','342345454',1,3,''),(34,'Daniel','Ghiglione',23908235,'Siglo 21','danielll34@gmail.com',48,'Masculino','234235325',2,1,''),(35,'Patricia','Nicolao',23456754,'mexico','patoo123@gmail.com',30,'Femenino','23454212',2,1,''),(36,'Vanina','Jorquera',34231098,'Emilio Civit','vaninaff43@gmail.com',32,'Femenino','2345676521',2,1,''),(37,'María Daniela','Dicesare',34678765,'Rama Caida','dicesaredani@gmail.com',56,'Femenino','934848363',2,2,''),(38,'Marcelo Fabian','Gonzales',45344221,'Chañaral','marcelogonzales@gmail.com',49,'Masculino','32457097',2,2,''),(39,'Maria','Guinsburg',32098654,'Mendoza','mariassd23@gmail.com',45,'Femenino','3213123123',2,2,''),(40,'Daniela','Pallares',32509324,'Juan Cruz','danielapall@gmail.com',30,'Femenino','234568752',2,3,''),(41,'Mario Omar','Granero',23410932,'Godoy Cruz','marioomar@gmail.com',48,'Masculino','234124092',2,3,''),(42,'Mariangeles','Navas',23456342,'Dean funes','mariangeles@gmail.com',45,'Femenino','45987653',3,1,''),(43,'María','Gombau',23457653,'montaña','mariagom@gmail.com',55,'Femenino','3242342345',3,2,''),(44,'Daniel','Crespillo',34542111,'9 de julio ','daniel1290@gmail.com',45,'Masculino','234235453',3,3,''),(45,'Laura ','Rosas',23525323,'montaña','lauuuu@gmail.com',67,'Femenino','23412341',15,1,''),(46,'Silvina del Valle ','Reyes',23452934,'Tierra del Fuego','silvinaaa@gmail.com',44,'Femenino','23487956',15,1,''),(47,'Virginia ','Piastrllini',23409234,'Siglo 21','virgiiii@gmail.com',33,'Femenino','2356786',15,1,''),(48,'Héctor','Lana',98374593,'Maipú','hectorlana@gmail.com',44,'Masculino','346756876',15,2,''),(49,'Paula','García',39485942,'Santa Cruz','paulagar@gmail.com',39,'Femenino','32767563',15,2,''),(50,'Miriam','Elizhabet ',23454675,'La cerelito','miriam@gmail.com',54,'Femenino','23647432211',15,2,''),(51,'Gastón ','Lombard',34575565,'Emilio Civit','gastooon@gmail.com',44,'Masculino','453345345',15,3,''),(52,'Marcelo','Cordero',34987593,'9 de julio ','marceeeloo@gmail.com',40,'Masculino','38453453',15,3,''),(53,'Marianela','Fernandez',39845932,'montaña','marianela@gmail.com',33,'Femenino','948293454',15,3,''),(54,'Marcela','Santarossa',23523211,'Tierra del Fuego','marcela@gmail.com',41,'Femenino','34905893',16,1,''),(55,'Dante ','Berdugo',93847529,'Godoy Cruz','dante@gmail.com',32,'Masculino','3252111221',16,1,''),(56,'Mauricio','Farconi',29384721,'Capdeville 345','mauriiiii@gmail.com',40,'Masculino','234211123',16,1,''),(57,'Mónica ','Zucca',3452323,'Godoy Cruz','monica@gmail.com',43,'Femenino','23423423',1,1,''),(58,'Emmanuel ','Funes',9394875,'Federico Gárcia','emaaaa@gmail.com',32,'Masculino','2523423',16,2,''),(59,'Gustavo','Malaniuk',23452111,'Francia','gustaavoo@gmail.com',56,'Masculino','235231346',16,2,''),(60,'Ezequiel','Membrive',98324723,'Fincañales','eze@gmail.com',44,'Masculino','04965076',16,2,''),(61,'Fernanda','Golbano',39045854,'La cerelito','fergolbv@gmail.com',34,'Femenino','23567087',2,1,''),(62,'Alfredo','Dicesare',12596843,'Godoy Cruz','dicesare@gmail.com',49,'Masculino','05689743',16,3,''),(63,'Adrián ','Lucero ',40634324,'Juan Sat','adrian@gmail.com',42,'Masculino','04958609834',16,3,''),(64,'Ernesto','Ochoa',9348795,'La cerelito','ochoa@gmail.com',55,'Masculino','934853321',16,3,''),(65,'Nicolao','García ',4985653,'montaña','gacr@gmail.com',54,'Masculino','943803345',15,1,''),(66,'Silvina','García',3453452,'Tierra del Fuego','sil@gmail.com',34,'Femenino','384963231',15,1,''),(67,'Laura','Rosas',43563453,'Godoy Cruz','lauud@gmail.com',45,'Femenino','39845345',15,2,''),(68,'Nelson','Cerezo',3984535,'Siglo 21','nelson@gmail.com',50,'Masculino','20934523',15,2,''),(69,'Ana','Gombau',34563456,'Federico Gárcia','anaaa@gmail.com',34,'Femenino','40956343',15,3,''),(70,'Mónica ','Succa',12098210,'Alberto Rivadavia','monicazucca.02@gmail.com',44,'Femenino','9230002111',1,1,''),(73,'Graciela','Denita',89000912,'Casf - sdkfd 123','gracielaaaaa@gmail.com',60,'Femenino','929390122',1,3,''),(74,'Ceferino Cristian ','Sepulveda',83210983,'Buenos Aires 322','cefecsepulveda20@gmail.com',31,'Masculino','27321098749',1,3,'');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_evaluación`
--

DROP TABLE IF EXISTS `tipo_evaluación`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evaluación` (
  `ID_Tipo_evaluacion` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Tipo_evaluacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_evaluación`
--

LOCK TABLES `tipo_evaluación` WRITE;
/*!40000 ALTER TABLE `tipo_evaluación` DISABLE KEYS */;
INSERT INTO `tipo_evaluación` VALUES (1,'Exámen Parcial'),(2,'Exámen Final'),(3,'Trabajo Práctico'),(4,'Revisión de Carpeta'),(5,'Evaluación escrita'),(6,'Evaluación oral');
/*!40000 ALTER TABLE `tipo_evaluación` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `documento` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contraseña_UNIQUE` (`contraseña`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Ramiro','Corra',44878200,'corraramiro02@gmail.com','$2b$12$ukp.TbH6dTat65Jq7EI.gOtp2qudLUHcqnjKufOPN7AOAZdA96s0a','user'),(3,'Bautista','Riveira',230981123,'bautiriveira24@gmail.com','$2b$12$Ds50VbYrIWJ9BaX4t9bjweOySy.i3Wja/b6YehQ.6OBbE7rebs2n6','user'),(4,'Julián','Astudillo',44878601,'juliastudillo@gmail.com','$2b$12$urY7WMtg.Wj.PSo3buJpqOg3txM9d/rHVd3XqOosdxhDPA.Xy0e0i','user'),(5,'admin','admin',21324900,'adminies9012@gmail.com','$2b$12$la0sDMCB2LJaI3oWUz243eWLZF5ZShAxUb.1IN83pcd6FwglCzSIK','admin'),(6,'Bautista','Riveira Buca',45256306,'bautiriveirabuca8@gmail.com','$2b$12$ebI2gsEf/DgKgk7/YJZiX.PzDGBCsEPMWNIi9FKPCgMVLog9Wabqq','user'),(7,'Bauti','Buca',44234444,'bauti.riveira2@gmail.com','$2b$12$JloK3gK0ouaRIcdpKmzWfeE8p549zJQD6GAhlCHe1bTmRd.6WxwFK','user');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-24 20:09:00
