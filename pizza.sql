-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: pizza
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `Almacen`
--

DROP TABLE IF EXISTS `Almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Almacen` (
  `Id_producto` int(11) NOT NULL,
  `Id_sucursal` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_producto`),
  UNIQUE KEY `Id_producto` (`Id_producto`),
  KEY `Id_sucursal` (`Id_sucursal`),
  CONSTRAINT `Almacen_ibfk_1` FOREIGN KEY (`Id_sucursal`) REFERENCES `Sucursales` (`Id_sucursales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Almacen`
--

LOCK TABLES `Almacen` WRITE;
/*!40000 ALTER TABLE `Almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Armada`
--

DROP TABLE IF EXISTS `Armada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Armada` (
  `Id_parmada` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_parmada`),
  UNIQUE KEY `Id_parmada` (`Id_parmada`),
  KEY `Id_usuario` (`Id_usuario`),
  CONSTRAINT `Armada_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `Usuario` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Armada`
--

LOCK TABLES `Armada` WRITE;
/*!40000 ALTER TABLE `Armada` DISABLE KEYS */;
/*!40000 ALTER TABLE `Armada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Articulo_pedido`
--

DROP TABLE IF EXISTS `Articulo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Articulo_pedido` (
  `Folio` int(11) NOT NULL,
  `Id_tamaño` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `Id_menu` int(11) NOT NULL,
  PRIMARY KEY (`Folio`),
  UNIQUE KEY `Folio` (`Folio`),
  KEY `Id_tamaño` (`Id_tamaño`),
  KEY `Id_menu` (`Id_menu`),
  CONSTRAINT `Articulo_pedido_ibfk_1` FOREIGN KEY (`Folio`) REFERENCES `Pedido` (`Folio`),
  CONSTRAINT `Articulo_pedido_ibfk_2` FOREIGN KEY (`Id_tamaño`) REFERENCES `Tamaño` (`Id_tamaño`),
  CONSTRAINT `Articulo_pedido_ibfk_3` FOREIGN KEY (`Id_menu`) REFERENCES `Menu` (`Id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articulo_pedido`
--

LOCK TABLES `Articulo_pedido` WRITE;
/*!40000 ALTER TABLE `Articulo_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Articulo_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direcciones_pedidos`
--

DROP TABLE IF EXISTS `Direcciones_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Direcciones_pedidos` (
  `Id_usuario` int(11) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Colonia` varchar(45) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_usuario`),
  UNIQUE KEY `Id_usuario` (`Id_usuario`),
  CONSTRAINT `Direcciones_pedidos_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `Usuario` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direcciones_pedidos`
--

LOCK TABLES `Direcciones_pedidos` WRITE;
/*!40000 ALTER TABLE `Direcciones_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Direcciones_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Elem_armada`
--

DROP TABLE IF EXISTS `Elem_armada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elem_armada` (
  `Id_parmada` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  PRIMARY KEY (`Id_parmada`),
  UNIQUE KEY `Id_parmada` (`Id_parmada`),
  KEY `Id_producto` (`Id_producto`),
  CONSTRAINT `Elem_armada_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `Almacen` (`Id_producto`),
  CONSTRAINT `Elem_armada_ibfk_1` FOREIGN KEY (`Id_parmada`) REFERENCES `Armada` (`Id_parmada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elem_armada`
--

LOCK TABLES `Elem_armada` WRITE;
/*!40000 ALTER TABLE `Elem_armada` DISABLE KEYS */;
/*!40000 ALTER TABLE `Elem_armada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empleado` (
  `Id_empleado` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `ApellidoP` varchar(45) NOT NULL,
  `ApellidoM` varchar(45) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Id_tipo` int(11) NOT NULL,
  `Id_sucursal` int(11) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Colonia` varchar(45) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `TelefonoCel` varchar(10) NOT NULL,
  `TelefonoFijo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id_empleado`),
  UNIQUE KEY `Id_empleado` (`Id_empleado`),
  KEY `Id_tipo` (`Id_tipo`),
  KEY `Id_sucursal` (`Id_sucursal`),
  CONSTRAINT `Empleado_ibfk_1` FOREIGN KEY (`Id_tipo`) REFERENCES `Tipo_empleado` (`Id_tipo`),
  CONSTRAINT `Empleado_ibfk_2` FOREIGN KEY (`Id_sucursal`) REFERENCES `Sucursales` (`Id_sucursales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estandares`
--

DROP TABLE IF EXISTS `Estandares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estandares` (
  `Id_producto` int(11) NOT NULL,
  `Id_tamaño` int(11) NOT NULL,
  `Caracteristicas` varchar(500) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Id_producto`),
  UNIQUE KEY `Id_producto` (`Id_producto`),
  KEY `Id_tamaño` (`Id_tamaño`),
  CONSTRAINT `Estandares_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `Almacen` (`Id_producto`),
  CONSTRAINT `Estandares_ibfk_2` FOREIGN KEY (`Id_tamaño`) REFERENCES `Tamaño` (`Id_tamaño`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estandares`
--

LOCK TABLES `Estandares` WRITE;
/*!40000 ALTER TABLE `Estandares` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estandares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `Id_menu` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_menu`),
  UNIQUE KEY `Id_menu` (`Id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pedido` (
  `Folio` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Colonia` varchar(45) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Id_sucursal` int(11) NOT NULL,
  PRIMARY KEY (`Folio`),
  UNIQUE KEY `Folio` (`Folio`),
  KEY `Id_usuario` (`Id_usuario`),
  KEY `Id_sucursal` (`Id_sucursal`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `Usuario` (`Id_usuario`),
  CONSTRAINT `Pedido_ibfk_2` FOREIGN KEY (`Id_sucursal`) REFERENCES `Sucursales` (`Id_sucursales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pizza_ingredientes`
--

DROP TABLE IF EXISTS `Pizza_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pizza_ingredientes` (
  `Id_menu` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  PRIMARY KEY (`Id_menu`),
  UNIQUE KEY `Id_menu` (`Id_menu`),
  KEY `Id_producto` (`Id_producto`),
  CONSTRAINT `Pizza_ingredientes_ibfk_1` FOREIGN KEY (`Id_menu`) REFERENCES `Menu` (`Id_menu`),
  CONSTRAINT `Pizza_ingredientes_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `Almacen` (`Id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pizza_ingredientes`
--

LOCK TABLES `Pizza_ingredientes` WRITE;
/*!40000 ALTER TABLE `Pizza_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pizza_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sucursales`
--

DROP TABLE IF EXISTS `Sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sucursales` (
  `Id_sucursales` int(11) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Colonia` varchar(45) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_sucursales`),
  UNIQUE KEY `Id_sucursales` (`Id_sucursales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sucursales`
--

LOCK TABLES `Sucursales` WRITE;
/*!40000 ALTER TABLE `Sucursales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tamaño`
--

DROP TABLE IF EXISTS `Tamaño`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tamaño` (
  `Id_tamaño` int(11) NOT NULL,
  `Tamaño` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_tamaño`),
  UNIQUE KEY `Id_tamaño` (`Id_tamaño`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tamaño`
--

LOCK TABLES `Tamaño` WRITE;
/*!40000 ALTER TABLE `Tamaño` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tamaño` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_empleado`
--

DROP TABLE IF EXISTS `Tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_empleado` (
  `Id_tipo` int(11) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `Sueldo` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Id_tipo`),
  UNIQUE KEY `Id_tipo` (`Id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_empleado`
--

LOCK TABLES `Tipo_empleado` WRITE;
/*!40000 ALTER TABLE `Tipo_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transportes`
--

DROP TABLE IF EXISTS `Transportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transportes` (
  `Id_transporte` int(11) NOT NULL,
  `Id_sucursal` int(11) NOT NULL,
  `Placas` varchar(10) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Año` year(4) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Id_empleado` int(11) NOT NULL,
  PRIMARY KEY (`Id_transporte`),
  UNIQUE KEY `Id_transporte` (`Id_transporte`),
  KEY `Id_sucursal` (`Id_sucursal`),
  KEY `Id_empleado` (`Id_empleado`),
  CONSTRAINT `Transportes_ibfk_1` FOREIGN KEY (`Id_sucursal`) REFERENCES `Sucursales` (`Id_sucursales`),
  CONSTRAINT `Transportes_ibfk_2` FOREIGN KEY (`Id_empleado`) REFERENCES `Empleado` (`Id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transportes`
--

LOCK TABLES `Transportes` WRITE;
/*!40000 ALTER TABLE `Transportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `Id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_usuario`),
  UNIQUE KEY `Id_usuario` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-01 12:21:22
