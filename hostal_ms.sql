-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 05, 2023 at 04:49 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostal_ms`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `acadamic_warden_null_complain_view`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `acadamic_warden_null_complain_view` ()  BEGIN

    SELECT
        c_ID,StudentId,ItemId,itemName,RoomId,Image,Description,Status,Time
    FROM
        awcomplaint
    WHERE status IS NULL;
END$$

DROP PROCEDURE IF EXISTS `complain_view`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `complain_view` ()  BEGIN

    SELECT
        id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time
    FROM
        complaint
    WHERE status IS NULL;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `get_total_not_resolve_complain`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_not_resolve_complain` () RETURNS INT(5) BEGIN
    DECLARE total_resolved INT;
    SELECT COUNT(*) INTO total_resolved FROM deancomplaint WHERE status IS NULL;
    RETURN total_resolved;
END$$

DROP FUNCTION IF EXISTS `get_total_resolve_complain`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_resolve_complain` () RETURNS INT(5) BEGIN
    DECLARE total_resolved INT;
    SELECT COUNT(*) INTO total_resolved FROM deancomplaint WHERE status IS NOT NULL;
    RETURN total_resolved;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `academicwardern`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `academicwardern`;
CREATE TABLE IF NOT EXISTS `academicwardern` (
`id` bigint(20)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`email` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `awcomplaint`
--

DROP TABLE IF EXISTS `awcomplaint`;
CREATE TABLE IF NOT EXISTS `awcomplaint` (
  `c_ID` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `ItemId` varchar(10) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `RoomId` varchar(10) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `Time` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` int(11) NOT NULL,
  `ItemID` varchar(10) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `RoomID` varchar(10) NOT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Description` varchar(200) NOT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `item_id` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `room_id` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `StudentId`, `ItemID`, `ItemName`, `RoomID`, `Image`, `Description`, `Status`, `Time`, `item_id`, `item_name`, `room_id`, `student_id`) VALUES
(1, 1, 'C001', 'Chair', 'R001', NULL, 'Leg is Broken', NULL, '2023-11-05 06:07:31', NULL, NULL, NULL, NULL),
(2, 1, 'C002', 'Chair', 'R001', NULL, 'Leg is broken', 'Resolved', '2023-11-05 08:34:14', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dean`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `dean`;
CREATE TABLE IF NOT EXISTS `dean` (
`id` bigint(20)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`email` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `deancomplaint`
--

DROP TABLE IF EXISTS `deancomplaint`;
CREATE TABLE IF NOT EXISTS `deancomplaint` (
  `c_ID` int(10) NOT NULL,
  `StudentId` int(10) NOT NULL,
  `ItemId` varchar(10) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `RoomId` varchar(10) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Time` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hostal`
--

DROP TABLE IF EXISTS `hostal`;
CREATE TABLE IF NOT EXISTS `hostal` (
  `HostalId` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostal`
--

INSERT INTO `hostal` (`HostalId`, `Name`) VALUES
('H01', 'Boys Hostal'),
('H02', 'Girls Hostal');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `ItemId` varchar(10) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `RoomId` varchar(10) NOT NULL,
  PRIMARY KEY (`ItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemId`, `ItemName`, `RoomId`) VALUES
('C001', 'Chair', 'R001'),
('C002', 'Chair', 'R001'),
('D001', 'Desk', 'R001'),
('D002', 'Desk', 'R001');

-- --------------------------------------------------------

--
-- Table structure for table `resolvedcomplaint`
--

DROP TABLE IF EXISTS `resolvedcomplaint`;
CREATE TABLE IF NOT EXISTS `resolvedcomplaint` (
  `c_ID` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `ItemID` varchar(10) NOT NULL,
  `ItemName` varchar(10) NOT NULL,
  `RoomID` varchar(10) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_SubWardern'),
(3, 'ROLE_AcademicWardern'),
(4, 'ROLE_Dean');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `RoomId` varchar(10) NOT NULL,
  `HostalId` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RoomId`, `HostalId`) VALUES
('R001', 'H01'),
('R002', 'H01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `student`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
`id` bigint(20)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`email` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subwardern`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `subwardern`;
CREATE TABLE IF NOT EXISTS `subwardern` (
`id` bigint(20)
,`first_name` varchar(255)
,`last_name` varchar(255)
,`email` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `password`, `RoleId`) VALUES
(1, 'lappramu@gmail.com', 'pawara', 'pramuditha', '$2a$10$yzIOWnOdxJdowIsiWtPyPuU3q5BbemDQLFjJ8iYCXVB4eMO3dzjpC', 1),
(2, 'subw@gmail.com', 'sunil', 'shantha', '$2a$10$yzIOWnOdxJdowIsiWtPyPuU3q5BbemDQLFjJ8iYCXVB4eMO3dzjpC', 2),
(3, 'abc@gmail.com', 'shehan', 'devin', '$2a$10$yzIOWnOdxJdowIsiWtPyPuU3q5BbemDQLFjJ8iYCXVB4eMO3dzjpC', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure for view `academicwardern`
--
DROP TABLE IF EXISTS `academicwardern`;

DROP VIEW IF EXISTS `academicwardern`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `academicwardern`  AS SELECT `user`.`id` AS `id`, `user`.`first_name` AS `first_name`, `user`.`last_name` AS `last_name`, `user`.`email` AS `email` FROM `user` WHERE (`user`.`RoleId` = 3) ;

-- --------------------------------------------------------

--
-- Structure for view `dean`
--
DROP TABLE IF EXISTS `dean`;

DROP VIEW IF EXISTS `dean`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dean`  AS SELECT `user`.`id` AS `id`, `user`.`first_name` AS `first_name`, `user`.`last_name` AS `last_name`, `user`.`email` AS `email` FROM `user` WHERE (`user`.`RoleId` = 4) ;

-- --------------------------------------------------------

--
-- Structure for view `student`
--
DROP TABLE IF EXISTS `student`;

DROP VIEW IF EXISTS `student`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student`  AS SELECT `user`.`id` AS `id`, `user`.`first_name` AS `first_name`, `user`.`last_name` AS `last_name`, `user`.`email` AS `email` FROM `user` WHERE (`user`.`RoleId` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `subwardern`
--
DROP TABLE IF EXISTS `subwardern`;

DROP VIEW IF EXISTS `subwardern`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subwardern`  AS SELECT `user`.`id` AS `id`, `user`.`first_name` AS `first_name`, `user`.`last_name` AS `last_name`, `user`.`email` AS `email` FROM `user` WHERE (`user`.`RoleId` = 2) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

DELIMITER $$
--
-- Events
--
DROP EVENT IF EXISTS `acadamic_wardern_complain`$$
CREATE DEFINER=`root`@`localhost` EVENT `acadamic_wardern_complain` ON SCHEDULE EVERY 1 DAY STARTS '2023-11-06 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  INSERT INTO awcomplaint(c_ID,StudentId,ItemId,itemName,RoomId,Image,Description,Status,Time)
  SELECT id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time
  FROM complaint
  WHERE status IS NULL AND Time <= NOW() - INTERVAL 3 DAY;

  DELETE FROM complaint
  WHERE status IS NULL AND Time <= NOW() - INTERVAL 3 DAY;
END$$

DROP EVENT IF EXISTS `dean_complain`$$
CREATE DEFINER=`root`@`localhost` EVENT `dean_complain` ON SCHEDULE EVERY 1 DAY STARTS '2023-11-06 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  INSERT INTO deancomplaint(c_ID,StudentId,ItemId,itemName,RoomId,Image,Description,Status,Time)
  SELECT c_ID,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time
  FROM awcomplaint
  WHERE status IS NULL AND Time <= NOW() - INTERVAL 7 DAY;

  DELETE FROM awcomplaint
  WHERE status IS NULL AND Time <= NOW() - INTERVAL 7 DAY;
END$$

DROP EVENT IF EXISTS `resolved_complain_event`$$
CREATE DEFINER=`root`@`localhost` EVENT `resolved_complain_event` ON SCHEDULE EVERY 10 SECOND STARTS '2023-11-05 00:00:10' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  INSERT INTO resolvedcomplaint (c_id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time)
   SELECT id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time
  FROM complaint
  WHERE status IS NOT NULL AND Time <= NOW() - INTERVAL 10 SECOND;

END$$

DROP EVENT IF EXISTS `resolved_aw_complain_event`$$
CREATE DEFINER=`root`@`localhost` EVENT `resolved_aw_complain_event` ON SCHEDULE EVERY 10 SECOND STARTS '2023-11-05 00:00:10' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  INSERT INTO resolvedcomplaint (c_id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time)
   SELECT c_id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time
  FROM awcomplaint
  WHERE status IS NOT NULL AND Time <= NOW() - INTERVAL 10 SECOND;

END$$

DROP EVENT IF EXISTS `resolved_dean_complain_event`$$
CREATE DEFINER=`root`@`localhost` EVENT `resolved_dean_complain_event` ON SCHEDULE EVERY 10 SECOND STARTS '2023-11-05 00:00:10' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
  INSERT INTO resolvedcomplaint (c_id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time)
   SELECT c_id,StudentId,ItemID,ItemName,RoomID,Image,Description,Status,Time
  FROM deancomplaint
  WHERE status IS NOT NULL AND Time <= NOW() - INTERVAL 10 SECOND;

END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
