-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2021 at 05:49 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ship_ticketing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(30) NOT NULL,
  `accommodation` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accommodations`
--

INSERT INTO `accommodations` (`id`, `accommodation`, `description`, `date_created`) VALUES
(1, 'CABIN FOR 6', 'Accom 101', '2021-08-28 10:43:12'),
(2, 'TOURIST CLASS', 'Accom 102', '2021-08-28 10:43:45'),
(3, 'CABIN FOR 4', 'Accom 103', '2021-08-28 10:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `port_list`
--

CREATE TABLE `port_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `port_list`
--

INSERT INTO `port_list` (`id`, `name`, `location`, `date_created`) VALUES
(1, 'Sample Port 101', 'Location 1', '2021-08-28 10:34:53'),
(2, 'Sample Port 102', 'Location 2', '2021-08-28 10:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(30) NOT NULL,
  `ticket_number` varchar(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `accommodation_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `ticket_price` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = Confirmed, 2 = Cancel',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `ticket_number`, `schedule_id`, `accommodation_id`, `name`, `gender`, `contact`, `address`, `dob`, `ticket_price`, `status`, `date_created`, `date_updated`) VALUES
(1, 2147483647, 2, 3, 'John D Smith', 'Male', '09123456789', 'Sample Address', '1997-06-23', 2000, 1, '2021-08-28 16:03:48', '2021-08-28 16:31:16'),
(2, 2147483647, 2, 2, 'Mike Williams', 'Male', '09456789321', 'Sample Address', '1997-10-14', 1300, 1, '2021-08-28 16:33:39', NULL),
(3, 2147483647, 2, 1, 'George Wilson', 'Male', '09321654987', 'Sample Address', '1997-07-15', 1600, 2, '2021-08-28 16:33:39', '2021-08-29 22:50:37'),
(5, 2147483647, 3, 2, 'Claire Blake', 'Female', '09123989456', 'Sample address ', '1997-12-07', 900, 1, '2021-08-29 23:39:58', '2021-08-29 23:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `port_from_id` int(30) NOT NULL,
  `port_to_id` int(30) NOT NULL,
  `ship_id` int(30) NOT NULL,
  `departure_datetime` datetime DEFAULT NULL,
  `arrival_datetime` datetime DEFAULT NULL,
  `total_passengers` int(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `port_from_id`, `port_to_id`, `ship_id`, `departure_datetime`, `arrival_datetime`, `total_passengers`, `date_created`, `date_updated`) VALUES
(2, 2, 1, 1, '2021-08-30 13:00:00', '2021-08-31 13:00:00', 0, '2021-08-28 13:41:48', '2021-08-28 14:07:48'),
(3, 2, 1, 2, '2021-09-02 23:00:00', '2021-09-03 02:00:00', 0, '2021-08-29 23:41:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sched_accom`
--

CREATE TABLE `sched_accom` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `accommodation_id` int(30) NOT NULL,
  `net_fare` float NOT NULL,
  `max_passenger` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sched_accom`
--

INSERT INTO `sched_accom` (`id`, `schedule_id`, `accommodation_id`, `net_fare`, `max_passenger`) VALUES
(4, 2, 3, 2000, 80),
(5, 2, 1, 1600, 60),
(6, 2, 2, 1300, 200),
(7, 3, 3, 1500, 40),
(8, 3, 1, 1300, 0),
(9, 3, 2, 900, 150);

-- --------------------------------------------------------

--
-- Table structure for table `ship_list`
--

CREATE TABLE `ship_list` (
  `id` int(30) NOT NULL,
  `id_code` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ship_list`
--

INSERT INTO `ship_list` (`id`, `id_code`, `name`, `description`, `status`, `date_created`) VALUES
(1, '78954', 'Vessel 101', 'Sample Vessel 101', 1, '2021-08-28 10:22:54'),
(2, '65499', 'Vessel 102', 'Sample Vessel 2', 1, '2021-08-28 10:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Ship/Ferry Ticket Reservation System - PHP'),
(6, 'short_name', 'SFTRS - PHP'),
(11, 'logo', 'uploads/1630115400_ship_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630250880_vessel.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(2, 'John', 'Smith', 'jsmith@sample.com', '39ce7e2a8573b41ce73b5ba41617f8f7', 'uploads/1630246860_male.png', NULL, 2, '2021-08-29 22:21:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `port_list`
--
ALTER TABLE `port_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sched_accom`
--
ALTER TABLE `sched_accom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `ship_list`
--
ALTER TABLE `ship_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `port_list`
--
ALTER TABLE `port_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sched_accom`
--
ALTER TABLE `sched_accom`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ship_list`
--
ALTER TABLE `ship_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sched_accom`
--
ALTER TABLE `sched_accom`
  ADD CONSTRAINT `sched_accom_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
