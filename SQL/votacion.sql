-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2023 a las 16:23:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos_presidenciales`
--

CREATE TABLE `candidatos_presidenciales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos_presidenciales`
--

INSERT INTO `candidatos_presidenciales` (`id`, `nombre`) VALUES
(1, 'Gabriel Boric'),
(2, 'Sebastián Sichel'),
(3, 'José Antonio Kast');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Arica', 1),
(2, 'Putre', 1),
(3, 'Iquique', 2),
(4, 'Pozo Almonte', 2),
(5, 'Antofagasta', 3),
(6, 'Calama', 3),
(7, 'Mejillones', 3),
(8, 'Taltal', 3),
(9, 'Copiapó', 4),
(10, 'Caldera', 4),
(11, 'Tierra Amarilla', 4),
(12, 'La Serena', 5),
(13, 'Coquimbo', 5),
(14, 'Illapel', 5),
(15, 'Vicuña', 5),
(16, 'Valparaíso', 6),
(17, 'Viña del Mar', 6),
(18, 'Quilpué', 6),
(19, 'Quillota', 6),
(20, 'Santiago', 7),
(21, 'Puente Alto', 7),
(22, 'Maipú', 7),
(23, 'La Florida', 7),
(24, 'Las Condes', 7),
(25, 'Peñalolén', 7),
(26, 'La Pintana', 7),
(27, 'Quilicura', 7),
(28, 'Conchalí', 7),
(29, 'Pudahuel', 7),
(30, 'Lo Prado', 7),
(31, 'Cerrillos', 7),
(32, 'Renca', 7),
(33, 'Quinta Normal', 7),
(34, 'Lo Barnechea', 7),
(35, 'La Reina', 7),
(36, 'Independencia', 7),
(37, 'Colina', 7),
(38, 'Lampa', 7),
(39, 'Tiltil', 7),
(40, 'San Bernardo', 7),
(41, 'Paine', 7),
(42, 'Melipilla', 7),
(43, 'Alhué', 7),
(44, 'Curacaví', 7),
(45, 'María Pinto', 7),
(46, 'San Pedro', 7),
(47, 'Talagante', 7),
(48, 'El Monte', 7),
(49, 'Isla de Maipo', 7),
(50, 'Padre Hurtado', 7),
(51, 'Peñaflor', 7),
(52, 'Rancagua', 8),
(53, 'Machalí', 8),
(54, 'San Fernando', 8),
(55, 'Santa Cruz', 8),
(56, 'Talca', 9),
(57, 'Curicó', 9),
(58, 'Linares', 9),
(59, 'Chillán', 10),
(60, 'Bulnes', 10),
(61, 'Quirihue', 10),
(62, 'Concepción', 11),
(63, 'Talcahuano', 11),
(64, 'Chillán', 11),
(65, 'Los Ángeles', 11),
(66, 'Temuco', 12),
(67, 'Padre Las Casas', 12),
(68, 'Angol', 12),
(69, 'Valdivia', 13),
(70, 'La Unión', 13),
(71, 'Paillaco', 13),
(72, 'Puerto Montt', 14),
(73, 'Osorno', 14),
(74, 'Puerto Varas', 14),
(75, 'Coyhaique', 15),
(76, 'Puerto Aysén', 15),
(77, 'Chile Chico', 15),
(78, 'Punta Arenas', 16),
(79, 'Puerto Natales', 16),
(80, 'Porvenir', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `region` varchar(50) NOT NULL,
  `comuna` varchar(50) NOT NULL,
  `candidato` varchar(50) NOT NULL,
  `como_se_entero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`id`, `nombre_apellido`, `alias`, `rut`, `email`, `region`, `comuna`, `candidato`, `como_se_entero`) VALUES
(1, 'Hans Neckelmann', 'asd', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '6', '17', 'a', 'Web'),
(2, '', 'asd', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '6', '17', 'a', 'Web'),
(3, 'Hans Neckelmann', 'asdasd12', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '1', '1', '', 'Web'),
(4, 'Hans Neckelmann', 'asdasd12', '19.606.526-1', 'sadsad@asdsad.cl', '1', '1', '', 'Web'),
(5, 'Hans Neckelmann', 'sadsad', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '1', '1', '', ''),
(6, 'Hans Neckelmann', 'sadsad', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '1', '1', '', 'Web'),
(7, 'Hans Neckelmann', 'sadasd', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '1', '1', '', ''),
(8, 'Hans Neckelmann', 'asdsadsa', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '1', '1', '', ''),
(9, 'Hans Neckelmann', 'asdsad', '19.606.526-1', 'hans.abbott.neckelmann@gmail.com', '7', '21', 'sadsad', 'Web, TV'),
(10, 'Hans Neckelmann', 'asdsad', '19520600-3', 'hans.abbott.neckelmann@gmail.com', '1', '1', 'asdsad', 'Web, TV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Región de Arica y Parinacota'),
(2, 'Región de Tarapacá'),
(3, 'Región de Antofagasta'),
(4, 'Región de Atacama'),
(5, 'Región de Coquimbo'),
(6, 'Región de Valparaíso'),
(7, 'Región Metropolitana'),
(8, 'Región del Libertador General Bernardo O\'Higgins'),
(9, 'Región del Maule'),
(10, 'Región de Ñuble'),
(11, 'Región de Biobío'),
(12, 'Región de La Araucanía'),
(13, 'Región de Los Ríos'),
(14, 'Región de Los Lagos'),
(15, 'Región de Aysén del General Carlos Ibáñez del Camp'),
(16, 'Región de Magallanes y de la Antártica Chilena');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos_presidenciales`
--
ALTER TABLE `candidatos_presidenciales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos_presidenciales`
--
ALTER TABLE `candidatos_presidenciales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
