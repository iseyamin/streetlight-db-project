-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 11, 2026 at 10:47 AM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `streetlight_zone_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `streetlight_zone_view`;
CREATE TABLE IF NOT EXISTS `streetlight_zone_view` (
`light_id` int
,`zone_name` varchar(100)
,`status` varchar(20)
);

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
