-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2021 at 04:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'User', 'user@gmail.com', '6ad14ba9986e3615423dfca256d04e3f');

-- --------------------------------------------------------

--
-- Table structure for table `doodle_time`
--

CREATE TABLE `doodle_time` (
  `id` int(11) NOT NULL,
  `time` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doodle_time`
--

INSERT INTO `doodle_time` (`id`, `time`) VALUES
(1, '13:52'),
(2, '14:52'),
(3, '15:52'),
(4, '16:52'),
(5, '17:52'),
(6, '18:52'),
(7, '19:52'),
(8, '20:52'),
(9, '21:52'),
(10, '22:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_doodle`
--

CREATE TABLE `user_doodle` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `doodle_time_availibility` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_doodle`
--

INSERT INTO `user_doodle` (`id`, `user_name`, `doodle_time_availibility`) VALUES
(2, 'h', '2,3'),
(5, 'Syed Ali Gilani', '1,2'),
(6, 'Alex Hales', '2'),
(7, 'Umer', '1,3'),
(8, 'demo', '1,3,5,7,9');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doodle_time`
--
ALTER TABLE `doodle_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_doodle`
--
ALTER TABLE `user_doodle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doodle_time`
--
ALTER TABLE `doodle_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_doodle`
--
ALTER TABLE `user_doodle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
