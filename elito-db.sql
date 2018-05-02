-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2018 at 01:48 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elito-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`user_id`, `password`, `email_id`) VALUES
('Ruchit_007', 'rks@9044', 'ruchitsherathiya007@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(10) NOT NULL,
  `event_name` varchar(45) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `event_conduct_date` date NOT NULL,
  `event_description` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='				';

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `user_id`, `event_conduct_date`, `event_description`) VALUES
(1, 'Indution', 'Ruchit_007', '2018-07-01', 'BIG EVENT');

-- --------------------------------------------------------

--
-- Table structure for table `project_showcase`
--

CREATE TABLE `project_showcase` (
  `user_id` varchar(20) NOT NULL,
  `project_id` int(10) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `project_description` varchar(600) NOT NULL,
  `project_posted_date` date NOT NULL,
  `project_ranking` int(10) NOT NULL,
  `project_review` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_showcase`
--

INSERT INTO `project_showcase` (`user_id`, `project_id`, `project_name`, `project_description`, `project_posted_date`, `project_ranking`, `project_review`) VALUES
('Ruchit_007', 1, 'ELITO', 'This is the best project of LPU', '2018-04-28', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewId` int(10) NOT NULL,
  `projectId` int(10) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `review` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(10) NOT NULL,
  `team_name` varchar(20) DEFAULT NULL,
  `team_head_id` varchar(20) NOT NULL,
  `no_of_members` int(30) NOT NULL,
  `team_description` varchar(600) NOT NULL,
  `team_date_formation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trustedreviewers`
--

CREATE TABLE `trustedreviewers` (
  `trustedId` int(10) NOT NULL,
  `trustedReviewerId` varchar(20) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `trustedReview` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `reg_no` int(9) NOT NULL,
  `dob` date NOT NULL,
  `department` varchar(45) NOT NULL,
  `current_year` int(6) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `mobile_no` int(10) NOT NULL,
  `project_completed` double NOT NULL,
  `user_rank` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `reg_no`, `dob`, `department`, `current_year`, `gender`, `mobile_no`, `project_completed`, `user_rank`) VALUES
('Ruchit_007', 'Ruchit', 'Sherathiya', 11715740, '1999-01-11', 'Computer Science And Engineering', 1, 'Male', 910625001, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `email_id_UNIQUE` (`email_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `project_showcase`
--
ALTER TABLE `project_showcase`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `project_ranking_UNIQUE` (`project_ranking`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewId`),
  ADD UNIQUE KEY `project_id` (`projectId`),
  ADD UNIQUE KEY `user_id` (`userId`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`,`team_head_id`),
  ADD UNIQUE KEY `team_id_UNIQUE` (`team_id`),
  ADD UNIQUE KEY `team_head_id_UNIQUE` (`team_head_id`);

--
-- Indexes for table `trustedreviewers`
--
ALTER TABLE `trustedreviewers`
  ADD PRIMARY KEY (`trustedId`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD UNIQUE KEY `trustedReviewerId` (`trustedReviewerId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`,`reg_no`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `reg_no_UNIQUE` (`reg_no`),
  ADD UNIQUE KEY `mobile_no_UNIQUE` (`mobile_no`),
  ADD UNIQUE KEY `user_rank_UNIQUE` (`user_rank`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trustedreviewers`
--
ALTER TABLE `trustedreviewers`
  MODIFY `trustedId` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_showcase`
--
ALTER TABLE `project_showcase`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
