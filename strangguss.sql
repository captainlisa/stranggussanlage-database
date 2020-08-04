-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Aug 2020 um 12:07
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `strangguss`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `batch`
--

CREATE TABLE `batch` (
  `batch_id` varchar(10) NOT NULL,
  `production_plan_id` int(5) DEFAULT NULL,
  `blueprint_id` int(3) DEFAULT NULL,
  `brand_designation` varchar(10) DEFAULT NULL,
  `casting_speed` varchar(10) DEFAULT NULL,
  `cooling_water_volume` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blueprint`
--

CREATE TABLE `blueprint` (
  `blueprint_id` int(3) NOT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `product_definition` varchar(100) DEFAULT NULL,
  `casting_speed_goal` varchar(10) DEFAULT NULL,
  `casting_speed_min` varchar(10) DEFAULT NULL,
  `casting_speed_max` varchar(10) DEFAULT NULL,
  `temperature_goal` varchar(5) DEFAULT NULL,
  `temperature_min` varchar(5) DEFAULT NULL,
  `temperature_max` varchar(5) DEFAULT NULL,
  `casting_powder` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `blueprint`
--

INSERT INTO `blueprint` (`blueprint_id`, `designation`, `product_definition`, `casting_speed_goal`, `casting_speed_min`, `casting_speed_max`, `temperature_goal`, `temperature_min`, `temperature_max`, `casting_powder`) VALUES
(1, '0815', 'Blech für eine Waschmaschine', '0.6 m/min', '0.5 m/min', '0.7 m/min', '1400 ', '1300 ', '1500 ', 'schwarz');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `brand`
--

CREATE TABLE `brand` (
  `designation` varchar(10) NOT NULL,
  `main_substance` varchar(10) DEFAULT NULL,
  `main_substance_amount` double DEFAULT NULL,
  `additional_substance` varchar(20) DEFAULT NULL,
  `additional_substance_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `brand`
--

INSERT INTO `brand` (`designation`, `main_substance`, `main_substance_amount`, `additional_substance`, `additional_substance_amount`) VALUES
('P43', 'Ph 0.04%', 70, 'N 0.008%', 30),
('X79', 'S 0.04%', 65, 'Ph 0.008%', 35);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `casting_machine`
--

CREATE TABLE `casting_machine` (
  `machine_id` int(3) NOT NULL,
  `employee_id` int(6) DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `maintenance_id` int(10) DEFAULT NULL,
  `production_plan_id` int(5) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `length` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `casting_machine`
--

INSERT INTO `casting_machine` (`machine_id`, `employee_id`, `work_date`, `maintenance_id`, `production_plan_id`, `type`, `length`) VALUES
(100, NULL, NULL, NULL, NULL, 1, 31);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cutting_plan`
--

CREATE TABLE `cutting_plan` (
  `cutting_plan_id` int(3) NOT NULL,
  `length` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cutting_plan`
--

INSERT INTO `cutting_plan` (`cutting_plan_id`, `length`) VALUES
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `distributor`
--

CREATE TABLE `distributor` (
  `distributor_id` int(3) NOT NULL,
  `maintenance_id` int(10) DEFAULT NULL,
  `capacity` int(3) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `distributor`
--

INSERT INTO `distributor` (`distributor_id`, `maintenance_id`, `capacity`, `type`) VALUES
(1, NULL, 15, 'GH-T6'),
(2, NULL, 15, 'GH-T7');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(6) NOT NULL,
  `work_date` date DEFAULT NULL,
  `emp_allo_id` int(3) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee_allocation`
--

CREATE TABLE `employee_allocation` (
  `emp_allo_id` int(3) NOT NULL,
  `role_id` int(3) DEFAULT NULL,
  `employee_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(2) NOT NULL,
  `employee_id` int(6) DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `designation` varchar(25) DEFAULT NULL,
  `max_positions` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `employee_id`, `work_date`, `designation`, `max_positions`) VALUES
(1, NULL, NULL, 'Büro', 5),
(2, NULL, NULL, 'Hauptleitstand', 3),
(3, NULL, NULL, 'Schneideleitstand', 2),
(4, NULL, NULL, 'Serviceraum', 3),
(5, NULL, NULL, 'Kran', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `maintenance_plan`
--

CREATE TABLE `maintenance_plan` (
  `maintenance_id` int(10) NOT NULL,
  `machine_part_id` varchar(20) DEFAULT NULL,
  `last_maintenance` date DEFAULT NULL,
  `batches_since` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mold`
--

CREATE TABLE `mold` (
  `mold_id` int(3) NOT NULL,
  `maintenance_id` int(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `casting_format` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mold`
--

INSERT INTO `mold` (`mold_id`, `maintenance_id`, `type`, `casting_format`) VALUES
(1, NULL, '773AG', '300 x 400 mm'),
(2, NULL, '832AG', '300 x 300 mm');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pan`
--

CREATE TABLE `pan` (
  `pan_id` int(3) NOT NULL,
  `maintenance_id` int(10) DEFAULT NULL,
  `capacity` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `pan`
--

INSERT INTO `pan` (`pan_id`, `maintenance_id`, `capacity`) VALUES
(1, NULL, 120);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `product_id` varchar(10) NOT NULL,
  `cutting_plan_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`product_id`, `cutting_plan_id`) VALUES
('A1-B2-C3', 1),
('R8-N2-M8', 1),
('D4-E5-F6', 2),
('G7-H8-I9', 2),
('F4-S3-H6', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `production_plan`
--

CREATE TABLE `production_plan` (
  `production_plan_id` int(5) NOT NULL,
  `batch_id` varchar(10) DEFAULT NULL,
  `in_planning` tinyint(1) DEFAULT NULL,
  `in_progress` tinyint(1) DEFAULT NULL,
  `begin_production` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `production_plan`
--

INSERT INTO `production_plan` (`production_plan_id`, `batch_id`, `in_planning`, `in_progress`, `begin_production`) VALUES
(1, 'B123', 1, 0, '2020-08-10'),
(2, 'B123', 1, 0, '2020-08-10'),
(3, 'B124', 0, 1, '2020-08-03'),
(4, 'B125', 1, 0, '2020-08-15'),
(5, 'B126', 1, 0, '2020-09-07'),
(6, 'B127', 0, 1, '2020-07-10'),
(7, 'B128', 0, 1, '2020-07-27'),
(8, 'B129', 0, 1, '2020-07-23'),
(9, 'B130', 1, 0, '2020-08-26'),
(10, 'B131', 1, 0, '2020-09-03');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `role`
--

CREATE TABLE `role` (
  `role_id` int(3) NOT NULL,
  `emp_allo_id` int(3) DEFAULT NULL,
  `employee_id` int(6) DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `designation` varchar(25) DEFAULT NULL,
  `is_shiftworker` tinyint(1) DEFAULT NULL,
  `has_screen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `role`
--

INSERT INTO `role` (`role_id`, `emp_allo_id`, `employee_id`, `work_date`, `designation`, `is_shiftworker`, `has_screen`) VALUES
(1, NULL, NULL, NULL, 'Betriebsingenieur', 0, 1),
(2, NULL, NULL, NULL, 'Sekretärin', 0, 1),
(3, NULL, NULL, NULL, 'Arbeitsaufbereiter', 0, 1),
(4, NULL, NULL, NULL, 'Metallurge', 0, 1),
(5, NULL, NULL, NULL, 'EDV Techniker', 0, 1),
(6, NULL, NULL, NULL, 'Schichtmeister', 1, 1),
(7, NULL, NULL, NULL, 'Operator 1 (Schichtmeiste', 1, 1),
(8, NULL, NULL, NULL, 'Schichtarbeiter 1', 1, 0),
(9, NULL, NULL, NULL, 'Elektriker', 0, 0),
(10, NULL, NULL, NULL, 'Schlosser', 0, 0),
(11, NULL, NULL, NULL, 'Helfer 1', 1, 0),
(12, NULL, NULL, NULL, 'Kranfahrer', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(2) NOT NULL,
  `employee_id` int(6) DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `timeframe` varchar(12) DEFAULT NULL,
  `number_of_workers` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shift`
--

INSERT INTO `shift` (`shift_id`, `employee_id`, `work_date`, `designation`, `timeframe`, `number_of_workers`) VALUES
(1, NULL, NULL, 'Tag', '12:00-24:00', 12),
(2, NULL, NULL, 'Nacht', '24:00-12:00', 7),
(3, NULL, NULL, 'Sonn-Feiertag Tag', '12:00-24:00', 7),
(4, NULL, NULL, 'Sonn-Feiertag Nacht', '24:00-12:00', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shift_plan`
--

CREATE TABLE `shift_plan` (
  `employee_id` int(6) NOT NULL,
  `work_date` date NOT NULL,
  `shift_id` int(2) DEFAULT NULL,
  `location_id` int(2) DEFAULT NULL,
  `role_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `strand`
--

CREATE TABLE `strand` (
  `strand_id` varchar(10) NOT NULL,
  `cutting_plan_id` int(3) DEFAULT NULL,
  `batch_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(3) NOT NULL,
  `machine_id` int(3) DEFAULT NULL,
  `cooling_temperature` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `zone`
--

INSERT INTO `zone` (`zone_id`, `machine_id`, `cooling_temperature`) VALUES
(1, 100, '250'),
(2, 100, '200'),
(3, 100, '150'),
(4, 100, '100');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `production_plan_id` (`production_plan_id`),
  ADD KEY `blueprint_id` (`blueprint_id`),
  ADD KEY `brand_designation` (`brand_designation`);

--
-- Indizes für die Tabelle `blueprint`
--
ALTER TABLE `blueprint`
  ADD PRIMARY KEY (`blueprint_id`);

--
-- Indizes für die Tabelle `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`designation`);

--
-- Indizes für die Tabelle `casting_machine`
--
ALTER TABLE `casting_machine`
  ADD PRIMARY KEY (`machine_id`),
  ADD KEY `employee_id` (`employee_id`,`work_date`),
  ADD KEY `maintenance_id` (`maintenance_id`),
  ADD KEY `production_plan_id` (`production_plan_id`);

--
-- Indizes für die Tabelle `cutting_plan`
--
ALTER TABLE `cutting_plan`
  ADD PRIMARY KEY (`cutting_plan_id`);

--
-- Indizes für die Tabelle `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`distributor_id`),
  ADD KEY `maintenance_id` (`maintenance_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employee_id` (`employee_id`,`work_date`);

--
-- Indizes für die Tabelle `employee_allocation`
--
ALTER TABLE `employee_allocation`
  ADD PRIMARY KEY (`emp_allo_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `employee_id` (`employee_id`,`work_date`);

--
-- Indizes für die Tabelle `maintenance_plan`
--
ALTER TABLE `maintenance_plan`
  ADD PRIMARY KEY (`maintenance_id`);

--
-- Indizes für die Tabelle `mold`
--
ALTER TABLE `mold`
  ADD PRIMARY KEY (`mold_id`),
  ADD KEY `maintenance_id` (`maintenance_id`);

--
-- Indizes für die Tabelle `pan`
--
ALTER TABLE `pan`
  ADD PRIMARY KEY (`pan_id`),
  ADD KEY `maintenance_id` (`maintenance_id`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `cutting_plan_id` (`cutting_plan_id`);

--
-- Indizes für die Tabelle `production_plan`
--
ALTER TABLE `production_plan`
  ADD PRIMARY KEY (`production_plan_id`);

--
-- Indizes für die Tabelle `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `emp_allo_id` (`emp_allo_id`),
  ADD KEY `employee_id` (`employee_id`,`work_date`);

--
-- Indizes für die Tabelle `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `employee_id` (`employee_id`,`work_date`);

--
-- Indizes für die Tabelle `shift_plan`
--
ALTER TABLE `shift_plan`
  ADD PRIMARY KEY (`employee_id`,`work_date`);

--
-- Indizes für die Tabelle `strand`
--
ALTER TABLE `strand`
  ADD PRIMARY KEY (`strand_id`),
  ADD KEY `cutting_plan_id` (`cutting_plan_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indizes für die Tabelle `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`),
  ADD KEY `machine_id` (`machine_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`production_plan_id`) REFERENCES `production_plan` (`production_plan_id`),
  ADD CONSTRAINT `batch_ibfk_2` FOREIGN KEY (`blueprint_id`) REFERENCES `blueprint` (`blueprint_id`),
  ADD CONSTRAINT `batch_ibfk_3` FOREIGN KEY (`brand_designation`) REFERENCES `brand` (`designation`);

--
-- Constraints der Tabelle `casting_machine`
--
ALTER TABLE `casting_machine`
  ADD CONSTRAINT `casting_machine_ibfk_1` FOREIGN KEY (`employee_id`,`work_date`) REFERENCES `shift_plan` (`employee_id`, `work_date`),
  ADD CONSTRAINT `casting_machine_ibfk_2` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_plan` (`maintenance_id`),
  ADD CONSTRAINT `casting_machine_ibfk_3` FOREIGN KEY (`production_plan_id`) REFERENCES `production_plan` (`production_plan_id`);

--
-- Constraints der Tabelle `distributor`
--
ALTER TABLE `distributor`
  ADD CONSTRAINT `distributor_ibfk_1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_plan` (`maintenance_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employee_id`,`work_date`) REFERENCES `shift_plan` (`employee_id`, `work_date`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`employee_id`,`work_date`) REFERENCES `shift_plan` (`employee_id`, `work_date`);

--
-- Constraints der Tabelle `mold`
--
ALTER TABLE `mold`
  ADD CONSTRAINT `mold_ibfk_1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_plan` (`maintenance_id`);

--
-- Constraints der Tabelle `pan`
--
ALTER TABLE `pan`
  ADD CONSTRAINT `pan_ibfk_1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_plan` (`maintenance_id`);

--
-- Constraints der Tabelle `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cutting_plan_id`) REFERENCES `cutting_plan` (`cutting_plan_id`);

--
-- Constraints der Tabelle `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`emp_allo_id`) REFERENCES `employee_allocation` (`emp_allo_id`),
  ADD CONSTRAINT `role_ibfk_2` FOREIGN KEY (`employee_id`,`work_date`) REFERENCES `shift_plan` (`employee_id`, `work_date`);

--
-- Constraints der Tabelle `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`employee_id`,`work_date`) REFERENCES `shift_plan` (`employee_id`, `work_date`);

--
-- Constraints der Tabelle `strand`
--
ALTER TABLE `strand`
  ADD CONSTRAINT `strand_ibfk_1` FOREIGN KEY (`cutting_plan_id`) REFERENCES `cutting_plan` (`cutting_plan_id`),
  ADD CONSTRAINT `strand_ibfk_2` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints der Tabelle `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`machine_id`) REFERENCES `casting_machine` (`machine_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
