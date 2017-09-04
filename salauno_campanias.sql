-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2017 a las 19:15:24
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `salauno_campanias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `nombre_aliado` varchar(100) DEFAULT NULL,
  `nombre_medico` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `tipo_campania` varchar(100) DEFAULT NULL,
  `promocion` varchar(100) DEFAULT NULL,
  `status` enum('En Proceso','Planeada','Completada','Cancelada') DEFAULT 'En Proceso',
  `activo` enum('Si','No') DEFAULT 'No',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `consultas` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `nombre_aliado`, `nombre_medico`, `correo_electronico`, `telefono`, `direccion`, `codigo`, `tipo_campania`, `promocion`, `status`, `activo`, `updated_at`, `created_at`, `consultas`) VALUES
(1, 3, 'Prueba', 'Prueba Eri', 'erika.villanueva@salauno.com.mx', '5543716167', 'N/A', 'C-CP-TEST-001', 'AA', '', 'Completada', 'No', '2017-08-31 21:59:57', '2017-08-25 23:59:38', 'Optica $150,Refractivo'),
(2, 3, 'SSA', 'Ivan Escobar Lopez', 'ivanescobarlopez.ie@gmail.com', '5568996228', 'IZTAPALAPA', 'CCP-SSA-025-001', 'AA', 'VISION INTEGRAL SIN COSTO, VI+OFTALMO $150', 'En Proceso', 'Si', '2017-08-31 22:00:06', '2017-08-30 04:42:37', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidates`
--

CREATE TABLE `candidates` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(5) DEFAULT NULL,
  `genero` enum('Femenino','Masculino','Otro') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocupacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiene_seguro_medico` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `seguro_medico` enum('IMSS','ISSTE','Seguro Popular','Seguro Privado','Otro','Ninguno') COLLATE utf8_unicode_ci DEFAULT NULL,
  `seguro_medico_otro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_poliza` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_fijo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_celular` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiene_correo_electronico` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `correo_electronico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domicilio_cp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domicilio_calle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domicilio_ciudad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domicilio_poblacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diabetes` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `diabetes_tiempo_anios` int(11) DEFAULT NULL,
  `retinopatia_diabetica` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `hipertension` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `hipertension_tiempo_anios` int(11) DEFAULT NULL,
  `familiar_glaucoma` enum('Si','No','No se') COLLATE utf8_unicode_ci DEFAULT NULL,
  `enfermedad_tiroides` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `disminucion_vista` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `consulta_oftalmologo` enum('Mas de un año','Menos de un año','Nunca') COLLATE utf8_unicode_ci DEFAULT NULL,
  `examen_visual` enum('Mas de un año','Menos de un año','Nunca') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cirugia_ojo` enum('Si','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `cirugia_ojo_cual` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firma` text COLLATE utf8_unicode_ci,
  `etapa` enum('Registro','Revision','Exploracion','Optica','Enfermeria','Consejeria','Terminado','Enviado a SF','Error importacion','Duplicado en SF') COLLATE utf8_unicode_ci DEFAULT 'Registro',
  `motivo_etapa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('No Interesado','Con cita','No Calificado') COLLATE utf8_unicode_ci DEFAULT 'No Interesado',
  `clinica` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_cita` date DEFAULT NULL,
  `salesforce_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_diagnostico` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_consulta` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `hora_consulta` time DEFAULT NULL,
  `ojo_prediagnostico` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `presion_estado_medicion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `candidates`
--

INSERT INTO `candidates` (`id`, `user_id`, `campaign_id`, `codigo`, `nombres`, `apellidos`, `fecha_nacimiento`, `edad`, `genero`, `ocupacion`, `tiene_seguro_medico`, `seguro_medico`, `seguro_medico_otro`, `numero_poliza`, `telefono_fijo`, `telefono_celular`, `tiene_correo_electronico`, `correo_electronico`, `domicilio_cp`, `domicilio_calle`, `domicilio_ciudad`, `domicilio_poblacion`, `diabetes`, `diabetes_tiempo_anios`, `retinopatia_diabetica`, `hipertension`, `hipertension_tiempo_anios`, `familiar_glaucoma`, `enfermedad_tiroides`, `disminucion_vista`, `consulta_oftalmologo`, `examen_visual`, `cirugia_ojo`, `cirugia_ojo_cual`, `firma`, `etapa`, `motivo_etapa`, `status`, `clinica`, `fecha_cita`, `salesforce_id`, `pre_diagnostico`, `created_at`, `updated_at`, `tipo_consulta`, `hora_consulta`, `ojo_prediagnostico`, `presion_estado_medicion`) VALUES
(1, '3', '1', 'TEST-001-001', 'Eduardo', 'Hernandez', '1993-03-10', 24, 'Masculino', 'Sistemas', NULL, 'Ninguno', '', '', '0000000000', '000000000', NULL, 'sincorreo@salauno.com.mx', '1234', NULL, 'México', 'N/A', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000ezUw2EAE', 'Sin Hallazgos', '2017-08-26 00:00:55', '2017-08-26 00:01:21', '', '00:00:00', 'AO', NULL),
(2, '3', '1', 'TEST-001-002', 'YSAMAR', 'ROMANO ESPINAL', '1992-08-07', 25, 'Femenino', 'EMPLEADA ', NULL, '', '', '', '4762412', '4762412', NULL, 'sincorreo@salauno.com.mx', '', NULL, 'CDMX', 'BENITO JUAREZ', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'Consejeria', '', 'No Interesado', NULL, NULL, NULL, 'Sin Hallazgos', '2017-08-29 18:24:38', '2017-08-29 18:52:38', NULL, NULL, 'AO', NULL),
(3, '3', '1', 'TEST-001-003', 'jijij', 'jojojo', '1988-11-11', 28, 'Femenino', 'jh', NULL, 'Ninguno', '', '', '', '123456789', NULL, 'sincorreo@salauno.com.mx', '', NULL, 'jijo', 'joji', 'Si', 5, NULL, 'Si', 5, 'No', 'Si', 'Si', NULL, 'Nunca', '', NULL, NULL, 'Terminado', '', 'No Calificado', '', '0000-00-00', NULL, 'Otro', '2017-08-29 18:56:48', '2017-08-29 19:00:55', '', '00:00:00', 'AO', NULL),
(4, '3', '2', '025-001-001', 'Josefina', 'Contreras Falcon', '1944-03-18', 73, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '50340752', '5539974790', NULL, 'sincorreo@salauno.com.mx', '09750', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 25, 'Si', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Terminado', 'Pb glaucoma', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AnCEAU', 'Conjuntivitis', '2017-08-30 19:56:36', '2017-08-31 21:53:55', '', '09:00:00', 'AO', NULL),
(5, '3', '2', '025-001-002', 'maria ', 'salgadp castañeda ', '1931-07-23', 86, 'Femenino', 'ama de casa ', NULL, '', '', '', '54280929', '000000000', NULL, 'sincorreo@salauno.com.mx', '', NULL, 'CDMX', 'IZTAPALAPA', NULL, 0, NULL, 'Si', 20, 'No', NULL, NULL, NULL, NULL, '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0AnREAU', 'Conjuntivitis', '2017-08-30 19:56:46', '2017-08-31 01:28:45', '', '16:00:00', 'AO', NULL),
(6, '3', '2', '025-001-003', 'Oliva', 'Hernandez mercado', '1950-03-08', 67, 'Femenino', 'Comerciante', NULL, 'Seguro Popular', '', '', '54274145', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09707', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-04', '00Q3600000f0AnbEAE', 'Sin Hallazgos', '2017-08-30 19:58:03', '2017-08-31 01:28:49', '', '16:45:00', 'AO', NULL),
(7, '3', '2', '025-001-004', 'José Agustín ', 'González Silva', '1948-08-23', 69, 'Masculino', 'Jubilado', NULL, 'IMSS', '', '', '50340752', '5539974790', NULL, 'sincorreo@salauno.com.mx', '09750', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 12, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AoZEAU', 'Ojo Seco', '2017-08-30 19:59:21', '2017-08-31 01:29:25', '', '09:15:00', 'AO', NULL),
(8, '3', '2', '025-001-005', 'Lourdes florentina', 'Ramirez reyes', '1948-11-03', 68, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '71608652', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09839', NULL, 'Df', 'Iztapalapa', 'Si', 15, NULL, 'Si', 20, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'No ve bien de lejos ', 'No Interesado', '', '0000-00-00', '00Q3600000f0AojEAE', 'Fondo coroideo/ Adelgazamiento de retina', '2017-08-30 20:01:31', '2017-08-31 01:29:30', '', '00:00:00', 'OD', NULL),
(9, '3', '2', '025-001-006', 'Margarita ', 'Hernández Guzmán', '1947-02-22', 70, 'Femenino', 'Hogar', NULL, 'ISSTE', '', '', '28350850', '5513790238', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, 'No', NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AooEAE', 'Sin Hallazgos', '2017-08-30 20:01:34', '2017-08-31 01:29:33', '', '00:00:00', 'AO', NULL),
(10, '3', '2', '025-001-007', 'Jose benito', 'Rodriguez castillo', '1946-02-12', 71, 'Masculino', 'Pensionado', NULL, 'IMSS', '', '', '71549429', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, 'Si', 4, 'No', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', 'Ve borroso', 'Con cita', 'a0A36000003WrH0', '2017-09-13', '00Q3600000f0Ap3EAE', 'Catarata', '2017-08-30 20:04:30', '2017-08-31 01:29:37', '', '04:15:00', 'OI', NULL),
(11, '3', '2', '025-001-008', 'Guadalupe ', 'Alonso Victoria', '1950-12-12', 66, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '71549429', '5519134969', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'CDMX', 'Iztapalapa', 'Si', 1, NULL, 'Si', 4, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'Catarata OD', 'Con cita', 'a0A36000003WrH0', '2017-09-13', '00Q3600000f0ApDEAU', 'Catarata', '2017-08-30 20:04:41', '2017-08-31 01:29:41', '', '16:00:00', 'OD', NULL),
(12, '3', '2', '025-001-009', 'Bertha', 'Morelos Martínez ', '1951-03-20', 66, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '58402341', '0000000000', NULL, 'sincorreo@salauno.com.mx', '', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, 'Si', 20, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', 'Necesita lentes', 'No Interesado', '', '0000-00-00', '00Q3600000f0ApNEAU', 'Ojo Seco', '2017-08-30 20:06:42', '2017-08-31 01:29:45', '', '00:00:00', 'AO', NULL),
(13, '3', '2', '025-001-010', 'Nicolás ', 'Zamora Rodríguez', '1950-11-13', 66, 'Masculino', 'Pensionado', NULL, 'IMSS', '', '', '56422024', '5512020196', NULL, 'sincorreo@salauno.com.mx', '09770', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'Glaucoma', 'No Interesado', '', '0000-00-00', '00Q3600000f0ApXEAU', 'Excavación sospechosa', '2017-08-30 20:06:45', '2017-08-31 01:29:49', '', '00:00:00', 'AO', NULL),
(14, '3', '2', '025-001-011', 'María Eugenia', 'Palma Silva ', '1961-04-05', 56, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '56074147', '5575128081', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, NULL, NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0AphEAE', 'Refractivo (evaluar graduación)', '2017-08-30 20:08:51', '2017-08-31 01:29:52', '', '16:00:00', 'AO', NULL),
(15, '3', '2', '025-001-012', 'Georgina', 'Sanchez gonzalez', '1957-10-24', 59, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '', '5582472186', NULL, 'sincorreo@salauno.com.mx', '', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, 'Si', 5, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'No ve bien ', 'Con cita', 'a0A36000003WrH0', '2017-09-04', '00Q3600000f0AprEAE', 'Excavación sospechosa', '2017-08-30 20:10:03', '2017-08-31 01:29:57', '', '13:45:00', 'AO', NULL),
(16, '3', '2', '025-001-013', 'Josefina Romana ', 'Samano Hernández', '1964-11-18', 52, 'Femenino', 'Hogar', NULL, 'ISSTE', '', '', '56086977', '5531151455', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, 'No', NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0ApiEAE', 'Refractivo (evaluar graduación)', '2017-08-30 20:10:47', '2017-08-31 01:30:00', '', '14:00:00', 'AO', NULL),
(17, '3', '2', '025-001-014', 'Elizabeth', 'Guillén guillen', '1975-06-12', 42, 'Femenino', 'Hogar', NULL, 'Otro', 'Gratuidad', '', '', '5584102597', NULL, 'sincorreo@salauno.com.mx', '09840', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'Necesita lentes', 'Con cita', 'a0A36000003WrH0', '2017-09-02', '00Q3600000f0Aq1EAE', 'Refractivo (evaluar graduación)', '2017-08-30 20:12:55', '2017-08-31 01:30:03', '', '12:00:00', 'AO', NULL),
(18, '3', '2', '025-001-015', 'María Altagracia ', 'Vázquez Cruz', '1954-12-18', 62, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5526877042', NULL, 'sincorreo@salauno.com.mx', '09860', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 20, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AqBEAU', 'Ojo Seco', '2017-08-30 20:13:01', '2017-08-31 01:30:07', '', '00:00:00', 'AO', NULL),
(19, '3', '2', '025-001-016', 'María de Lourdes', 'Morales Flores', '1956-10-29', 60, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '50198221', '5510796948', NULL, 'sincorreo@salauno.com.mx', '09860', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AqLEAU', 'Ojo Seco', '2017-08-30 20:15:29', '2017-08-31 01:30:10', '', '00:00:00', 'AO', NULL),
(20, '3', '2', '025-001-017', 'Maria blanca', 'Covarrubias rodriguez', '1945-11-30', 71, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '35481337', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09890', NULL, 'Df', 'Iztapalapa ', 'Si', 15, NULL, 'Si', 1, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'Revisar molestia ', 'Con cita', 'a0A36000003WrH0', '2017-09-08', '00Q3600000f0AzSEAU', 'Excavación sospechosa', '2017-08-30 20:15:44', '2017-08-31 01:34:19', '', '11:00:00', 'AO', NULL),
(21, '3', '2', '025-001-018', 'María del Carmen ', 'Ramírez Rodríguez', '1948-11-09', 68, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '46331859', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09850', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 15, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Calificado', '', '0000-00-00', '00Q3600000f0ArsEAE', 'Excavación sospechosa', '2017-08-30 20:17:47', '2017-08-31 01:30:59', '', '00:00:00', 'AO', NULL),
(22, '3', '2', '025-001-019', 'Gloria', 'Gonzalez condado', '1937-05-16', 80, 'Femenino', 'Hogar', NULL, 'Ninguno', '', '', '', '5513949259', NULL, 'sincorreo@salauno.com.mx', '09890', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'Derrame en ojos, ', 'No Calificado', '', '0000-00-00', '00Q3600000f0ArxEAE', 'Excavación sospechosa', '2017-08-30 20:19:37', '2017-08-31 01:31:02', '', '00:00:00', 'AO', NULL),
(23, '3', '2', '025-001-020', 'Francisca ', 'Ramírez Rodríguez', '1941-06-03', 76, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '54435151', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09880', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 40, 'No', NULL, 'Si', NULL, NULL, '', NULL, NULL, 'Enviado a SF', '', 'No Calificado', '', '0000-00-00', '00Q3600000f0As2EAE', 'Otro', '2017-08-30 20:20:10', '2017-08-31 01:31:08', '', '00:00:00', 'AO', NULL),
(24, '3', '2', '025-001-021', 'Maria del carmen', 'Soriano camacho', '1943-10-16', 73, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5512585537', NULL, 'sincorreo@salauno.com.mx', '09890', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, 'Si', 15, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'Se cayó y golpeó ojo y siente molestias', 'No Calificado', '', '0000-00-00', '00Q3600000f0AsMEAU', 'No Valorable', '2017-08-30 20:26:28', '2017-08-31 01:31:13', '', '00:00:00', 'AO', NULL),
(25, '3', '2', '025-001-022', 'Elvia', 'Espino muñoz', '1955-12-18', 61, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '62794356', '000000000', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'Df', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No se', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', 'Hacerse examen', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0AroEAE', 'Excavación sospechosa', '2017-08-30 20:29:14', '2017-08-31 01:31:16', '', '11:00:00', 'AO', NULL),
(26, '3', '2', '025-001-023', 'Sara ', 'Osnaya', '1943-08-29', 74, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '55584738', '00000000000', NULL, 'sincorreo@salauno.com.mx', '09880', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 42, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-29', '00Q3600000f0AslEAE', 'Catarata', '2017-08-30 20:30:14', '2017-08-31 01:31:23', '', '10:00:00', 'AO', NULL),
(27, '3', '2', '025-001-024', 'Javier ', 'Blancas Ramos', '1940-03-01', 77, 'Masculino', 'Jubilado', NULL, 'Ninguno', '', '', '56136111', '000000000', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 3, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AtFEAU', 'No Valorable', '2017-08-30 20:33:18', '2017-08-31 01:31:28', '', '00:00:00', 'AO', NULL),
(28, '3', '2', '025-001-025', 'Macaria', 'Molotla', '1946-03-10', 71, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '58453333', '00000000000', NULL, 'sincorreo@salauno.com.mx', '09830', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0AtPEAU', 'Excavación sospechosa', '2017-08-30 20:35:05', '2017-08-31 01:31:31', '', '10:00:00', 'AO', NULL),
(29, '3', '2', '025-001-026', 'Maria Elena ', 'Ayala', '1949-01-07', 68, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '56703940', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AtoEAE', 'No Valorable', '2017-08-30 20:36:33', '2017-08-31 01:31:35', '', '00:00:00', 'AO', NULL),
(30, '3', '2', '025-001-027', 'Emilia ', 'González Garcés', '1949-01-13', 68, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '58458950', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09830', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 10, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0Au3EAE', 'Otro', '2017-08-30 20:36:44', '2017-08-31 01:31:39', '', '00:00:00', 'AO', NULL),
(31, '3', '2', '025-001-028', 'Martha ', 'Becerril Rosario ', '1958-07-29', 59, 'Femenino', 'Comerciante', NULL, 'IMSS', '', '', '54261106', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09880', NULL, 'CDMX', 'Iztapalapa', 'Si', 0, NULL, 'Si', 3, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0AuNEAU', 'Sin Hallazgos', '2017-08-30 20:38:53', '2017-08-31 01:31:43', '', '10:00:00', 'AO', NULL),
(32, '3', '2', '025-001-029', 'Albino ', 'Pacheco Ambriz', '1954-03-01', 63, 'Masculino', 'Hogar', NULL, 'Seguro Popular', '', '', '58502789', '5566653756', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-08-31', '00Q3600000f0AuhEAE', 'Catarata', '2017-08-30 20:40:55', '2017-08-31 01:31:48', '', '11:45:00', 'AO', NULL),
(33, '3', '2', '025-001-030', 'Eva ', 'Guzmán Bautista', '1955-12-19', 61, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '58502789', '5566653756', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX', 'Iztapalapa', 'Si', 1, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AurEAE', 'Sin Hallazgos', '2017-08-30 20:43:09', '2017-08-31 01:31:54', '', '00:00:00', 'AO', NULL),
(34, '3', '2', '025-001-031', 'Guillermina', 'Osorio Martinez', '1950-01-19', 67, 'Femenino', 'Carpinteria', NULL, 'IMSS', '', '', '', '5581309719', NULL, 'sincorreo@salauno.com.mx', '09970', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, 'Si', 3, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', 'No ve de lejos', 'No Interesado', '', '0000-00-00', '00Q3600000f0AuwEAE', 'Sin Hallazgos', '2017-08-30 20:43:32', '2017-08-31 01:31:58', '', '00:00:00', 'AO', NULL),
(35, '3', '2', '025-001-032', 'Victoria', 'Santana Villalba', '1941-12-30', 75, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '', '000000000', NULL, 'sincorreo@salauno.com.mx', '09920', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 20, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-23', '00Q3600000f0Av6EAE', 'Catarata', '2017-08-30 20:47:01', '2017-08-31 01:32:02', '', '10:00:00', 'OI', NULL),
(36, '3', '2', '025-001-033', 'Ernestina', 'Favila Velázquez ', '1956-03-28', 61, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '5572596704', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09910', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 14, NULL, 'Si', 14, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrGv', '2017-08-31', '00Q3600000f0AvQEAU', 'Excavación sospechosa', '2017-08-30 20:47:11', '2017-08-31 01:32:23', '', '13:00:00', 'AO', NULL),
(37, '3', '2', '025-001-034', 'Patricia ', 'Jiménez González', '1973-02-02', 44, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5531082673', NULL, 'sincorreo@salauno.com.mx', '09810', NULL, 'CDMX', 'Iztapalapa', 'Si', 12, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AvVEAU', 'Retinopatía Diabética', '2017-08-30 20:49:15', '2017-08-31 01:32:28', '', '00:00:00', 'OD', NULL),
(38, '3', '2', '025-001-035', 'Daniel', 'Hernández Ele', '1949-04-08', 68, 'Masculino', 'Hogar', NULL, 'IMSS', '', '', '5572596704', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09910', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 20, NULL, 'Si', 12, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrGv', '2017-08-31', '00Q3600000f0AvaEAE', 'Ojo Seco', '2017-08-30 20:50:58', '2017-08-31 01:32:32', '', '13:20:00', 'AO', NULL),
(39, '3', '2', '025-001-036', 'Jorge Gilivaldo', 'Meinguer Hernández', '1947-07-07', 70, 'Masculino', 'Pensionado', NULL, 'IMSS', '', '', '56126933', '000000000', NULL, 'sincorreo@salauno.com.mx', '09860', NULL, 'CDMX', 'Iztapalapa', 'Si', 5, NULL, 'Si', 8, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AvpEAE', 'Pterigión', '2017-08-30 20:54:10', '2017-08-31 01:32:37', '', '00:00:00', 'OI', NULL),
(40, '3', '2', '025-001-037', 'Alfredo', 'Hernández García ', '1949-01-12', 68, 'Masculino', 'Hogar', NULL, 'IMSS', '', '', '56144749', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09860', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 10, NULL, 'Si', 5, 'No', 'Si', 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-08', '00Q3600000f0Aw4EAE', 'Catarata', '2017-08-30 20:55:04', '2017-08-31 01:32:42', '', '12:00:00', 'OD', NULL),
(41, '3', '2', '025-001-038', 'Teresa  ', 'Hernández Carlon', '1935-11-01', 81, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09960', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0AwOEAU', 'Fondo coroideo/ Adelgazamiento de retina', '2017-08-30 20:57:38', '2017-08-31 01:32:49', '', '10:00:00', 'AO', NULL),
(42, '3', '2', '025-001-039', 'Manuel ', 'De León González ', '1946-06-17', 71, 'Masculino', 'Plomeria ', NULL, 'Seguro Popular', '', '', '58457692', '5536496852', NULL, 'sincorreo@salauno.com.mx', '09990', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 1, NULL, 'Si', 1, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AwTEAU', 'Fondo coroideo/ Adelgazamiento de retina', '2017-08-30 21:00:19', '2017-08-31 01:32:52', '', '00:00:00', 'AO', NULL),
(43, '3', '2', '025-001-040', 'Sixta', 'Romero Cuautengo', '1952-08-19', 65, 'Femenino', 'Comerciante', NULL, 'Seguro Popular', '', '', '13126661', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09880', NULL, 'Cdm', 'Iztapalapa', 'Si', 10, NULL, 'Si', 7, NULL, NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0AwiEAE', 'Pterigión', '2017-08-30 21:00:41', '2017-08-31 01:32:56', '', '10:15:00', 'AO', NULL),
(44, '3', '2', '025-001-041', 'Emma ', 'Rosales Paniagua', '1951-12-27', 65, 'Femenino', 'Hogar ', NULL, 'ISSTE', '', '', '58598544', '5541902338', NULL, 'sincorreo@salauno.com.mx', '09790', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 1, NULL, 'Si', 1, 'No', NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AwsEAE', 'Fondo coroideo/ Adelgazamiento de retina', '2017-08-30 21:04:40', '2017-08-31 01:33:02', '', '13:11:00', 'AO', NULL),
(45, '3', '2', '025-001-042', 'Petra', 'Medina Herrera', '1964-10-19', 52, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5572226158', NULL, 'sincorreo@salauno.com.mx', '09790', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 30, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-04', '00Q3600000f0AwUEAU', 'Catarata', '2017-08-30 21:07:52', '2017-08-31 01:33:07', '', '11:30:00', 'OI', NULL),
(46, '3', '2', '025-001-043', 'Daria Maximina ', 'Javier Pelaez ', '1953-10-25', 63, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '54280292', '5536997979', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AxCEAU', 'Refractivo (evaluar graduación)', '2017-08-30 21:10:42', '2017-08-31 01:33:11', '', '00:00:00', 'AO', NULL),
(47, '3', '2', '025-001-044', 'Esmeralda ', 'Barrera Ramírez ', '1993-05-20', 24, 'Femenino', 'Trabajo de campo', NULL, 'Ninguno', '', '', '56978768', '5559046905', 'Si', 'princessesmeraldams@gmail.com', '09810', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0AxREAU', 'Fondo coroideo/ Adelgazamiento de retina', '2017-08-30 21:15:30', '2017-08-31 01:33:17', '', '16:45:00', 'AO', NULL),
(48, '3', '2', '025-001-045', 'Heliodoro', 'Ramírez Ramos', '1946-05-03', 71, 'Masculino', 'Eléctrico y plomero', NULL, 'Ninguno', '', '', '', '5518189845', NULL, 'sincorreo@salauno.com.mx', '09810', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-08', '00Q3600000f0AxbEAE', 'Catarata', '2017-08-30 21:18:41', '2017-08-31 01:33:20', '', '16:30:00', 'AO', NULL),
(49, '3', '2', '025-001-046', 'Teresa', 'Juárez Lara', '1946-08-27', 71, 'Femenino', 'Hogar', NULL, 'ISSTE', '', '', '56975241', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09819', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 22, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0AxgEAE', 'Otro', '2017-08-30 21:21:30', '2017-08-31 01:33:27', '', '10:30:00', 'OD', NULL),
(50, '3', '2', '025-001-047', 'Manuel ', 'Juárez Molina', '1948-12-10', 68, 'Masculino', 'Pensionado', NULL, 'IMSS', '', '', '54264851', '5516923157', NULL, 'sincorreo@salauno.com.mx', '09860', NULL, 'CDMX', 'Iztapalapa', NULL, 0, NULL, 'Si', 8, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AxvEAE', 'No Valorable', '2017-08-30 21:21:58', '2017-08-31 01:33:32', '', '00:00:00', 'AO', NULL),
(51, '3', '2', '025-001-048', 'Luis', 'Diaz Gomez', '1951-08-25', 66, 'Masculino', 'Pensionado', NULL, 'IMSS', '', '', '58595018', '5533508910', NULL, 'sincorreo@salauno.com.mx', '09960', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 2, NULL, NULL, 0, 'No', NULL, NULL, NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0Ay5EAE', 'Catarata', '2017-08-30 21:26:11', '2017-08-31 01:33:40', '', '00:00:00', 'AO', NULL),
(52, '3', '2', '025-001-049', 'Isabel', 'García Ramírez ', '1959-07-08', 58, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '50374302', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AyFEAU', 'Excavación sospechosa', '2017-08-30 21:29:55', '2017-08-31 01:33:44', '', '14:00:00', 'AO', NULL),
(53, '3', '2', '025-001-050', 'Lidia Teresa', 'Martínez Luna', '1958-08-03', 59, 'Femenino', 'Empleada', NULL, 'IMSS', '', '', '56867562', '5518228666', NULL, 'sincorreo@salauno.com.mx', '09000', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0AyKEAU', 'Excavación sospechosa', '2017-08-30 21:32:38', '2017-08-31 01:33:48', '', '00:00:00', 'AO', NULL),
(54, '3', '2', '025-001-051', 'María Guadalupe ', 'Saenz Rivera', '1950-10-22', 66, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5563277210', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 35, 'Si', 'Si', 35, NULL, NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH5', '2017-09-01', '00Q3600000f0AyUEAU', 'Retinopatía Diabética', '2017-08-30 21:35:57', '2017-08-31 01:33:51', '', '04:00:00', 'AO', NULL),
(55, '3', '2', '025-001-052', 'Teofilo', 'Heredia Colin', '1949-09-23', 67, 'Masculino', 'Jubilado', NULL, 'ISSTE', '', '', '54263589', '0000000000', NULL, 'sincorreo@salauno.com.mx', '099850', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AyeEAE', 'Excavación sospechosa', '2017-08-30 21:38:36', '2017-08-31 01:33:56', '', '08:45:00', 'AO', NULL),
(56, '3', '2', '025-001-053', 'Lucina Guadalupe ', 'Gonzalez Colin', '1954-06-30', 63, 'Femenino', 'Jubilada', NULL, 'ISSTE', '', '', '54269589', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09850', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AyjEAE', 'Refractivo (evaluar graduación)', '2017-08-30 21:45:07', '2017-08-31 01:34:00', '', '08:30:00', 'AO', NULL),
(57, '3', '2', '025-001-054', 'Lucio ', 'Hernández Maldonado', '1954-09-24', 62, 'Masculino', 'Comercio', NULL, 'Ninguno', '', '', '', '5537960106', NULL, 'sincorreo@salauno.com.mx', '09770', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0AytEAE', 'Otro', '2017-08-30 21:50:27', '2017-08-31 01:34:04', '', '11:50:00', 'OD', NULL),
(58, '3', '2', '025-001-055', 'Evangelina ', 'Isidro Ovando', '1957-06-28', 60, 'Femenino', 'Costurera', NULL, 'Ninguno', '', '', '', '5537960106', NULL, 'sincorreo@salauno.com.mx', '09770', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 20, NULL, 'Si', 20, 'Si', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0AyyEAE', 'Retinopatía Diabética', '2017-08-30 21:54:13', '2017-08-31 01:34:08', '', '11:15:00', 'AO', NULL),
(59, '3', '2', '025-001-056', 'Maria Raquel', 'Martínez González ', '1944-11-18', 72, 'Femenino', 'Hogar', NULL, 'ISSTE', '', '', '56126366', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09860', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0Az8EAE', 'Refractivo (evaluar graduación)', '2017-08-30 21:57:56', '2017-08-31 01:34:11', '', '00:00:00', 'AO', NULL),
(60, '3', '2', '025-001-057', 'Felicitas ', 'Hernandez Orozco ', '1949-11-23', 67, 'Femenino', 'Cerrajería ', NULL, 'IMSS', '', '', '56147756', '5521306342', NULL, 'sincorreo@salauno.com.mx', '09830', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, 'Si', 30, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0AzcEAE', 'Fondo coroideo/ Adelgazamiento de retina', '2017-08-30 22:00:47', '2017-08-31 01:34:23', '', '13:30:00', 'AO', NULL),
(61, '3', '2', '025-001-058', 'Eleazar', 'Estrada Perez ', '1954-02-13', 63, 'Femenino', 'Comerciante', NULL, 'Seguro Popular', '', '', '56321940', '5511557191', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 12, NULL, 'Si', 12, 'No se', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0AzrEAE', 'Otro', '2017-08-30 22:04:05', '2017-08-31 01:34:26', '', '09:45:00', 'AO', NULL),
(62, '3', '2', '025-001-059', 'Candido', 'Galarza Lira', '1955-02-02', 62, 'Masculino', 'Comerciante ', NULL, 'Seguro Popular', '', '', '56321940', '5511557191', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0B06EAE', 'Excavación sospechosa', '2017-08-30 22:06:23', '2017-08-31 01:34:29', '', '21:45:00', 'AO', NULL),
(63, '3', '2', '025-001-060', 'Maria ', 'Del Pilar Salas ', '1943-02-03', 74, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '', '5527807725', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, 'Si', 1, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B0GEAU', 'Catarata', '2017-08-30 22:09:51', '2017-08-31 01:34:33', '', '12:30:00', 'OI', NULL),
(64, '3', '2', '025-001-061', 'Bertha', 'Bowser Lugo', '1946-03-13', 71, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '58630237', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09960', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 6, NULL, 'Si', 6, 'No', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0B0VEAU', 'Catarata', '2017-08-30 22:16:34', '2017-08-31 01:34:36', '', '00:00:00', 'AO', NULL),
(65, '3', '2', '025-001-062', 'Alejandra', 'Benitez Toris ', '1951-07-07', 66, 'Femenino', 'Hogar', NULL, 'Ninguno', '', '', '56947245', '5541294090', NULL, 'sincorreo@salauno.com.mx', '09310', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, 'Si', 1, 'No', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B0aEAE', 'Catarata', '2017-08-30 22:18:44', '2017-08-31 01:34:40', '', '10:45:00', 'AO', NULL),
(66, '3', '2', '025-001-063', 'Leonor Refugio', 'Martínez Valencia', '1956-12-19', 60, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '56907341', '5534551156', NULL, 'sincorreo@salauno.com.mx', '09830', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 6, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0B0kEAE', 'Retinopatía Diabética', '2017-08-30 22:22:42', '2017-08-31 01:34:43', '', '17:45:00', 'AO', NULL),
(67, '3', '2', '025-001-064', 'Marcela Sandra', 'Jimenez Perez', '1957-01-16', 60, 'Femenino', 'Hogar', NULL, 'ISSTE', '', '', '58400833', '5521182332', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0B0zEAE', 'Ojo Seco', '2017-08-30 22:24:42', '2017-08-31 01:34:49', '', '18:45:00', 'AO', NULL),
(68, '3', '2', '025-001-065', 'Juana', 'Romero Perez', '1933-06-24', 84, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '58452000', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 30, NULL, 'Si', 30, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-06', '00Q3600000f0B14EAE', 'Catarata', '2017-08-30 22:27:14', '2017-08-31 01:34:56', '', '18:30:00', 'AO', NULL),
(69, '3', '2', '025-001-066', 'Ma del Socorro', 'Anacleto Sánchez ', '1970-12-15', 46, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5564511899', NULL, 'sincorreo@salauno.com.mx', '09225', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0B1OEAU', 'Catarata', '2017-08-30 22:29:59', '2017-08-31 01:35:00', '', '09:30:00', 'OI', NULL),
(70, '3', '2', '025-001-067', 'Francisca ', 'Evangelista Salas', '1952-01-29', 65, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '58506525', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 12, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B1TEAU', 'Retinopatía Diabética', '2017-08-30 22:31:59', '2017-08-31 01:35:03', '', '11:30:00', 'AO', NULL),
(71, '3', '2', '025-001-068', 'Maria ', 'Del Carmen Prieto', '1947-08-24', 70, 'Femenino', 'Hogar', NULL, 'Ninguno', '', '', '58450599', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 30, 'Si', 'Si', 10, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-08', '00Q3600000f0B1dEAE', 'Retinopatía Diabética', '2017-08-30 22:36:05', '2017-08-31 01:35:08', '', '16:45:00', 'AO', NULL),
(72, '3', '2', '025-001-069', 'Leticia', 'Leyte Rosalino', '1961-04-27', 56, 'Femenino', 'Hogar', NULL, 'Ninguno', '', '', '13126280', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No se', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B1iEAE', 'Pterigión', '2017-08-30 22:43:28', '2017-08-31 01:35:12', '', '11:45:00', 'AO', NULL),
(73, '3', '2', '025-001-070', 'Maria Dora', 'Alfaro Olvera', '1953-04-25', 64, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '', '5565565072', NULL, 'sincorreo@salauno.com.mx', '09900', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 15, NULL, 'Si', 4, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-09', '00Q3600000f0B1sEAE', 'Retinopatía Diabética', '2017-08-30 22:48:43', '2017-08-31 01:35:17', '', '11:44:00', 'AO', NULL),
(74, '3', '2', '025-001-071', 'Cristina', 'Flores Sanchez', '1945-06-08', 72, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '54289359', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, 'Si', 5, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0B22EAE', 'Pterigión', '2017-08-30 22:53:41', '2017-08-31 01:35:21', '', '00:00:00', 'AO', NULL),
(75, '3', '2', '025-001-072', 'Ana Consuelo', 'Cortés Martínez ', '1946-07-21', 71, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '', '5560017159', NULL, 'sincorreo@salauno.com.mx', '09760', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 3, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-01', '00Q3600000f0B2CEAU', 'Retinopatía Diabética', '2017-08-30 22:56:24', '2017-08-31 01:35:24', '', '16:45:00', 'AO', NULL),
(76, '3', '2', '025-001-073', 'Vicente', 'Cruz Garcia', '1953-08-07', 64, 'Masculino', 'Desempleado', NULL, 'Seguro Popular', '', '', '58639936', '5523527593', NULL, 'sincorreo@salauno.com.mx', '09920', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-04', '00Q3600000f0B2HEAU', 'Refractivo (evaluar graduación)', '2017-08-30 22:58:22', '2017-08-31 01:35:27', '', '13:00:00', 'AO', NULL),
(77, '3', '2', '025-001-074', 'Francisca', 'Hernández Marban', '1949-09-20', 67, 'Femenino', 'Jubilada', NULL, 'ISSTE', '', '', '58632451', '5514689448', NULL, 'sincorreo@salauno.com.mx', '09960', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 15, NULL, 'Si', 20, 'No', NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B2REAU', 'Retinopatía Diabética', '2017-08-30 23:03:01', '2017-08-31 01:35:30', '', '13:30:00', '', NULL),
(78, '3', '2', '025-001-075', 'Hilda', 'Lopez Morales', '1954-05-13', 63, 'Femenino', 'Pensionada', NULL, 'ISSTE', '', '', '58456202', '5538940027', NULL, 'sincorreo@salauno.com.mx', '09960', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, 'Si', 5, 'Si', NULL, 'Si', NULL, 'Menos de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B2bEAE', 'Excavación sospechosa', '2017-08-30 23:06:48', '2017-08-31 01:35:34', '', '00:45:00', 'AO', NULL),
(79, '3', '2', '025-001-076', 'Maria Enriqueta', 'Garcia Jacinto', '1948-07-10', 69, 'Femenino', 'Hogar', NULL, 'IMSS', '', '', '58451393', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09940', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-04', '00Q3600000f0B2gEAE', 'Pterigión', '2017-08-30 23:09:12', '2017-08-31 01:35:37', '', '12:20:00', 'AO', NULL),
(80, '3', '2', '025-001-077', 'Maria Guadalupe ', 'Jaimes Monterubio', '1945-12-05', 71, 'Femenino', 'Hogar', NULL, 'Ninguno', '', '', '58457247', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09940', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 3, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'No Interesado', '', '0000-00-00', '00Q3600000f0B2lEAE', 'No Valorable', '2017-08-30 23:13:37', '2017-08-31 01:35:40', '', '00:00:00', 'AO', NULL),
(81, '3', '2', '025-001-078', 'Efigenia', 'Picazo Azua', '1951-09-21', 65, 'Femenino', 'Hogar', NULL, 'Seguro Popular', '', '', '56957981', '5551969351', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX ', 'Iztapalapa ', NULL, 0, NULL, NULL, 0, 'Si', NULL, 'Si', NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-08-08', '00Q3600000f0AyfEAE', 'Ojo Seco', '2017-08-30 23:16:04', '2017-08-31 01:35:43', '', '17:00:00', 'AO', NULL),
(82, '3', '2', '025-001-079', 'Eustorgio', 'Santos Villegas', '1946-04-11', 71, 'Masculino', 'Jardinero', NULL, 'Seguro Popular', '', '', '', '0000000000', NULL, 'sincorreo@salauno.com.mx', '09800', NULL, 'CDMX ', 'Iztapalapa ', 'Si', 12, NULL, NULL, 0, 'No', NULL, 'Si', NULL, 'Nunca', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A3600000D7Kd2', '2017-09-06', '00Q3600000f0B2vEAE', 'Catarata', '2017-08-30 23:21:19', '2017-08-31 01:35:48', '', '11:00:00', 'OI', NULL),
(83, '3', '2', '025-001-080', 'JOSE ', 'VAZQUEZ ', '1948-07-13', 69, 'Masculino', 'DESEMPLEado', NULL, '', '', '', '', '00000000000', NULL, 'sincorreo@salauno.com.mx', '', NULL, 'CDMX', 'iztapalapa', 'Si', 15, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'Mas de un año', '', NULL, NULL, 'Enviado a SF', '', 'Con cita', 'a0A36000003WrH0', '2017-09-05', '00Q3600000f0B30EAE', 'Pterigión', '2017-08-30 23:48:19', '2017-08-31 01:35:52', '', '13:30:00', 'AO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinics`
--

CREATE TABLE `clinics` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `activo` enum('Si','No') DEFAULT NULL,
  `direccion` varchar(50) CHARACTER SET utf16 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clinics`
--

INSERT INTO `clinics` (`id`, `nombre`, `activo`, `direccion`) VALUES
('a0A36000002MOAS', 'Roma Norte', 'Si', 'Mérida 204, Col. Roma Norte, 06700'),
('a0A36000003WrGl', 'Buenavista', 'Si', 'José Antonio Alzate 6 Col. Buenavista, 06350'),
('a0A36000003WrGq', 'Coyoacán', 'Si', 'Miguel Angel de Quevedo 550, Coyoacán, 04360'),
('a0A36000003WrGv', 'Gran Sur', 'Si', 'Centro Comercial Gran Sur, Gran Sur 5550, Col. El '),
('a0A36000003WrH0', 'Tezontle', 'Si', 'PlaSalud, Av. Canal de Tezontle s/n, Iztapalapa, 0'),
('a0A36000003WrH5', 'Narvarte', 'Si', 'José María Vértiz 810, Col. Narvarte, 03020'),
('a0A36000003XXC9', 'Corporativo', 'No', NULL),
('a0A36000005qthu', 'Campañas', 'No', NULL),
('a0A36000006Qwu7', 'Satélite', 'Si', 'Ciudad Satélite, Cto. Centro Comercial No. 7 Local'),
('a0A36000007qvlE', 'Cuautitlán', 'Si', 'Juan Pablo II esq. Teyahualco, Rancho Santa Elena,'),
('a0A36000009LGV7', 'La Villa', 'Si', 'Calz. de los Misterios 142, Tepeyac Insurgentes, 0'),
('a0A36000009LGW0', 'Tlalpan', 'Si', 'Calz. de Tlalpan 5037, La Joya, 14000'),
('a0A3600000D7Kd2', 'Hamburgo', 'Si', 'Hamburgo 115, Col. Juarez, 06600');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configurations`
--

CREATE TABLE `configurations` (
  `id` int(11) NOT NULL,
  `client_id` text,
  `client_secret` text,
  `username` text,
  `password` text,
  `url_tk` varchar(50) DEFAULT NULL,
  `activo` enum('Si','No') DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configurations`
--

INSERT INTO `configurations` (`id`, `client_id`, `client_secret`, `username`, `password`, `url_tk`, `activo`) VALUES
(1, '3MVG93MGy9V8hF9M2UmXz0Q0GQixWs3S_MPPYkN2JlUqx71ULL', '2678466391247652633', 'edgar.guerra@salauno.com.mx.dev3', 'Salauno2016*Gqr0m9qSaOLdDZTGujQ0INrn', 'https://test.salesforce.com/services/oauth2/token', 'No'),
(2, '3MVG93MGy9V8hF9M2UmXz0Q0GQiSkvOpd6m0i8YKEZSxn4QupNH9hywyQ03mPSC8XVr6H1OMMpOKlaQog2w99', '5678725638604264682', 'pedro.jauregui@salauno.com.mx.dev3', 'cl0udc028bWaF9z5XyYhPJvxIUNsC0lfO', 'https://test.salesforce.com/services/oauth2/token', 'No'),
(3, '3MVG93MGy9V8hF9M2UmXz0Q0GQiSkvOpd6m0i8YKEZSxn4QupNH9hywyQ03mPSC8XVr6H1OMMpOKlaQog2w99', '5678725638604264682', 'pedro.jauregui@salauno.com.mx.dev4', 'cl0udc04r530nWkYHWDP6wYj0DV7dDAR', 'https://test.salesforce.com/services/oauth2/token', 'No'),
(4, '3MVG9uudbyLbNPZOitpGGxfSVAQG2CTBUaIH.HxGGa9C8j2cf5.1CrwcllfGIc55GcK.0m29TvwVHhTrP5Pfb', '3556869032589325760', 'edgar.guerra@salauno.com.mx', '17SALAUNOWEBr1WJ9Db07AUAPjnRDF4hrr', 'https://login.salesforce.com/services/oauth2/token', 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_render_campos`
--

CREATE TABLE `core_render_campos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `formulario_id` int(11) DEFAULT NULL,
  `obligatorio` enum('Si','No') DEFAULT 'No',
  `orden` int(11) DEFAULT NULL,
  `tipo` enum('text','email','select','checkbox','radio','date','number','readonly','hidden','accordion','selectNum') DEFAULT NULL,
  `longitud` text,
  `activo` enum('Si','No') DEFAULT 'No',
  `tabla` varchar(50) DEFAULT NULL,
  `script` text,
  `class` varchar(50) DEFAULT NULL,
  `ayuda` text,
  `placeholder` varchar(50) DEFAULT NULL,
  `attr` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `core_render_campos`
--

INSERT INTO `core_render_campos` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES
(1, 'created_at', 'Fecha de Registro', 1, 1, 'Si', 0, 'date', NULL, 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(2, 'nombres', 'Nombre', 1, 1, 'Si', 10, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Ingresa Nombres del candidato', NULL, NULL),
(3, 'apellidos', 'Apellidos', 1, 1, 'Si', 20, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Ingresa Apellido Paterno y Materno', NULL, NULL),
(4, 'fecha_nacimiento', 'Fecha de Nacimiento', 1, 1, 'Si', 30, 'date', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(5, 'genero', 'Genero', 1, 1, 'Si', 40, 'select', 'Femenino,Masculino,Otro', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(6, 'ocupacion', 'Ocupación', 1, 1, 'Si', 50, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(7, 'seguro_medico', 'Cobertura Medica', 1, 1, 'No', 60, 'select', 'IMSS,ISSTE,Seguro Popular,Seguro Privado,Otro,Ninguno', 'Si', 'candidates', 'if ($("#seguro_medico").val() == ''Otro'') {\r\n    $(".seguro_medico_otro").show();\r\n} else if($("#seguro_medico").val() == ''Ninguno'' || $("#seguro_medico").val() == ''''){\r\n    $(".seguro_medico_otro").hide();\r\n    $(".numero_poliza").hide();\r\n} else {\r\n    $(".numero_poliza").show();\r\n    $(".seguro_medico_otro").hide();\r\n}\r\n\r\n$("#seguro_medico").change(function(event) {\r\n    if ($(this).val() == ''Otro'') {\r\n        $(".seguro_medico_otro").show();\r\n    } else if($(this).val() == ''Ninguno'' || $(this).val() == ''''){\r\n        $(".seguro_medico_otro").hide();\r\n        $(".numero_poliza").hide();\r\n    } else {\r\n        $(".numero_poliza").show();\r\n        $(".seguro_medico_otro").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(8, 'seguro_medico_otro', '¿Cual?', 1, 1, 'No', 70, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Si selecciono OTRO en seguro medico, favor de poner con que seguro cuenta', NULL, NULL),
(9, 'numero_poliza', 'Numero de Póliza', 1, 1, 'No', 80, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Ingresa numero de poliza de seuro', NULL, NULL),
(10, 'telefono_fijo', 'Teléfono Fijo', 2, 1, 'No', 10, 'number', '15', 'Si', 'candidates', '$("#telefono_fijo").change(function(event) {\r\n	var caracteres = $(this).val();\r\n	if (caracteres.length >= 16 ) {\r\n	    	alert(''Revice el Telefono Fijo, el numero de digitos no es correcto [''+caracteres.length+'']'');\r\n		$(this).val('''');\r\n    		$(this).focus();\r\n	}\r\n});', NULL, NULL, NULL, NULL),
(11, 'telefono_celular', 'Teléfono Celular (Este telefono debe conincidir con el de la cita)', 2, 1, 'Si', 20, 'number', '10', 'Si', 'candidates', '$("#telefono_celular").change(function(event) {\r\n	var caracteres = $(this).val();\r\n	if (caracteres.length >= 16 ) {\r\n	    	alert(''Revice el Telefono Fijo, el numero de digitos no es correcto [''+caracteres.length+'']'');\r\n    		$(this).focus();\r\n		$(this).val('''');\r\n	}\r\n});', NULL, NULL, NULL, NULL),
(12, 'telefono_otro', 'Telefono Otro', 2, 1, 'No', 30, 'number', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(13, 'correo_electronico', 'Correo electrónico', 2, 1, 'Si', 40, 'email', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(14, 'domicilio_cp', 'Código Postal', 2, 1, 'No', 50, 'number', '5', 'Si', 'candidates', NULL, NULL, NULL, '#####', NULL),
(15, 'domicilio_calle', 'Calle', 2, 1, 'No', 60, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(16, 'domicilio_numero_exterior', 'Numero Exterior', 2, 1, 'No', 70, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(17, 'domicilio_numero_interior', 'Numero Interior', 2, 1, 'No', 80, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(18, 'domicilio_ciudad', 'Estado', 2, 1, 'No', 90, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(19, 'domicilio_poblacion', 'Población/Municipio/Delegación', 2, 1, 'No', 100, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(20, 'diabetes', 'Diabetes', 3, 1, 'No', 10, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#diabetes").prop("checked")) {\r\n    $(".diabetes_tiempo_anios").show();\r\n    $(".retinopatia_diabetica").show();\r\n} else {\r\n    $(".diabetes_tiempo_anios").hide();\r\n    $(".retinopatia_diabetica").hide();\r\n}\r\n\r\n$("#diabetes").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".diabetes_tiempo_anios").show();\r\n        $(".retinopatia_diabetica").show();\r\n    } else {\r\n        $(".diabetes_tiempo_anios").hide();\r\n        $(".retinopatia_diabetica").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(21, 'diabetes_tiempo_anios', 'Tiempo de Evolución (años)', 3, 1, 'No', 20, 'number', '2', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(22, 'diabetes_tratamiento', 'Tratamiento', 3, 1, 'No', 30, 'select', 'Si,No', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(23, 'hipertension', 'Hipertensión', 3, 1, 'No', 40, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#hipertension").prop("checked")) {\r\n    $(".hipertension_tiempo_anios").show();\r\n} else {\r\n    $(".hipertension_tiempo_anios").hide();\r\n}\r\n\r\n$("#hipertension").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".hipertension_tiempo_anios").show();\r\n    } else {\r\n        $(".hipertension_tiempo_anios").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(24, 'hipertension_tiempo_anios', 'Tiempo de Evolución (años)', 3, 1, 'No', 50, 'number', '2', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(25, 'hipertension_tratamiento', 'Tratamiento', 3, 1, 'No', 60, 'checkbox', 'Si,No', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(26, 'dialisis', 'Dialisis', 3, 1, 'No', 70, 'select', 'Si,No', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(27, 'familiar_glaucoma', '¿Familiar con Glaucoma o algún familiar ha quedado ciego?', 3, 1, 'No', 80, 'radio', 'Si,No,No se', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(28, 'enfermedad_tiroides', 'Enfermedad de Tiroides', 3, 1, 'No', 32, 'checkbox', 'Si', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(29, 'disminucion_vista', '¿Ha notado disminución en su visión en el último año?', 4, 1, 'No', 10, 'checkbox', 'Si', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(30, 'examen_visual', '¿Hace cuánto se hizo un examen de la vista?', 4, 1, 'No', 20, 'radio', 'Mas de un año,Menos de un año,Nunca', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(31, 'consulta_oftalmologo', '¿Hace cuánto tiempo fue su última consulta con oftalmólogo?', 4, 1, 'No', 30, 'radio', 'Mas de un año,Menos de un año,Nunca', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(32, 'retinopatia_diabetica', 'Retinopatía Diabética', 3, 1, 'No', 31, 'checkbox', 'Si', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(33, 'cirugia_ojo', '¿Ha tenido una cirugía de ojo?', 4, 1, 'No', 40, 'select', 'Catarata,Retina,Glaucoma,Refractiva,Otro,Ninguno', 'Si', 'candidates', 'if ($("#cirugia_ojo").val() == ''Otro'') {\r\n    $(".cirugia_ojo_cual").show();\r\n} else {\r\n    $(".cirugia_ojo_cual").hide();\r\n}\r\n\r\n$("#cirugia_ojo").change(function(event) {\r\n    if ($(this).val() == ''Otro'') {\r\n        $(".cirugia_ojo_cual").show();\r\n    } else {\r\n        $(".cirugia_ojo_cual").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(34, 'cirugia_ojo_cual', '¿Cual?', 4, 1, 'No', 50, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(35, 'codigo', 'Código', 5, 2, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(36, 'nombres', 'Nombre', 5, 2, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(37, 'apellidos', 'Apellidos', 5, 2, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(38, 'edad', 'Edad', 5, 2, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(39, 'diabetes', 'Diabetes', 5, 2, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(40, 'hipertension', 'Hipertensión', 5, 2, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(41, 'dialisis', 'Dialisis', 5, 2, 'No', 70, 'readonly', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(42, 'refractivo', 'Refractivo', 5, 2, 'No', 80, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(43, 'enfermedad_tiroides', '¿Tiene enfermedad de Tiroides?', 5, 2, 'No', 90, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(44, 'etapa', '¿A qué estación lo quieren mandar?', 4, 1, 'Si', 110, 'select', 'Exploracion,Optica,Consejeria', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(45, 'codigo', 'Código', 6, 3, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(46, 'nombres', 'Nombre', 6, 3, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(47, 'apellidos', 'Apellidos', 6, 3, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(48, 'edad', 'Edad', 6, 3, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(49, 'parpados_posicion', 'Posicion Parpados', 7, 3, 'No', 50, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(50, 'parpados_normal', 'Normal', 7, 3, 'No', 45, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, NULL, NULL, NULL, NULL),
(51, 'parpados_ptosis', 'Ptosis', 7, 3, 'No', 70, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(52, 'parpados_entropion', 'Entropión', 7, 3, 'No', 80, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(53, 'parpados_ectroprion', 'Ectroprión', 7, 3, 'No', 90, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(54, 'parpados_triquiasis', 'Triquiasis', 7, 3, 'No', 100, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(55, 'parpados_blefaritis', 'Blefaritis ', 7, 3, 'No', 110, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(56, 'parpados_aumento_volumen', 'Aumento de volumen (lesiones localizadas)', 7, 3, 'No', 120, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(57, 'parpados_coloracion_diferente', 'Coloracion diferente al resro de la piel', 7, 3, 'No', 130, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(58, 'parpados_via_lagrimal', 'Vía lagrimal', 7, 3, 'No', 140, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(59, 'parpados_lagrimeo_sin_origen', 'Lagrimeo sin Origen', 7, 3, 'No', 150, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(60, 'parpados_abcesos', 'Abcesos', 7, 3, 'No', 160, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(61, 'parpados_otros', 'Otros', 7, 3, 'No', 170, 'text', '50', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(62, 'segmento_anterior_aplicado', 'Aplicado', 8, 3, 'No', 180, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, NULL, NULL, NULL, NULL),
(126, 'segmento_anterior_secrecion', 'Secreción', 8, 3, 'No', 190, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(127, 'segmento_anterior_quemosis', 'Quemosis', 8, 3, 'No', 200, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(128, 'segmento_anterior_hiperemia', 'Hiperemia', 8, 3, 'No', 210, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(129, 'segmento_anterior_pterigion', 'Pterigion', 8, 3, 'No', 220, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(130, 'segmento_anterior_catarata_incipiente', 'Catarata Incipiente', 8, 3, 'No', 230, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(131, 'segmento_anterior_otros', 'Otros', 8, 3, 'No', 240, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(132, 'iris_aplicado', 'Aplicado', 9, 3, 'No', 10, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'iris', '', '', ''),
(133, 'iris_dpa', 'DPA', 9, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(134, 'iris_aniridia', 'Aniridia', 9, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(135, 'iris_rubeosis', 'Rubeosis', 9, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(136, 'iris_reflejo_ausente', 'Reflejo Ausente', 9, 3, 'No', 50, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(137, 'iris_ectropion_uveal', 'Ectroprión Uveal', 9, 3, 'No', 60, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(138, 'iris_no_valorable', 'Sin hallazgos aparentes', 9, 3, 'No', 5, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(139, 'iris_otros', 'Otros', 9, 3, 'No', 80, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(140, 'vitreo_transparente', 'Transparente', 10, 3, 'No', 10, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(141, 'vitreo_hemorragia', 'Hemorragia', 10, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'vitreo', '', '', ''),
(142, 'vitreo_no_valorable', 'No Valorable', 10, 3, 'No', 5, 'checkbox', 'OD,OI', 'No', 'explorations', '', '', '', '', ''),
(143, 'vitreo_otros', 'Otros', 10, 3, 'No', 40, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(144, 'retina_aplicada', 'Aplicada', 11, 3, 'No', 10, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(145, 'retina_desprendimiento', 'Desprendimiento', 11, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(146, 'retina_aneurismas', 'Aneurismas', 11, 3, 'No', 30, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(147, 'retina_microaneurismas', 'Microaneurismas', 11, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(148, 'retina_exudados', 'Exudados', 11, 3, 'No', 50, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(149, 'retina_exudados_blandos', 'Exudados blandos', 11, 3, 'No', 60, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(150, 'retina_drusas', 'Drusas', 11, 3, 'No', 70, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(151, 'retina_fondo_coroideo', 'Fondo coroideo', 11, 3, 'No', 80, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(152, 'retina_vision_borrosa', 'Visión borrosa', 11, 3, 'No', 90, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(153, 'retina_hemorragias', 'Hemorragias', 11, 3, 'No', 100, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(154, 'retina_neovasos', 'Neovasos', 11, 3, 'No', 110, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(155, 'retina_cruce_av_sospechoso', 'Cruce AV sospechoso', 11, 3, 'No', 120, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(156, 'retina_tortosidad_venosa', 'Tortuosidad Venosa', 11, 3, 'No', 130, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(157, 'retina_adelgazamiento_vascular', 'Adelgazamiento vascular', 11, 3, 'No', 140, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(158, 'retina_no_valorable', 'No Valorable', 11, 3, 'No', 5, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(159, 'retina_otros', 'Otros', 11, 3, 'No', 160, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(160, 'macula_brillo', 'Brillo Foveolar Normal', 12, 3, 'No', 10, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(161, 'macula_edema', 'Edema', 12, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(162, 'macula_desprendimiento', 'Desprendimiento', 12, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(163, 'macula_exudados', 'Exudados', 12, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(164, 'macula_drusas', 'Drusas', 12, 3, 'No', 50, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(165, 'macula_hemorragias', 'Hemorragia', 12, 3, 'No', 60, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(166, 'macula_no_valorable', 'No Valorable', 12, 3, 'No', 5, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(167, 'macula_otros', 'Otros', 12, 3, 'No', 80, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(168, 'papila_excavacion_fisiologica', 'Excavación fisiológica', 13, 3, 'No', 10, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(169, 'papila_excavacion_sospechosa', 'Excavación sospechosa', 13, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(170, 'papila_neovasos', 'Neovasos', 13, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(171, 'papila_hemorragia_astila', 'Hemorragia en Astilla Papila', 13, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(172, 'papila_no_valorable', 'No Valorable', 13, 3, 'No', 5, 'checkbox', 'OD,OI', 'No', 'explorations', '', '', '', '', ''),
(173, 'papila_otros', 'Otros', 13, 3, 'No', 60, 'text', '50', 'Si', 'explorations', '', '', '', '', NULL),
(189, 'codigo', 'Código', 22, 5, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, 'readonly="true"'),
(190, 'nombres', 'Nombre', 22, 5, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, 'readonly="true"'),
(191, 'edad', 'Edad', 22, 5, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, 'readonly="true"'),
(192, 'od_av_lejana', 'A.V. Lejana', 23, 5, 'No', 10, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(193, 'oi_av_lejana', 'A.V. Lejana', 23, 5, 'No', 20, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(198, 'od_cv_estenopeic', 'C. V. Con Estenopéic', 23, 5, 'No', 30, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(199, 'oi_cv_estenopeic', 'C. V. Con Estenopéic', 23, 5, 'No', 40, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(200, 'apellidos', 'Apellidos', 22, 5, 'No', 25, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(201, 'od_av_cercana', 'A. V. Cercana', 23, 5, 'No', 50, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(202, 'oi_av_cercana', 'A. V. Cercana', 23, 5, 'No', 60, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(203, 'od_av_rx', 'A. V. Con Rx Actual', 23, 5, 'No', 70, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(204, 'oi_av_rx', 'A. V. Con Rx Actual', 23, 5, 'No', 80, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(205, 'od_presion_intraocular', 'Presión Intraocular', 23, 5, 'No', 90, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(206, 'oi_presion_intraocular', 'Presión Intraocular', 23, 5, 'No', 100, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(207, 'od_r_esferico', 'Esférico', 24, 5, 'No', 10, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(208, 'oi_r_esferico', 'Esférico', 24, 5, 'No', 20, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(209, 'od_r_cilíndrico', 'Cilíndrico', 24, 5, 'No', 30, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(210, 'oi_r_cilíndrico', 'Cilíndrico', 24, 5, 'No', 40, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(211, 'od_r_eje', 'Eje', 24, 5, 'No', 50, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(212, 'oi_r_eje', 'Eje', 24, 5, 'No', 60, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(213, 'od_r_av', 'A. V.', 24, 5, 'No', 70, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(214, 'oi_r_av', 'A. V.', 24, 5, 'No', 80, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(215, 'r_adicion', 'Adición', 24, 5, 'No', 110, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(216, 'od_rf_esferico', 'Esférico', 25, 5, 'No', 10, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(217, 'oi_rf_esferico', 'Esférico', 25, 5, 'No', 20, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(218, 'od_rf_cilíndrico', 'Cilíndrico', 25, 5, 'No', 30, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(219, 'oi_rf_cilíndrico', 'Cilíndrico', 25, 5, 'No', 40, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(220, 'od_rf_eje', 'Eje', 25, 5, 'No', 50, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(221, 'oi_rf_eje', 'Eje', 25, 5, 'No', 60, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(222, 'od_rf_av', 'A. V.', 25, 5, 'No', 70, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(223, 'oi_rf_av', 'A. V.', 25, 5, 'No', 80, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(224, 'rf_adicion', 'Adición', 25, 5, 'No', 100, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(225, 'etapa', 'Enviar a', 27, 5, 'No', 10, 'select', NULL, 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(226, 'motivo_etapa', 'Motivo por el que se envía', 4, 1, 'No', 120, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(227, 'diabetes', 'Diabetes', 6, 3, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(228, 'hipertension', 'Hipertensión', 6, 3, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(229, 'enfermedad_tiroides', 'Enfermedad de Tiroides', 6, 3, 'No', 70, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(232, 'codigo', 'Código', 28, 4, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(233, 'nombres', 'Nombre', 28, 4, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(234, 'apellidos', 'Apellidos', 28, 4, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(235, 'edad', 'Edad', 28, 4, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(236, 'diabetes', 'Diabetes', 28, 4, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(237, 'hipertension', 'Hipertensión', 28, 4, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(238, 'enfermedad_tiroides', '¿Tiene enfermedad de Tiroides?', 28, 4, 'No', 70, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(239, 'retinopatia_diabetica', 'Retinopatía Diabética', 29, 4, 'No', 10, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(240, 'maculopatia', 'Maculopatia', 29, 4, 'No', 20, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(241, 'retinopatia_hipertensiva', 'Retinopatía Hipertensiva', 29, 4, 'No', 30, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(242, 'catarata_avanzada', 'Catarata Avanzada', 29, 4, 'No', 40, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(243, 'pterigion', 'Pterigion', 29, 4, 'No', 50, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(244, 'catarata_incipiente', 'Catarata Incipiente', 29, 4, 'No', 21, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(245, 'glaucoma', 'Excavación sospechosa', 29, 4, 'No', 22, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(246, 'oculoplastica', 'Oculoplastica', 29, 4, 'No', 80, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(247, 'conjuntivitis', 'Conjuntivitis', 29, 4, 'No', 90, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(248, 'iridopatia', 'Iridopatia', 29, 4, 'No', 100, 'hidden', '50', 'No', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(249, 'revision_integral', 'Revisión Integral', 29, 4, 'No', 110, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(250, 'etapa', 'Etapa', 30, 4, 'Si', 10, 'select', 'Optica,Consejeria', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(251, 'codigo', 'Código', 31, 6, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(252, 'nombres', 'Nombres', 31, 6, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(253, 'apellidos', 'Apellidos', 31, 6, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(254, 'edad', 'Edad', 31, 6, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(255, 'diabetes', 'Diabetes', 31, 6, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(256, 'hipertension', 'Hipertensión', 31, 6, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(257, 'enfermedad_tiroides', '¿Tiene enfermedad de Tiroides?', 31, 6, 'No', 70, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(258, 'retinopatia_diabetica', 'Retinopatía Diabética', 32, 6, 'No', 10, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(259, 'maculopatia', 'Maculopatia', 32, 6, 'No', 20, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(260, 'retinopatia_hipertensiva', 'Retinopatía Hipertensiva', 32, 6, 'No', 30, 'hidden', '50', 'Si', 'results', '', 'campo_unico', NULL, NULL, NULL),
(261, 'catarata_incipiente', 'Catarata Incipiente', 32, 6, 'No', 40, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(262, 'pterigion', 'Pterigion', 32, 6, 'No', 50, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(263, 'catarata_avanzada', 'Catarata Avanzada', 32, 6, 'No', 60, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(264, 'glaucoma', 'Excavación sospechosa', 32, 6, 'No', 70, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(265, 'oculoplastica', 'Oculoplastica', 32, 6, 'No', 80, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(266, 'conjuntivitis', 'Conjuntivitis', 32, 6, 'No', 90, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(267, 'iridopatia', 'Iridopatia', 32, 6, 'No', 100, 'hidden', '50', 'No', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(268, 'revision_integral', 'Revisión Integral', 32, 6, 'No', 100, 'hidden', '50', 'Si', 'results', NULL, 'campo_unico', NULL, NULL, NULL),
(269, 'status', 'Status', 33, 6, 'Si', 10, 'select', 'No Interesado,Con cita,No Calificado', 'Si', 'candidates', 'if ($("#status").val() == ''Con cita'') {\r\n    $(".clinica").show();\r\n    $(".fecha_cita").show();\r\n    $(".tipo_consulta").show();\r\n    $(".hora_consulta").show();\r\n    $("#clinica").attr({\r\n        required: ''required'',\r\n        style: ''background-color: hsla(50,81%,94%,0.5);''\r\n    });\r\n    $("#fecha_cita").attr({\r\n        required: ''required'',\r\n        style: ''background-color: hsla(50,81%,94%,0.5);''\r\n    });\r\n    $("#tipo_consulta").attr({\r\n        required: ''required'',\r\n        style: ''background-color: //hsla(50,81%,94%,0.5);''\r\n    });\r\n    $("#hora_consulta").attr({\r\n        required: ''required'',\r\n        style: ''background-color: //hsla(50,81%,94%,0.5);''\r\n    });\r\n} else {\r\n    $(".clinica").hide();\r\n    $(".fecha_cita").hide();\r\n    $(".tipo_consulta").hide();\r\n    $(".hora_consulta").hide();\r\n    $("#fecha_cita").removeAttr(''required'');\r\n    $("#clinica").removeAttr(''required'');\r\n    $("#tipo_consulta").removeAttr(''required'');\r\n    $("#hora_consulta").removeAttr(''required'');\r\n}\r\n\r\n$("#status").change(function(event) {\r\n    if ($(this).val() == ''Con cita'') {\r\n        $(".clinica").show();\r\n        $(".fecha_cita").show();\r\n        $(".tipo_consulta").show();\r\n        $(".hora_consulta").show();\r\n        $("#clinica").attr({\r\n            required: ''required'',\r\n            style: ''background-color: hsla(50,81%,94%,0.5);''\r\n        });\r\n        $("#fecha_cita").attr({\r\n            required: ''required'',\r\n            style: ''background-color: hsla(50,81%,94%,0.5);''\r\n        });\r\n        $("#tipo_consulta").attr({\r\n            required: ''required'',\r\n            style: ''background-color: hsla(50,81%,94%,0.5);''\r\n        });\r\n        $("#hora_consulta").attr({\r\n            required: ''required'',\r\n            style: ''background-color: hsla(50,81%,94%,0.5);''\r\n        });\r\n    } else {\r\n        $(".clinica").hide();\r\n        $(".fecha_cita").hide();\r\n        $(".tipo_consulta").hide();\r\n        $(".hora_consulta").hide();\r\n        $("#fecha_cita").removeAttr(''required'');\r\n        $("#clinica").removeAttr(''required'');\r\n        $("#tipo_consulta").removeAttr(''required'');\r\n        $("#hora_consulta").removeAttr(''required'');\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(270, 'fecha_cita', 'Fecha de Cita', 33, 6, 'No', 20, 'date', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(271, 'agenda', 'Generar Cita', 33, 6, 'No', 5, 'accordion', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(272, 'nombres', 'Nombre', 33, 6, 'No', 21, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(273, 'nombre_aliado', 'Nombre del Aliado', 35, 7, 'Si', 10, 'text', '100', 'Si', 'campaigns', NULL, NULL, NULL, 'Nombres, Apellidos paterno y materno', NULL),
(274, 'nombre_medico', 'Nombre del Medico', 35, 7, 'Si', 20, 'text', '100', 'Si', 'campaigns', NULL, NULL, NULL, 'Nombres, Apellidos paterno y materno', NULL),
(275, 'correo_electronico', 'Correo electrónico', 35, 7, 'Si', 30, 'email', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(276, 'telefono', 'Teléfono', 35, 7, 'Si', 40, 'text', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(277, 'direccion', 'Dirección', 35, 7, 'Si', 50, 'text', '150', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(278, 'codigo', 'Código de Campaña', 35, 7, 'Si', 60, 'text', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(279, 'tipo_campania', 'Tipo de Campaña', 35, 7, 'Si', 70, 'select', 'A,AA,AAA,B,BB,BBB,C,CC,CCC', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(280, 'promocion', 'Promoción', 35, 7, 'No', 80, 'text', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(281, 'status', 'Status', 35, 7, 'Si', 90, 'select', 'En Proceso,Planeada,Completada,Cancelada', 'Si', 'campaigns', '', NULL, NULL, NULL, NULL),
(282, 'pre_diagnostico', 'Pre diagnóstico del Optometrista', 30, 4, 'Si', 5, 'select', 'Catarata,Conjuntivitis,Excavación sospechosa,Fondo coroideo/ Adelgazamiento de retina,Maculopatía,Oculoplástica,Ojo Seco,Pterigión,Queratocono,Refractivo (evaluar graduación),Retinopatía Diabética,Retinopatía Hipertensiva,Glaucoma preexistente,Otro,Sin Hallazgos,No Valorable', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(283, 'pre_diagnostico', 'Pre-Diagnostico del Optometrista', 32, 6, 'Si', 5, 'select', 'Catarata,Conjuntivitis,Excavación sospechosa,Fondo coroideo/ Adelgazamiento de retina,Maculopatía,Oculoplástica,Ojo Seco,Pterigión,Queratocono,Refractivo (evaluar graduación),Retinopatía Diabética,Retinopatía Hipertensiva,Glaucoma preexistente,Otro,Sin Hallazgos,No Valorable', 'Si', 'candidates', 'var prediagnostico = $(''#pre_diagnostico'').val();\r\n\r\nif (prediagnostico == '''') {\r\n	$(''.retinopatia_diabetica'').hide();\r\n	$(''.maculopatia'').hide();\r\n	$(''.retinopatia_hipertensiva'').hide();\r\n	$(''.catarata_incipiente'').hide();\r\n	$(''.pterigion'').hide();\r\n	$(''.catarata_avanzada'').hide();\r\n	$(''.glaucoma'').hide();\r\n	$(''.oculoplastica'').hide();\r\n	$(''.conjuntivitis'').hide();\r\n	$(''.revision_integral'').hide();\r\n}', NULL, NULL, NULL, ''),
(284, 'motivo_etapa', 'Motivo por el que se envía', 6, 3, 'No', 80, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(285, 'parpados_otros', 'Parpados', 38, 4, 'No', 70, 'readonly', '50', 'Si', 'explorations', 'if ($(''#parpados_otros'').text() == '''') {\r\n	$(''.parpados_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(286, 'segmento_anterior_otros', 'Segmento Anterior', 38, 4, 'No', 60, 'readonly', '50', 'Si', 'explorations', 'if ($(''#segmento_anterior_otros'').text() == '''') {\r\n	$(''.segmento_anterior_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(287, 'iris_otros', 'Iris', 38, 4, 'No', 50, 'readonly', '50', 'Si', 'explorations', 'if ($(''#iris_otros'').text() == '''') {\r\n	$(''.iris_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(288, 'vitreo_otros', 'Vítreo', 38, 4, 'No', 40, 'readonly', '50', 'Si', 'explorations', 'if ($(''#vitreo_otros'').text() == '''') {\r\n	$(''.vitreo_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(289, 'retina_otros', 'Retina', 38, 4, 'No', 30, 'readonly', '50', 'Si', 'explorations', 'if ($(''#retina_otros'').text() == '''') {\r\n	$(''.retina_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(290, 'macula_otros', 'Macula', 38, 4, 'No', 20, 'readonly', '50', 'Si', 'explorations', 'if ($(''#macula_otros'').text() == '''') {\r\n	$(''.macula_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(291, 'papila_otros', 'Papila', 38, 4, 'No', 10, 'readonly', '50', 'Si', 'explorations', 'if ($(''#papila_otros'').text() == '''') {\r\n	$(''.papila_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(292, 'ocupacion', 'Ocupacion', 6, 3, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(293, 'clinica', 'Clínica', 33, 6, 'No', 15, 'select', 'hola', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(294, 'segmento_anterior_catarata_avanzada', 'Catarata Avanzada', 8, 3, 'No', 231, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(295, 'segmento_anterior_hemorragia', 'Hemorragia', 8, 3, 'No', 232, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(296, 'segmento_anterior_sinequia', 'Sinequia', 8, 3, 'No', 233, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(297, 'iris_anisocoria', 'Anisocoria', 9, 3, 'No', 31, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'iris', NULL, NULL, NULL),
(298, 'vitreo_sinquisis', 'Sinquisis Centellante', 10, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'vitreo', NULL, NULL, NULL),
(299, 'papila_vasos_bayoneta', 'Vasos en bayoneta', 13, 3, 'No', 35, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(300, 'od_rf_distancia_nasopupilar', 'Distancia Nasopupilar', 25, 5, 'No', 92, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(301, 'oi_rf_distancia_nasopupilar', 'Distancia Nasopupilar', 25, 5, 'No', 94, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(302, 'optometrista_responsable', 'Optometrista Responsable', 25, 5, 'Si', 110, 'text', '100', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(303, 'tiene_seguro_medico', '¿Tiene seguro médico?', 1, 1, 'No', 55, 'checkbox', 'Si', 'No', 'candidates', 'if ($("#tiene_seguro_medico").prop("checked")) {\r\n    $(".seguro_medico").show();\r\n    $("#seguro_medico").val('''');\r\n} else {\r\n    $("#seguro_medico").val(''Ninguno'');\r\n    $(".seguro_medico").hide();\r\n}\r\n\r\n$("#tiene_seguro_medico").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".seguro_medico").show();\r\n        $("#seguro_medico").val('''');\r\n    } else {\r\n        $("#seguro_medico").val(''Ninguno'');\r\n        $(".seguro_medico").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(304, 'tiene_correo_electronico', '¿Tiene correo electrónico?', 2, 1, 'No', 39, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#tiene_correo_electronico").prop("checked")) {\r\n    $(".correo_electronico").show();\r\n    $("#correo_electronico").val('''');\r\n} else {\r\n    $("#correo_electronico").val(''sincorreo@salauno.com.mx'');\r\n    $(".correo_electronico").hide();\r\n}\r\n\r\n$("#tiene_correo_electronico").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".correo_electronico").show();\r\n        $("#correo_electronico").val('''');\r\n    } else {\r\n        $("#correo_electronico").val(''sincorreo@salauno.com.mx'');\r\n        $(".correo_electronico").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(305, 'optometrista_comentarios', 'Comentarios', 25, 5, 'No', 115, 'text', '150', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(306, 'tipo_consulta', 'Artículos de cita', 33, 6, 'No', 45, 'select', '', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(307, 'hora_consulta', 'Hora de consulta', 33, 6, 'No', 25, 'selectNum', '', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(309, 'consultas', 'Consultas', 35, 7, 'No', 100, 'text', NULL, 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(310, 'presion_intraocular', 'Presión Intraocular', 39, 3, 'No', 45, 'text', '50', 'Si', 'explorations', NULL, 'presion', NULL, NULL, NULL),
(311, 'glucosa_capilar', 'Glucosa Capilar', 39, 3, 'No', 50, 'text', '50', 'Si', 'explorations', NULL, 'presion', NULL, NULL, NULL),
(312, 'presion_arterial', 'Presión Arterial', 39, 3, 'No', 55, 'text', '50', 'Si', 'explorations', NULL, 'presion', NULL, NULL, NULL),
(313, 'ojo_prediagnostico', 'Ojo prediagnostico', 30, 4, 'No', 10, 'select', 'OD,OI,AO', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(314, 'ojo_prediagnostico', 'Ojo prediagnostico', 32, 6, 'No', 6, 'select', 'OD,OI,AO', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(315, 'presion_estado_medicion', 'Estado de medicion', 39, 3, 'No', 70, 'select', 'Ayunas,PostPrandial,2 Horas,Al azar', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(316, 'od_av_lejana', 'A.V. Lejana  OD', 32, 6, 'No', 7, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(317, 'oi_av_lejana', 'A.V. Lejana OI', 32, 6, 'No', 8, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(318, 'od_cv_estenopeic', 'C. V. Con Estenopéic OD', 32, 6, 'No', 9, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(319, 'oi_cv_estenopeic', 'C. V. Con Estenopéic OI', 32, 6, 'No', 10, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(320, 'presion_arterial', 'Presión Arterial', 40, 6, 'No', 10, 'text', '50', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(321, 'glucosa_capilar', 'Glucosa capilar', 40, 6, 'No', 20, 'text', '50', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(322, 'presion_intraocular', 'Presión Intraocular', 40, 6, 'No', 30, 'text', '20', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(323, 'presion_estado_medicion', 'Estado de medicion', 40, 6, 'No', 40, 'select', 'Ayunas,PostPrandial,2 Horas,Al azar', 'Si', 'explorations', NULL, 'campo_unico', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_render_campos_x`
--

CREATE TABLE `core_render_campos_x` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `seccion_id` int(11) DEFAULT NULL,
  `formulario_id` int(11) DEFAULT NULL,
  `obligatorio` enum('Si','No') DEFAULT 'No',
  `orden` int(11) DEFAULT NULL,
  `tipo` enum('text','email','select','checkbox','radio','date','number','readonly','hidden','accordion') DEFAULT NULL,
  `longitud` text,
  `activo` enum('Si','No') DEFAULT 'No',
  `tabla` varchar(50) DEFAULT NULL,
  `script` text,
  `class` varchar(50) DEFAULT NULL,
  `ayuda` text,
  `placeholder` varchar(50) DEFAULT NULL,
  `attr` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `core_render_campos_x`
--

INSERT INTO `core_render_campos_x` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES
(1, 'created_at', 'Fecha de Registro', 1, 1, 'Si', 0, 'date', NULL, 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(2, 'nombres', 'Nombre', 1, 1, 'Si', 10, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Ingresa Nombres del candidato', NULL, NULL),
(3, 'apellidos', 'Apellidos', 1, 1, 'Si', 20, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Ingresa Apellido Paterno y Materno', NULL, NULL),
(4, 'fecha_nacimiento', 'Fecha de Nacimiento', 1, 1, 'Si', 30, 'date', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(5, 'genero', 'Genero', 1, 1, 'Si', 40, 'radio', 'Femenino,Masculino,Otro', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(6, 'ocupacion', 'Ocupación', 1, 1, 'Si', 50, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(7, 'seguro_medico', 'Cobertura Medica', 1, 1, 'No', 60, 'select', 'IMSS,ISSTE,Seguro Popular,Seguro Privado,Otro,Ninguno', 'Si', 'candidates', 'if ($("#seguro_medico").val() == ''Otro'') {\r\n    $(".seguro_medico_otro").show();\r\n} else if($("#seguro_medico").val() == ''Ninguno'' || $("#seguro_medico").val() == ''''){\r\n    $(".seguro_medico_otro").hide();\r\n    $(".numero_poliza").hide();\r\n} else {\r\n    $(".numero_poliza").show();\r\n    $(".seguro_medico_otro").hide();\r\n}\r\n\r\n$("#seguro_medico").change(function(event) {\r\n    if ($(this).val() == ''Otro'') {\r\n        $(".seguro_medico_otro").show();\r\n    } else if($(this).val() == ''Ninguno'' || $(this).val() == ''''){\r\n        $(".seguro_medico_otro").hide();\r\n        $(".numero_poliza").hide();\r\n    } else {\r\n        $(".numero_poliza").show();\r\n        $(".seguro_medico_otro").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(8, 'seguro_medico_otro', '¿Cual?', 1, 1, 'No', 70, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Si selecciono OTRO en seguro medico, favor de poner con que seguro cuenta', NULL, NULL),
(9, 'numero_poliza', 'Numero de Póliza', 1, 1, 'No', 80, 'text', '50', 'Si', 'candidates', NULL, NULL, 'Ingresa numero de poliza de seuro', NULL, NULL),
(10, 'telefono_fijo', 'Teléfono Fijo', 2, 1, 'No', 10, 'number', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(11, 'telefono_celular', 'Teléfono Celular', 2, 1, 'No', 20, 'number', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(12, 'telefono_otro', 'Telefono Otro', 2, 1, 'No', 30, 'number', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(13, 'correo_electronico', 'Correo electrónico', 2, 1, 'Si', 40, 'email', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(14, 'domicilio_cp', 'Código Postal', 2, 1, 'No', 50, 'number', '5', 'Si', 'candidates', NULL, NULL, NULL, '#####', NULL),
(15, 'domicilio_calle', 'Calle', 2, 1, 'No', 60, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(16, 'domicilio_numero_exterior', 'Numero Exterior', 2, 1, 'No', 70, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(17, 'domicilio_numero_interior', 'Numero Interior', 2, 1, 'No', 80, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(18, 'domicilio_ciudad', 'Ciudad', 2, 1, 'No', 90, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(19, 'domicilio_poblacion', 'Población/Municipio/Delegación', 2, 1, 'No', 100, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(20, 'diabetes', 'Diabetes', 3, 1, 'No', 10, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#diabetes").prop("checked")) {\r\n    $(".diabetes_tiempo_anios").show();\r\n    $(".retinopatia_diabetica").show();\r\n} else {\r\n    $(".diabetes_tiempo_anios").hide();\r\n    $(".retinopatia_diabetica").hide();\r\n}\r\n\r\n$("#diabetes").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".diabetes_tiempo_anios").show();\r\n        $(".retinopatia_diabetica").show();\r\n    } else {\r\n        $(".diabetes_tiempo_anios").hide();\r\n        $(".retinopatia_diabetica").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(21, 'diabetes_tiempo_anios', 'Tiempo de Evolución (años)', 3, 1, 'No', 20, 'number', '2', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(22, 'diabetes_tratamiento', 'Tratamiento', 3, 1, 'No', 30, 'select', 'Si,No', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(23, 'hipertension', 'Hipertensión', 3, 1, 'No', 40, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#hipertension").prop("checked")) {\r\n    $(".hipertension_tiempo_anios").show();\r\n} else {\r\n    $(".hipertension_tiempo_anios").hide();\r\n}\r\n\r\n$("#hipertension").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".hipertension_tiempo_anios").show();\r\n    } else {\r\n        $(".hipertension_tiempo_anios").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(24, 'hipertension_tiempo_anios', 'Tiempo de Evolución (años)', 3, 1, 'No', 50, 'number', '2', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(25, 'hipertension_tratamiento', 'Tratamiento', 3, 1, 'No', 60, 'select', 'Si,No', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(26, 'dialisis', 'Dialisis', 3, 1, 'No', 70, 'select', 'Si,No', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(27, 'familiar_glaucoma', '¿Familiar con Glaucoma o algún familiar ha quedado ciego?', 3, 1, 'No', 80, 'radio', 'Si,No,No se', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(28, 'enfermedad_tiroides', 'Enfermedad de Tiroides', 3, 1, 'No', 32, 'checkbox', 'Si', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(29, 'disminucion_vista', '¿Ha notado disminución en su visión en el último año?', 4, 1, 'No', 10, 'checkbox', 'Si', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(30, 'examen_visual', '¿Hace cuánto se hizo un examen de la vista?', 4, 1, 'No', 20, 'radio', 'Mas de un año,Menos de un año,Nunca', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(31, 'consulta_oftalmologo', '¿Hace cuánto tiempo fue su última consulta con oftalmólogo?', 4, 1, 'No', 30, 'radio', 'Mas de un año,Menos de un año,Nunca', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(32, 'retinopatia_diabetica', 'Retinopatía Diabética', 3, 1, 'No', 31, 'checkbox', 'Si', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(33, 'cirugia_ojo', '¿Ha tenido una cirugía de ojo?', 4, 1, 'No', 40, 'select', 'Catarata,Retina,Glaucoma,Refractiva,Otro,Ninguno', 'Si', 'candidates', 'if ($("#cirugia_ojo").val() == ''Otro'') {\r\n    $(".cirugia_ojo_cual").show();\r\n} else {\r\n    $(".cirugia_ojo_cual").hide();\r\n}\r\n\r\n$("#cirugia_ojo").change(function(event) {\r\n    if ($(this).val() == ''Otro'') {\r\n        $(".cirugia_ojo_cual").show();\r\n    } else {\r\n        $(".cirugia_ojo_cual").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(34, 'cirugia_ojo_cual', '¿Cual?', 4, 1, 'No', 50, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(35, 'codigo', 'Código', 5, 2, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(36, 'nombres', 'Nombre', 5, 2, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(37, 'apellidos', 'Apellidos', 5, 2, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(38, 'edad', 'Edad', 5, 2, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(39, 'diabetes', 'Diabetes', 5, 2, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(40, 'hipertension', 'Hipertensión', 5, 2, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(41, 'dialisis', 'Dialisis', 5, 2, 'No', 70, 'readonly', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(42, 'refractivo', 'Refractivo', 5, 2, 'No', 80, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(43, 'enfermedad_tiroides', '¿Tiene enfermedad de Tiroides?', 5, 2, 'No', 90, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(44, 'etapa', '¿A qué estación lo quieren mandar?', 4, 1, 'Si', 110, 'select', 'Exploracion,Optica,Consejeria', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(45, 'codigo', 'Código', 6, 3, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(46, 'nombres', 'Nombre', 6, 3, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(47, 'apellidos', 'Apellidos', 6, 3, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(48, 'edad', 'Edad', 6, 3, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(49, 'parpados_posicion', 'Posicion Parpados', 7, 3, 'No', 50, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(50, 'parpados_normal', 'Normal', 7, 3, 'No', 45, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, NULL, NULL, NULL, NULL),
(51, 'parpados_ptosis', 'Ptosis', 7, 3, 'No', 70, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(52, 'parpados_entropion', 'Entropión', 7, 3, 'No', 80, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(53, 'parpados_ectroprion', 'Ectroprión', 7, 3, 'No', 90, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(54, 'parpados_triquiasis', 'Triquiasis', 7, 3, 'No', 100, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(55, 'parpados_blefaritis', 'Blefaritis ', 7, 3, 'No', 110, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(56, 'parpados_aumento_volumen', 'Aumento de volumen (lesiones localizadas)', 7, 3, 'No', 120, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(57, 'parpados_coloracion_diferente', 'Coloracion diferente al resro de la piel', 7, 3, 'No', 130, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(58, 'parpados_via_lagrimal', 'Vía lagrimal', 7, 3, 'No', 140, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(59, 'parpados_lagrimeo_sin_origen', 'Lagrimeo sin Origen', 7, 3, 'No', 150, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(60, 'parpados_abcesos', 'Abcesos', 7, 3, 'No', 160, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, 'parpados', NULL, NULL, NULL),
(61, 'parpados_otros', 'Otros', 7, 3, 'No', 170, 'text', '50', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(62, 'segmento_anterior_aplicado', 'Aplicado', 8, 3, 'No', 180, 'checkbox', 'OD,OI', 'No', 'explorations', NULL, NULL, NULL, NULL, NULL),
(126, 'segmento_anterior_secrecion', 'Secreción', 8, 3, 'No', 190, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(127, 'segmento_anterior_quemosis', 'Quemosis', 8, 3, 'No', 200, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(128, 'segmento_anterior_hiperemia', 'Hiperemia', 8, 3, 'No', 210, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(129, 'segmento_anterior_pterigion', 'Pterigion', 8, 3, 'No', 220, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(130, 'segmento_anterior_catarata_incipiente', 'Catarata Incipiente', 8, 3, 'No', 230, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(131, 'segmento_anterior_otros', 'Otros', 8, 3, 'No', 240, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(132, 'iris_aplicado', 'Aplicado', 9, 3, 'No', 10, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'iris', '', '', ''),
(133, 'iris_dpa', 'DPA', 9, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(134, 'iris_aniridia', 'Aniridia', 9, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(135, 'iris_rubeosis', 'Rubeosis', 9, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(136, 'iris_reflejo_ausente', 'Reflejo Ausente', 9, 3, 'No', 50, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(137, 'iris_ectropion_uveal', 'Ectroprión Uveal', 9, 3, 'No', 60, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'iris', '', '', ''),
(138, 'iris_no_valorable', 'Sin hallazgos aparentes', 9, 3, 'No', 5, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(139, 'iris_otros', 'Otros', 9, 3, 'No', 80, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(140, 'vitreo_transparente', 'Transparente', 10, 3, 'No', 10, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(141, 'vitreo_hemorragia', 'Hemorragia', 10, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'vitreo', '', '', ''),
(142, 'vitreo_no_valorable', 'No Valorable', 10, 3, 'No', 5, 'checkbox', 'OD,OI', 'No', 'explorations', '', '', '', '', ''),
(143, 'vitreo_otros', 'Otros', 10, 3, 'No', 40, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(144, 'retina_aplicada', 'Aplicada', 11, 3, 'No', 10, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(145, 'retina_desprendimiento', 'Desprendimiento', 11, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(146, 'retina_aneurismas', 'Aneurismas', 11, 3, 'No', 30, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(147, 'retina_microaneurismas', 'Microaneurismas', 11, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(148, 'retina_exudados', 'Exudados', 11, 3, 'No', 50, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(149, 'retina_exudados_blandos', 'Exudados blandos', 11, 3, 'No', 60, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(150, 'retina_drusas', 'Drusas', 11, 3, 'No', 70, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(151, 'retina_fondo_coroideo', 'Fondo coroideo', 11, 3, 'No', 80, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(152, 'retina_vision_borrosa', 'Visión borrosa', 11, 3, 'No', 90, 'checkbox', 'OD,OI', 'No', 'explorations', '', 'retina', '', '', ''),
(153, 'retina_hemorragias', 'Hemorragias', 11, 3, 'No', 100, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(154, 'retina_neovasos', 'Neovasos', 11, 3, 'No', 110, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(155, 'retina_cruce_av_sospechoso', 'Cruce AV sospechoso', 11, 3, 'No', 120, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(156, 'retina_tortosidad_venosa', 'Tortuosidad Venosa', 11, 3, 'No', 130, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(157, 'retina_adelgazamiento_vascular', 'Adelgazamiento vascular', 11, 3, 'No', 140, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'retina', '', '', ''),
(158, 'retina_no_valorable', 'No Valorable', 11, 3, 'No', 5, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(159, 'retina_otros', 'Otros', 11, 3, 'No', 160, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(160, 'macula_brillo', 'Brillo Foveolar Normal', 12, 3, 'No', 10, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(161, 'macula_edema', 'Edema', 12, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(162, 'macula_desprendimiento', 'Desprendimiento', 12, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(163, 'macula_exudados', 'Exudados', 12, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(164, 'macula_drusas', 'Drusas', 12, 3, 'No', 50, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(165, 'macula_hemorragias', 'Hemorragia', 12, 3, 'No', 60, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'macula', '', '', ''),
(166, 'macula_no_valorable', 'No Valorable', 12, 3, 'No', 5, 'checkbox', 'OD,OI', 'Si', 'explorations', '', '', '', '', ''),
(167, 'macula_otros', 'Otros', 12, 3, 'No', 80, 'text', '50', 'Si', 'explorations', '', '', '', '', ''),
(168, 'papila_excavacion_fisiologica', 'Excavación fisiológica', 13, 3, 'No', 10, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(169, 'papila_excavacion_sospechosa', 'Excavación sospechosa', 13, 3, 'No', 20, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(170, 'papila_neovasos', 'Neovasos', 13, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(171, 'papila_hemorragia_astila', 'Hemorragia en Astilla Papila', 13, 3, 'No', 40, 'checkbox', 'OD,OI', 'Si', 'explorations', '', 'papila', '', '', ''),
(172, 'papila_no_valorable', 'No Valorable', 13, 3, 'No', 5, 'checkbox', 'OD,OI', 'No', 'explorations', '', '', '', '', ''),
(173, 'papila_otros', 'Otros', 13, 3, 'No', 60, 'text', '50', 'Si', 'explorations', '', '', '', '', NULL),
(189, 'codigo', 'Código', 22, 5, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, 'readonly="true"'),
(190, 'nombres', 'Nombre', 22, 5, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, 'readonly="true"'),
(191, 'edad', 'Edad', 22, 5, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, 'readonly="true"'),
(192, 'od_av_lejana', 'A.V. Lejana', 23, 5, 'No', 10, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(193, 'oi_av_lejana', 'A.V. Lejana', 23, 5, 'No', 20, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(198, 'od_cv_estenopeic', 'C. V. Con Estenopéic', 23, 5, 'No', 30, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(199, 'oi_cv_estenopeic', 'C. V. Con Estenopéic', 23, 5, 'No', 40, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(200, 'apellidos', 'Apellidos', 22, 5, 'No', 25, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(201, 'od_av_cercana', 'A. V. Cercana', 23, 5, 'No', 50, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(202, 'oi_av_cercana', 'A. V. Cercana', 23, 5, 'No', 60, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(203, 'od_av_rx', 'A. V. Con Rx Actual', 23, 5, 'No', 70, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(204, 'oi_av_rx', 'A. V. Con Rx Actual', 23, 5, 'No', 80, 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(205, 'od_presion_intraocular', 'Presión Intraocular', 23, 5, 'No', 90, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(206, 'oi_presion_intraocular', 'Presión Intraocular', 23, 5, 'No', 100, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(207, 'od_r_esferico', 'Esférico', 24, 5, 'No', 10, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(208, 'oi_r_esferico', 'Esférico', 24, 5, 'No', 20, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(209, 'od_r_cilíndrico', 'Cilíndrico', 24, 5, 'No', 30, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(210, 'oi_r_cilíndrico', 'Cilíndrico', 24, 5, 'No', 40, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(211, 'od_r_eje', 'Eje', 24, 5, 'No', 50, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(212, 'oi_r_eje', 'Eje', 24, 5, 'No', 60, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(213, 'od_r_av', 'A. V.', 24, 5, 'No', 70, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(214, 'oi_r_av', 'A. V.', 24, 5, 'No', 80, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(215, 'r_adicion', 'Adición', 24, 5, 'No', 110, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(216, 'od_rf_esferico', 'Esférico', 25, 5, 'No', 10, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(217, 'oi_rf_esferico', 'Esférico', 25, 5, 'No', 20, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(218, 'od_rf_cilíndrico', 'Cilíndrico', 25, 5, 'No', 30, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(219, 'oi_rf_cilíndrico', 'Cilíndrico', 25, 5, 'No', 40, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(220, 'od_rf_eje', 'Eje', 25, 5, 'No', 50, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(221, 'oi_rf_eje', 'Eje', 25, 5, 'No', 60, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(222, 'od_rf_av', 'A. V.', 25, 5, 'No', 70, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(223, 'oi_rf_av', 'A. V.', 25, 5, 'No', 80, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(224, 'rf_adicion', 'Adición', 25, 5, 'No', 100, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(225, 'etapa', 'Enviar a', 27, 5, 'No', 10, 'select', NULL, 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(226, 'motivo_etapa', 'Motivo por el que se envía', 4, 1, 'No', 120, 'text', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(227, 'diabetes', 'Diabetes', 6, 3, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(228, 'hipertension', 'Hipertensión', 6, 3, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(229, 'enfermedad_tiroides', 'Enfermedad de Tiroides', 6, 3, 'No', 70, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(232, 'codigo', 'Código', 28, 4, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(233, 'nombres', 'Nombre', 28, 4, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(234, 'apellidos', 'Apellidos', 28, 4, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(235, 'edad', 'Edad', 28, 4, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(236, 'diabetes', 'Diabetes', 28, 4, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(237, 'hipertension', 'Hipertensión', 28, 4, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(238, 'enfermedad_tiroides', '¿Tiene enfermedad de Tiroides?', 28, 4, 'No', 70, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(239, 'retinopatia_diabetica', 'Retinopatía Diabética', 29, 4, 'No', 10, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(240, 'maculopatia', 'Maculopatia', 29, 4, 'No', 20, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(241, 'retinopatia_hipertensiva', 'Retinopatía Hipertensiva', 29, 4, 'No', 30, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(242, 'catarata_avanzada', 'Catarata Avanzada', 29, 4, 'No', 40, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(243, 'pterigion', 'Pterigion', 29, 4, 'No', 50, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(244, 'catarata_incipiente', 'Catarata Incipiente', 29, 4, 'No', 21, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(245, 'glaucoma', 'Excavación sospechosa', 29, 4, 'No', 22, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(246, 'oculoplastica', 'Oculoplastica', 29, 4, 'No', 80, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(247, 'conjuntivitis', 'Conjuntivitis', 29, 4, 'No', 90, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(248, 'iridopatia', 'Iridopatia', 29, 4, 'No', 100, 'hidden', '50', 'No', 'results', NULL, NULL, NULL, NULL, NULL),
(249, 'revision_integral', 'Revisión Integral', 29, 4, 'No', 110, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(250, 'etapa', 'Etapa', 30, 4, 'Si', 10, 'select', 'Optica,Consejeria', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(251, 'codigo', 'Código', 31, 6, 'No', 10, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(252, 'nombres', 'Nombres', 31, 6, 'No', 20, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(253, 'apellidos', 'Apellidos', 31, 6, 'No', 30, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(254, 'edad', 'Edad', 31, 6, 'No', 40, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(255, 'diabetes', 'Diabetes', 31, 6, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(256, 'hipertension', 'Hipertensión', 31, 6, 'No', 60, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(257, 'enfermedad_tiroides', '¿Tiene enfermedad de Tiroides?', 31, 6, 'No', 70, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(258, 'retinopatia_diabetica', 'Retinopatía Diabética', 32, 6, 'No', 10, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(259, 'maculopatia', 'Maculopatia', 32, 6, 'No', 20, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(260, 'retinopatia_hipertensiva', 'Retinopatía Hipertensiva', 32, 6, 'No', 30, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(261, 'catarata_incipiente', 'Catarata Incipiente', 32, 6, 'No', 40, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(262, 'pterigion', 'Pterigion', 32, 6, 'No', 50, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(263, 'catarata_avanzada', 'Catarata Avanzada', 32, 6, 'No', 60, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(264, 'glaucoma', 'Excavación sospechosa', 32, 6, 'No', 70, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(265, 'oculoplastica', 'Oculoplastica', 32, 6, 'No', 80, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(266, 'conjuntivitis', 'Conjuntivitis', 32, 6, 'No', 90, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(267, 'iridopatia', 'Iridopatia', 32, 6, 'No', 100, 'hidden', '50', 'No', 'results', NULL, NULL, NULL, NULL, NULL),
(268, 'revision_integral', 'Revisión Integral', 32, 6, 'No', 100, 'hidden', '50', 'Si', 'results', NULL, NULL, NULL, NULL, NULL),
(269, 'status', 'Status', 33, 6, 'No', 10, 'select', 'Seguimiento,Con cita,No Calificado', 'Si', 'candidates', 'if ($("#status").val() == ''Con cita'') {\r\n    $(".clinica").show();\r\n    $(".fecha_cita").show();\r\n    $("#clinica").attr({\r\n        required: ''required'',\r\n        style: ''background-color: hsla(50,81%,94%,0.5);''\r\n    });\r\n    $("#fecha_cita").attr({\r\n        required: ''required'',\r\n        style: ''background-color: hsla(50,81%,94%,0.5);''\r\n    });\r\n} else {\r\n    $(".clinica").hide();\r\n    $(".fecha_cita").hide();\r\n    $("#fecha_cita").removeAttr(''required'');\r\n    $("#clinica").removeAttr(''required'');\r\n}\r\n\r\n$("#status").change(function(event) {\r\n    if ($(this).val() == ''Con cita'') {\r\n        $(".clinica").show();\r\n        $(".fecha_cita").show();\r\n        $("#clinica").attr({\r\n            required: ''required'',\r\n            style: ''background-color: hsla(50,81%,94%,0.5);''\r\n        });\r\n        $("#fecha_cita").attr({\r\n            required: ''required'',\r\n            style: ''background-color: hsla(50,81%,94%,0.5);''\r\n        });\r\n    } else {\r\n        $(".clinica").hide();\r\n        $(".fecha_cita").hide();\r\n        $("#fecha_cita").removeAttr(''required'');\r\n        $("#clinica").removeAttr(''required'');\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(270, 'fecha_cita', 'Fecha de Cita', 33, 6, 'No', 20, 'date', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(271, 'agenda', 'Generar Cita', 33, 6, 'No', 5, 'accordion', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(272, 'nombres', 'Nombre', 33, 6, 'No', 21, 'text', '50', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(273, 'nombre_aliado', 'Nombre del Aliado', 35, 7, 'Si', 10, 'text', '100', 'Si', 'campaigns', NULL, NULL, NULL, 'Nombres, Apellidos paterno y materno', NULL),
(274, 'nombre_medico', 'Nombre del Medico', 35, 7, 'Si', 20, 'text', '100', 'Si', 'campaigns', NULL, NULL, NULL, 'Nombres, Apellidos paterno y materno', NULL),
(275, 'correo_electronico', 'Correo electrónico', 35, 7, 'Si', 30, 'email', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(276, 'telefono', 'Teléfono', 35, 7, 'Si', 40, 'text', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(277, 'direccion', 'Dirección', 35, 7, 'Si', 50, 'text', '150', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(278, 'codigo', 'Código de Campaña', 35, 7, 'Si', 60, 'text', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(279, 'tipo_campania', 'Tipo de Campaña', 35, 7, 'Si', 70, 'select', 'A,AA,AAA,B,BB,BBB,C,CC,CCC', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(280, 'promocion', 'Promoción', 35, 7, 'No', 80, 'text', '50', 'Si', 'campaigns', NULL, NULL, NULL, NULL, NULL),
(281, 'status', 'Status', 35, 7, 'Si', 90, 'select', 'En Proceso,Planeada,Completada,Cancelada', 'Si', 'campaigns', '', NULL, NULL, NULL, NULL),
(282, 'pre_diagnostico', 'Pre diagnóstico del Optometrista', 30, 4, 'Si', 5, 'select', 'Catarata incipiente,Catarata pb quirurgica,Conjuntivitis,Excavacion Sospechosa,Fondo coroideo / Adelgazamiento retina,Maculopatia,No valorable,Oculoplastica,Ojo seco,Otro,Pterigion,Queratocono,Refractivo,Retinopatia Diabetica,Retinopatia Hipertensiva,Revision Integral,Sano,Sin Hallazgo,Sin Pre-diagnostico,Valoracion cirugia refractiva', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(283, 'pre_diagnostico', 'Pre-Diagnostico del Optometrista', 32, 6, 'No', 5, 'text', '50', 'Si', 'candidates', 'var prediagnostico = $(''#pre_diagnostico'').val();\r\n\r\nif (prediagnostico == '''') {\r\n	$(''.retinopatia_diabetica'').hide();\r\n	$(''.maculopatia'').hide();\r\n	$(''.retinopatia_hipertensiva'').hide();\r\n	$(''.catarata_incipiente'').hide();\r\n	$(''.pterigion'').hide();\r\n	$(''.catarata_avanzada'').hide();\r\n	$(''.glaucoma'').hide();\r\n	$(''.oculoplastica'').hide();\r\n	$(''.conjuntivitis'').hide();\r\n	$(''.revision_integral'').hide();\r\n}', NULL, NULL, NULL, 'disabled'),
(284, 'motivo_etapa', 'Motivo por el que se envía', 6, 3, 'No', 80, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(285, 'parpados_otros', 'Parpados', 38, 4, 'No', 70, 'readonly', '50', 'Si', 'explorations', 'if ($(''#parpados_otros'').text() == '''') {\r\n	$(''.parpados_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(286, 'segmento_anterior_otros', 'Segmento Anterior', 38, 4, 'No', 60, 'readonly', '50', 'Si', 'explorations', 'if ($(''#segmento_anterior_otros'').text() == '''') {\r\n	$(''.segmento_anterior_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(287, 'iris_otros', 'Iris', 38, 4, 'No', 50, 'readonly', '50', 'Si', 'explorations', 'if ($(''#iris_otros'').text() == '''') {\r\n	$(''.iris_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(288, 'vitreo_otros', 'Vítreo', 38, 4, 'No', 40, 'readonly', '50', 'Si', 'explorations', 'if ($(''#vitreo_otros'').text() == '''') {\r\n	$(''.vitreo_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(289, 'retina_otros', 'Retina', 38, 4, 'No', 30, 'readonly', '50', 'Si', 'explorations', 'if ($(''#retina_otros'').text() == '''') {\r\n	$(''.retina_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(290, 'macula_otros', 'Macula', 38, 4, 'No', 20, 'readonly', '50', 'Si', 'explorations', 'if ($(''#macula_otros'').text() == '''') {\r\n	$(''.macula_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(291, 'papila_otros', 'Papila', 38, 4, 'No', 10, 'readonly', '50', 'Si', 'explorations', 'if ($(''#papila_otros'').text() == '''') {\r\n	$(''.papila_otros'').hide();\r\n}', NULL, NULL, NULL, NULL),
(292, 'ocupacion', 'Ocupacion', 6, 3, 'No', 50, 'readonly', '50', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL),
(293, 'clinica', 'Clínica', 33, 6, 'No', 15, 'select', 'Narvarte,Satelite,Coyoacan,Roma,Tezontle,Gran Sur,Buenavista,Satelite', 'No', 'candidates', NULL, NULL, NULL, NULL, NULL),
(294, 'segmento_anterior_catarata_avanzada', 'Catarata Avanzada', 8, 3, 'No', 231, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(295, 'segmento_anterior_hemorragia', 'Hemorragia', 8, 3, 'No', 232, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(296, 'segmento_anterior_sinequia', 'Sinequia', 8, 3, 'No', 233, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(297, 'iris_anisocoria', 'Anisocoria', 9, 3, 'No', 31, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'iris', NULL, NULL, NULL),
(298, 'vitreo_sinquisis', 'Sinquisis Centellante', 10, 3, 'No', 30, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, 'vitreo', NULL, NULL, NULL),
(299, 'papila_vasos_bayoneta', 'Vasos en bayoneta', 13, 3, 'No', 35, 'checkbox', 'OD,OI', 'Si', 'explorations', NULL, NULL, NULL, NULL, NULL),
(300, 'od_rf_distancia_nasopupilar', 'Distancia Nasopupilar', 25, 5, 'No', 92, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(301, 'oi_rf_distancia_nasopupilar', 'Distancia Nasopupilar', 25, 5, 'No', 94, 'number', '20', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(302, 'optometrista_responsable', 'Optometrista Responsable', 25, 5, 'Si', 110, 'text', '100', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL),
(303, 'tiene_seguro_medico', '¿Tiene seguro médico?', 1, 1, 'No', 55, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#tiene_seguro_medico").prop("checked")) {\r\n    $(".seguro_medico").show();\r\n    $("#seguro_medico").val('''');\r\n} else {\r\n    $("#seguro_medico").val(''Ninguno'');\r\n    $(".seguro_medico").hide();\r\n}\r\n\r\n$("#tiene_seguro_medico").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".seguro_medico").show();\r\n        $("#seguro_medico").val('''');\r\n    } else {\r\n        $("#seguro_medico").val(''Ninguno'');\r\n        $(".seguro_medico").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL),
(304, 'tiene_correo_electronico', '¿Tiene correo electrónico?', 2, 1, 'No', 39, 'checkbox', 'Si', 'Si', 'candidates', 'if ($("#tiene_correo_electronico").prop("checked")) {\r\n    $(".correo_electronico").show();\r\n    $("#correo_electronico").val('''');\r\n} else {\r\n    $("#correo_electronico").val(''sincorreo@salauno.com.mx'');\r\n    $(".correo_electronico").hide();\r\n}\r\n\r\n$("#tiene_correo_electronico").change(function(event) {\r\n    if ($(this).prop("checked")) {\r\n        $(".correo_electronico").show();\r\n        $("#correo_electronico").val('''');\r\n    } else {\r\n        $("#correo_electronico").val(''sincorreo@salauno.com.mx'');\r\n        $(".correo_electronico").hide();\r\n    }\r\n});', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_render_formularios`
--

CREATE TABLE `core_render_formularios` (
  `id` int(11) NOT NULL,
  `stage_id` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `tabla` varchar(50) DEFAULT NULL,
  `activo` enum('Si','No') DEFAULT NULL,
  `ayuda` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `core_render_formularios`
--

INSERT INTO `core_render_formularios` (`id`, `stage_id`, `titulo`, `tabla`, `activo`, `ayuda`) VALUES
(1, '1', 'Registro', 'candidates', 'Si', 'Captura principal para el registro de Candidatos								'),
(2, '2', 'Revision', 'reviews', 'Si', 'De acuerdo a los datos capturados y validados, se  decidira a que etapa pasara cada candidato.'),
(3, '3', 'Exploracion', 'explorations', 'Si', 'Cuando un candidato pase a forus aquí se registraran los hallazgos encontrados.'),
(4, '4', 'Resultado de Exploracion', 'results', 'Si', 'Resultados de Exploracion'),
(5, '5', 'Refraccion', 'refraccions', 'Si', 'Se registran los niveles de Refraccion'),
(6, '6', 'Consejeria', 'conselign', 'Si', 'Con los "Resultados de Exploracion" el consejero debe saber los puntos a mencionar al Candidato y de Acuerdo a la direccion del Candidato se podria buscar la Sucursal mas cercana.'),
(7, '7', 'Campañas', 'campaigns', 'Si', 'Administracion de Campañas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_render_secciones`
--

CREATE TABLE `core_render_secciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `activo` enum('Si','No') DEFAULT NULL,
  `formulario_id` int(11) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `core_render_secciones`
--

INSERT INTO `core_render_secciones` (`id`, `nombre`, `titulo`, `orden`, `activo`, `formulario_id`, `class`) VALUES
(1, 'datos_generales', 'Datos Generales', 1, 'Si', 1, 'panel-default'),
(2, 'domicilio', 'Domicilio', 2, 'Si', 1, 'panel-default'),
(3, 'antecedentes_medicos', 'Antecedentes Médicos', 3, 'Si', 1, 'panel-default'),
(4, 'ultima_visita_oftalmologo', 'Última Visita al Oftalmólogo', 4, 'Si', 1, 'panel-default'),
(5, 'candidato', 'Candidato', 1, 'Si', 2, 'panel-primary form-horizontal'),
(6, 'candidato', 'Candidato', 1, 'Si', 3, 'panel-primary form-horizontal'),
(7, 'parpados', 'Posición de Parpados', 8, 'Si', 3, 'panel-default'),
(8, 'segmento_anterior', 'Segmeno Anterior', 7, 'Si', 3, 'panel-default'),
(9, 'iris', 'Iris', 6, 'Si', 3, 'panel-default'),
(10, 'vitreo', 'Vítreo', 5, 'Si', 3, 'panel-default'),
(11, 'retina', 'Retina', 4, 'Si', 3, 'panel-default'),
(12, 'macula', 'Macula', 3, 'Si', 3, 'panel-default'),
(13, 'papila', 'Papila', 2, 'Si', 3, 'panel-default'),
(22, 'candidato', 'Candidato', 1, 'Si', 5, 'panel-primary form-horizontal'),
(23, 'agudeza_visual', 'Agudeza Visual', 2, 'Si', 5, 'panel-default'),
(24, 'refraccion', 'Refracción', 3, 'Si', 5, 'panel-default'),
(25, 'refraccion_final', 'Refracción Final', 4, 'Si', 5, 'panel-default'),
(26, 'etapa', 'Siguiente Etapa', 2, 'Si', 2, 'panel-default'),
(27, 'etapa', 'Siguiente Etapa', 5, 'No', 5, 'panel-default'),
(28, 'candidato', 'Candidato', 1, 'Si', 4, 'panel-primary form-horizontal'),
(29, 'resultado_exploracion', 'Probablemente el Candidato tenga alguno de los siguientes padecimientos:', 2, 'Si', 4, 'panel-default'),
(30, 'etapa', 'Siguiente Etapa', 4, 'Si', 4, 'panel-default'),
(31, 'candidato', 'Candidato', 1, 'Si', 6, 'panel-primary form-horizontal'),
(32, 'resultados_explotacion', 'Probablemente el Candidato tenga alguno de los siguientes padecimientos:', 2, 'Si', 6, 'panel-default'),
(33, 'seguimiento', 'Seguimiento', 5, 'Si', 6, 'panel-default'),
(34, 'cita', 'Generar Cita', 4, 'No', 6, 'panel-default'),
(35, 'campania', 'Datos de Campaña', 1, 'Si', 7, 'panel-primary'),
(36, 'direccion', 'Direccion', 2, 'No', 7, 'panel-default'),
(37, 'datos_campania', 'Datos de la Campaña', 3, 'No', 7, 'panel-default'),
(38, 'notas_exploracion', 'Otros hallazgos encontrados en la exploración', 3, 'Si', 4, 'panel-default form-horizontal'),
(39, 'presion', 'Enfermeria', 9, 'Si', 3, 'panel-default'),
(40, 'presion', 'Enfermeria', 3, 'Si', 6, 'panel-default form-horizontal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_stage`
--

CREATE TABLE `core_stage` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `activo` enum('Si','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `core_stage`
--

INSERT INTO `core_stage` (`id`, `nombre`, `titulo`, `descripcion`, `activo`) VALUES
(1, 'candidates', 'Registro', NULL, 'Si'),
(2, 'review', 'Revision', NULL, 'Si'),
(3, 'exploration', 'Exploracion', NULL, 'Si'),
(4, 'display', 'Optica', NULL, 'Si'),
(5, 'enfermeria', 'Enfermeria', NULL, 'Si'),
(6, 'consejeria', 'Consejeria', NULL, 'Si'),
(7, 'generar_cita', 'Generar Cita', NULL, 'Si'),
(8, 'campaing', 'Campañas', 'privilegios', 'Si'),
(9, 'seguimiento', 'Seguimiento', 'privilegios', 'Si'),
(10, 'configuration', 'Configuracion', 'privilegios', 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `displays`
--

CREATE TABLE `displays` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `od_av_lejana` decimal(10,2) DEFAULT NULL,
  `oi_av_lejana` decimal(10,2) DEFAULT NULL,
  `od_estenopeic` decimal(10,2) DEFAULT NULL,
  `oi_estenopeic` decimal(10,2) DEFAULT NULL,
  `od_av_cercana` decimal(10,2) DEFAULT NULL,
  `oi_av_cercana` decimal(10,2) DEFAULT NULL,
  `od_av_rx` decimal(10,2) DEFAULT NULL,
  `oi_av_rx` decimal(10,2) DEFAULT NULL,
  `od_pio` decimal(10,2) DEFAULT NULL,
  `oi_pio` decimal(10,2) DEFAULT NULL,
  `refaccion_od_esferico` decimal(10,2) DEFAULT NULL,
  `refaccion_oi_esferico` decimal(10,2) DEFAULT NULL,
  `refaccion_od_cilindrico` decimal(10,2) DEFAULT NULL,
  `refaccion_oi_cilindrico` decimal(10,2) DEFAULT NULL,
  `refaccion_od_eje` decimal(10,2) DEFAULT NULL,
  `refaccion_oi_eje` decimal(10,2) DEFAULT NULL,
  `refaccion_od_av` decimal(10,2) DEFAULT NULL,
  `refaccion_oi_av` decimal(10,2) DEFAULT NULL,
  `refaccion_add` decimal(10,2) DEFAULT NULL,
  `refaccion_final_od_esferico` decimal(10,2) DEFAULT NULL,
  `refaccion_final_oi_esferico` decimal(10,2) DEFAULT NULL,
  `refaccion_final_od_cilindrico` decimal(10,2) DEFAULT NULL,
  `refaccion_final_oi_cilindrico` decimal(10,2) DEFAULT NULL,
  `refaccion_final_od_eje` decimal(10,2) DEFAULT NULL,
  `refaccion_final_oi_eje` decimal(10,2) DEFAULT NULL,
  `refaccion_final_od_av` decimal(10,2) DEFAULT NULL,
  `refaccion_final_oi_av` decimal(10,2) DEFAULT NULL,
  `refaccion_final_add` decimal(10,2) DEFAULT NULL,
  `optometrista_responsable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `explorations`
--

CREATE TABLE `explorations` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL DEFAULT '0',
  `campaign_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `segmento_anterior_secrecion` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `parpados_posicion` text,
  `parpados_ptosis` text,
  `parpados_entropion` text,
  `parpados_ectroprion` text,
  `parpados_triquiasis` text,
  `parpados_blefaritis` text,
  `parpados_otros` text,
  `segmento_anterior_quemosis` text,
  `segmento_anterior_hiperemia` text,
  `segmento_anterior_pterigion` text,
  `segmento_anterior_catarata_incipiente` text,
  `segmento_anterior_catarata_avanzada` text,
  `segmento_anterior_hemorragia` text,
  `segmento_anterior_sinequia` text,
  `segmento_anterior_otros` text,
  `iris_no_valorable` text,
  `iris_dpa` text,
  `iris_aniridia` text,
  `iris_anisocoria` text,
  `iris_rubeosis` text,
  `iris_reflejo_ausente` text,
  `iris_ectropion_uveal` text,
  `iris_otros` text,
  `vitreo_transparente` text,
  `vitreo_hemorragia` text,
  `vitreo_sinquisis` text,
  `vitreo_otros` text,
  `retina_no_valorable` text,
  `retina_desprendimiento` text,
  `retina_microaneurismas` text,
  `retina_exudados` text,
  `retina_drusas` text,
  `retina_fondo_coroideo` text,
  `retina_hemorragias` text,
  `retina_neovasos` text,
  `retina_cruce_av_sospechoso` text,
  `retina_tortosidad_venosa` text,
  `retina_adelgazamiento_vascular` text,
  `retina_otros` text,
  `macula_no_valorable` text,
  `macula_brillo` text,
  `macula_edema` text,
  `macula_desprendimiento` text,
  `macula_exudados` text,
  `macula_drusas` text,
  `macula_hemorragias` text,
  `macula_otros` text,
  `papila_excavacion_fisiologica` text,
  `papila_excavacion_sospechosa` text,
  `papila_neovasos` text,
  `papila_vasos_bayoneta` text,
  `papila_hemorragia_astila` text,
  `papila_otros` text,
  `prediagnostico` enum('Si','No') DEFAULT 'No',
  `presion_intraocular` varchar(50) DEFAULT NULL,
  `glucosa_capilar` varchar(50) DEFAULT NULL,
  `presion_arterial` varchar(50) DEFAULT NULL,
  `presion_estado_medicion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `explorations`
--

INSERT INTO `explorations` (`id`, `candidate_id`, `campaign_id`, `created_at`, `segmento_anterior_secrecion`, `updated_at`, `user_id`, `parpados_posicion`, `parpados_ptosis`, `parpados_entropion`, `parpados_ectroprion`, `parpados_triquiasis`, `parpados_blefaritis`, `parpados_otros`, `segmento_anterior_quemosis`, `segmento_anterior_hiperemia`, `segmento_anterior_pterigion`, `segmento_anterior_catarata_incipiente`, `segmento_anterior_catarata_avanzada`, `segmento_anterior_hemorragia`, `segmento_anterior_sinequia`, `segmento_anterior_otros`, `iris_no_valorable`, `iris_dpa`, `iris_aniridia`, `iris_anisocoria`, `iris_rubeosis`, `iris_reflejo_ausente`, `iris_ectropion_uveal`, `iris_otros`, `vitreo_transparente`, `vitreo_hemorragia`, `vitreo_sinquisis`, `vitreo_otros`, `retina_no_valorable`, `retina_desprendimiento`, `retina_microaneurismas`, `retina_exudados`, `retina_drusas`, `retina_fondo_coroideo`, `retina_hemorragias`, `retina_neovasos`, `retina_cruce_av_sospechoso`, `retina_tortosidad_venosa`, `retina_adelgazamiento_vascular`, `retina_otros`, `macula_no_valorable`, `macula_brillo`, `macula_edema`, `macula_desprendimiento`, `macula_exudados`, `macula_drusas`, `macula_hemorragias`, `macula_otros`, `papila_excavacion_fisiologica`, `papila_excavacion_sospechosa`, `papila_neovasos`, `papila_vasos_bayoneta`, `papila_hemorragia_astila`, `papila_otros`, `prediagnostico`, `presion_intraocular`, `glucosa_capilar`, `presion_arterial`, `presion_estado_medicion`) VALUES
(1, 1, 1, '2017-08-26 00:00:55', '', '2017-08-26 00:01:12', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '0/0', '0/0', '0/0', ''),
(2, 2, 1, '2017-08-29 18:24:38', '', '2017-08-29 18:25:13', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(3, 3, 1, '2017-08-29 18:56:48', '', '2017-08-29 18:58:00', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(4, 4, 2, '2017-08-30 19:56:36', '', '2017-08-30 20:03:49', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(5, 5, 2, '2017-08-30 19:56:46', '', '2017-08-30 19:56:56', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(6, 6, 2, '2017-08-30 19:58:03', '', '2017-08-30 20:00:31', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(7, 7, 2, '2017-08-30 19:59:21', '', '2017-08-30 20:07:05', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(8, 8, 2, '2017-08-30 20:01:31', '', '2017-08-30 20:10:16', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(9, 9, 2, '2017-08-30 20:01:34', '', '2017-08-30 20:13:33', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(10, 10, 2, '2017-08-30 20:04:30', '', '2017-08-30 20:17:11', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(11, 11, 2, '2017-08-30 20:04:41', '', '2017-08-30 20:28:23', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(12, 12, 2, '2017-08-30 20:06:42', '', '2017-08-30 20:29:32', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(13, 13, 2, '2017-08-30 20:06:45', '', '2017-08-30 20:33:18', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(14, 14, 2, '2017-08-30 20:08:51', '', '2017-08-30 20:36:31', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(15, 15, 2, '2017-08-30 20:10:04', '', '2017-08-30 20:40:45', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(16, 16, 2, '2017-08-30 20:10:47', '', '2017-08-30 20:43:36', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(17, 17, 2, '2017-08-30 20:12:55', '', '2017-08-30 20:46:35', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(18, 18, 2, '2017-08-30 20:13:02', '', '2017-08-30 20:50:12', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(19, 19, 2, '2017-08-30 20:15:29', '', '2017-08-30 20:53:41', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(20, 20, 2, '2017-08-30 20:15:44', '', '2017-08-30 20:57:07', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(21, 21, 2, '2017-08-30 20:17:47', '', '2017-08-30 21:03:45', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(22, 22, 2, '2017-08-30 20:19:37', '', '2017-08-30 21:10:09', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(23, 23, 2, '2017-08-30 20:20:10', '', '2017-08-30 21:15:32', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(24, 24, 2, '2017-08-30 20:26:28', '', '2017-08-30 23:49:26', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(25, 25, 2, '2017-08-30 20:29:14', '', '2017-08-30 21:20:11', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(26, 26, 2, '2017-08-30 20:30:14', '', '2017-08-30 21:24:49', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(27, 27, 2, '2017-08-30 20:33:18', '', '2017-08-30 23:49:49', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(28, 28, 2, '2017-08-30 20:35:05', '', '2017-08-30 21:23:59', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(29, 29, 2, '2017-08-30 20:36:34', '', '2017-08-30 23:50:03', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(30, 30, 2, '2017-08-30 20:36:44', '', '2017-08-30 21:31:50', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(31, 31, 2, '2017-08-30 20:38:53', '', '2017-08-30 21:34:57', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(32, 32, 2, '2017-08-30 20:40:55', '', '2017-08-30 21:41:35', 3, NULL, '', '', '', '', '', '', '', '', '', 'OD,', ',OI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(33, 33, 2, '2017-08-30 20:43:09', '', '2017-08-30 21:42:48', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(34, 34, 2, '2017-08-30 20:43:32', '', '2017-08-30 21:37:47', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(35, 35, 2, '2017-08-30 20:47:01', '', '2017-08-30 21:47:46', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(36, 36, 2, '2017-08-30 20:47:11', '', '2017-08-30 21:41:58', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(37, 37, 2, '2017-08-30 20:49:15', '', '2017-08-30 21:50:16', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(38, 38, 2, '2017-08-30 20:50:58', '', '2017-08-30 21:45:21', 3, NULL, '', '', '', '', 'OD,', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(39, 39, 2, '2017-08-30 20:54:11', '', '2017-08-30 21:54:01', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(40, 40, 2, '2017-08-30 20:55:04', '', '2017-08-30 21:57:10', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(41, 41, 2, '2017-08-30 20:57:38', '', '2017-08-30 22:00:27', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(42, 42, 2, '2017-08-30 21:00:19', '', '2017-08-30 22:03:22', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(43, 43, 2, '2017-08-30 21:00:41', '', '2017-08-30 22:15:37', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(44, 44, 2, '2017-08-30 21:04:40', '', '2017-08-30 22:05:48', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(45, 45, 2, '2017-08-30 21:07:52', '', '2017-08-30 22:10:34', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(46, 46, 2, '2017-08-30 21:10:43', '', '2017-08-30 22:11:00', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(47, 47, 2, '2017-08-30 21:15:30', '', '2017-08-30 22:19:52', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(48, 48, 2, '2017-08-30 21:18:41', '', '2017-08-30 22:22:28', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(49, 49, 2, '2017-08-30 21:21:30', '', '2017-08-30 22:28:57', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(50, 50, 2, '2017-08-30 21:21:58', '', '2017-08-30 23:50:17', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(51, 51, 2, '2017-08-30 21:26:11', '', '2017-08-30 22:31:37', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(52, 52, 2, '2017-08-30 21:29:55', '', '2017-08-30 22:31:41', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(53, 53, 2, '2017-08-30 21:32:38', '', '2017-08-30 22:35:37', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(54, 54, 2, '2017-08-30 21:35:57', '', '2017-08-30 22:39:39', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(55, 55, 2, '2017-08-30 21:38:36', '', '2017-08-30 22:41:57', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(56, 56, 2, '2017-08-30 21:45:07', '', '2017-08-30 22:40:04', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'OD,OI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(57, 57, 2, '2017-08-30 21:50:27', '', '2017-08-30 22:43:57', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(58, 58, 2, '2017-08-30 21:54:13', '', '2017-08-30 22:46:04', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(59, 59, 2, '2017-08-30 21:57:56', '', '2017-08-30 22:52:07', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(60, 60, 2, '2017-08-30 22:00:47', '', '2017-08-30 22:54:07', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(61, 61, 2, '2017-08-30 22:04:05', '', '2017-08-30 22:55:56', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(62, 62, 2, '2017-08-30 22:06:23', '', '2017-08-30 22:58:10', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(63, 63, 2, '2017-08-30 22:09:51', '', '2017-08-30 23:00:28', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(64, 64, 2, '2017-08-30 22:16:34', '', '2017-08-30 23:04:35', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(65, 65, 2, '2017-08-30 22:18:45', '', '2017-08-30 23:08:02', 3, NULL, '', '', '', '', '', '', '', '', '', 'OD,OI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(66, 66, 2, '2017-08-30 22:22:42', '', '2017-08-30 23:08:55', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(67, 67, 2, '2017-08-30 22:24:43', '', '2017-08-30 23:08:59', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(68, 68, 2, '2017-08-30 22:27:15', '', '2017-08-30 23:07:22', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(69, 69, 2, '2017-08-30 22:29:59', '', '2017-08-30 23:12:52', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(70, 70, 2, '2017-08-30 22:32:00', '', '2017-08-30 23:13:18', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(71, 71, 2, '2017-08-30 22:36:05', '', '2017-08-30 23:16:07', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(72, 72, 2, '2017-08-30 22:43:28', '', '2017-08-30 23:19:08', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(73, 73, 2, '2017-08-30 22:48:43', '', '2017-08-30 23:21:39', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(74, 74, 2, '2017-08-30 22:53:41', '', '2017-08-30 23:23:59', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(75, 75, 2, '2017-08-30 22:56:24', '', '2017-08-30 23:26:08', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(76, 76, 2, '2017-08-30 22:58:23', '', '2017-08-30 23:31:57', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(77, 77, 2, '2017-08-30 23:03:01', '', '2017-08-30 23:30:19', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(78, 78, 2, '2017-08-30 23:06:48', '', '2017-08-30 23:32:57', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(79, 79, 2, '2017-08-30 23:09:12', '', '2017-08-30 23:36:01', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(80, 80, 2, '2017-08-30 23:13:37', '', '2017-08-30 23:37:15', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(81, 81, 2, '2017-08-30 23:16:04', '', '2017-08-30 23:40:17', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(82, 82, 2, '2017-08-30 23:21:19', '', '2017-08-30 23:42:19', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', ''),
(83, 83, 2, '2017-08-30 23:48:19', '', '2017-08-30 23:49:06', 3, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Si', '0/0', '0/0', '0/0', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_05_05_211440_create_reviews_table', 1),
('2016_05_05_211502_create_explorations_table', 1),
('2016_05_05_211535_create_candidates_table', 1),
('2016_05_05_212327_create_campaigns_table', 1),
('2016_05_05_212409_create_results_table', 1),
('2016_05_13_181133_create_displays_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('erika.villanueva@salauno.com.mx', '1cd0f27dd79aec1eed2fce9de3791ef779b892ab40420fe571b2f2367af50b24', '2016-05-23 20:00:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refractions`
--

CREATE TABLE `refractions` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `od_av_lejana` varchar(50) DEFAULT NULL,
  `oi_av_lejana` varchar(50) DEFAULT NULL,
  `od_cv_estenopeic` varchar(50) DEFAULT NULL,
  `oi_cv_estenopeic` varchar(50) DEFAULT NULL,
  `od_av_cercana` varchar(50) DEFAULT NULL,
  `oi_av_cercana` varchar(50) DEFAULT NULL,
  `od_av_rx` varchar(50) DEFAULT NULL,
  `oi_av_rx` varchar(50) DEFAULT NULL,
  `od_presion_intraocular` varchar(50) DEFAULT NULL,
  `oi_presion_intraocular` varchar(50) DEFAULT NULL,
  `od_r_esferico` varchar(50) DEFAULT NULL,
  `oi_r_esferico` varchar(50) DEFAULT NULL,
  `od_r_cilíndrico` varchar(50) DEFAULT NULL,
  `oi_r_cilíndrico` varchar(50) DEFAULT NULL,
  `od_r_eje` varchar(50) DEFAULT NULL,
  `oi_r_eje` varchar(50) DEFAULT NULL,
  `od_r_av` varchar(50) DEFAULT NULL,
  `oi_r_av` varchar(50) DEFAULT NULL,
  `r_adicion` varchar(50) DEFAULT NULL,
  `od_rf_esferico` varchar(50) DEFAULT NULL,
  `oi_rf_esferico` varchar(50) DEFAULT NULL,
  `od_rf_cilíndrico` varchar(50) DEFAULT NULL,
  `oi_rf_cilíndrico` varchar(50) DEFAULT NULL,
  `od_rf_eje` varchar(50) DEFAULT NULL,
  `oi_rf_eje` varchar(50) DEFAULT NULL,
  `od_rf_av` varchar(50) DEFAULT NULL,
  `oi_rf_av` varchar(50) DEFAULT NULL,
  `rf_adicion` varchar(50) DEFAULT NULL,
  `od_rf_distancia_nasopupilar` varchar(50) DEFAULT NULL,
  `oi_rf_distancia_nasopupilar` varchar(50) DEFAULT NULL,
  `etapa` varchar(50) DEFAULT NULL,
  `optometrista_responsable` varchar(100) DEFAULT NULL,
  `optometrista_comentarios` varchar(150) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `refractions`
--

INSERT INTO `refractions` (`id`, `candidate_id`, `campaign_id`, `user_id`, `od_av_lejana`, `oi_av_lejana`, `od_cv_estenopeic`, `oi_cv_estenopeic`, `od_av_cercana`, `oi_av_cercana`, `od_av_rx`, `oi_av_rx`, `od_presion_intraocular`, `oi_presion_intraocular`, `od_r_esferico`, `oi_r_esferico`, `od_r_cilíndrico`, `oi_r_cilíndrico`, `od_r_eje`, `oi_r_eje`, `od_r_av`, `oi_r_av`, `r_adicion`, `od_rf_esferico`, `oi_rf_esferico`, `od_rf_cilíndrico`, `oi_rf_cilíndrico`, `od_rf_eje`, `oi_rf_eje`, `od_rf_av`, `oi_rf_av`, `rf_adicion`, `od_rf_distancia_nasopupilar`, `oi_rf_distancia_nasopupilar`, `etapa`, `optometrista_responsable`, `optometrista_comentarios`, `updated_at`, `created_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-26 00:00:55', '2017-08-26 00:00:55'),
(2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-29 18:24:38', '2017-08-29 18:24:38'),
(3, 3, 1, 3, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '2017-08-29 18:59:34', '2017-08-29 18:56:48'),
(4, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 19:56:36', '2017-08-30 19:56:36'),
(5, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 19:56:46', '2017-08-30 19:56:46'),
(6, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 19:58:03', '2017-08-30 19:58:03'),
(7, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 19:59:21', '2017-08-30 19:59:21'),
(8, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:01:31', '2017-08-30 20:01:31'),
(9, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:01:34', '2017-08-30 20:01:34'),
(10, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:04:30', '2017-08-30 20:04:30'),
(11, 11, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:04:41', '2017-08-30 20:04:41'),
(12, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:06:42', '2017-08-30 20:06:42'),
(13, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:06:45', '2017-08-30 20:06:45'),
(14, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:08:51', '2017-08-30 20:08:51'),
(15, 15, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:10:04', '2017-08-30 20:10:04'),
(16, 16, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:10:48', '2017-08-30 20:10:48'),
(17, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:12:55', '2017-08-30 20:12:55'),
(18, 18, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:13:02', '2017-08-30 20:13:02'),
(19, 19, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:15:29', '2017-08-30 20:15:29'),
(20, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:15:44', '2017-08-30 20:15:44'),
(21, 21, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:17:47', '2017-08-30 20:17:47'),
(22, 22, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:19:37', '2017-08-30 20:19:37'),
(23, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:20:10', '2017-08-30 20:20:10'),
(24, 24, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:26:28', '2017-08-30 20:26:28'),
(25, 25, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:29:14', '2017-08-30 20:29:14'),
(26, 26, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:30:14', '2017-08-30 20:30:14'),
(27, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:33:18', '2017-08-30 20:33:18'),
(28, 28, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:35:05', '2017-08-30 20:35:05'),
(29, 29, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:36:34', '2017-08-30 20:36:34'),
(30, 30, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:36:44', '2017-08-30 20:36:44'),
(31, 31, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:38:53', '2017-08-30 20:38:53'),
(32, 32, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:40:55', '2017-08-30 20:40:55'),
(33, 33, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:43:09', '2017-08-30 20:43:09'),
(34, 34, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:43:32', '2017-08-30 20:43:32'),
(35, 35, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:47:01', '2017-08-30 20:47:01'),
(36, 36, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:47:11', '2017-08-30 20:47:11'),
(37, 37, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:49:15', '2017-08-30 20:49:15'),
(38, 38, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:50:58', '2017-08-30 20:50:58'),
(39, 39, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:54:11', '2017-08-30 20:54:11'),
(40, 40, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:55:04', '2017-08-30 20:55:04'),
(41, 41, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 20:57:38', '2017-08-30 20:57:38'),
(42, 42, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:00:19', '2017-08-30 21:00:19'),
(43, 43, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:00:41', '2017-08-30 21:00:41'),
(44, 44, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:04:40', '2017-08-30 21:04:40'),
(45, 45, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:07:52', '2017-08-30 21:07:52'),
(46, 46, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:10:43', '2017-08-30 21:10:43'),
(47, 47, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:15:30', '2017-08-30 21:15:30'),
(48, 48, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:18:41', '2017-08-30 21:18:41'),
(49, 49, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:21:30', '2017-08-30 21:21:30'),
(50, 50, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:21:58', '2017-08-30 21:21:58'),
(51, 51, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:26:11', '2017-08-30 21:26:11'),
(52, 52, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:29:55', '2017-08-30 21:29:55'),
(53, 53, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:32:38', '2017-08-30 21:32:38'),
(54, 54, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:35:57', '2017-08-30 21:35:57'),
(55, 55, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:38:36', '2017-08-30 21:38:36'),
(56, 56, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:45:07', '2017-08-30 21:45:07'),
(57, 57, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:50:27', '2017-08-30 21:50:27'),
(58, 58, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:54:13', '2017-08-30 21:54:13'),
(59, 59, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 21:57:56', '2017-08-30 21:57:56'),
(60, 60, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:00:47', '2017-08-30 22:00:47'),
(61, 61, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:04:05', '2017-08-30 22:04:05'),
(62, 62, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:06:23', '2017-08-30 22:06:23'),
(63, 63, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:09:51', '2017-08-30 22:09:51'),
(64, 64, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:16:34', '2017-08-30 22:16:34'),
(65, 65, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:18:45', '2017-08-30 22:18:45'),
(66, 66, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:22:42', '2017-08-30 22:22:42'),
(67, 67, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:24:43', '2017-08-30 22:24:43'),
(68, 68, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:27:15', '2017-08-30 22:27:15'),
(69, 69, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:29:59', '2017-08-30 22:29:59'),
(70, 70, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:32:00', '2017-08-30 22:32:00'),
(71, 71, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:36:05', '2017-08-30 22:36:05'),
(72, 72, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:43:28', '2017-08-30 22:43:28'),
(73, 73, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:48:43', '2017-08-30 22:48:43'),
(74, 74, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:53:41', '2017-08-30 22:53:41'),
(75, 75, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:56:24', '2017-08-30 22:56:24'),
(76, 76, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 22:58:23', '2017-08-30 22:58:23'),
(77, 77, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:03:01', '2017-08-30 23:03:01'),
(78, 78, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:06:49', '2017-08-30 23:06:49'),
(79, 79, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:09:12', '2017-08-30 23:09:12'),
(80, 80, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:13:38', '2017-08-30 23:13:38'),
(81, 81, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:16:04', '2017-08-30 23:16:04'),
(82, 82, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:21:19', '2017-08-30 23:21:19'),
(83, 83, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-08-30 23:48:20', '2017-08-30 23:48:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `retinopatia_diabetica` enum('OD','OI','AO') DEFAULT NULL,
  `retinopatia_hipertensiva` enum('OD','OI','AO') DEFAULT NULL,
  `maculopatia` enum('OD','OI','AO') DEFAULT NULL,
  `glaucoma` enum('OD','OI','AO') DEFAULT NULL,
  `pterigion` enum('OD','OI','AO') DEFAULT NULL,
  `catarata_incipiente` enum('OD','OI','AO') DEFAULT NULL,
  `catarata_avanzada` enum('OD','OI','AO') DEFAULT NULL,
  `oculoplastica` enum('OD','OI','AO') DEFAULT NULL,
  `conjuntivitis` enum('OD','OI','AO') DEFAULT NULL,
  `revision_integral` enum('OD','OI','AO') DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `results`
--

INSERT INTO `results` (`id`, `candidate_id`, `user_id`, `retinopatia_diabetica`, `retinopatia_hipertensiva`, `maculopatia`, `glaucoma`, `pterigion`, `catarata_incipiente`, `catarata_avanzada`, `oculoplastica`, `conjuntivitis`, `revision_integral`, `updated_at`, `created_at`) VALUES
(1, 2, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-29 18:25:14', '2017-08-29 18:25:14'),
(2, 3, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-29 18:59:09', '2017-08-29 18:58:00'),
(3, 5, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 19:56:56', '2017-08-30 19:56:56'),
(4, 6, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:00:31', '2017-08-30 20:00:31'),
(5, 4, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:03:49', '2017-08-30 20:03:49'),
(6, 7, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:07:05', '2017-08-30 20:07:05'),
(7, 8, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:10:16', '2017-08-30 20:10:16'),
(8, 9, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:13:33', '2017-08-30 20:13:33'),
(9, 10, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:17:11', '2017-08-30 20:17:11'),
(10, 11, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:28:23', '2017-08-30 20:28:23'),
(11, 12, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:29:32', '2017-08-30 20:29:32'),
(12, 13, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:33:18', '2017-08-30 20:33:18'),
(13, 14, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:36:31', '2017-08-30 20:36:31'),
(14, 15, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:40:45', '2017-08-30 20:40:45'),
(15, 16, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:43:36', '2017-08-30 20:43:36'),
(16, 17, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:46:35', '2017-08-30 20:46:35'),
(17, 18, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:50:12', '2017-08-30 20:50:12'),
(18, 19, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:53:41', '2017-08-30 20:53:41'),
(19, 20, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 20:57:07', '2017-08-30 20:57:07'),
(20, 21, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:03:45', '2017-08-30 21:03:45'),
(21, 22, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:10:09', '2017-08-30 21:10:09'),
(22, 23, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:15:32', '2017-08-30 21:15:32'),
(23, 25, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:20:11', '2017-08-30 21:20:11'),
(24, 28, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:23:59', '2017-08-30 21:23:59'),
(25, 26, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:24:49', '2017-08-30 21:24:49'),
(26, 30, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:31:50', '2017-08-30 21:31:50'),
(27, 31, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:34:57', '2017-08-30 21:34:57'),
(28, 34, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:37:47', '2017-08-30 21:37:47'),
(29, 32, 3, '', '', '', '', '', 'OD', 'OI', '', '', '', '2017-08-30 21:41:35', '2017-08-30 21:41:35'),
(30, 36, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:41:58', '2017-08-30 21:41:58'),
(31, 33, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:42:48', '2017-08-30 21:42:48'),
(32, 38, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:45:21', '2017-08-30 21:45:21'),
(33, 35, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:47:46', '2017-08-30 21:47:46'),
(34, 37, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:50:16', '2017-08-30 21:50:16'),
(35, 39, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:54:01', '2017-08-30 21:54:01'),
(36, 40, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 21:57:10', '2017-08-30 21:57:10'),
(37, 41, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:00:27', '2017-08-30 22:00:27'),
(38, 42, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:03:22', '2017-08-30 22:03:22'),
(39, 44, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:05:49', '2017-08-30 22:05:49'),
(40, 45, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:10:34', '2017-08-30 22:10:34'),
(41, 46, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:11:01', '2017-08-30 22:11:01'),
(42, 43, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:15:37', '2017-08-30 22:15:37'),
(43, 47, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:19:52', '2017-08-30 22:19:52'),
(44, 48, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:22:28', '2017-08-30 22:22:28'),
(45, 49, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:28:57', '2017-08-30 22:28:57'),
(46, 51, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:31:37', '2017-08-30 22:31:37'),
(47, 52, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:31:41', '2017-08-30 22:31:41'),
(48, 53, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:35:37', '2017-08-30 22:35:37'),
(49, 54, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:39:39', '2017-08-30 22:39:39'),
(50, 56, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:40:04', '2017-08-30 22:40:04'),
(51, 55, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:41:58', '2017-08-30 22:41:58'),
(52, 57, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:43:57', '2017-08-30 22:43:57'),
(53, 58, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:46:04', '2017-08-30 22:46:04'),
(54, 59, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:52:07', '2017-08-30 22:52:07'),
(55, 60, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:54:07', '2017-08-30 22:54:07'),
(56, 61, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:55:56', '2017-08-30 22:55:56'),
(57, 62, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 22:58:10', '2017-08-30 22:58:10'),
(58, 63, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:00:28', '2017-08-30 23:00:28'),
(59, 64, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:04:35', '2017-08-30 23:04:35'),
(60, 68, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:07:22', '2017-08-30 23:07:22'),
(61, 65, 3, '', '', '', '', '', 'AO', '', '', '', '', '2017-08-30 23:08:03', '2017-08-30 23:08:03'),
(62, 66, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:08:55', '2017-08-30 23:08:55'),
(63, 67, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:08:59', '2017-08-30 23:08:59'),
(64, 69, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:12:52', '2017-08-30 23:12:52'),
(65, 70, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:13:18', '2017-08-30 23:13:18'),
(66, 71, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:16:07', '2017-08-30 23:16:07'),
(67, 72, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:19:08', '2017-08-30 23:19:08'),
(68, 73, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:21:39', '2017-08-30 23:21:39'),
(69, 74, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:23:59', '2017-08-30 23:23:59'),
(70, 75, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:26:08', '2017-08-30 23:26:08'),
(71, 77, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:30:19', '2017-08-30 23:30:19'),
(72, 76, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:31:57', '2017-08-30 23:31:57'),
(73, 78, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:32:57', '2017-08-30 23:32:57'),
(74, 79, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:36:01', '2017-08-30 23:36:01'),
(75, 80, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:37:15', '2017-08-30 23:37:15'),
(76, 81, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:40:17', '2017-08-30 23:40:17'),
(77, 82, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:42:20', '2017-08-30 23:42:20'),
(78, 83, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:49:06', '2017-08-30 23:49:06'),
(79, 24, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:49:26', '2017-08-30 23:49:26'),
(80, 27, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:49:49', '2017-08-30 23:49:49'),
(81, 29, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:50:03', '2017-08-30 23:50:03'),
(82, 50, 3, '', '', '', '', '', '', '', '', '', '', '2017-08-30 23:50:17', '2017-08-30 23:50:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stages`
--

CREATE TABLE `stages` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `activo` enum('Si','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stages`
--

INSERT INTO `stages` (`id`, `nombre`, `titulo`, `activo`) VALUES
(1, 'candidates', 'Revision', 'Si'),
(2, 'reviews', 'Tamizaje', 'No'),
(3, 'explorations', 'Exploración', 'Si'),
(4, 'resultados', 'Resultado Exploración', 'Si'),
(5, 'refractions', 'Optica', 'Si'),
(6, 'counselings', 'Consejeria', 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_consultas`
--

CREATE TABLE `tipo_consultas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 NOT NULL,
  `Activo` enum('Si','No') CHARACTER SET utf8 NOT NULL DEFAULT 'Si'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_consultas`
--

INSERT INTO `tipo_consultas` (`id`, `nombre`, `Activo`) VALUES
(1, 'Visión Integral', 'Si'),
(3, 'Oftalmólogo', 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Erika Villanueva', 'erika.villanueva@salauno.com.mx', '$2y$10$cs5eUAldYxgODcA0mXMAF.BYfR7LEtrml4EwO/gZ0/V7A7jSA72wm', NULL, '2016-05-26 21:11:57', '2016-05-26 21:11:57'),
(2, 'Edgar Guerra', 'edgar.guerra@salauno.com.mx', '$2y$10$eppdM5FAD7RESTzxhPdh3O46hZVhFBImDXb3h1DiiS2xOzPSeF9Le', 'rswxqFrRPAOWq7ECrip6g3knsrh8NX1wVdkcW8bJAqIb90f2N6cookqYjojW', '2016-05-14 13:05:49', '2016-08-25 01:31:50'),
(3, 'Campañas', 'campanas@salauno.com.mx', '$2y$10$S0.ZobKbxMBwHxKq8DijqePRnftKsBnItHcbxpV6BMQlkvPDlHCNC', 'fIlhAUJJbshUUlZniC5NsK6D6xsWNM43lCPZurdNNESeJWNJaegoFq1GdtlU', '2016-05-26 21:07:39', '2017-02-04 00:58:24'),
(4, 'Sandra Transito', 'sandra.transito@salauno.com.mx', '$2y$10$GAloBcMb.WWyeKc1sfHQD.1mdAYJ9Om4u.UzBWkTlSZsutBese20S', 'EzUI16hTdqB8FqVIy9r9NPylqGk1AsCugRVBHiv5mLKw2RVO1KEbiNamiGIB', '2016-05-26 21:07:57', '2016-08-15 21:41:04'),
(5, 'Edmundo Flores', 'edmundo.flores@salauno.com.mx', '$2y$10$1KSZMJVbkDhHDlLz4e8DrOtprdYi6emfTWZZgWUV50KwyU1LlkkvO', 'tUYYGLC026pz8CJv6C2kn7tpVeNhi9RdYHQaXb0khzcCtT3Qc15GONcHKHfE', '2016-05-26 21:08:27', '2017-01-28 22:04:39'),
(7, 'Ysamar Romano', 'ysamar.romano@salauno.com.mx', '$2y$10$IcBjDfssRFejXj0wdCxeRuEkF5x51d8q6.yFxcZunx2N7JwW4qIva', 'fOyq0UKTQdGQjpHqZ5gJ9gPYgMltkIPbaDqvF7LLCaDisZcisIF8uvwkaXwF', '2016-05-26 21:31:24', '2016-10-10 19:59:35'),
(8, 'Cristian Alvarez', 'cristian.alvarez@salauno.com.mx', '$2y$10$nZ5Jk5CBNqCDlFo.4hU6w.8UbBJ4eaOqsQDI./.7tUn/wS9ilapoe', NULL, '2016-06-21 20:00:42', '2016-06-21 20:00:42'),
(9, 'Andrea Portilla', 'andrea.portilla@salauno.com.mx', '$2y$10$SCxGoC9J6/yC5iMEtBBPleEpYVF1hfvBfg.449xHEV2LKL1hVll32', 'zOemaWcJI8td2OhGhVYUTx6sJqgxvQisvQPAY2BX5ZiBIJRkfWsY6suOzj0y', '2016-08-15 22:00:10', '2016-08-15 22:00:25'),
(10, 'Jabier Barajas', 'jabier.barajas@salauno.com.mx', '$2y$10$epfbA/BerDtWoGISvWzmM.qNTXaOk509OkUWN.68pSliBORYmqvx.', '49jE5jUgGSbbldhQzEMs3OcuIBfMnut5V7lArAExTQrAdeOvBaRipOGdZ5ia', '2016-08-15 22:00:48', '2016-08-15 22:00:51'),
(11, 'Ana Mayen', 'analilia.mayen@salauno.com.mx', '$2y$10$F28PIpwxmsjYHu8PJQJgtun/GoPUPJ8eh6.0S/rXistXMBempumhy', 'I7ephukJuEosVwUMCj4rK0atAljv63DNBDWU1ctD3ndUBYFwqEdac5n655df', '2016-08-15 22:01:14', '2016-08-15 22:01:16'),
(12, 'Enrique Cuevas', 'enrique.cuevas@salauno.com.mx', '$2y$10$J/AUG8c6r1Y1b.oldhcQVOTWyWmeLdCdx8kDUO8677pYwzVVfrMHu', 'Tdlbyxv2Fgau0F9FSyW5XyQVZcKWeas8epMUP3UgCJE4MS3SjWsPKccwly17', '2016-08-15 22:01:45', '2016-08-15 22:01:48'),
(13, 'Enedina García', 'enedina.garcia@salauno.com.mx', '$2y$10$OHLK.9hKQ8E95e9QnNeScO8qn.gOI6lYcf5HeJ5a5ZDRvNyvfuR1a', '1e4TlI1CRyomIf0qF7XOo8W2QtsW7Bkhlv9gX8ESKIvw74m1DCDKEaWZ2Lyf', '2016-08-15 22:02:10', '2016-08-15 22:02:17'),
(14, 'María Hernández', 'maru.hernandez@salauno.com.mx', '$2y$10$fGovDE.1eqcLSiasGXxgKu45IJ/5XCQQAGSvgkAKzspz3EoRBROFO', 'QA1XWuWYzoLzICcwL1mhu0JqGq7DOMvp2oYmKJJP3yVcUgt4x81m5zrvwUyf', '2016-08-15 22:02:56', '2016-08-15 22:02:59'),
(15, 'Cristobal Mejía', 'cristobal.mejia@salauno.com.mx', '$2y$10$huvxKsrOY/4DswzkxwHUueFfxZl1Netw8ZiEAdv4HbIFzh/xKh0tG', 'PyINCSt6rq5ZZbwBONLckvFxlUC4GPdduNu8NXUy7pkO10mFSf84giNl7GlQ', '2016-08-15 22:04:46', '2016-08-15 22:04:50'),
(16, 'Jazmín Sánchez', 'jazmin.sanchez@salauno.com.mx', '$2y$10$lFjT.sLKMqbZK.Iirij6h.eN1okK6IQH9uQfUC9Ju9k720IE/VM2y', 'NVoyrDPSwzWOf4PJmFGlzFMhzR8uDXuyLIJwR9a0UyER3kaB01uYhFUFbxvE', '2016-08-15 22:05:21', '2016-08-15 22:05:24'),
(17, 'Flor Reyes', 'flor.reyes@salauno.com.mx', '$2y$10$LFmcqY5qksC0/lia8ufbPeQbxuhf2b/wpheCtCsDLm7W60Nx4zVae', '8m3Cp9a8xArancEJvJJFuKSwjQ3g8tQsHLDQ5o7KWCfbcQLEOtbDQ1M32BpS', '2016-08-15 22:05:58', '2016-08-15 22:06:08'),
(18, 'Dolores Ramírez', 'dolores.ramirez@salauno.com.mx', '$2y$10$joTh2mNLm1zCWTftgfuGb.tWk3axX3F8P6HStR8FlN45OcGSgC68u', 'YgM9bevG3nzJOdZCN4WuNzL2Y3bqQRx04nfILMY8gGZq9RbOvapwsffeArmp', '2016-08-15 22:06:35', '2016-08-15 22:06:37'),
(19, 'Evelyn Vásquez', 'evelyn.vasquez@salauno.com.mx', '$2y$10$/WQenImLrxqxfhG2p6bJbeBudxocPeBKfKi9G8YQtgP5WnMdBPcy.', 'UBvu7h0Y6vyswx1Cw4gDGajHrEGoLLJ9dIOU4dYzDFg5cn3auS3hx13VuWS8', '2016-08-15 22:07:42', '2016-08-15 22:07:49'),
(20, 'Jonathan Arrioja', 'jonathan.arrioja@salauno.com.mx', '$2y$10$7wwQ3nhKA7Tigj3Fz9J3eO9feaXCUs6rYiqDCPvV5/TQ7KO0jwy7S', '3ACpmSpK9qz9M8k3tZfy4gWX0EXkc7N81SS0KDjYm9yf0x7ZcAp0nXHQ6lwm', '2016-08-15 22:08:16', '2016-08-15 22:08:19'),
(21, 'Yair Martínez', 'yair.martinez@salauno.com.mx', '$2y$10$uA/AXFqwfrmVWqv9K9dqoOrQeeeD031AhZlx.7ww6WA8ibau2Ln8e', 'NBLMwiaIS6EMYvAmdOufs5VhNBTEJrPb17cj46R0g82HeHEhAUqfGpiQUodS', '2016-08-15 22:08:48', '2016-08-15 22:08:51'),
(22, 'Narda Roldan', 'narda.roldan@salauno.com.mx', '$2y$10$Tbw.90/1tpOVn572RvpQ7uahLvBwdJLxL1ReTnnq.owWBUK.7YAMy', 'YmVf8uMhM8WEf5RxpOzLopiksywjyPOxOGCehxABWFz4VKHWTgAhQPOfnzQE', '2016-08-15 22:09:22', '2016-08-15 22:09:25'),
(23, 'Raul Pineda', 'raul.pineda@salauno.com.mx', '$2y$10$QT6zIjHE5Zy8n2nhQIq41.sLoIoYijdmKIteYO2otAj9hU.S7ToWO', 'JehQqeJ7OqeDL8sCKsgHEoB2zsF7IcHlyLYbPECQ6WYl7wgiJ8bdENdUd4QG', '2016-08-15 22:10:03', '2016-08-15 22:10:06'),
(24, 'Diana González', 'diana.gonzalez@salauno.com.mx', '$2y$10$/cblUzwUphvta7C1xvURSOe8ku7F6pP1NaV/SuGkqX7RpUgIeTBZy', 'DuKEu9PLzuDa2H0UMd1LP6lcGHkKv9WQlZfAwhAP8KY2PVeQRMfYJflykaOq', '2016-08-15 22:10:38', '2016-08-15 22:13:24'),
(25, 'Alberto Chavez', 'alberto.chavez@salauno.com.mx', '$2y$10$aUR5lg6bfyU3T8O19dcwmehiikyen2dQ7M6CQNm.Z6E9k/gMrKs1W', 'ykhPrdhH9t9clxOJtVin4jJU79xis37tUzG7WjeRo8vStG3Aq2AFXPhKZ846', '2016-08-15 22:22:59', '2016-08-15 22:23:02'),
(26, 'Marcelo Samano', 'marcelo.samano@salauno.com.mx', '$2y$10$TIpvB.u.9r4MwQjg8tfgP.MFB2GWIkoYQ5lN0ryG3gi3ZRl49XYpO', 'vZD9ZL9vXfLKGKF3xsCPLdhiujZJ5z7XulsJ4nfNNZLEdNRAJKDdrpo85lM7', '2016-08-15 22:23:23', '2016-08-15 22:23:28'),
(27, 'Mariana Chacon', 'mariana.chacon@salauno.com.mx', '$2y$10$Ablq/2ILVupLCRsg1JR1DO46TW3nfm4TJ9yxkZHZRhiJdiQ069iZS', 'PNdxHghbvhvzVFgoWGcgDPkzIqYla6l2f81F3nw1ClxUhYSrc1TLGsqqyNji', '2016-08-15 22:23:46', '2016-08-15 22:23:49'),
(28, 'Yarina Arevalo', 'yarina.arevalo@salauno.com.mx', '$2y$10$pSWgerBiyAIYM5R1F0JgnOaEyVPlpbjw5pZENiP8xg7dAwTGrikgS', 'GQcUiuymgWdmNXK1BjdAFJW4VWlhdGk9V1gsA1UXmwEQIv85CppFhAT3P0kQ', '2016-08-15 22:24:19', '2016-08-15 22:24:24'),
(29, 'Jorge Aparicio', 'jorge.aparicio@salauno.com.mx', '$2y$10$Pa4jr.b079ivAGj9JbYIGe5opBYFuzImPz0HKISwDgLqkB6lUJVo.', 'I7nw4YRmui0G0HRxIS4avchxXa2Vx9B2hNUo0wasllhmlxjEFiUWyr5NA3A9', '2016-08-15 22:24:51', '2016-08-15 22:24:53'),
(30, 'Juan Hernández', 'juan.antonio@salauno.com.mx', '$2y$10$2oSc7XotM4fosXjoxRTfMuB6D0f7gHMGm/RG1YHtqykOyEk1q9OJa', 'AjmU7ExkULgqDFLpo867LmKk9o6uhlzish9j58eH6U0IUi3N8BNsqF6Kn52F', '2016-08-15 22:25:38', '2016-08-15 22:25:41'),
(31, 'Janet Ruiz', 'janet.ruiz@salauno.com.mx', '$2y$10$f9vtzdnkQgS4ZoiBBTrNXuRQ9Yub9JHzB7okyiUVE6mBZ.Z1rQdMe', 'ptjmECabudKaNox8M8kOyYFG8eU1cWWEFWc1Kf8gDHSWGChHKIoZ6xrC7Ugf', '2016-08-15 22:26:12', '2016-08-15 22:26:15'),
(32, 'Alberto Avila', 'alberto.avila@salauno.com.mx', '$2y$10$V8pd8Vg1AkRJ2V3jTmZc9uEc3MVhAZyFeY6IH.eouhO3zfKp2vJsC', 'O9jjyxJSFhgjNTINvDRF013aB3MoxwWCvbTLiJda0RHeUobxhJnuQeUdeHjM', '2016-08-15 22:26:46', '2016-08-15 22:26:49'),
(33, 'Enrique González', 'enrique.gonzalez@salauno.com.mx', '$2y$10$W1U0MidTBungMJjWtWJMJedYAA0sd2eeW5135vvg2KhbaMEMO5q8e', 'rZkBLUtAETIx6oXAVpVJGwPgE0bv6oic3G0a4BUNMlReAyI8gewcKCI6lTXL', '2016-08-16 04:49:12', '2016-08-16 04:49:17'),
(34, 'Oscar Fernández', 'oscar.fernandez@salauno.com.mx', '$2y$10$2HgeLT0sSrBXLLs17FIIMORFqISXvqypwGfrNlt9jDZQ/uCkM5Fxm', 'JxF4DuICgnQLvmXf87tSTpHwCnujVwJZYSPutbtp9rkirm9CcMGs7NTDsfCv', '2016-08-16 04:50:02', '2016-08-16 04:50:05'),
(35, 'Claudia García', 'claudia.garcia@salauno.com.mx', '$2y$10$pYKfyQji1Vh4ce/iaxEaAu.C7TgwzqI8lmMZTVo4/RvDPY63ttAj.', 'MwEz8GxKSYvESBEifs6d7DlvizG6vSqlPiVzfXsOLomxUwhEms3BuuWf7oAQ', '2016-08-16 04:50:40', '2016-08-16 04:50:43'),
(36, 'Francisco Cortes', 'francisco.cortes@salauno.com.mx', '$2y$10$xV9EU5r5lc3Yj8tHTaYdjuvHh6SByPF.MbU4JrqfWMqYLZmrIwQUS', 'sppxwCKUO2ze3HwFyGdHzrFlrW1uBQaTU2o3jfPoDGEYbYzEzQixcwpR3mQl', '2016-08-16 04:51:15', '2016-08-16 04:51:18'),
(37, 'Carla Monge', 'carla.monge@salauno.com.mx', '$2y$10$ZTIrD6wdA2Djwnhls/bSe.5wo.5eql9BlgUpBGFfT/mNXacR2aG6y', 'jj56mGQjFpK6uvWFIWjnFDWYzHpNbRFQ4R6Mm6oT7SqAEQ09e6pzL8vEqdsz', '2016-08-16 04:51:45', '2016-08-16 04:51:48'),
(38, 'Pariz Palacios', 'pariz.palacios@salauno.com.mx', '$2y$10$Y59lDyj8NY0jv6HkTufeMOdpn5JTH0sUeLNytacq/5lXCJkq04j.2', 'bZCwOIAYgc9ctP4v7r0fBKH1fxvLwlWKCGY4tlxWbjigldCkaFE9ezMzcXZf', '2016-08-19 03:44:32', '2016-08-19 03:45:30'),
(39, 'Francisco Galvez', 'francisco.galvez@salauno.com.mx', '$2y$10$ZTSlt9jwB6J/qWhbJXXYFu4Owhf60Ib9o9G0w9emRFrvowvgZT/DC', 'N6mjFOVtauYoBpYB6r9v4hBalPcwYc7sIGzmWaC3lUEuIL3bbgUyDa6Klx2x', '2016-08-19 03:45:59', '2016-08-19 03:46:02'),
(40, 'Harumi Quezada', 'harumi.quezada@salauno.com.mx', '$2y$10$iG5exmZRVMmAXKFFsqfX0OM9xP7u1l4Y9jHFl3IUng7qhKYsPnso6', 'bVja0klHWPZZW7S7gxhFTnDzgtysVGcpLmlk9Jv5AuUz3Dzd4EV7H3m2h16e', '2016-08-19 03:46:32', '2016-08-19 03:46:36'),
(41, 'Alberto Castro', 'alberto.castro@salauno.com.mx', '$2y$10$8jDh63kxvG73ZS0VMiEoTeoV35fSHYo9s5kR24rDMsCQdYllrnDgy', 'O0ldyAY79dwcrUdBP45OwihFFVm5pZDNhXzK7IRqB1oWHnL2Pinrjk6PtD8Z', '2016-08-19 03:54:51', '2016-08-19 03:54:54'),
(42, 'Cessia Patricia', 'cessia.tafoya@salauno.com.mx', '$2y$10$.ubrRVKLIR9aePiRI0feiOKCrLOvjFptils/Y0jQEZ2SooEU0oyBe', 'olpB4zgJ6zzsG94pDjViyrGIcOPDV8xsCuWxa4OnGJfUiTbTI9I7OPFkZlQT', '2016-08-19 03:56:00', '2016-10-19 19:38:38'),
(43, 'Ramon Rios', 'ramon.rios@salauno.com.mx', '$2y$10$4z8fyYET3gPqQnsvvcikGOUUUPisw/MxDSkj4BV9JVNDL2YFwbMTe', 'ChzgaFYXaQSaR6Cqy0d9K08YPxKN3mNLYRp1uF9UTzWhJzub4z3zhUFF38wf', '2016-08-19 03:56:58', '2016-08-19 03:57:02'),
(44, 'Rodrigo Garnica', 'rodrigo.garnica@salauno.com.mx', '$2y$10$dvBMh8y.zDvz87aO.w3qmuHj1ydpjb8RCT3mwtVTge3JzZ9uDKsZe', 'eLbbqdPx3x684O7A3k5ZZuZ8Q92tDuqb0v8bF3DFBfRhjzxUbYJ2eW5ookKY', '2016-08-19 03:57:33', '2016-08-19 03:57:37'),
(45, 'Jose Olascuaga', 'jose.olascuaga@salauno.com.mx', '$2y$10$kHUsJgDEFfrkBMiPvlOwSOR.bBAf2Kb5wrMa7Td91/BnD2fkyXyn6', 'eu6Zd4hL4dYMpRlgehqCaHSEYNC77GGmqeX0BXvtPGZFPRelryUs7mvUlqDD', '2016-08-19 03:58:09', '2016-08-19 03:58:13'),
(46, 'Zeus Severo', 'zeus.severo@salauno.com.mx', '$2y$10$4N9qi1w58wss.CMGbv36DuZeUh6sgzcM0d00q.N/D8nrH3mTA4sWO', '6yJBhcDQtfMUG83T0IVO1MOOBIOiM5otafFAOOrgNZyv1ks7IuFeQ2ZSTM87', '2016-08-19 03:59:17', '2016-08-19 03:59:21'),
(47, 'Carlos Orellana', 'carlos.orellana@salauno.com.mx', '$2y$10$D3vl19i7Y6V61h0jVb0Fd.BzuxQrGFc4UeaM9qJWOcIQb1EwCU.iq', 'Q6ge2yFL0I5ieAjm1US8PM7SX2iMhqhciu4wTL5U55gRGov23Ftii7CDeeIg', '2016-08-19 04:00:31', '2016-08-19 04:00:36'),
(48, 'Javier Okhuysen', 'javier.okhuysen@salauno.com.mx', '$2y$10$JHb4AFhnGzOeIqy0jkQXve5bVbXBNN0YNG9s8840q356GpKKIOju6', 'joMIY1dbAlFMHnC1CpRPiarP0I6euFaNSPvXsTBLkN0mU55b3dYWvUfDzmvd', '2016-08-19 04:01:15', '2016-08-19 04:01:19'),
(49, 'Adriana Yañez', 'adriana.yanez@salauno.com.mx', '$2y$10$ikYNiiti4FbwK0VxCFCILO9ufd985PpEfPzvE.ck2eTSs4sVqq6Im', 'wYqK5mndp8KAspuvzL3z0OQRQgKAqmmYq2ENbTiJJkJTcw2cnYa76gyERBKv', '2016-08-19 04:07:39', '2016-08-19 04:08:06'),
(50, 'Monse Valverde', 'monse.valverde@salauno.com.mx', '$2y$10$EHt3cBpnM.KjMw.qLXCT2OLishAJ0ug6yFD8OQQzVKqP0EZEzkI3m', NULL, '2016-08-19 04:09:34', '2016-08-19 04:09:34');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidates_codigo_unique` (`codigo`),
  ADD KEY `candidates_user_id_index` (`user_id`),
  ADD KEY `candidates_campaign_id_index` (`campaign_id`);

--
-- Indices de la tabla `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_render_campos`
--
ALTER TABLE `core_render_campos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_render_campos_x`
--
ALTER TABLE `core_render_campos_x`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_render_formularios`
--
ALTER TABLE `core_render_formularios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_render_secciones`
--
ALTER TABLE `core_render_secciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_stage`
--
ALTER TABLE `core_stage`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `displays`
--
ALTER TABLE `displays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `displays_candidate_id_index` (`candidate_id`),
  ADD KEY `displays_user_id_index` (`user_id`);

--
-- Indices de la tabla `explorations`
--
ALTER TABLE `explorations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `refractions`
--
ALTER TABLE `refractions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_consultas`
--
ALTER TABLE `tipo_consultas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT de la tabla `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `core_render_campos`
--
ALTER TABLE `core_render_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
--
-- AUTO_INCREMENT de la tabla `core_render_campos_x`
--
ALTER TABLE `core_render_campos_x`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;
--
-- AUTO_INCREMENT de la tabla `core_render_formularios`
--
ALTER TABLE `core_render_formularios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `core_render_secciones`
--
ALTER TABLE `core_render_secciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `core_stage`
--
ALTER TABLE `core_stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `displays`
--
ALTER TABLE `displays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `explorations`
--
ALTER TABLE `explorations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT de la tabla `refractions`
--
ALTER TABLE `refractions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT de la tabla `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `stages`
--
ALTER TABLE `stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tipo_consultas`
--
ALTER TABLE `tipo_consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
