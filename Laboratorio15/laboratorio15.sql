-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2019 a las 20:21:08
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laboratorio15`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntarios`
--

CREATE TABLE `voluntarios` (
  `VolID` int(100) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  `Edad` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `voluntarios`
--

INSERT INTO `voluntarios` (`VolID`, `Nombre`, `Mail`, `Telefono`, `Edad`) VALUES
(1, 'Raymundo', 'A00570654@itesm.mx', '4776496924', 20),
(2, 'Patricia', 'paty.arenas@gmail.com', '4776497000', 45),
(3, 'Fátima', 'A01635041@itesm.mx', '4421234567', 20),
(4, 'Juan José', 'A01066352@itesm.mx', '4427777777', 21),
(5, 'Patricio', 'patricio.romero@gmail.com', '4772289298', 21),
(6, 'Ricardo', 'rcortese@tec.mx', '4423004000', 45),
(12, 'Carlos', 'A01703280@itesm.mx', '4624554655', 21),
(13, 'Tomás', 'A00570655@itesm.mx', '4776496935', 34);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD PRIMARY KEY (`VolID`),
  ADD UNIQUE KEY `telefono_unico` (`Telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  MODIFY `VolID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
