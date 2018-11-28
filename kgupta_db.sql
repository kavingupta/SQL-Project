-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 28, 2018 at 12:50 AM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.38-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kgupta_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `b_id` int(3) NOT NULL,
  `b_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`b_id`, `b_name`) VALUES
(21, 'Kingston HyperX'),
(22, 'Logitech'),
(23, 'Nissan'),
(24, 'Nvidia'),
(25, 'Ozone'),
(26, 'Pringles'),
(27, 'Razer'),
(28, 'ROCCAT'),
(29, 'SanDisk'),
(30, 'SteelSeries');

-- --------------------------------------------------------

--
-- Table structure for table `champion`
--

CREATE TABLE IF NOT EXISTS `champion` (
  `c_id` int(3) NOT NULL,
  `c_name` varchar(35) NOT NULL,
  `c_role` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `champion`
--

INSERT INTO `champion` (`c_id`, `c_name`, `c_role`) VALUES
(101, 'Ahri', 'Mage'),
(102, 'Akali', 'Assassin'),
(103, 'Alistar', 'Tank'),
(104, 'Annie', 'Mage'),
(105, 'Caitlyn', 'Marksman'),
(106, 'Draven', 'Marksman'),
(107, 'Elise', 'Mage'),
(108, 'Evelynn', 'Assassin'),
(109, 'Ezreal', 'Marksman'),
(110, 'Graves', 'Marksman');

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE IF NOT EXISTS `coach` (
  `id` int(3) NOT NULL,
  `position` varchar(7) NOT NULL,
  `t_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`id`, `position`, `t_id`) VALUES
(201, 'Coach', 11),
(202, 'Analyst', 11),
(204, 'Coach', 13),
(205, 'Coach', 14),
(206, 'Analyst', 15),
(207, 'Analyst', 16),
(208, 'Coach', 12),
(209, 'Coach', 16),
(210, 'Coach', 15);

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE IF NOT EXISTS `day` (
  `d_number` int(1) NOT NULL,
  `w_number` int(2) NOT NULL,
  `continent` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`d_number`, `w_number`, `continent`) VALUES
(1, 1, 'Europe'),
(2, 1, 'Europe'),
(1, 1, 'North America'),
(2, 1, 'North America'),
(1, 2, 'Europe'),
(2, 2, 'Europe'),
(1, 2, 'North America'),
(2, 2, 'North America'),
(1, 3, 'Europe'),
(2, 3, 'Europe'),
(1, 3, 'North America'),
(2, 3, 'North America');

-- --------------------------------------------------------

--
-- Table structure for table `disables`
--

CREATE TABLE IF NOT EXISTS `disables` (
  `version` int(2) NOT NULL,
  `c_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disables`
--

INSERT INTO `disables` (`version`, `c_id`) VALUES
(9, 101),
(5, 103),
(6, 105),
(5, 108),
(7, 109),
(7, 110);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `code` int(3) NOT NULL,
  `g_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `g_duration` int(3) DEFAULT NULL,
  `d_number` int(1) NOT NULL,
  `w_number` int(2) NOT NULL,
  `continent` varchar(13) NOT NULL,
  `blue_t` int(3) NOT NULL,
  `red_t` int(3) NOT NULL,
  `winner_t` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`code`, `g_date`, `g_duration`, `d_number`, `w_number`, `continent`, `blue_t`, `red_t`, `winner_t`) VALUES
(106, '2004-01-20 15:17:00', 35, 2, 1, 'North America', 12, 13, 12),
(107, '2004-01-20 15:18:30', 28, 2, 1, 'North America', 11, 15, 15),
(108, '2004-01-20 15:19:30', 28, 2, 1, 'North America', 14, 16, 16),
(151, '2001-01-20 15:13:00', 45, 1, 1, 'Europe', 11, 12, 12),
(152, '2001-01-20 15:14:30', 38, 1, 1, 'Europe', 13, 14, 13),
(153, '2001-01-20 15:16:00', 31, 1, 1, 'Europe', 15, 16, 16);

--
-- Triggers `game`
--
DELIMITER //
CREATE TRIGGER `boston_vehicle_check` BEFORE INSERT ON `game`
 FOR EACH ROW BEGIN
  IF (New.g_duration < 0) THEN
      SIGNAL SQLSTATE '02002' SET MESSAGE_TEXT = 'Game duration less than 0';
  END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patch`
--

CREATE TABLE IF NOT EXISTS `patch` (
  `version` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patch`
--

INSERT INTO `patch` (`version`) VALUES
(5),
(6),
(7),
(8),
(9);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(3) NOT NULL,
  `game_id` varchar(35) NOT NULL,
  `name` varchar(35) NOT NULL,
  `nationality` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `game_id`, `name`, `nationality`) VALUES
(101, 'Balls', 'An Le', 'USA'),
(102, 'Meteos', 'William Hartman', 'USA'),
(103, 'Incarnati0n', 'Nicolaj Jensen', 'Denmark'),
(104, 'Sneaky', 'Zachary Scuderi', 'USA'),
(105, 'LemonNation', 'Daerek Hart', 'USA'),
(106, 'ZionSpartan', 'Darshan Upadhyaya', 'Canada'),
(107, 'Xmithie', 'Alfred Schmidt', 'Dutch'),
(108, 'Pobelter', 'Eugene Park', 'USA'),
(109, 'Doublelift', 'Yiliang Peng', 'USA'),
(110, 'Aphromoo', 'Zaqueri Black', 'USA'),
(111, 'Flaresz', 'Cuong Ta', 'USA'),
(112, 'Trashy', 'Jonas Andersen', 'Denmark'),
(113, 'Innox', 'Tyson Kapler', 'Canada'),
(114, 'Otter', 'Brian Baniqued', 'USA'),
(115, 'Bodydrop', 'Adam Krauthaker', 'Canada'),
(116, 'Hauntzer', 'Kevin Yarnell', 'USA'),
(117, 'Move', 'Kang Min-su', 'South Korea'),
(118, 'Keane', 'Lae-Young Jang', 'South Korea'),
(119, 'Altec', 'Johnny Ru', 'Canada'),
(120, 'Bunny FuFuu', 'Michael Kurylo', 'USA'),
(201, 'Charlie', 'Charlie Lipsie', 'China'),
(202, 'Hai', 'Hai Lam', 'USA'),
(203, 'HuHi', 'Choi Jae-hyun', 'South Korea'),
(204, 'Lazydude', 'Brad Marx', 'USA'),
(205, 'LS', 'Nick De Cesare', 'USA'),
(206, 'Matthew Schmieder', 'Matthew Schmieder', 'USA'),
(207, 'Rico', 'Rico', 'USA'),
(208, 'chain', 'Kim Dong-woo', 'South Korea'),
(209, 'Fly', 'Sangchul Kim', 'South Korea'),
(210, 'Peter', 'Peter Zhang', 'China');

-- --------------------------------------------------------

--
-- Stand-in structure for view `person_coaches`
--
CREATE TABLE IF NOT EXISTS `person_coaches` (
`id` int(3)
,`game_id` varchar(35)
,`name` varchar(35)
,`nationality` varchar(35)
,`position` varchar(7)
,`t_id` int(3)
);
-- --------------------------------------------------------

--
-- Variable
--

DECLARE @Myvariable int 
SET @Myvariable = 101
Select role, birth_date, t_id, name 
FROM player, person 
WHERE id>=@Myvariable;

-- --------------------------------------------------------

--
-- Stand-in structure for view `person_players`
--
CREATE TABLE IF NOT EXISTS `person_players` (
`id` int(3)
,`game_id` varchar(35)
,`name` varchar(35)
,`nationality` varchar(35)
,`role` varchar(8)
,`age` date
,`birth_date` date
,`t_id` int(3)
);
-- --------------------------------------------------------
--
-- Function plays
--
CREATE FUNCTION `avg_kills`(player IN INTEGER)
RETURN INTEGER IS
pkills INTEGER;
BEGIN
SELECT avg (kills) INTO pkills FROM `plays`p WHERE `player`  = p.id;
RETURN pkills;
END;

-- ---------------------------------------------------------
--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `id` int(3) NOT NULL,
  `role` varchar(8) NOT NULL,
  `birth_date` date NOT NULL,
  `t_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `role`, `birth_date`, `t_id`) VALUES
(101, 'Top', '1994-06-22', 11),
(102, 'Jungler', '1993-01-01', 11),
(103, 'Mid', '1993-02-02', 11),
(104, 'AD Carry', '1994-03-19', 11),
(105, 'Support', '1989-06-15', 11),
(106, 'Top', '1994-11-12', 12),
(107, 'Jungler', '1991-05-10', 12),
(108, 'Mid', '1995-10-14', 12),
(109, 'AD Carry', '1993-07-19', 12),
(110, 'Support', '1992-09-08', 12),
(111, 'Top', '1993-03-03', 13),
(112, 'Jungler', '1993-04-04', 13),
(113, 'Mid', '1995-07-05', 13),
(114, 'AD Carry', '1993-05-05', 13),
(115, 'Support', '1993-06-06', 13),
(116, 'Top', '1995-05-20', 14),
(117, 'Jungler', '1992-05-23', 14),
(118, 'Mid', '1993-07-07', 14),
(119, 'AD Carry', '1997-05-08', 14),
(120, 'Support', '1993-08-08', 14);

--
-- Triggers `player`
--
DELIMITER //
CREATE TRIGGER `DeletePlayer` AFTER DELETE ON `player`
 FOR EACH ROW begin

delete from plays

where id = old.id;



delete from player

where id = old.id;



delete from person

where id = old.id;

end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `plays`
--

CREATE TABLE IF NOT EXISTS `plays` (
  `id` int(3) NOT NULL,
  `code` int(3) NOT NULL,
  `kills` int(2) NOT NULL,
  `deaths` int(2) NOT NULL,
  `assists` int(2) NOT NULL,
  `creeps_slain` int(3) NOT NULL,
  `gold` int(5) NOT NULL,
  `c_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plays`
--

INSERT INTO `plays` (`id`, `code`, `kills`, `deaths`, `assists`, `creeps_slain`, `gold`, `c_id`) VALUES
(101, 106, 3, 2, 11, 220, 16142, 110),
(102, 106, 6, 0, 16, 174, 17126, 107),
(103, 108, 4, 4, 8, 249, 16996, 108),
(104, 151, 10, 1, 6, 282, 19328, 109),
(105, 152, 1, 3, 19, 31, 13564, 104),
(106, 153, 3, 4, 3, 207, 15762, 105);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `continent` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`continent`) VALUES
('Europe'),
('North America');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE IF NOT EXISTS `sponsors` (
  `b_id` int(3) NOT NULL,
  `t_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`b_id`, `t_id`) VALUES
(21, 11),
(25, 11),
(22, 12),
(26, 12),
(24, 13),
(21, 14),
(22, 14),
(21, 15),
(21, 16),
(23, 16);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `t_id` int(3) NOT NULL,
  `tag` varchar(6) NOT NULL,
  `t_name` varchar(24) NOT NULL,
  `wins` int(2) NOT NULL,
  `losses` int(2) NOT NULL,
  `fundation_date` date NOT NULL,
  `continent` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`t_id`, `tag`, `t_name`, `wins`, `losses`, `fundation_date`, `continent`) VALUES
(11, 'C9', 'Cloud9', 0, 0, '2012-12-01', 'North America'),
(12, 'CLG', 'Counter Logic Gaming', 0, 0, '2010-04-01', 'North America'),
(13, 'NME', 'Enemy Esports', 0, 0, '2014-11-01', 'North America'),
(14, 'GV', 'Gravity', 0, 0, '2015-01-01', 'North America'),
(15, 'T8', 'Team 8', 0, 0, '2013-12-01', 'North America'),
(16, 'Dig', 'Team Dignitas', 0, 0, '2011-09-01', 'North America');

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE IF NOT EXISTS `week` (
  `w_number` int(2) NOT NULL,
  `continent` varchar(13) NOT NULL,
  `version` int(2) NOT NULL,
  `week_mvp` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `week`
--

INSERT INTO `week` (`w_number`, `continent`, `version`, `week_mvp`) VALUES
(1, 'Europe', 8, 114),
(1, 'North America', 5, 101),
(2, 'Europe', 8, 115),
(2, 'North America', 5, 103),
(3, 'Europe', 8, 119),
(3, 'North America', 6, 106),
(4, 'North America', 6, 109),
(5, 'North America', 7, 110),
(6, 'North America', 8, 112);

--
-- Triggers `week`
--
DELIMITER //
CREATE TRIGGER `trig1` BEFORE INSERT ON `week`
 FOR EACH ROW BEGIN
  IF (New.w_number < 0) THEN
      SIGNAL SQLSTATE '02002' SET MESSAGE_TEXT = 'week number less than 0';
  END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `person_coaches`
--
DROP TABLE IF EXISTS `person_coaches`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kgupta`@`localhost` SQL SECURITY DEFINER VIEW `person_coaches` AS select `person`.`id` AS `id`,`person`.`game_id` AS `game_id`,`person`.`name` AS `name`,`person`.`nationality` AS `nationality`,`coach`.`position` AS `position`,`coach`.`t_id` AS `t_id` from (`person` join `coach`);

-- --------------------------------------------------------

--
-- Structure for view `person_players`
--
DROP TABLE IF EXISTS `person_players`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kgupta`@`localhost` SQL SECURITY DEFINER VIEW `person_players` AS select `player`.`id` AS `id`,`person`.`game_id` AS `game_id`,`person`.`name` AS `name`,`person`.`nationality` AS `nationality`,`player`.`role` AS `role`,`player`.`birth_date` AS `age`,`player`.`birth_date` AS `birth_date`,`player`.`t_id` AS `t_id` from (`person` join `player`);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
 ADD PRIMARY KEY (`b_id`), ADD UNIQUE KEY `b_name` (`b_name`);

--
-- Indexes for table `champion`
--
ALTER TABLE `champion`
 ADD PRIMARY KEY (`c_id`), ADD UNIQUE KEY `c_name` (`c_name`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
 ADD PRIMARY KEY (`id`), ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `day`
--
ALTER TABLE `day`
 ADD PRIMARY KEY (`d_number`,`w_number`,`continent`), ADD KEY `w_number` (`w_number`,`continent`);

--
-- Indexes for table `disables`
--
ALTER TABLE `disables`
 ADD PRIMARY KEY (`version`,`c_id`), ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
 ADD PRIMARY KEY (`code`), ADD UNIQUE KEY `g_date` (`g_date`), ADD KEY `d_number` (`d_number`,`w_number`,`continent`), ADD KEY `blue_t` (`blue_t`), ADD KEY `red_t` (`red_t`), ADD KEY `winner_t` (`winner_t`);

--
-- Indexes for table `patch`
--
ALTER TABLE `patch`
 ADD PRIMARY KEY (`version`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `game_id` (`game_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`id`), ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `plays`
--
ALTER TABLE `plays`
 ADD PRIMARY KEY (`id`,`code`), ADD KEY `code` (`code`), ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
 ADD PRIMARY KEY (`continent`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
 ADD PRIMARY KEY (`b_id`,`t_id`), ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
 ADD PRIMARY KEY (`t_id`), ADD UNIQUE KEY `tag` (`tag`), ADD UNIQUE KEY `t_name` (`t_name`), ADD KEY `continent` (`continent`);

--
-- Indexes for table `week`
--
ALTER TABLE `week`
 ADD PRIMARY KEY (`w_number`,`continent`), ADD KEY `continent` (`continent`), ADD KEY `version` (`version`), ADD KEY `week_mvp` (`week_mvp`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coach`
--
ALTER TABLE `coach`
ADD CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`id`) REFERENCES `person` (`id`),
ADD CONSTRAINT `coach_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`);

--
-- Constraints for table `day`
--
ALTER TABLE `day`
ADD CONSTRAINT `day_ibfk_1` FOREIGN KEY (`w_number`, `continent`) REFERENCES `week` (`w_number`, `continent`);

--
-- Constraints for table `disables`
--
ALTER TABLE `disables`
ADD CONSTRAINT `disables_ibfk_1` FOREIGN KEY (`version`) REFERENCES `patch` (`version`),
ADD CONSTRAINT `disables_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `champion` (`c_id`);

--
-- Constraints for table `game`
--
ALTER TABLE `game`
ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`d_number`, `w_number`, `continent`) REFERENCES `day` (`d_number`, `w_number`, `continent`),
ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`blue_t`) REFERENCES `team` (`t_id`),
ADD CONSTRAINT `game_ibfk_3` FOREIGN KEY (`red_t`) REFERENCES `team` (`t_id`),
ADD CONSTRAINT `game_ibfk_4` FOREIGN KEY (`winner_t`) REFERENCES `team` (`t_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`id`) REFERENCES `person` (`id`),
ADD CONSTRAINT `player_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`);

--
-- Constraints for table `plays`
--
ALTER TABLE `plays`
ADD CONSTRAINT `plays_ibfk_1` FOREIGN KEY (`id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `plays_ibfk_2` FOREIGN KEY (`code`) REFERENCES `game` (`code`),
ADD CONSTRAINT `plays_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `champion` (`c_id`);

--
-- Constraints for table `sponsors`
--
ALTER TABLE `sponsors`
ADD CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `brand` (`b_id`),
ADD CONSTRAINT `sponsors_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`continent`) REFERENCES `region` (`continent`);

--
-- Constraints for table `week`
--
ALTER TABLE `week`
ADD CONSTRAINT `week_ibfk_1` FOREIGN KEY (`continent`) REFERENCES `region` (`continent`),
ADD CONSTRAINT `week_ibfk_2` FOREIGN KEY (`version`) REFERENCES `patch` (`version`),
ADD CONSTRAINT `week_ibfk_3` FOREIGN KEY (`week_mvp`) REFERENCES `player` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
