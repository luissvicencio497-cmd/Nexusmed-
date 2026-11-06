-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generaci√≥n: 06-11-2026 a las 19:10:01
-- Versi√≥n del servidor: 10.4.32-MariaDB
-- Versi√≥n de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nexusmed`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `correo`, `password_hash`, `nombre`, `creado_en`) VALUES
(1, 'luis.delacruz@nexusmed.com', 'admin123', 'Luis Eduardo de la Cruz', '2026-10-29 23:19:14'),
(2, 'juan.santiz@nexusmed.com', 'admin123', 'Juan Santiz P?rez', '2026-10-29 23:19:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_medicamentos`
--

CREATE TABLE `catalogo_medicamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `stock` int(11) DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_medicamentos`
--

INSERT INTO `catalogo_medicamentos` (`id`, `nombre`, `categoria`, `descripcion`, `stock`) VALUES
(1, 'Paracetamol 500mg', 'Analgesico', 'Tratamiento para el dolor leve a moderado y fiebre.', 250),
(2, 'Ibuprofeno 600mg', 'Antiinflamatorio', 'Alivio de dolores musculares e inflamacion.', 180),
(3, 'Amoxicilina 500mg', 'Antibiotico', 'Infecciones bacterianas del tracto respiratorio.', 120),
(4, 'Loratadina 10mg', 'Antihistaminico', 'Control de sintomas alergicos y rinitis.', 300),
(5, 'Omeprazol 20mg', 'Gastroprotector', 'Inhibidor de acidez estomacal y reflujo.', 210),
(6, 'Metformina 850mg', 'Diabetes', 'Control glucomico para diabetes tipo 2.', 150),
(7, 'Propranolol 40mg', 'Cardiologia', 'Tratamiento de la hipertension y arritmias.', 90),
(8, 'Alprazolam 0.25mg', 'Psiquiatria', 'Tratamiento para trastornos de ansiedad.', 60),
(9, 'Diclofenaco 50mg', 'Antiinflamatorio', 'Antiinflamatorio y relajante muscular.', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado` enum('pendiente','atendida','cancelada') DEFAULT 'pendiente',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `paciente_id`, `medico_id`, `fecha`, `hora`, `estado`, `creado_en`) VALUES
(1, 1, 1, '2026-11-01', '09:00:00', 'pendiente', '2026-10-29 23:21:40'),
(2, 2, 2, '2026-11-01', '10:30:00', 'pendiente', '2026-10-29 23:21:40'),
(3, 3, 3, '2026-11-02', '11:00:00', 'atendida', '2026-10-29 23:21:40'),
(4, 4, 4, '2026-11-02', '12:30:00', 'pendiente', '2026-10-29 23:21:40'),
(5, 5, 5, '2026-11-03', '14:00:00', 'pendiente', '2026-10-29 23:21:40'),
(6, 6, 6, '2026-11-03', '15:30:00', 'cancelada', '2026-10-29 23:21:40'),
(7, 7, 7, '2026-11-04', '16:00:00', 'pendiente', '2026-10-29 23:21:40'),
(8, 8, 8, '2026-11-04', '17:00:00', 'atendida', '2026-10-29 23:21:40'),
(9, 9, 9, '2026-11-05', '09:30:00', 'pendiente', '2026-10-29 23:21:40'),
(10, 10, 10, '2026-11-05', '11:30:00', 'pendiente', '2026-10-29 23:21:40'),
(11, 11, 2, '2026-07-03', '08:00:00', 'pendiente', '2026-11-04 23:33:17'),
(12, 11, 1, '2026-11-03', '09:00:00', 'pendiente', '2026-11-04 23:37:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Cardiolog?a', 'Diagn?stico y tratamiento de enfermedades del coraz?n y sistema circulatorio.'),
(2, 'Pediatr?a', 'Atenci?n m?dica integral desde el nacimiento hasta la adolescencia.'),
(3, 'Dermatolog?a', 'Cuidado y tratamiento de enfermedades de la piel, cabello y u?as.'),
(4, 'Ginecolog?a', 'Salud del sistema reproductor femenino y control prenatal.'),
(5, 'Neurolog?a', 'Tratamiento de trastornos del sistema nervioso central y perif?rico.'),
(6, 'Oftalmolog?a', 'Diagn?stico de enfermedades oculares y correcci?n de la visi?n.'),
(7, 'Traumatolog?a', 'Evaluaci?n de lesiones ?seas, articulares y musculares.'),
(8, 'Endocrinolog?a', 'Tratamiento de des?rdenes hormonales y metab?licos como la diabetes.'),
(9, 'Psiquiatr?a', 'Atenci?n a la salud mental y trastornos del comportamiento.'),
(10, 'Medicina General', 'Atenci?n m?dica primaria, prevenci?n y canalizaci?n de pacientes.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes_medicos`
--

CREATE TABLE `expedientes_medicos` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `cita_id` int(11) DEFAULT NULL,
  `fecha_consulta` datetime DEFAULT current_timestamp(),
  `sintomas` text NOT NULL,
  `diagnostico` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expedientes_medicos`
--

INSERT INTO `expedientes_medicos` (`id`, `paciente_id`, `medico_id`, `cita_id`, `fecha_consulta`, `sintomas`, `diagnostico`) VALUES
(1, 1, 1, 1, '2026-10-29 17:40:52', 'Fiebre alta, tos seca y dolor de garganta.', 'Infecci?n respiratoria aguda.'),
(2, 2, 2, 2, '2026-10-29 17:40:52', 'Erupci?n cut?nea con comez?n en ambos brazos.', 'Dermatitis por contacto.'),
(3, 3, 3, 3, '2026-10-29 17:40:52', 'Dolor en el pecho y palpitaciones repentinas.', 'Arritmia card?aca leve.'),
(4, 4, 4, 4, '2026-10-29 17:40:52', 'Cramps abdominales intensos y n?useas.', 'Gastritis aguda por estr?s.'),
(5, 5, 5, 5, '2026-10-29 17:40:52', 'Migra?a fuerte recurrente acompa?ada de fotofobia.', 'Cefalea migra?osa.'),
(6, 6, 6, 6, '2026-10-29 17:40:52', 'Visi?n borrosa y sequedad ocular constante.', 'Fatiga visual por pantallas.'),
(7, 7, 7, 7, '2026-10-29 17:40:52', 'Dolor e inflamaci?n severa en el tobillo derecho.', 'Esguince de tobillo grado 1.'),
(8, 8, 8, 8, '2026-10-29 17:40:52', 'Cansancio extremo, mucha sed y p?rdida de peso.', 'Sospecha de diabetes tipo 2.'),
(9, 9, 9, 9, '2026-10-29 17:40:52', 'Insomnio cr?nico y episodios de ansiedad elevada.', 'Trastorno de ansiedad generalizada.'),
(10, 10, 10, 10, '2026-10-29 17:40:52', 'Fatiga generalizada y congesti?n nasal.', 'Resfriado com?n.'),
(11, 1, 1, NULL, '2026-11-04 17:39:46', 'dolor de cabeza', 'es un peque√±o dolor ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_medicos`
--

CREATE TABLE `horarios_medicos` (
  `id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Mi?rcoles','Jueves','Viernes','S?bado') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios_medicos`
--

INSERT INTO `horarios_medicos` (`id`, `medico_id`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 1, 'Lunes', '08:00:00', '14:00:00'),
(2, 2, 'Martes', '09:00:00', '15:00:00'),
(3, 3, 'MiÇrcoles', '08:00:00', '16:00:00'),
(4, 4, 'Jueves', '10:00:00', '18:00:00'),
(5, 5, 'Viernes', '07:00:00', '13:00:00'),
(6, 6, 'Lunes', '14:00:00', '20:00:00'),
(7, 7, 'Martes', '12:00:00', '18:00:00'),
(8, 8, 'MiÇrcoles', '09:00:00', '17:00:00'),
(9, 9, 'Jueves', '08:00:00', '14:00:00'),
(10, 10, 'S†bado', '08:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `correo`, `password_hash`, `nombre`, `especialidad`, `telefono`, `creado_en`) VALUES
(1, 'dra.elena.ruiz@nexusmed.com', 'doc123', 'Dra. Elena Ruiz', 'Pediatr?a', '555-1001', '2026-10-29 23:20:27'),
(2, 'dr.marcos.vega@nexusmed.com', 'doc123', 'Dr. Marcos Vega', 'Dermatolog?a', '555-1002', '2026-10-29 23:20:27'),
(3, 'dr.roberto.salas@nexusmed.com', 'doc123', 'Dr. Roberto Salas', 'Cardiolog?a', '555-1003', '2026-10-29 23:20:27'),
(4, 'dra.lucia.mendez@nexusmed.com', 'doc123', 'Dra. Luc?a M?ndez', 'Ginecolog?a', '555-1004', '2026-10-29 23:20:27'),
(5, 'dr.emilio.hernandez@nexusmed.com', 'doc123', 'Dr. Emilio Hern?ndez', 'Neurolog?a', '555-1005', '2026-10-29 23:20:27'),
(6, 'dra.valeria.rios@nexusmed.com', 'doc123', 'Dra. Valeria R?os', 'Oftalmolog?a', '555-1006', '2026-10-29 23:20:27'),
(7, 'dr.fernando.soto@nexusmed.com', 'doc123', 'Dr. Fernando Soto', 'Traumatolog?a', '555-1007', '2026-10-29 23:20:27'),
(8, 'dra.camila.navarro@nexusmed.com', 'doc123', 'Dra. Camila Navarro', 'Endocrinolog?a', '555-1008', '2026-10-29 23:20:27'),
(9, 'dr.hugo.ortiz@nexusmed.com', 'doc123', 'Dr. Hugo Ortiz', 'Psiquiatr?a', '555-1009', '2026-10-29 23:20:27'),
(10, 'dra.lorena.silva@nexusmed.com', 'doc123', 'Dra. Lorena Silva', 'Medicina General', '555-1010', '2026-10-29 23:20:27'),
(11, 'oliver.atom@nexusmed.com', 'oli123', 'Doctor', 'Medicina General', '555-0000', '2026-11-04 23:23:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `correo`, `password_hash`, `nombre`, `telefono`, `creado_en`) VALUES
(1, 'carlos.martinez@gmail.com', 'paciente123', 'Carlos Mart?nez', '555-2001', '2026-10-29 23:21:23'),
(2, 'ana.gomez.88@hotmail.com', 'paciente123', 'Ana G?mez', '555-2002', '2026-10-29 23:21:23'),
(3, 'pedro.perez.99@gmail.com', 'paciente123', 'Pedro P?rez', '555-2003', '2026-10-29 23:21:23'),
(4, 'maria.fernandez@yahoo.com', 'paciente123', 'Mar?a Fern?ndez', '555-2004', '2026-10-29 23:21:23'),
(5, 'jorge.ramirez.mx@outlook.com', 'paciente123', 'Jorge Ram?rez', '555-2005', '2026-10-29 23:21:23'),
(6, 'laura.reyes@gmail.com', 'paciente123', 'Laura Reyes', '555-2006', '2026-10-29 23:21:23'),
(7, 'diego.alvarez@hotmail.com', 'paciente123', 'Diego ?lvarez', '555-2007', '2026-10-29 23:21:23'),
(8, 'andrea.dominguez@gmail.com', 'paciente123', 'Andrea Dom?nguez', '555-2008', '2026-10-29 23:21:23'),
(9, 'gabriel.cruz@yahoo.com', 'paciente123', 'Gabriel Cruz', '555-2009', '2026-10-29 23:21:23'),
(10, 'natalia.herrera@outlook.com', 'paciente123', 'Natalia Herrera', '555-2010', '2026-10-29 23:21:23'),
(11, 'erick.santillan@nexusmed.com', 'erick123', 'erick santillan', '222222222', '2026-11-04 23:32:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `expediente_id` int(11) NOT NULL,
  `medicamento` varchar(150) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `frecuencia` varchar(100) NOT NULL,
  `duracion_dias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `expediente_id`, `medicamento`, `dosis`, `frecuencia`, `duracion_dias`) VALUES
(1, 1, 'Paracetamol 500mg', '1 tableta', 'Cada 8 horas', 5),
(2, 2, 'Loratadina 10mg', '1 comprimido', 'Cada 24 horas', 7),
(3, 3, 'Propranolol 40mg', '1/2 tableta', 'Cada 12 horas', 30),
(4, 4, 'Omeprazol 20mg', '1 c?psula en ayunas', 'Cada 24 horas', 14),
(5, 5, 'Ibuprofeno 600mg', '1 tableta', 'Cada 8 horas', 3),
(6, 6, 'L?grimas artificiales', '2 gotas en cada ojo', 'Cada 6 horas', 15),
(7, 7, 'Ketorolaco 10mg', '1 sublingual', 'Cada 12 horas', 4),
(8, 8, 'Metformina 850mg', '1 tableta con la comida', 'Cada 12 horas', 60),
(9, 9, 'Alprazolam 0.25mg', '1 tableta antes de dormir', 'Cada 24 horas', 10),
(10, 10, 'Amoxicilina 500mg', '1 c?psula', 'Cada 8 horas', 7),
(11, 11, 'paracetamol 500g', '1 tableta', 'cada 8 hoas', 8);

--
-- √çndices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `catalogo_medicamentos`
--
ALTER TABLE `catalogo_medicamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `expedientes_medicos`
--
ALTER TABLE `expedientes_medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `medico_id` (`medico_id`),
  ADD KEY `cita_id` (`cita_id`);

--
-- Indices de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expediente_id` (`expediente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `catalogo_medicamentos`
--
ALTER TABLE `catalogo_medicamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `expedientes_medicos`
--
ALTER TABLE `expedientes_medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `expedientes_medicos`
--
ALTER TABLE `expedientes_medicos`
  ADD CONSTRAINT `expedientes_medicos_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expedientes_medicos_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expedientes_medicos_ibfk_3` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD CONSTRAINT `horarios_medicos_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`expediente_id`) REFERENCES `expedientes_medicos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
