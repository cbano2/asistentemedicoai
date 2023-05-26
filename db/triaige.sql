-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 04:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `triaige`
--

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `uuid` char(36) NOT NULL,
  `diagnostico_isbn` char(12) NOT NULL,
  `user_id` smallint(3) UNSIGNED NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Almacena los datos de las consultas';

--
-- Dumping data for table `consulta`
--

INSERT INTO `consulta` (`uuid`, `diagnostico_isbn`, `user_id`, `fecha`) VALUES
('0063cb99-f44c-11ed-93de-f01faf1d01ad', '028439242686', 2, '2023-05-17 00:44:37'),
('06cb1568-f38d-11ed-9d0f-f01faf1d01ad', '396223673327', 2, '2023-05-16 01:57:34'),
('0a30a33b-f38b-11ed-9d0f-f01faf1d01ad', '551129672322', 2, '2023-05-16 01:43:21'),
('0d9f8091-f398-11ed-9d0f-f01faf1d01ad', '048907616282', 2, '2023-05-16 03:16:30'),
('0effad71-f505-11ed-9272-f01faf1d01ad', '028439242686', 2, '2023-05-17 22:49:19'),
('0fcc5d04-f5fb-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 04:10:16'),
('1092dee1-f624-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 09:03:47'),
('10ca69a4-f639-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:34:07'),
('1c0285b6-f628-11ed-86f3-f01faf1d01ad', '028439242686', 2, '2023-05-19 09:32:44'),
('22b040b5-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:13:08'),
('26f148ea-f636-11ed-86f3-f01faf1d01ad', '228111917204', 2, '2023-05-19 11:13:16'),
('27fb35ee-f62b-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 09:54:33'),
('2cf2e5c2-f633-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:51:57'),
('2f65b925-f62f-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:23:23'),
('2fca3de9-f62e-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:16:14'),
('33360f53-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:13:36'),
('3a3239b9-f628-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 09:33:35'),
('3c8aff84-f637-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:21:01'),
('4150a652-f644-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 12:54:13'),
('44def590-f632-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:45:28'),
('45deedd8-f624-11ed-86f3-f01faf1d01ad', '028439242686', 2, '2023-05-19 09:05:16'),
('4b55859a-f634-11ed-86f3-f01faf1d01ad', '376473822195', 2, '2023-05-19 10:59:58'),
('5bfa70c0-f62c-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 10:03:10'),
('5ded47a8-f644-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 12:55:01'),
('696a9845-f639-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:36:36'),
('6d211656-f621-11ed-86f3-f01faf1d01ad', '028439242686', 2, '2023-05-19 08:44:54'),
('6d7cab84-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:15:14'),
('6f0e3c27-f633-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:53:48'),
('757b9879-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:15:27'),
('75809410-f633-11ed-86f3-f01faf1d01ad', '376473822195', 2, '2023-05-19 10:53:59'),
('76e40d5e-f632-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:46:52'),
('78b3815b-f62c-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 10:03:58'),
('7b46b0bf-f644-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 12:55:50'),
('7fac3dc7-f633-11ed-86f3-f01faf1d01ad', '028439242686', 2, '2023-05-19 10:54:16'),
('87487900-f633-11ed-86f3-f01faf1d01ad', '024719340133', 2, '2023-05-19 10:54:29'),
('88d8e035-f62c-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 10:04:25'),
('890c9aa1-f63a-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:44:38'),
('8f5a06a1-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:16:11'),
('91dfbe7a-f633-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:54:46'),
('925aece7-f644-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 12:56:29'),
('951c5acf-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:16:20'),
('97d43989-f62c-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 10:04:50'),
('9a0684b6-f537-11ed-9272-f01faf1d01ad', '028439242686', 2, '2023-05-18 04:51:07'),
('a947a51e-f61b-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 08:03:38'),
('ad751581-f632-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:48:23'),
('af6f6dbc-f646-11ed-86f3-f01faf1d01ad', '022967027571', 2, '2023-05-19 13:11:36'),
('b2323422-f633-11ed-86f3-f01faf1d01ad', '376473822195', 2, '2023-05-19 10:55:41'),
('b4436fc8-f62f-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:27:06'),
('ba1305fa-f637-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:24:32'),
('bcc57771-f53d-11ed-9272-f01faf1d01ad', '048907616282', 2, '2023-05-18 05:35:02'),
('c00d842f-f5f1-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 03:03:37'),
('c51c46ba-f61b-11ed-86f3-f01faf1d01ad', '028439242686', 2, '2023-05-19 08:04:24'),
('c77969b3-f628-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 09:37:32'),
('ca64ad68-f62a-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 09:51:56'),
('cb81b183-f628-11ed-86f3-f01faf1d01ad', '028439242686', 2, '2023-05-19 09:37:39'),
('cd776406-f639-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:39:23'),
('cf68e000-f5ff-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 04:44:16'),
('d33d3586-f632-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:49:27'),
('d722c1dc-f63b-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:53:59'),
('df62ee03-f628-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 09:38:12'),
('e33d4b1b-f62b-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 09:59:47'),
('e40bc475-f636-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 11:18:33'),
('e784814c-f62a-11ed-86f3-f01faf1d01ad', '048907616282', 2, '2023-05-19 09:52:45'),
('e946d633-f631-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 10:42:54'),
('eacd3b46-f460-11ed-93de-f01faf1d01ad', '028439242686', 2, '2023-05-17 03:14:21'),
('ed84f22f-f5f8-11ed-86f3-f01faf1d01ad', '551129672322', 2, '2023-05-19 03:55:00'),
('f2a764ef-f641-11ed-86f3-f01faf1d01ad', '082129320160', 2, '2023-05-19 12:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `diagnostico`
--

CREATE TABLE `diagnostico` (
  `isbn` char(12) NOT NULL,
  `paciente_id` smallint(4) UNSIGNED NOT NULL,
  `openai` longtext NOT NULL,
  `signos_vitales` longtext NOT NULL,
  `sintomas` longtext NOT NULL,
  `examenes_extra` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Almacena el diagnostico';

--
-- Dumping data for table `diagnostico`
--

INSERT INTO `diagnostico` (`isbn`, `paciente_id`, `openai`, `signos_vitales`, `sintomas`, `examenes_extra`) VALUES
('022967027571', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo, lo que significa que es una emergencia urgente pero no inmediata. Nuestra pre-diagnóstico es que podrías tener una infección respiratoria aguda, sinusitis o rinitis alérgica.\n\nEn cuanto a la prioridad de los pre-diagnósticos, en primer lugar estaría la infección respiratoria aguda, seguida de la sinusitis y en tercer lugar la rinitis alérgica.\n\nPara la infección respiratoria aguda, los posibles tratamientos incluyen descanso, hidratación, analgésicos y antipiréticos. Para la sinusitis, los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos en caso de que la infección sea bacteriana. Para la rinitis alérgica, los tratamientos pueden incluir antihistamínicos, descongestionantes y corticosteroides.\n\nPara verificar la posible condición, se pueden realizar pruebas como un cultivo de garganta o una radiografía de senos paranasales.\n\nEn conclusión, la pre-diagnóstico más probable es una infección respiratoria aguda. Sin embargo, es importante que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('024719340133', 4, '', '', '', ''),
('028439242686', 2, '', '\r', '', ''),
('048907616282', 4, '', '', '', ''),
('082129320160', 1, '', '', '', ''),
('100601850125', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('153177062125', 4, '', '', '', ''),
('228111917204', 1, '', '', '', ''),
('228634015134', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('231413713091', 1, '', '', '', ''),
('243100894012', 1, '', '', '', ''),
('250049940682', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y la urgencia de la pre-diagnóstico es moderada.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos.\n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común. Los tratamientos pueden incluir descanso, líquidos y medicamentos para aliviar los síntomas.\n3. Alergias: Los síntomas que presentas también pueden ser causados por alergias. Los tratamientos pueden incluir antihistamínicos y descongestionantes.\n\nPara la sinusitis, el tratamiento puede incluir descongestionantes, analgésicos y antibióticos. Para el resfriado común, el tratamiento puede incluir descanso, líquidos y medicamentos para aliviar los síntomas. Para las alergias, el tratamiento puede incluir antihistamínicos y descongestionantes.\n\nPara verificar la posible condición de sinusitis, se pueden realizar pruebas de imagen como una tomografía computarizada o una resonancia magnética. Para verificar la posible condición de alergias, se pueden realizar pruebas cutáneas o de sangre.\n\nEn conclusión, la pre-diagnóstico más probable es sinusitis. Se recomienda que consultes a un médico para obtener un diagnóstico definitivo y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('250683239103', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('254112535826', 4, '', '', '', ''),
('262355563522', 2, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('282278820256', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('313862975973', 4, '', '', '', ''),
('317554902740', 1, '', '', '', ''),
('346735884216', 1, '', '', '', ''),
('355898626357', 4, '', '', '', ''),
('369259992593', 4, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('376473822195', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('381938703670', 4, '', '', '', ''),
('384128518727', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo, lo que significa que es una emergencia urgente pero no inmediata. Nuestra pre-diagnóstico es que podrías tener una infección respiratoria aguda, sinusitis o rinitis alérgica.\n\nEn cuanto a la prioridad de los pre-diagnósticos, en primer lugar estaría la infección respiratoria aguda, seguida de la sinusitis y en tercer lugar la rinitis alérgica.\n\nPara la infección respiratoria aguda, los posibles tratamientos incluyen descanso, hidratación, analgésicos y antipiréticos. Para la sinusitis, los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos en caso de que la infección sea bacteriana. Para la rinitis alérgica, los tratamientos pueden incluir antihistamínicos, descongestionantes y corticosteroides.\n\nPara verificar la posible condición, se pueden realizar pruebas como un cultivo de garganta o una radiografía de senos paranasales.\n\nEn conclusión, la pre-diagnóstico más probable es una infección respiratoria aguda. Sin embargo, es importante que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('396223673327', 3, '', '', '', ''),
('481496953904', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y de nivel de urgencia medio.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los síntomas incluyen dolor facial, congestión nasal, dolor de cabeza y goteo posnasal. \n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común, que es una infección viral del tracto respiratorio superior. \n3. Faringitis: El dolor de garganta y la tos pueden ser síntomas de una faringitis, que es una inflamación de la faringe.\n\nLos posibles tratamientos para cada pre-diagnóstico son:\n1. Sinusitis: Los tratamientos pueden incluir descongestionantes, analgésicos y en algunos casos, antibióticos.\n2. Resfriado común: Los tratamientos pueden incluir descanso, hidratación y medicamentos para aliviar los síntomas.\n3. Faringitis: Los tratamientos pueden incluir analgésicos, antiinflamatorios y en algunos casos, antibióticos.\n\nLos posibles exámenes para verificar cada pre-diagnóstico son:\n1. Sinusitis: Un examen físico y una tomografía computarizada pueden ayudar a confirmar el diagnóstico.\n2. Resfriado común: No se requieren exámenes adicionales para confirmar el diagnóstico.\n3. Faringitis: Un examen físico y una prueba de estreptococo pueden ayudar a confirmar el diagnóstico.\n\nEn conclusión, la pre-diagnóstico más probable es sinusitis, debido a los síntomas que presentas. Te recomendamos que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado. Esperamos haberte ayudado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('509291474938', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('522018594841', 1, '', '', '', ''),
('538356513347', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('551129672322', 1, '', '\r', '', ''),
('579110270153', 1, '', '', '', ''),
('600162443543', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('637626905125', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y la urgencia de la pre-diagnóstico es moderada.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los tratamientos pueden incluir descongestionantes, analgésicos y enjuagues nasales.\n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común. Los tratamientos pueden incluir descanso, líquidos y medicamentos para aliviar los síntomas.\n3. Alergias: Los síntomas que presentas también pueden ser causados por alergias. Los tratamientos pueden incluir antihistamínicos y descongestionantes.\n\nPara la sinusitis, los posibles tratamientos incluyen descongestionantes, analgésicos y enjuagues nasales. Para el resfriado común, los tratamientos pueden incluir descanso, líquidos y medicamentos para aliviar los síntomas. Para las alergias, los tratamientos pueden incluir antihistamínicos y descongestionantes.\n\nLos posibles exámenes para verificar la condición incluyen una radiografía de los senos paranasales para la sinusitis, una prueba de alergia para las alergias y un examen físico para el resfriado común.\n\nEn conclusión, la pre-diagnóstico más probable es la sinusitis, pero también es posible que sea un resfriado común o alergias. Se recomienda que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('670130679693', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y de nivel de urgencia medio.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los síntomas incluyen dolor facial, congestión nasal, dolor de cabeza y goteo posnasal. \n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común, que es una infección viral del tracto respiratorio superior. \n3. Faringitis: El dolor de garganta y la tos pueden ser síntomas de una faringitis, que es una inflamación de la faringe.\n\nLos posibles tratamientos para cada pre-diagnóstico son:\n1. Sinusitis: Los tratamientos pueden incluir descongestionantes, analgésicos y en algunos casos, antibióticos.\n2. Resfriado común: Los tratamientos pueden incluir descanso, hidratación y medicamentos para aliviar los síntomas.\n3. Faringitis: Los tratamientos pueden incluir analgésicos, antiinflamatorios y en algunos casos, antibióticos.\n\nLos posibles exámenes para verificar cada pre-diagnóstico son:\n1. Sinusitis: Un examen físico y una tomografía computarizada pueden ayudar a confirmar el diagnóstico.\n2. Resfriado común: No se requieren exámenes adicionales para confirmar el diagnóstico.\n3. Faringitis: Un examen físico y una prueba de estreptococo pueden ayudar a confirmar el diagnóstico.\n\nEn conclusión, la pre-diagnóstico más probable es sinusitis, debido a los síntomas que presentas. Se recomienda que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('690856556920', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('698908297440', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y de nivel de urgencia medio.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos.\n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común. Los tratamientos pueden incluir descanso, líquidos y medicamentos para aliviar los síntomas.\n3. Alergias: Los síntomas que presentas también pueden ser causados por alergias. Los tratamientos pueden incluir antihistamínicos y descongestionantes.\n\nPara la sinusitis, el tratamiento puede incluir descongestionantes, analgésicos y antibióticos. Para el resfriado común, el tratamiento puede incluir descanso, líquidos y medicamentos para aliviar los síntomas. Para las alergias, el tratamiento puede incluir antihistamínicos y descongestionantes.\n\nPara verificar la sinusitis, se pueden realizar pruebas de imagen como una tomografía computarizada o una resonancia magnética. Para verificar las alergias, se pueden realizar pruebas cutáneas o de sangre.\n\nEn conclusión, la sinusitis es el diagnóstico más probable basado en los síntomas que presentas. Se recomienda que consultes a un médico para obtener un diagnóstico y tratamiento precisos.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('728751056973', 2, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('739235357097', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('748119710250', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('748964730373', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo, lo que significa que es una emergencia urgente pero no inmediata. Nuestra pre-diagnóstico es que podrías tener una infección respiratoria aguda, sinusitis o rinitis alérgica.\n\nEn cuanto a la prioridad de los pre-diagnósticos, en primer lugar estaría la infección respiratoria aguda, seguida de la sinusitis y en tercer lugar la rinitis alérgica.\n\nPara la infección respiratoria aguda, los posibles tratamientos incluyen descanso, hidratación, analgésicos y antipiréticos. Para la sinusitis, los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos en caso de que la infección sea bacteriana. Para la rinitis alérgica, los tratamientos pueden incluir antihistamínicos, descongestionantes y corticosteroides.\n\nPara verificar la posible condición, se pueden realizar pruebas como un cultivo de garganta o una radiografía de senos paranasales.\n\nEn conclusión, la pre-diagnóstico más probable es una infección respiratoria aguda. Sin embargo, es importante que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('754600727374', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y la urgencia de la pre-diagnóstico es moderada.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los tratamientos pueden incluir descongestionantes, analgésicos y enjuagues nasales.\n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común. Los tratamientos pueden incluir descanso, líquidos y medicamentos para aliviar los síntomas.\n3. Alergias: Los síntomas que presentas también pueden ser causados por alergias. Los tratamientos pueden incluir antihistamínicos y descongestionantes.\n\nPara la sinusitis, los posibles tratamientos incluyen descongestionantes, analgésicos y enjuagues nasales. Para el resfriado común, los tratamientos pueden incluir descanso, líquidos y medicamentos para aliviar los síntomas. Para las alergias, los tratamientos pueden incluir antihistamínicos y descongestionantes.\n\nLos posibles exámenes para verificar la condición incluyen una radiografía de los senos paranasales para la sinusitis, una prueba de alergia para las alergias y un examen físico para el resfriado común.\n\nEn conclusión, la pre-diagnóstico más probable es la sinusitis, pero también es posible que tengas un resfriado común o alergias. Te recomendamos que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('763349495151', 1, '', '', '', ''),
('784255268167', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('794701641522', 1, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('795453940620', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo, lo que significa que es una emergencia urgente pero no inmediata. Nuestra pre-diagnóstico es que podrías tener una infección respiratoria aguda, sinusitis o rinitis alérgica.\n\nEn cuanto a la prioridad de los pre-diagnósticos, en primer lugar estaría la infección respiratoria aguda, seguida de la sinusitis y en tercer lugar la rinitis alérgica.\n\nPara la infección respiratoria aguda, los posibles tratamientos incluyen descanso, hidratación, analgésicos y antipiréticos. Para la sinusitis, los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos en caso de que la infección sea bacteriana. Para la rinitis alérgica, los tratamientos pueden incluir antihistamínicos, descongestionantes y corticosteroides.\n\nPara verificar la posible condición, se pueden realizar pruebas como un cultivo de garganta o una radiografía de senos paranasales.\n\nEn conclusión, la pre-diagnóstico más probable es una infección respiratoria aguda. Sin embargo, es importante que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('798911401171', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo, lo que significa que es una emergencia urgente pero no inmediata. Nuestra pre-diagnóstico es que podrías tener una infección respiratoria aguda, sinusitis o rinitis alérgica.\n\nEn cuanto a la prioridad de los pre-diagnósticos, en primer lugar estaría la infección respiratoria aguda, seguida de la sinusitis y en tercer lugar la rinitis alérgica.\n\nPara la infección respiratoria aguda, los posibles tratamientos incluyen descanso, hidratación, analgésicos y antipiréticos. Para la sinusitis, los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos en caso de que la infección sea bacteriana. Para la rinitis alérgica, los tratamientos pueden incluir antihistamínicos, descongestionantes y corticosteroides.\n\nPara verificar la posible condición, se pueden realizar pruebas como un cultivo de garganta o una radiografía de senos paranasales.\n\nEn conclusión, la pre-diagnóstico más probable es una infección respiratoria aguda. Sin embargo, es importante que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('831125754553', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son temperatura de 36.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo, lo que significa que es una emergencia urgente pero no inmediata. Nuestra pre-diagnóstico es que podrías tener una infección respiratoria aguda, sinusitis o rinitis alérgica.\n\nEn cuanto a la prioridad de los pre-diagnósticos, en primer lugar estaría la infección respiratoria aguda, seguida de la sinusitis y en tercer lugar la rinitis alérgica.\n\nPara la infección respiratoria aguda, los posibles tratamientos incluyen descanso, hidratación, analgésicos y antipiréticos. Para la sinusitis, los tratamientos pueden incluir descongestionantes, analgésicos y antibióticos en caso de que la infección sea bacteriana. Para la rinitis alérgica, los tratamientos pueden incluir antihistamínicos, descongestionantes y corticosteroides.\n\nPara verificar la posible condición, se pueden realizar pruebas como un cultivo de garganta o una radiografía de senos paranasales.\n\nEn conclusión, la pre-diagnóstico más probable es una infección respiratoria aguda. Sin embargo, es importante que consultes a un médico para obtener un diagnóstico preciso y un tratamiento adecuado.', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('851553859604', 4, '', 'Temperatura: 36.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('868296145584', 1, '', '', '', ''),
('927463126186', 1, 'Hola, bienvenido/a a IA TRIAGE. Mi nombre es IA TRIAGE y estoy aquí para ayudarte. Según la información que nos has proporcionado, tienes moqueo, congestión nasal, dolor o presión en la cara, dolor de cabeza, goteo de mucosidad en la garganta (goteo posnasal), dolor de garganta, tos y mal aliento. Además, tus signos vitales son: temperatura de 38.5 y presión arterial de 120/80.\n\nBasándonos en esta información, clasificamos tu emergencia como de color amarillo y de nivel de urgencia medio.\n\nLas tres pre-diagnósticos más probables son:\n1. Sinusitis: Los síntomas que presentas son comunes en la sinusitis, una inflamación de los senos paranasales. Los síntomas incluyen dolor facial, congestión nasal, dolor de cabeza y goteo posnasal. \n2. Resfriado común: Los síntomas que presentas también pueden ser causados por un resfriado común, que es una infección viral del tracto respiratorio superior. \n3. Faringitis: El dolor de garganta y la tos pueden ser síntomas de una faringitis, que es una inflamación de la faringe.\n\nLos tratamientos para estas pre-diagnósticos son:\n1. Sinusitis: Los tratamientos pueden incluir descongestionantes, analgésicos y en algunos casos, antibióticos.\n2. Resfriado común: Los tratamientos pueden incluir descanso, hidratación y medicamentos para aliviar los síntomas.\n3. Faringitis: Los tratamientos pueden incluir analgésicos, antiinflamatorios y en algunos casos, antibióticos.\n\nLos exámenes adicionales para verificar estas condiciones pueden incluir una radiografía de los senos paranasales para la sinusitis, un cultivo de garganta para la faringitis y un examen físico para el resfriado común.\n\nEn conclusión, la pre-diagnóstico más probable es sinusitis, debido a la combinación de síntomas que presentas. Te recomendamos que consultes a un médico para obtener un diagnóstico definitivo y un tratamiento adecuado.', 'Temperatura: 38.5 , Presión arterial: 120/80', 'Moqueo. Congestión nasal. Dolor o presión en la cara. Dolor de cabeza. Goteo de mucosidad en la garganta (goteo posnasal) Dolor de garganta. Tos. Mal aliento.', 'Ninguno'),
('932352218557', 4, '', '', '', ''),
('967285326604', 4, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `genero` varchar(20) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `caracteristicas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Datos del paciente';

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id`, `apellidos`, `nombres`, `fechanacimiento`, `genero`, `cedula`, `correo`, `caracteristicas`) VALUES
(1, 'Bano Serrano', 'Carlos Alberto', '1995-03-08', 'masculino', '1717844367', 'carlosbacan34@hotmail.com', 'ALTURA: 1.71 metros\r\nPESO: 71 kilos\r\n'),
(2, 'Prado Gonzales', 'Lencio Ignacio', '2000-05-10', 'masculino', '1784597868', 'locoterocko35@gmail.com', 'ALTURA: 1.80 metros\r\nPESO: 76 kilos'),
(3, 'Bano Serrano', 'Yessenia Alejandra', '2004-07-17', 'Femenino', '1755565987', 'yesi34@hotmail.com', 'Altura: 1.55\r\nPeso: 42 kilos'),
(4, 'Serrano Lopez', 'Ivonne Alexandra', '1972-09-30', 'Femenino', '1712821535', 'ivonalexa34@hotmail.com', 'Altura: 1.55 metros\r\nPeso: 50 kilos');

-- --------------------------------------------------------

--
-- Table structure for table `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Almacena los tipos de usuarios';

--
-- Dumping data for table `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` char(254) NOT NULL,
  `tipousuario_id` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Almacena los usuarios';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user`, `password`, `tipousuario_id`) VALUES
(1, 'Astrix', 'pbkdf2:sha256:600000$ZQTydJP3ocOBguzV$e3e7ae023e6a3eeace9e3808d8e4316d375025604c4691b64c4704d437e26c31', 1),
(2, 'Test1', 'pbkdf2:sha256:600000$bP4qmxyJ5QHROcVa$ca77cce8a745f0f84e35886361a6b08c0a8dd43661d50ce7bbc9431519acbaa2', 2),
(3, 'root', 'pbkdf2:sha256:600000$bP4qmxyJ5QHROcVa$ca77cce8a745f0f84e35886361a6b08c0a8dd43661d50ce7bbc9431519acbaa2', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `FK_consulta_diagnostico` (`diagnostico_isbn`),
  ADD KEY `FK_consulta_user` (`user_id`);

--
-- Indexes for table `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `FK_diagnostico_paciente` (`paciente_id`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_tiposuario` (`tipousuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `FK_consulta_diagnostico` FOREIGN KEY (`diagnostico_isbn`) REFERENCES `diagnostico` (`isbn`),
  ADD CONSTRAINT `FK_consulta_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `FK_diagnostico_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_tiposuario` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipousuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
