-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2014 at 02:50 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `job_seeker`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `Category_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`Category_Id`),
  KEY `Category_Id` (`Category_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_Id`, `Category_Name`) VALUES
(1, 'Babysitting'),
(2, 'painting'),
(3, 'computer help'),
(4, 'reparing bike'),
(5, 'Cleaning'),
(6, 'Delivery / Moving');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `City_Id` int(10) NOT NULL AUTO_INCREMENT,
  `City_Name` varchar(128) CHARACTER SET utf32 COLLATE utf32_swedish_ci NOT NULL,
  `Country_Id` int(10) NOT NULL,
  PRIMARY KEY (`City_Id`),
  UNIQUE KEY `City_Id` (`City_Id`),
  UNIQUE KEY `City_Id_2` (`City_Id`),
  KEY `Country_Id` (`Country_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`City_Id`, `City_Name`, `Country_Id`) VALUES
(0, 'All Sweden', 1),
(1, 'Västerbotten', 1),
(2, 'Jämtland', 1),
(3, 'Västernorrland', 1),
(4, 'Gävleborg', 1),
(5, 'Dalarna', 1),
(6, 'Värmland', 1),
(7, 'Örebro', 1),
(8, 'Västmanland', 1),
(9, 'Uppsala', 1),
(10, 'Stockholm', 1),
(11, 'Södermanland', 1),
(12, 'Skaraborg', 1),
(13, 'Östergötland', 1),
(14, 'Göteborg', 1),
(15, 'Älvsborg', 1),
(16, 'Jönköping', 1),
(17, 'Kalmar', 1),
(18, 'Gotland', 1),
(19, 'Halland', 1),
(20, 'Kronoberg', 1),
(21, 'Blekinge', 1),
(22, 'Skåne', 1),
(23, 'Norrbotten', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `Country_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Country_Name` varchar(128) NOT NULL,
  PRIMARY KEY (`Country_Id`),
  KEY `Country_Id` (`Country_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Country_Id`, `Country_Name`) VALUES
(1, 'Sweden');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `Job_id` int(10) NOT NULL AUTO_INCREMENT,
  `Job_title` varchar(128) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Category_id` int(10) NOT NULL,
  `Description` varchar(1024) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Start_Time` date NOT NULL,
  `End_Time` date NOT NULL,
  `Employer_id` int(10) NOT NULL,
  `Location` int(10) NOT NULL,
  `Maximum_Salary` int(128) NOT NULL,
  `Is_Finished` tinyint(1) NOT NULL DEFAULT '0',
  `Worker_Id` int(10) DEFAULT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`Job_id`),
  KEY `Job_id` (`Job_id`),
  KEY `Employer_id` (`Employer_id`),
  KEY `Worker_Id` (`Worker_Id`),
  KEY `Category_id` (`Category_id`,`Employer_id`,`Worker_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`Job_id`, `Job_title`, `Category_id`, `Description`, `Start_Time`, `End_Time`, `Employer_id`, `Location`, `Maximum_Salary`, `Is_Finished`, `Worker_Id`, `Date_created`) VALUES
(5, 'paint', 2, 'lol lol test', '0000-00-00', '0000-00-00', 7, 5, 80, 0, NULL, '0000-00-00 00:00:00'),
(6, 'paint', 2, 'lol lol test', '0000-00-00', '0000-00-00', 7, 5, 100, 0, NULL, '2014-05-27 23:18:17'),
(7, 'Last one', 2, 'lol lol test', '0000-00-00', '0000-00-00', 7, 5, 50, 0, NULL, '2014-05-27 23:18:58'),
(8, 'test', 1, 't', '0000-00-00', '0000-00-00', 7, 3, 22, 0, NULL, '0000-00-00 00:00:00'),
(9, '6', 1, '500', '0000-00-00', '0000-00-00', 7, 11, 50, 0, NULL, '0000-00-00 00:00:00'),
(10, '6', 1, '500', '0000-00-00', '0000-00-00', 7, 11, 50, 0, NULL, '0000-00-00 00:00:00'),
(11, '6', 1, '500', '0000-00-00', '0000-00-00', 7, 11, 50, 0, NULL, '0000-00-00 00:00:00'),
(12, 'titre', 1, 'description\r\n', '0000-00-00', '0000-00-00', 7, 11, 50, 0, NULL, '0000-00-00 00:00:00'),
(13, 'tttt', 1, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 0, 0, NULL, '0000-00-00 00:00:00'),
(14, 'tttt', 1, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 0, 0, NULL, '0000-00-00 00:00:00'),
(15, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 0, 0, NULL, '0000-00-00 00:00:00'),
(16, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '0000-00-00 00:00:00'),
(17, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '0000-00-00 00:00:00'),
(18, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '0000-00-00 00:00:00'),
(19, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '0000-00-00 00:00:00'),
(20, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '0000-00-00 00:00:00'),
(21, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '2014-05-29 18:13:16'),
(22, 'tttt', 4, 'tttt', '0000-00-00', '0000-00-00', 7, 0, 5000, 0, NULL, '2014-05-29 18:14:16'),
(23, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 18:18:17'),
(24, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 18:21:01'),
(25, 'rrrr', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:22:32'),
(26, 'rrrr', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:24:05'),
(27, 'rrrr', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:24:38'),
(28, 'the last test', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:25:16'),
(29, 'the last test', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:28:21'),
(30, 'the last test', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:28:21'),
(31, 'the last test', 1, 'rrr', '0000-00-00', '0000-00-00', 7, 23, 50, 0, NULL, '2014-05-29 18:30:22'),
(32, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:06:16'),
(33, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:06:31'),
(34, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:07:09'),
(35, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:07:47'),
(36, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:09:22'),
(37, '', 1, '', '2014-07-05', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:15:38'),
(38, '', 1, '', '2014-07-05', '2015-07-05', 7, 23, 0, 0, NULL, '2014-05-29 20:16:41'),
(39, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:29:13'),
(40, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:31:14'),
(41, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:31:37'),
(42, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:32:12'),
(43, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:34:46'),
(44, '', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:34:54'),
(45, '4324', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:44:42'),
(46, 'titel', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:46:41'),
(47, 'titel', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:47:07'),
(48, '2342', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:48:06'),
(49, '3423', 1, '', '0000-00-00', '0000-00-00', 7, 23, 0, 0, NULL, '2014-05-29 20:58:10'),
(50, 'Test', 1, 'Test a jobs', '2014-01-06', '2015-05-06', 8, 18, 500, 0, NULL, '2014-06-01 12:20:58'),
(51, '123', 3, '321', '2014-06-01', '2014-06-05', 8, 2, 123321, 0, NULL, '2014-06-01 15:45:33'),
(52, 'test a job', 6, 'test a job', '2014-01-06', '2016-06-06', 8, 9, 9000, 0, NULL, '2014-06-01 16:19:32'),
(53, 'test', 1, '42343424', '2014-06-01', '2014-06-30', 8, 9, 9090, 0, NULL, '2014-06-01 16:22:59'),
(54, 'post a job for test', 1, 'this is a test job', '2014-06-23', '2014-09-01', 8, 10, 15000, 0, NULL, '2014-06-01 16:31:50'),
(55, 'new Job', 1, 'this is a test', '2014-06-03', '2014-06-04', 9, 18, 1000, 0, NULL, '2014-06-03 22:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `job_applicants`
--

CREATE TABLE IF NOT EXISTS `job_applicants` (
  `Person_Id` int(10) NOT NULL,
  `Job_Id` int(10) NOT NULL,
  `Comment` varchar(1024) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Proposed_Salary` int(128) NOT NULL,
  `Date_Created` datetime NOT NULL,
  `Is_Deleted` tinyint(1) NOT NULL DEFAULT '0',
  `Application_Id` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Application_Id`),
  KEY `Person_Id` (`Person_Id`),
  KEY `Job_Id` (`Job_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `job_applicants`
--

INSERT INTO `job_applicants` (`Person_Id`, `Job_Id`, `Comment`, `Proposed_Salary`, `Date_Created`, `Is_Deleted`, `Application_Id`) VALUES
(8, 54, '11111', 900, '0000-00-00 00:00:00', 0, 1),
(9, 20, 'hi i want to apply', 1000, '2014-06-04 00:40:07', 0, 2),
(10, 55, 'hi', 100, '2014-06-04 00:43:23', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `job_seeker_category`
--

CREATE TABLE IF NOT EXISTS `job_seeker_category` (
  `Profile_Id` int(10) NOT NULL,
  `Category_Id` int(10) NOT NULL,
  PRIMARY KEY (`Profile_Id`,`Category_Id`),
  KEY `Profile_Id` (`Profile_Id`,`Category_Id`),
  KEY `Category_Id` (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderID` int(11) NOT NULL,
  `receiverID` int(11) NOT NULL,
  `message` text NOT NULL,
  `time` datetime NOT NULL,
  `isRead` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `receiverID` (`receiverID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `senderID`, `receiverID`, `message`, `time`, `isRead`) VALUES
(1, 9999, 8, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2014-05-28 17:14:10', 1),
(2, 6, 8, 'This page contains examples of all the styled elements available as part of this design. Use this page for reference, whilst you build your website.', '2014-05-08 06:24:26', 1),
(3, 9999, 8, 'just for test!', '2014-06-01 01:14:57', 1),
(4, 9999, 8, 'You logined out at 2014-06-01 01:40:14. If it''s not your behavior, please change your password!', '2014-06-01 01:40:14', 1),
(5, 9999, 8, 'You logined in at 2014-06-01 01:40:18. If it''s not your behavior, please change your password!', '2014-06-01 01:40:18', 1),
(6, 9999, 8, 'You post a job [post a job for test] at 2014-06-01 04:31:50.', '2014-06-01 04:31:50', 1),
(7, 9999, 8, 'You logged out at 2014-06-03 01:03:30. If it''s not your behavior, please change your password!', '2014-06-03 01:03:30', 1),
(8, 9999, 8, 'You logged in at 2014-06-03 01:12:55. If it''s not your behavior, please change your password!', '2014-06-03 01:12:55', 1),
(9, 9999, 8, 'You logged out at 2014-06-03 02:06:19. If it''s not your behavior, please change your password!', '2014-06-03 02:06:19', 1),
(10, 9999, 8, 'You logged in at 2014-06-03 02:08:27. If it''s not your behavior, please change your password!', '2014-06-03 02:08:27', 1),
(11, 9999, 8, 'You logged out at 2014-06-03 03:11:27. If it''s not your behavior, please change your password!', '2014-06-03 03:11:27', 0),
(13, 9999, 9, 'You logged in at 2014-06-03 10:55:31. If it''s not your behavior, please change your password!', '2014-06-03 10:55:31', 1),
(14, 9999, 9, 'You post a job [new Job] at 2014-06-03 10:56:20.', '2014-06-03 10:56:20', 1),
(15, 9999, 7, '[2014-06-04 12:40:07] john has applied your job[<a href=''./display.html?id=20''>20</a>].', '2014-06-04 12:40:07', 0),
(16, 9999, 10, 'You logged in at 2014-06-04 12:43:07. If it''s not your behavior, please change your password!', '2014-06-04 12:43:07', 0),
(17, 9999, 9, '[2014-06-04 12:43:23] johny has applied your job[<a href=''./display.html?id=55''>55</a>].', '2014-06-04 12:43:23', 1),
(18, 9999, 9, 'You logged in at 2014-06-04 12:43:59. If it''s not your behavior, please change your password!', '2014-06-04 12:43:59', 1),
(19, 9999, 9, '[2014-06-04 02:02:30] john has commented[<a href=''./showProfile.html?profileId=10''</a>].', '2014-06-04 02:02:30', 1),
(20, 9999, 9, '[2014-06-04 02:07:59] john has commented [<a href=''./displayjob.php?jobId=''></a>].', '2014-06-04 02:07:59', 1),
(21, 9999, 10, '[2014-06-04 02:08:42] john has commented [<a href=''./displayjob.php</a>].', '2014-06-04 02:08:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `Comment_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Profile_Id` int(10) NOT NULL,
  `Job_Id` int(10) NOT NULL,
  `Comment` varchar(1024) NOT NULL,
  `Rating` int(10) NOT NULL,
  `Commenter_Id` int(10) NOT NULL,
  `Date_created` datetime NOT NULL,
  `Is_Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Comment_Id`),
  KEY `Commenter_Id` (`Commenter_Id`),
  KEY `Profile_Id` (`Profile_Id`),
  KEY `Job_Id` (`Job_Id`),
  KEY `Job_Id_2` (`Job_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Comment_Id`, `Profile_Id`, `Job_Id`, `Comment`, `Rating`, `Commenter_Id`, `Date_created`, `Is_Deleted`) VALUES
(6, 2, 5, 'try', 0, 1, '0000-00-00 00:00:00', 0),
(7, 1, 0, 'comment', 0, 2, '0000-00-00 00:00:00', 0),
(8, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(9, 10, 0, 'trytry', 0, 9, '0000-00-00 00:00:00', 0),
(10, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(11, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(12, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(13, 10, 0, '123', 0, 9, '0000-00-00 00:00:00', 0),
(14, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(15, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(16, 0, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0),
(17, 10, 0, 'try', 0, 9, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Profile_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Email` varchar(128) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Address` varchar(1024) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Postal_Code` int(10) NOT NULL,
  `City_Id` int(4) NOT NULL,
  `Country_Id` int(4) NOT NULL,
  `Number_Of_Jobs` int(4) NOT NULL,
  `Descriptions` varchar(1024) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `Phone_Number` bigint(10) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Rating` int(4) NOT NULL,
  `Notification` tinyint(1) NOT NULL DEFAULT '0',
  `Gender` tinyint(1) NOT NULL,
  `Date_created` datetime NOT NULL,
  `Last_login` datetime NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`Profile_Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Person_Id` (`Profile_Id`),
  KEY `City_Id` (`City_Id`),
  KEY `Country_Id` (`Country_Id`),
  KEY `Number_Of_Jobs` (`Number_Of_Jobs`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Profile_Id`, `Name`, `Email`, `Address`, `Postal_Code`, `City_Id`, `Country_Id`, `Number_Of_Jobs`, `Descriptions`, `Phone_Number`, `Date_Of_Birth`, `Rating`, `Notification`, `Gender`, `Date_created`, `Last_login`, `username`, `password`) VALUES
(6, 'Amine Koraibi', 'amine', 'test', 29200, 9, 1, 0, '', 0, '0000-00-00', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 'Amine', 'Amine', 'totototol', 29200, 1, 1, 0, 'Test', 0, '2014-05-27', 0, 0, 0, '2014-05-27 00:00:00', '2014-05-27 00:00:00', 'test', '098f6bcd4621d373cade4e832627b4f6'),
(8, 'Testman', '333', '', 0, 9, 1, 0, '', 0, '0000-00-00', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '310dcbbf4cce62f762a2aaa148d556bd'),
(9, 'john', '', '', 0, 1, 1, 0, '', 0, '0000-00-00', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(10, 'johny', 'johnny', '', 0, 18, 1, 0, '', 0, '0000-00-00', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '5f4dcc3b5aa765d61d8327deb882cf99');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`Country_Id`) REFERENCES `country` (`Country_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`Employer_id`) REFERENCES `user` (`Profile_Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job_ibfk_2` FOREIGN KEY (`Worker_Id`) REFERENCES `rating` (`Profile_Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job_ibfk_3` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_Id`) ON UPDATE CASCADE;

--
-- Constraints for table `job_applicants`
--
ALTER TABLE `job_applicants`
  ADD CONSTRAINT `job_applicants_ibfk_1` FOREIGN KEY (`Person_Id`) REFERENCES `user` (`Profile_Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job_applicants_ibfk_2` FOREIGN KEY (`Job_Id`) REFERENCES `job` (`Job_id`) ON UPDATE CASCADE;

--
-- Constraints for table `job_seeker_category`
--
ALTER TABLE `job_seeker_category`
  ADD CONSTRAINT `job_seeker_category_ibfk_1` FOREIGN KEY (`Profile_Id`) REFERENCES `user` (`Profile_Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job_seeker_category_ibfk_2` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Category_Id`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`receiverID`) REFERENCES `user` (`Profile_Id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`City_Id`) REFERENCES `city` (`City_Id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Country_Id`) REFERENCES `city` (`Country_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
