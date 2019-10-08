-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2019 a las 20:20:19
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
-- Base de datos: `laboratorio14`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `geometry`
--

CREATE TABLE `geometry` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Descripción` varchar(256) NOT NULL,
  `URL` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `geometry`
--

INSERT INTO `geometry` (`ID`, `Name`, `Descripción`, `URL`) VALUES
(1, 'yStep', 'Completa xStep en modo práctica', 'https://vignette.wikia.nocookie.net/geometry-dash/images/9/9d/Cube017.png/revision/latest?cb=20150327071926'),
(2, 'The Journey Begins', 'Colecciona 10 User Coins', 'https://vignette.wikia.nocookie.net/geometry-dash/images/d/d1/Cube049.png/revision/latest?cb=20150829171050'),
(3, 'Stars', 'Colecciona 2000 estrellas', 'https://vignette.wikia.nocookie.net/geometry-dash/images/5/50/Ball09.png/revision/latest?cb=20150727113907');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntarios`
--

CREATE TABLE `voluntarios` (
  `VolID` int(255) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido_Materno` varchar(50) NOT NULL,
  `Apellido_Paterno` varchar(50) NOT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(12) DEFAULT NULL,
  `Edad` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `voluntarios`
--

INSERT INTO `voluntarios` (`VolID`, `Nombre`, `Apellido_Materno`, `Apellido_Paterno`, `Mail`, `Teléfono`, `Edad`) VALUES
(1, 'Raymundo', 'Romero', 'Arenas', 'ray.romero.arenas@gmail.com', '4776496924', 20),
(2, 'Juan José', 'Díaz ', 'André', 'A01066352@itesm.mx', '4776497000', 21),
(3, 'Eduardo', 'Juárez', 'Pineda', 'edjuarezp@tec.mx', '4427777777', 27),
(4, 'Ricardo', 'Cortés', 'Espinosa', 'rcortese@tec.mx', '4421234567', 40),
(10, 'Patricia', 'Arenas', 'Carrillo', 'paty.arenas@gmail.com', '4776497001', 48),
(11, 'Fátima', 'Delenne', 'Zapata', 'A01630541@itesm.mx', '4429876543', 21),
(12, 'Doménica', 'Rentería', 'Berrospe', 'A01208576@itesm.mx', '4421235813', 21),
(13, 'Adriana Paola', 'Salinas', 'García', 'A01703675@itesm.mx', '4778888444', 20),
(14, 'Raymundo', 'Romero ', 'Hernández', 'rromero@bb.com.mx', '4771595948', 54);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `geometry`
--
ALTER TABLE `geometry`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `nombre_unico` (`Name`);

--
-- Indices de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD PRIMARY KEY (`VolID`),
  ADD UNIQUE KEY `telefono_unico` (`Teléfono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `geometry`
--
ALTER TABLE `geometry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  MODIFY `VolID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
