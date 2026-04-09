-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 09, 2026 at 07:48 PM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `streetlight_management`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `lightdetails`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `lightdetails` (IN `light_id` INT)   BEGIN
  SELECT * FROM streetlight s
  WHERE s.light_id = light_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `fault_report`
--

DROP TABLE IF EXISTS `fault_report`;
CREATE TABLE IF NOT EXISTS `fault_report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `light_id` int DEFAULT NULL,
  `fault_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `severity` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  KEY `light_id` (`light_id`)
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fault_report`
--

INSERT INTO `fault_report` (`report_id`, `user_id`, `light_id`, `fault_type`, `severity`, `report_date`, `status`) VALUES
(201, 1, 102, 'Bulb Failure', 'High', '2025-01-01', 'Pending'),
(202, 2, 104, 'Wiring Issue', 'Medium', '2025-01-02', 'Pending'),
(203, 3, 107, 'Power Failure', 'High', '2025-01-03', 'Assigned'),
(204, 9, 110, 'Broken Lamp', 'Low', '2025-01-04', 'Pending'),
(205, 10, 113, 'Short Circuit', 'High', '2025-01-05', 'Assigned'),
(206, 11, 116, 'Bulb Failure', 'Medium', '2025-01-06', 'Resolved'),
(207, 12, 119, 'Power Issue', 'High', '2025-01-07', 'Assigned'),
(208, 13, 104, 'Wiring Damage', 'Medium', '2025-01-08', 'Pending'),
(209, 14, 107, 'Bulb Failure', 'Low', '2025-01-09', 'Pending'),
(210, 15, 110, 'Lamp Damage', 'Medium', '2025-01-10', 'Pending'),
(211, 16, 102, 'Power Failure', 'High', '2025-01-11', 'Assigned'),
(212, 17, 104, 'Broken Pole', 'Medium', '2025-01-12', 'Pending'),
(213, 18, 107, 'Bulb Failure', 'Low', '2025-01-13', 'Pending'),
(214, 19, 110, 'Short Circuit', 'High', '2025-01-14', 'Assigned'),
(215, 20, 113, 'Power Issue', 'Medium', '2025-01-15', 'Resolved'),
(216, 1, 116, 'Lamp Failure', 'Low', '2025-01-16', 'Pending'),
(217, 2, 119, 'Bulb Failure', 'Medium', '2025-01-17', 'Assigned'),
(218, 3, 102, 'Wiring Issue', 'High', '2025-01-18', 'Pending'),
(219, 9, 104, 'Lamp Broken', 'Medium', '2025-01-19', 'Assigned'),
(220, 10, 107, 'Power Failure', 'High', '2025-01-20', 'Pending'),
(221, 21, 122, 'Bulb Failure', 'High', '2025-01-22', 'Pending'),
(222, 22, 125, 'Power Failure', 'Medium', '2025-01-23', 'Assigned'),
(223, 23, 128, 'Lamp Broken', 'Low', '2025-01-24', 'Pending'),
(224, 24, 131, 'Short Circuit', 'High', '2025-01-25', 'Assigned'),
(225, 25, 134, 'Bulb Failure', 'Medium', '2025-01-26', 'Pending'),
(226, 26, 137, 'Wiring Issue', 'High', '2025-01-27', 'Assigned'),
(227, 27, 140, 'Power Failure', 'Medium', '2025-01-28', 'Pending'),
(228, 28, 123, 'Lamp Damage', 'Low', '2025-01-29', 'Pending'),
(229, 29, 126, 'Bulb Failure', 'Medium', '2025-01-30', 'Assigned'),
(230, 30, 129, 'Short Circuit', 'High', '2025-01-31', 'Pending'),
(231, 23, 123, 'Highly Bright', 'Medium', '2026-03-15', 'Pending'),
(232, 23, 124, 'Highly Bright', 'Low', '2026-03-15', 'Pending'),
(233, 1, 123, 'error', 'Low', '2026-03-16', 'Pending'),
(234, 1, 132, 'low bright', 'Medium', '2026-03-16', 'Pending'),
(235, 1, 133, 'low bright', 'Low', '2026-03-16', 'Pending'),
(236, 1, 132, 'low bright', 'Medium', '2026-03-16', 'Pending'),
(237, 10, 111, 'blimming', 'Low', '2026-04-07', 'Pending'),
(238, 11, 111, 'blimming', 'Low', '2026-04-07', 'Pending');

--
-- Triggers `fault_report`
--
DROP TRIGGER IF EXISTS `update_report_status2`;
DELIMITER $$
CREATE TRIGGER `update_report_status2` AFTER INSERT ON `fault_report` FOR EACH ROW BEGIN
UPDATE streetlight
SET status='Faulty'
WHERE light_id=NEW.light_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `fault_report_details`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `fault_report_details`;
CREATE TABLE IF NOT EXISTS `fault_report_details` (
`fault_type` varchar(100)
,`light_id` int
,`report_id` int
,`reporter` varchar(100)
,`severity` varchar(10)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maintenance_cost_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `maintenance_cost_summary`;
CREATE TABLE IF NOT EXISTS `maintenance_cost_summary` (
`team_name` varchar(100)
,`total_cost` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_log`
--

DROP TABLE IF EXISTS `maintenance_log`;
CREATE TABLE IF NOT EXISTS `maintenance_log` (
  `log_id` int NOT NULL,
  `task_id` int DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `cost` decimal(10,2) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `task_id` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_log`
--

INSERT INTO `maintenance_log` (`log_id`, `task_id`, `remarks`, `cost`, `log_date`) VALUES
(501, 401, 'Bulb replaced', 250.00, '2025-01-03'),
(502, 402, 'Wire repaired', 300.00, '2025-01-05'),
(503, 403, 'Power restored', 200.00, '2025-01-06'),
(504, 404, 'Lamp fixed', 150.00, '2025-01-07'),
(505, 405, 'Short circuit fixed', 400.00, '2025-01-08'),
(506, 406, 'Bulb replaced', 250.00, '2025-01-09'),
(507, 407, 'Power line checked', 180.00, '2025-01-10'),
(508, 408, 'Wiring replaced', 320.00, '2025-01-11'),
(509, 409, 'Lamp repaired', 200.00, '2025-01-12'),
(510, 410, 'Pole fixed', 500.00, '2025-01-13'),
(511, 411, 'Bulb replaced', 260.00, '2025-01-14'),
(512, 412, 'Wire repaired', 310.00, '2025-01-15'),
(513, 413, 'Power issue solved', 220.00, '2025-01-16'),
(514, 414, 'Lamp replaced', 350.00, '2025-01-17'),
(515, 415, 'Short circuit repair', 420.00, '2025-01-18'),
(516, 416, 'Bulb changed', 240.00, '2025-01-19'),
(517, 417, 'Wiring fix', 280.00, '2025-01-20'),
(518, 418, 'Power restored', 200.00, '2025-01-21'),
(519, 419, 'Lamp repaired', 210.00, '2025-01-22'),
(520, 420, 'Pole maintenance', 450.00, '2025-01-23'),
(521, 411, 'repaired', 100.00, '2026-04-07');

--
-- Triggers `maintenance_log`
--
DROP TRIGGER IF EXISTS `check_cost`;
DELIMITER $$
CREATE TRIGGER `check_cost` BEFORE INSERT ON `maintenance_log` FOR EACH ROW BEGIN
IF NEW.cost < 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Cost cannot be negative';
END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_light_status`;
DELIMITER $$
CREATE TRIGGER `update_light_status` AFTER INSERT ON `maintenance_log` FOR EACH ROW BEGIN
UPDATE STREETLIGHT
SET status='Working'
WHERE light_id=
(
SELECT light_id
FROM FAULT_REPORT
WHERE report_id=
(
SELECT report_id
FROM REPAIR_TASK
WHERE task_id=NEW.task_id
)
);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_team`
--

DROP TABLE IF EXISTS `maintenance_team`;
CREATE TABLE IF NOT EXISTS `maintenance_team` (
  `team_id` int NOT NULL,
  `team_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_team`
--

INSERT INTO `maintenance_team` (`team_id`, `team_name`, `contact_no`) VALUES
(301, 'Team Alpha', '01720000001'),
(302, 'Team Beta', '01720000002'),
(303, 'Team Gamma', '01720000003'),
(304, 'Team Delta', '01720000004'),
(305, 'Team Omega', '01720000005'),
(306, 'Team Sigma', '01720000006'),
(307, 'Team Zeta', '01720000007'),
(308, 'Team Theta', '01720000008'),
(309, 'Team Lambda', '01720000009'),
(310, 'Team Kappa', '01720000010'),
(311, 'Team Rho', '01720000011'),
(312, 'Team Phi', '01720000012'),
(313, 'Team Psi', '01720000013'),
(314, 'Team Nova', '01720000014'),
(315, 'Team Titan', '01720000015'),
(316, 'Team Falcon', '01720000016'),
(317, 'Team Hawk', '01720000017'),
(318, 'Team Eagle', '01720000018'),
(319, 'Team Tiger', '01720000019'),
(320, 'Team Lion', '01720000020');

-- --------------------------------------------------------

--
-- Table structure for table `repair_task`
--

DROP TABLE IF EXISTS `repair_task`;
CREATE TABLE IF NOT EXISTS `repair_task` (
  `task_id` int NOT NULL,
  `report_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `assigned_date` date DEFAULT NULL,
  `repair_date` date DEFAULT NULL,
  `task_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `report_id` (`report_id`),
  KEY `team_id` (`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `repair_task`
--

INSERT INTO `repair_task` (`task_id`, `report_id`, `team_id`, `assigned_date`, `repair_date`, `task_status`) VALUES
(401, 201, 301, '2025-01-02', NULL, 'Assigned'),
(402, 202, 302, '2025-01-03', '2025-01-05', 'Completed'),
(403, 203, 303, '2025-01-04', NULL, 'Assigned'),
(404, 204, 304, '2025-01-05', '2025-01-06', 'Completed'),
(405, 205, 305, '2025-01-06', NULL, 'Assigned'),
(406, 206, 306, '2025-01-07', '2025-01-08', 'Completed'),
(407, 207, 307, '2025-01-08', NULL, 'Assigned'),
(408, 208, 308, '2025-01-09', NULL, 'Assigned'),
(409, 209, 309, '2025-01-10', NULL, 'Assigned'),
(410, 210, 310, '2025-01-11', '2025-01-13', 'Completed'),
(411, 211, 311, '2025-01-12', NULL, 'Assigned'),
(412, 212, 312, '2025-01-13', NULL, 'Assigned'),
(413, 213, 313, '2025-01-14', NULL, 'Assigned'),
(414, 214, 314, '2025-01-15', '2025-01-16', 'Completed'),
(415, 215, 315, '2025-01-16', '2025-01-17', 'Completed'),
(416, 216, 316, '2025-01-17', NULL, 'Assigned'),
(417, 217, 317, '2025-01-18', NULL, 'Assigned'),
(418, 218, 318, '2025-01-19', NULL, 'Assigned'),
(419, 219, 319, '2025-01-20', '2025-01-21', 'Completed'),
(420, 220, 320, '2025-01-21', NULL, 'Assigned'),
(0, 236, 320, '2026-03-16', NULL, 'Assigned');

--
-- Triggers `repair_task`
--
DROP TRIGGER IF EXISTS `update_report_status`;
DELIMITER $$
CREATE TRIGGER `update_report_status` AFTER INSERT ON `repair_task` FOR EACH ROW BEGIN
UPDATE FAULT_REPORT
SET status='Assigned'
WHERE report_id=NEW.report_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `streetlight`
--

DROP TABLE IF EXISTS `streetlight`;
CREATE TABLE IF NOT EXISTS `streetlight` (
  `light_id` int NOT NULL,
  `zone_id` int DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`light_id`),
  KEY `zone_id` (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `streetlight`
--

INSERT INTO `streetlight` (`light_id`, `zone_id`, `latitude`, `longitude`, `installation_date`, `status`) VALUES
(101, 1, 23.810300, 90.412500, '2022-01-01', 'Working'),
(102, 1, 23.810400, 90.412600, '2022-02-01', 'Working'),
(103, 2, 23.811000, 90.413000, '2022-03-01', 'Working'),
(104, 3, 23.812000, 90.414000, '2022-04-01', 'Faulty'),
(105, 4, 23.813000, 90.415000, '2022-05-01', 'Working'),
(106, 5, 23.814000, 90.416000, '2022-06-01', 'Working'),
(107, 6, 23.815000, 90.417000, '2022-07-01', 'Faulty'),
(108, 7, 23.816000, 90.418000, '2022-08-01', 'Working'),
(109, 8, 23.817000, 90.419000, '2022-09-01', 'Working'),
(110, 9, 23.818000, 90.420000, '2022-10-01', 'Faulty'),
(111, 10, 23.819000, 90.421000, '2022-11-01', 'Faulty'),
(112, 11, 23.820000, 90.422000, '2022-12-01', 'Working'),
(113, 12, 23.821000, 90.423000, '2023-01-01', 'Faulty'),
(114, 13, 23.822000, 90.424000, '2023-02-01', 'Working'),
(115, 14, 23.823000, 90.425000, '2023-03-01', 'Working'),
(116, 15, 23.824000, 90.426000, '2023-04-01', 'Faulty'),
(117, 16, 23.825000, 90.427000, '2023-05-01', 'Working'),
(118, 17, 23.826000, 90.428000, '2023-06-01', 'Working'),
(119, 18, 23.827000, 90.429000, '2023-07-01', 'Faulty'),
(120, 19, 23.828000, 90.430000, '2023-08-01', 'Working'),
(121, 2, 23.829000, 90.431000, '2023-09-01', 'Working'),
(122, 3, 23.830000, 90.432000, '2023-10-01', 'Faulty'),
(123, 4, 23.831000, 90.433000, '2023-11-01', 'Working'),
(124, 5, 23.832000, 90.434000, '2023-12-01', 'Working'),
(125, 6, 23.833000, 90.435000, '2024-01-01', 'Faulty'),
(126, 7, 23.834000, 90.436000, '2024-02-01', 'Working'),
(127, 8, 23.835000, 90.437000, '2024-03-01', 'Working'),
(128, 9, 23.836000, 90.438000, '2024-04-01', 'Faulty'),
(129, 10, 23.837000, 90.439000, '2024-05-01', 'Working'),
(130, 11, 23.838000, 90.440000, '2024-06-01', 'Working'),
(131, 12, 23.839000, 90.441000, '2024-07-01', 'Faulty'),
(132, 13, 23.840000, 90.442000, '2024-08-01', 'Working'),
(133, 14, 23.841000, 90.443000, '2024-09-01', 'Working'),
(134, 15, 23.842000, 90.444000, '2024-10-01', 'Faulty'),
(135, 16, 23.843000, 90.445000, '2024-11-01', 'Working'),
(136, 17, 23.844000, 90.446000, '2024-12-01', 'Working'),
(137, 18, 23.845000, 90.447000, '2025-01-01', 'Faulty'),
(138, 19, 23.846000, 90.448000, '2025-02-01', 'Working'),
(139, 20, 23.847000, 90.449000, '2025-03-01', 'Working'),
(140, 1, 23.848000, 90.450000, '2025-04-01', 'Faulty');

-- --------------------------------------------------------

--
-- Stand-in structure for view `streetlight_zone_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `streetlight_zone_view`;
CREATE TABLE IF NOT EXISTS `streetlight_zone_view` (
`light_id` int
,`status` varchar(20)
,`zone_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `phone`, `role`) VALUES
(1, 'Rahim Uddin', 'rahim@mail.com', '01711111111', 'Citizen'),
(2, 'Karim Ahmed', 'karim@mail.com', '01711111112', 'Citizen'),
(3, 'Nusrat Jahan', 'nusrat@mail.com', '01711111113', 'Citizen'),
(4, 'Admin One', 'admin1@mail.com', '01711111114', 'Admin'),
(5, 'Admin Two', 'admin2@mail.com', '01711111115', 'Admin'),
(6, 'Tech Hasan', 'tech1@mail.com', '01711111116', 'Technician'),
(7, 'Tech Kabir', 'tech2@mail.com', '01711111117', 'Technician'),
(8, 'Tech Rafi', 'tech3@mail.com', '01711111118', 'Technician'),
(9, 'Salma Akter', 'salma@mail.com', '01711111119', 'Citizen'),
(10, 'Tanvir Hossain', 'tanvir@mail.com', '01711111120', 'Citizen'),
(11, 'Arif Khan', 'arif@mail.com', '01711111121', 'Citizen'),
(12, 'Sadia Islam', 'sadia@mail.com', '01711111122', 'Citizen'),
(13, 'Mahin Rahman', 'mahin@mail.com', '01711111123', 'Citizen'),
(14, 'Rima Sultana', 'rima@mail.com', '01711111124', 'Citizen'),
(15, 'Farhan Ahmed', 'farhan@mail.com', '01711111125', 'Citizen'),
(16, 'Shuvo Das', 'shuvo@mail.com', '01711111126', 'Citizen'),
(17, 'Mitu Akter', 'mitu@mail.com', '01711111127', 'Citizen'),
(18, 'Rashed Karim', 'rashed@mail.com', '01711111128', 'Citizen'),
(19, 'Nabil Hasan', 'nabil@mail.com', '01711111129', 'Citizen'),
(20, 'Jannat Ara', 'jannat@mail.com', '01711111130', 'Citizen'),
(21, 'Rakib Hasan', 'rakib@mail.com', '01711111131', 'Citizen'),
(22, 'Sohan Mahmud', 'sohan@mail.com', '01711111132', 'Citizen'),
(23, 'Tania Akter', 'tania@mail.com', '01711111133', 'Citizen'),
(24, 'Nayeem Islam', 'nayeem@mail.com', '01711111134', 'Citizen'),
(25, 'Jahid Hasan', 'jahid@mail.com', '01711111135', 'Citizen'),
(26, 'Sabbir Rahman', 'sabbir@mail.com', '01711111136', 'Technician'),
(27, 'Morshed Alam', 'morshed@mail.com', '01711111137', 'Technician'),
(28, 'Anika Rahman', 'anika@mail.com', '01711111138', 'Citizen'),
(29, 'Tarek Ahmed', 'tarek@mail.com', '01711111139', 'Citizen'),
(30, 'Sakib Khan', 'sakib@mail.com', '01711111140', 'Citizen');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int NOT NULL,
  `zone_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `zone_name`, `area_name`) VALUES
(1, 'North Zone', 'Uttara'),
(2, 'South Zone', 'Motijheel'),
(3, 'East Zone', 'Badda'),
(4, 'West Zone', 'Mirpur'),
(5, 'Central Zone', 'Dhanmondi'),
(6, 'Zone A', 'Banani'),
(7, 'Zone B', 'Gulshan'),
(8, 'Zone C', 'Mohakhali'),
(9, 'Zone D', 'Farmgate'),
(10, 'Zone E', 'Tejgaon'),
(11, 'Zone F', 'Khilgaon'),
(12, 'Zone G', 'Rampura'),
(13, 'Zone H', 'Malibagh'),
(14, 'Zone I', 'Shahbag'),
(15, 'Zone J', 'Azimpur'),
(16, 'Zone K', 'Lalbag'),
(17, 'Zone L', 'Jatrabari'),
(18, 'Zone M', 'Demra'),
(19, 'Zone N', 'Keraniganj'),
(20, 'Zone O', 'Savar');

-- --------------------------------------------------------

--
-- Structure for view `fault_report_details`
--
DROP TABLE IF EXISTS `fault_report_details`;

DROP VIEW IF EXISTS `fault_report_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fault_report_details`  AS SELECT `f`.`report_id` AS `report_id`, `u`.`name` AS `reporter`, `s`.`light_id` AS `light_id`, `f`.`fault_type` AS `fault_type`, `f`.`severity` AS `severity`, `f`.`status` AS `status` FROM ((`fault_report` `f` join `users` `u` on((`f`.`user_id` = `u`.`user_id`))) join `streetlight` `s` on((`f`.`light_id` = `s`.`light_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `maintenance_cost_summary`
--
DROP TABLE IF EXISTS `maintenance_cost_summary`;

DROP VIEW IF EXISTS `maintenance_cost_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maintenance_cost_summary`  AS SELECT `t`.`team_name` AS `team_name`, sum(`l`.`cost`) AS `total_cost` FROM ((`maintenance_log` `l` join `repair_task` `r` on((`l`.`task_id` = `r`.`task_id`))) join `maintenance_team` `t` on((`r`.`team_id` = `t`.`team_id`))) GROUP BY `t`.`team_name` ;

-- --------------------------------------------------------

--
-- Structure for view `streetlight_zone_view`
--
DROP TABLE IF EXISTS `streetlight_zone_view`;

DROP VIEW IF EXISTS `streetlight_zone_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `streetlight_zone_view`  AS SELECT `s`.`light_id` AS `light_id`, `z`.`zone_name` AS `zone_name`, `s`.`status` AS `status` FROM (`streetlight` `s` join `zone` `z` on((`s`.`zone_id` = `z`.`zone_id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
