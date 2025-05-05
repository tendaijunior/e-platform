-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 11:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblms`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_system_users`
--

CREATE TABLE `booking_system_users` (
  `id` int(50) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `last_name` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_system_users`
--

INSERT INTO `booking_system_users` (`id`, `first_name`, `middlename`, `last_name`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(4, 'Samantha', NULL, 'Betty', 'samantha', '1ed1255790523a907da869eab7306f5a', 'uploads/avatar-4.png?v=1641346647', NULL, 2, 1, '2022-01-05 09:36:56', '2025-04-30 20:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `font_awesome_class` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `name`, `parent`, `slug`, `date_added`, `last_modified`, `font_awesome_class`, `thumbnail`) VALUES
(1, '53bbe5156c', 'Safety', 0, 'safety', 1745272800, NULL, 'fas fa-fire-extinguisher', 'category-thumbnail.png');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('enmf0fdvodejqdl3l94q64la6bclpd0j', '127.0.0.1', 1746190293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139303239333b636172745f6974656d737c613a303a7b7d),
('sc0dr335h80etv9vthhej05calfuqumh', '127.0.0.1', 1746190594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139303539343b636172745f6974656d737c613a303a7b7d),
('c1jmbi5o1u3t2ne50a0veo66fqfj06im', '127.0.0.1', 1746190996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139303939363b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d757365725f69647c733a313a2230223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2274656e6973656e206d75223b666c6173685f6d6573736167657c733a31373a2257656c636f6d2074656e6973656e206d75223b757365725f6c6f67696e7c733a313a2231223b),
('g7guenrgv6q8t184qc3buqme6rt54mh9', '127.0.0.1', 1746193330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139333333303b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d757365725f69647c733a313a2230223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2274656e6973656e206d75223b666c6173685f6d6573736167657c733a36333a22436f75727365204164646564205375636365737366756c6c792e20506c65617365205761697420556e74696c6c2041646d696e20417070726f766573204974223b757365725f6c6f67696e7c733a313a2231223b),
('av9spvt1iuda4c5amnmbrq2g7a5vqqn5', '127.0.0.1', 1746193691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139333639313b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d757365725f69647c733a313a2230223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2274656e6973656e206d75223b666c6173685f6d6573736167657c733a36333a22436f75727365204164646564205375636365737366756c6c792e20506c65617365205761697420556e74696c6c2041646d696e20417070726f766573204974223b757365725f6c6f67696e7c733a313a2231223b),
('c4sju79gbsrt8pom4pp3egd59re3fuav', '127.0.0.1', 1746194006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139343030363b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d757365725f69647c733a313a2230223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2274656e6973656e206d75223b666c6173685f6d6573736167657c733a36333a22436f75727365204164646564205375636365737366756c6c792e20506c65617365205761697420556e74696c6c2041646d696e20417070726f766573204974223b757365725f6c6f67696e7c733a313a2231223b),
('rviapoetcpumjeaqqonbs6ud4otbr9fc', '127.0.0.1', 1746194473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139343437333b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d757365725f69647c733a313a2230223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2274656e6973656e206d75223b666c6173685f6d6573736167657c733a36333a22436f75727365204164646564205375636365737366756c6c792e20506c65617365205761697420556e74696c6c2041646d696e20417070726f766573204974223b757365725f6c6f67696e7c733a313a2231223b),
('2cvilrouf4crmp90u0f3bie1embq136j', '127.0.0.1', 1746194805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139343830353b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a31373a2257656c636f6d2074656e6973656e206d75223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2274656e6973656e206d75223b757365725f6c6f67696e7c733a313a2231223b),
('s7eo9nulovju45nous94h77k41ucn4i3', '127.0.0.1', 1746195730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139353733303b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a32313a22436f75727365205374617475732055706461746564223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31303a2274656e6973656e206d75223b61646d696e5f6c6f67696e7c733a313a2231223b),
('bo5fj8nasm43egfr8qqea3d5pcam1ed6', '127.0.0.1', 1746195297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139353235373b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a31373a2257656c636f6d2074656e6973656e206d75223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31303a2274656e6973656e206d75223b61646d696e5f6c6f67696e7c733a313a2231223b),
('prgp6p004jnp0r1oo89m2vt1ptvfk3jj', '127.0.0.1', 1746196284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139363238343b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a34303a2253747564656e7420486173204265656e20456e726f6c6c656420546f205468617420436f75727365223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31303a2274656e6973656e206d75223b61646d696e5f6c6f67696e7c733a313a2231223b),
('703kobabk5a93t31cmvd24nesb0au2r4', '127.0.0.1', 1746196671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139363637313b636172745f6974656d737c613a303a7b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a34303a2253747564656e7420486173204265656e20456e726f6c6c656420546f205468617420436f75727365223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31303a2274656e6973656e206d75223b61646d696e5f6c6f67696e7c733a313a2231223b),
('rldba8m5eafubiffr96gktnpejsm2s13', '127.0.0.1', 1746197122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139373132323b636172745f6974656d737c613a313a7b693a303b733a313a2237223b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a34303a2253747564656e7420486173204265656e20456e726f6c6c656420546f205468617420436f75727365223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31303a2274656e6973656e206d75223b61646d696e5f6c6f67696e7c733a313a2231223b),
('jg276oe302ngnmknkfmhag83m936uanh', '127.0.0.1', 1746197307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363139373132323b636172745f6974656d737c613a313a7b693a303b733a313a2237223b7d6572726f725f6d6573736167657c733a32353a22496e76616c6964204c6f67696e2043726564656e7469616c73223b5f5f63695f766172737c613a323a7b733a31333a226572726f725f6d657373616765223b733a333a226f6c64223b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d666c6173685f6d6573736167657c733a34303a2253747564656e7420486173204265656e20456e726f6c6c656420546f205468617420436f75727365223b757365725f69647c733a313a2230223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31303a2274656e6973656e206d75223b61646d696e5f6c6f67696e7c733a313a2231223b6c61796f75747c733a343a226c697374223b),
('5bjksf97etclklc1n35vgeekfc8mcdtb', '127.0.0.1', 1746313947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363331333931323b636172745f6974656d737c613a303a7b7d);

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule_info`
--

CREATE TABLE `class_schedule_info` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `subject` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `outcomes` longtext DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `section` longtext DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_flag` int(11) DEFAULT 0,
  `discounted_price` int(11) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `is_top_course` int(11) DEFAULT 0,
  `is_admin` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `course_overview_provider` varchar(255) DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `is_free_course` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `short_description`, `description`, `outcomes`, `language`, `category_id`, `sub_category_id`, `section`, `requirements`, `price`, `discount_flag`, `discounted_price`, `level`, `user_id`, `thumbnail`, `video_url`, `date_added`, `last_modified`, `visibility`, `is_top_course`, `is_admin`, `status`, `course_overview_provider`, `meta_keywords`, `meta_description`, `is_free_course`) VALUES
(7, ' Fire Safety Awareness', 'This foundational course is designed to equip learners with essential knowledge and skills to recognize, prevent, and respond to fire hazards in various environments. It is suitable for individuals across all industries, aiming to foster a culture of safety and preparedness.', '<p data-start=\"629\" data-end=\"948\" class=\"\">Understanding fire safety is crucial for ensuring the well-being of individuals and the protection of property. This course delves into the fundamental principles of fire safety, including the fire triangle, common causes of fires, and the importance of good housekeeping practices to minimize risks.</p>\r\n<p data-start=\"950\" data-end=\"1207\" class=\"\">Participants will explore the types of fire extinguishers, their appropriate uses, and the significance of clear evacuation routes and assembly points. The course also emphasizes the role of fire signage and the procedures to follow during a fire emergency.</p>\r\n<p data-start=\"1209\" data-end=\"1517\" class=\"\">Through interactive modules and real-life scenarios, learners will gain practical insights into fire prevention strategies and emergency response protocols. The course aims to instill confidence in individuals to act swiftly and effectively in the event of a fire, thereby reducing potential harm and damage.</p><p><br></p>', '[\"Recognize potential fire hazards and implement preventive measures.\"]', 'english', NULL, 0, '[]', '[\"No prior experience or qualifications are necessary. This course is suitable for all employees, supervisors, and managers.\"]', 500, NULL, 450, 'beginner', 0, NULL, '', 1746136800, NULL, NULL, NULL, 0, 'active', '', '', 'Enhance your understanding of fire safety with our comprehensive course. Learn to identify hazards, use extinguishers correctly, and implement effective evacuation procedures to ensure workplace safety.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(30) NOT NULL,
  `course` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `description`) VALUES
(1, 'Information Technology', 'IT'),
(4, 'BSCS', 'Bachelor of Science in Computer Science'),
(5, 'BSIS', 'Bachelor of Science in Information Systems'),
(6, 'BSED', 'Bachelor in Secondary Education');

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `course_description` text DEFAULT NULL,
  `name` text NOT NULL,
  `premium_class_capacity` float NOT NULL DEFAULT 0,
  `standard_capacity` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `code`, `course_description`, `name`, `premium_class_capacity`, `standard_capacity`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Principles of Occupational Health and Safety', 'Examines the intersection of environmental engineering and public health policy. Students will analyze regulatory processes, global health governance, and legal frameworks that guide pollution control, waste management, and disease prevention efforts.', 'James Kabinas', 36, 30, 0, '2022-01-05 11:05:42', '2025-05-01 21:52:52'),
(2, 'Environmental Health and Toxicology', 'Examines the intersection of environmental engineering and public health policy. Students will analyze regulatory processes, global health governance, and legal frameworks that guide pollution control, waste management, and disease prevention efforts.', 'Portia Radebe', 13, 30, 0, '2022-01-05 11:11:41', '2025-05-01 10:46:30'),
(3, 'Industrial Hygiene and Exposure Controls', 'Examines the intersection of environmental engineering and public health policy. Students will analyze regulatory processes, global health governance, and legal frameworks that guide pollution control, waste management, and disease prevention efforts.', 'Gloria Jacobs', 25, 42, 0, '2022-01-05 11:11:56', '2025-05-02 08:01:24'),
(4, 'Public Health Policy and Environmental Regulation', 'Examines the intersection of environmental engineering and public health policy. Students will analyze regulatory processes, global health governance, and legal frameworks that guide pollution control, waste management, and disease prevention efforts.', 'Candice Aniwe', 20, 26, 0, '2022-01-05 11:12:15', '2025-05-01 22:18:45'),
(5, 'Emergency Preparedness and Disaster Response', 'Examines the intersection of environmental engineering and public health policy. Students will analyze regulatory processes, global health governance, and legal frameworks that guide pollution control, waste management, and disease prevention efforts.', 'Lilith Mogau', 15, 50, 1, '2022-01-05 11:13:00', '2025-05-01 10:46:43'),
(7, '', NULL, 'vbc', 5, 5, 0, '2025-05-02 07:51:47', '2025-05-02 07:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`) VALUES
(1, 'Leke', 'ALL', 'Lek', 0, 1),
(2, 'Dollars', 'USD', '$', 1, 1),
(3, 'Afghanis', 'AFN', '؋', 0, 1),
(4, 'Pesos', 'ARS', '$', 0, 1),
(5, 'Guilders', 'AWG', 'ƒ', 0, 1),
(6, 'Dollars', 'AUD', '$', 1, 1),
(7, 'New Manats', 'AZN', 'ман', 0, 1),
(8, 'Dollars', 'BSD', '$', 0, 1),
(9, 'Dollars', 'BBD', '$', 0, 1),
(10, 'Rubles', 'BYR', 'p.', 0, 0),
(11, 'Euro', 'EUR', '€', 1, 1),
(12, 'Dollars', 'BZD', 'BZ$', 0, 1),
(13, 'Dollars', 'BMD', '$', 0, 1),
(14, 'Bolivianos', 'BOB', '$b', 0, 1),
(15, 'Convertible Marka', 'BAM', 'KM', 0, 1),
(16, 'Pula', 'BWP', 'P', 0, 1),
(17, 'Leva', 'BGN', 'лв', 0, 1),
(18, 'Reais', 'BRL', 'R$', 1, 1),
(19, 'Pounds', 'GBP', '£', 1, 1),
(20, 'Dollars', 'BND', '$', 0, 1),
(21, 'Riels', 'KHR', '៛', 0, 1),
(22, 'Dollars', 'CAD', '$', 1, 1),
(23, 'Dollars', 'KYD', '$', 0, 1),
(24, 'Pesos', 'CLP', '$', 0, 1),
(25, 'Yuan Renminbi', 'CNY', '¥', 0, 1),
(26, 'Pesos', 'COP', '$', 0, 1),
(27, 'Colón', 'CRC', '₡', 0, 1),
(28, 'Kuna', 'HRK', 'kn', 0, 1),
(29, 'Pesos', 'CUP', '₱', 0, 0),
(30, 'Koruny', 'CZK', 'Kč', 1, 1),
(31, 'Kroner', 'DKK', 'kr', 1, 1),
(32, 'Pesos', 'DOP ', 'RD$', 0, 1),
(33, 'Dollars', 'XCD', '$', 0, 1),
(34, 'Pounds', 'EGP', '£', 0, 1),
(35, 'Colones', 'SVC', '$', 0, 0),
(36, 'Pounds', 'FKP', '£', 0, 1),
(37, 'Dollars', 'FJD', '$', 0, 1),
(38, 'Cedis', 'GHC', '¢', 0, 0),
(39, 'Pounds', 'GIP', '£', 0, 1),
(40, 'Quetzales', 'GTQ', 'Q', 0, 1),
(41, 'Pounds', 'GGP', '£', 0, 0),
(42, 'Dollars', 'GYD', '$', 0, 1),
(43, 'Lempiras', 'HNL', 'L', 0, 1),
(44, 'Dollars', 'HKD', '$', 1, 1),
(45, 'Forint', 'HUF', 'Ft', 1, 1),
(46, 'Kronur', 'ISK', 'kr', 0, 1),
(47, 'Rupees', 'INR', 'Rp', 0, 1),
(48, 'Rupiahs', 'IDR', 'Rp', 0, 1),
(49, 'Rials', 'IRR', '﷼', 0, 0),
(50, 'Pounds', 'IMP', '£', 0, 0),
(51, 'New Shekels', 'ILS', '₪', 1, 1),
(52, 'Dollars', 'JMD', 'J$', 0, 1),
(53, 'Yen', 'JPY', '¥', 1, 1),
(54, 'Pounds', 'JEP', '£', 0, 0),
(55, 'Tenge', 'KZT', 'лв', 0, 1),
(56, 'Won', 'KPW', '₩', 0, 0),
(57, 'Won', 'KRW', '₩', 0, 1),
(58, 'Soms', 'KGS', 'лв', 0, 1),
(59, 'Kips', 'LAK', '₭', 0, 1),
(60, 'Lati', 'LVL', 'Ls', 0, 0),
(61, 'Pounds', 'LBP', '£', 0, 1),
(62, 'Dollars', 'LRD', '$', 0, 1),
(63, 'Switzerland Francs', 'CHF', 'CHF', 1, 1),
(64, 'Litai', 'LTL', 'Lt', 0, 0),
(65, 'Denars', 'MKD', 'ден', 0, 1),
(66, 'Ringgits', 'MYR', 'RM', 1, 1),
(67, 'Rupees', 'MUR', '₨', 0, 1),
(68, 'Pesos', 'MXN', '$', 1, 1),
(69, 'Tugriks', 'MNT', '₮', 0, 1),
(70, 'Meticais', 'MZN', 'MT', 0, 1),
(71, 'Dollars', 'NAD', '$', 0, 1),
(72, 'Rupees', 'NPR', '₨', 0, 1),
(73, 'Guilders', 'ANG', 'ƒ', 0, 1),
(74, 'Dollars', 'NZD', '$', 1, 1),
(75, 'Cordobas', 'NIO', 'C$', 0, 1),
(76, 'Nairas', 'NGN', '₦', 0, 1),
(77, 'Krone', 'NOK', 'kr', 1, 1),
(78, 'Rials', 'OMR', '﷼', 0, 0),
(79, 'Rupees', 'PKR', '₨', 0, 1),
(80, 'Balboa', 'PAB', 'B/.', 0, 1),
(81, 'Guarani', 'PYG', 'Gs', 0, 1),
(82, 'Nuevos Soles', 'PEN', 'S/.', 0, 1),
(83, 'Pesos', 'PHP', 'Php', 1, 1),
(84, 'Zlotych', 'PLN', 'zł', 1, 1),
(85, 'Rials', 'QAR', '﷼', 0, 1),
(86, 'New Lei', 'RON', 'lei', 0, 1),
(87, 'Rubles', 'RUB', 'руб', 0, 1),
(88, 'Pounds', 'SHP', '£', 0, 1),
(89, 'Riyals', 'SAR', '﷼', 0, 1),
(90, 'Dinars', 'RSD', 'Дин.', 0, 1),
(91, 'Rupees', 'SCR', '₨', 0, 1),
(92, 'Dollars', 'SGD', '$', 1, 1),
(93, 'Dollars', 'SBD', '$', 0, 1),
(94, 'Shillings', 'SOS', 'S', 0, 1),
(95, 'Rand', 'ZAR', 'R', 0, 1),
(96, 'Rupees', 'LKR', '₨', 0, 1),
(97, 'Kronor', 'SEK', 'kr', 1, 1),
(98, 'Dollars', 'SRD', '$', 0, 1),
(99, 'Pounds', 'SYP', '£', 0, 0),
(100, 'New Dollars', 'TWD', 'NT$', 1, 1),
(101, 'Baht', 'THB', '฿', 1, 1),
(102, 'Dollars', 'TTD', 'TT$', 0, 1),
(103, 'Lira', 'TRY', 'TL', 0, 1),
(104, 'Liras', 'TRL', '£', 0, 0),
(105, 'Dollars', 'TVD', '$', 0, 0),
(106, 'Hryvnia', 'UAH', '₴', 0, 1),
(107, 'Pesos', 'UYU', '$U', 0, 1),
(108, 'Sums', 'UZS', 'лв', 0, 1),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', 0, 0),
(110, 'Dong', 'VND', '₫', 0, 1),
(111, 'Rials', 'YER', '﷼', 0, 1),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `enrol`
--

CREATE TABLE `enrol` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enrol`
--

INSERT INTO `enrol` (`id`, `user_id`, `course_id`, `date_added`, `last_modified`) VALUES
(1, 4, 1, 1745359200, NULL),
(2, 1, 7, 1746136800, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(30) NOT NULL,
  `id_no` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `id_no`, `firstname`, `middlename`, `lastname`, `contact`, `gender`, `address`, `email`) VALUES
(1, '06232014', 'John', 'C', 'Smith', '+18456-5455-55', 'Male', 'Sample Address', 'jsmith@sample.com'),
(2, '37362629', 'Claire', 'C', 'Blake', '+12345687923', 'Female', 'Sample Address', 'cblake@sample.com');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`) VALUES
(1, 'banner_title', 'Learn on your schedule'),
(2, 'banner_sub_title', 'Study any topic, anytime. Explore thousands of courses for the lowest price ever!'),
(4, 'about_us', '<p></p><h2>This is about us</h2><p><span xss=\"removed\" xss=removed>Welcome to Academy. It will help you to learn in a new ways</span></p>'),
(10, 'terms_and_condition', '<h2>Terms and Condition</h2>This is the Terms and condition page for your companys'),
(11, 'privacy_policy', '<h2>Privacy Policy</h2>This is the Privacy Policy page for your companys'),
(13, 'theme', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext DEFAULT NULL,
  `english` longtext DEFAULT NULL,
  `Bengali` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `Bengali`) VALUES
(1, 'manage_profile', NULL, NULL),
(140, 'category_code', NULL, NULL),
(3, 'dashboard', NULL, NULL),
(4, 'categories', NULL, NULL),
(5, 'courses', NULL, NULL),
(6, 'students', NULL, NULL),
(7, 'enroll_history', NULL, NULL),
(8, 'message', NULL, NULL),
(9, 'settings', NULL, NULL),
(10, 'system_settings', NULL, NULL),
(11, 'frontend_settings', NULL, NULL),
(12, 'payment_settings', NULL, NULL),
(13, 'manage_language', NULL, NULL),
(14, 'edit_profile', NULL, NULL),
(15, 'log_out', NULL, NULL),
(16, 'first_name', NULL, NULL),
(17, 'last_name', NULL, NULL),
(18, 'email', NULL, NULL),
(19, 'facebook_link', NULL, NULL),
(20, 'twitter_link', NULL, NULL),
(21, 'linkedin_link', NULL, NULL),
(22, 'a_short_title_about_yourself', NULL, NULL),
(23, 'biography', NULL, NULL),
(24, 'photo', NULL, NULL),
(25, 'select_image', NULL, NULL),
(26, 'change', NULL, NULL),
(27, 'remove', NULL, NULL),
(28, 'update_profile', NULL, NULL),
(29, 'change_password', NULL, NULL),
(30, 'current_password', NULL, NULL),
(31, 'new_password', NULL, NULL),
(32, 'confirm_new_password', NULL, NULL),
(33, 'delete', NULL, NULL),
(34, 'cancel', NULL, NULL),
(35, 'are_you_sure_to_update_this_information', NULL, NULL),
(36, 'yes', NULL, NULL),
(37, 'no', NULL, NULL),
(38, 'system settings', NULL, NULL),
(39, 'system_name', NULL, NULL),
(40, 'system_title', NULL, NULL),
(41, 'slogan', NULL, NULL),
(42, 'system_email', NULL, NULL),
(43, 'address', NULL, NULL),
(44, 'phone', NULL, NULL),
(45, 'youtube_api_key', NULL, NULL),
(46, 'get_youtube_api_key', NULL, NULL),
(47, 'vimeo_api_key', NULL, NULL),
(48, 'purchase_code', NULL, NULL),
(49, 'language', NULL, NULL),
(50, 'text-align', NULL, NULL),
(51, 'update_system_settings', NULL, NULL),
(52, 'update_product', NULL, NULL),
(53, 'file', NULL, NULL),
(54, 'install_update', NULL, NULL),
(55, 'system_logo', NULL, NULL),
(56, 'update_logo', NULL, NULL),
(57, 'get_vimeo_api_key', NULL, NULL),
(58, 'add_category', NULL, NULL),
(59, 'category_title', NULL, NULL),
(60, 'sub_categories', NULL, NULL),
(61, 'actions', NULL, NULL),
(62, 'action', NULL, NULL),
(63, 'manage_sub_categories', NULL, NULL),
(64, 'edit', NULL, NULL),
(65, 'add_course', NULL, NULL),
(66, 'select_category', NULL, NULL),
(67, 'title', NULL, NULL),
(68, 'category', NULL, NULL),
(69, '#_section', NULL, NULL),
(70, '#_lesson', NULL, NULL),
(71, '#_enrolled_user', NULL, NULL),
(72, 'view_course_details', NULL, NULL),
(73, 'manage_section', NULL, NULL),
(74, 'manage_lesson', NULL, NULL),
(75, 'student', NULL, NULL),
(76, 'add_student', NULL, NULL),
(77, 'name', NULL, NULL),
(78, 'date_added', NULL, NULL),
(79, 'enrolled_courses', NULL, NULL),
(80, 'view_profile', NULL, NULL),
(81, 'admin_dashboard', NULL, NULL),
(82, 'total_courses', NULL, NULL),
(83, 'number_of_courses', NULL, NULL),
(84, 'total_lessons', NULL, NULL),
(85, 'number_of_lessons', NULL, NULL),
(86, 'total_enrollment', NULL, NULL),
(87, 'number_of_enrollment', NULL, NULL),
(88, 'total_student', NULL, NULL),
(89, 'number_of_student', NULL, NULL),
(90, 'manage_sections', NULL, NULL),
(91, 'manage sections', NULL, NULL),
(92, 'course', NULL, NULL),
(93, 'add_section', NULL, NULL),
(94, 'lessons', NULL, NULL),
(95, 'serialize_sections', NULL, NULL),
(96, 'add_lesson', NULL, NULL),
(97, 'edit_section', NULL, NULL),
(98, 'delete_section', NULL, NULL),
(99, 'course_details', NULL, NULL),
(100, 'course details', NULL, NULL),
(101, 'details', NULL, NULL),
(102, 'instructor', NULL, NULL),
(103, 'sub_category', NULL, NULL),
(104, 'enrolled_user', NULL, NULL),
(105, 'last_modified', NULL, NULL),
(106, 'manage language', NULL, NULL),
(107, 'language_list', NULL, NULL),
(108, 'add_phrase', NULL, NULL),
(109, 'add_language', NULL, NULL),
(110, 'option', NULL, NULL),
(111, 'edit_phrase', NULL, NULL),
(112, 'delete_language', NULL, NULL),
(113, 'phrase', NULL, NULL),
(114, 'value_required', NULL, NULL),
(115, 'frontend settings', NULL, NULL),
(116, 'banner_title', NULL, NULL),
(117, 'banner_sub_title', NULL, NULL),
(118, 'about_us', NULL, NULL),
(119, 'blog', NULL, NULL),
(120, 'update_frontend_settings', NULL, NULL),
(121, 'update_banner', NULL, NULL),
(122, 'banner_image', NULL, NULL),
(123, 'update_banner_image', NULL, NULL),
(124, 'payment settings', NULL, NULL),
(125, 'paypal_settings', NULL, NULL),
(126, 'client_id', NULL, NULL),
(127, 'sandbox', NULL, NULL),
(128, 'production', NULL, NULL),
(129, 'active', NULL, NULL),
(130, 'mode', NULL, NULL),
(131, 'stripe_settings', NULL, NULL),
(132, 'testmode', NULL, NULL),
(133, 'on', NULL, NULL),
(134, 'off', NULL, NULL),
(135, 'test_secret_key', NULL, NULL),
(136, 'test_public_key', NULL, NULL),
(137, 'live_secret_key', NULL, NULL),
(138, 'live_public_key', NULL, NULL),
(139, 'save_changes', NULL, NULL),
(141, 'update_phrase', NULL, NULL),
(142, 'check', NULL, NULL),
(143, 'settings_updated', NULL, NULL),
(144, 'checking', NULL, NULL),
(145, 'phrase_added', NULL, NULL),
(146, 'language_added', NULL, NULL),
(147, 'language_deleted', NULL, NULL),
(148, 'add course', NULL, NULL),
(149, 'add_courses', NULL, NULL),
(150, 'add_course_form', NULL, NULL),
(151, 'basic_info', NULL, NULL),
(152, 'short_description', NULL, NULL),
(153, 'description', NULL, NULL),
(154, 'level', NULL, NULL),
(155, 'beginner', NULL, NULL),
(156, 'advanced', NULL, NULL),
(157, 'intermediate', NULL, NULL),
(158, 'language_made_in', NULL, NULL),
(159, 'is_top_course', NULL, NULL),
(160, 'outcomes', NULL, NULL),
(161, 'category_and_sub_category', NULL, NULL),
(162, 'select_a_category', NULL, NULL),
(163, 'select_a_category_first', NULL, NULL),
(164, 'requirements', NULL, NULL),
(165, 'price_and_discount', NULL, NULL),
(166, 'price', NULL, NULL),
(167, 'has_discount', NULL, NULL),
(168, 'discounted_price', NULL, NULL),
(169, 'course_thumbnail', NULL, NULL),
(170, 'note', NULL, NULL),
(171, 'thumbnail_size_should_be_600_x_600', NULL, NULL),
(172, 'course_overview_url', NULL, NULL),
(173, '0%', NULL, NULL),
(174, 'manage profile', NULL, NULL),
(175, 'edit_course', NULL, NULL),
(176, 'edit course', NULL, NULL),
(177, 'edit_courses', NULL, NULL),
(178, 'edit_course_form', NULL, NULL),
(179, 'update_course', NULL, NULL),
(180, 'course_updated', NULL, NULL),
(181, 'number_of_sections', NULL, NULL),
(182, 'number_of_enrolled_users', NULL, NULL),
(183, 'add section', NULL, NULL),
(184, 'section', NULL, NULL),
(185, 'add_section_form', NULL, NULL),
(186, 'update', NULL, NULL),
(187, 'serialize_section', NULL, NULL),
(188, 'serialize section', NULL, NULL),
(189, 'submit', NULL, NULL),
(190, 'sections_have_been_serialized', NULL, NULL),
(191, 'select_course', NULL, NULL),
(192, 'search', NULL, NULL),
(193, 'thumbnail', NULL, NULL),
(194, 'duration', NULL, NULL),
(195, 'provider', NULL, NULL),
(196, 'add lesson', NULL, NULL),
(197, 'add_lesson_form', NULL, NULL),
(198, 'video_type', NULL, NULL),
(199, 'select_a_course', NULL, NULL),
(200, 'select_a_course_first', NULL, NULL),
(201, 'video_url', NULL, NULL),
(202, 'invalid_url', NULL, NULL),
(203, 'your_video_source_has_to_be_either_youtube_or_vimeo', NULL, NULL),
(204, 'for', NULL, NULL),
(205, 'of', NULL, NULL),
(206, 'edit_lesson', NULL, NULL),
(207, 'edit lesson', NULL, NULL),
(208, 'edit_lesson_form', NULL, NULL),
(209, 'login', NULL, NULL),
(210, 'password', NULL, NULL),
(211, 'forgot_password', NULL, NULL),
(212, 'back_to_website', NULL, NULL),
(213, 'send_mail', NULL, NULL),
(214, 'back_to_login', NULL, NULL),
(215, 'student_add', NULL, NULL),
(216, 'student add', NULL, NULL),
(217, 'add_students', NULL, NULL),
(218, 'student_add_form', NULL, NULL),
(219, 'login_credentials', NULL, NULL),
(220, 'social_information', NULL, NULL),
(221, 'facebook', NULL, NULL),
(222, 'twitter', NULL, NULL),
(223, 'linkedin', NULL, NULL),
(224, 'user_image', NULL, NULL),
(225, 'add_user', NULL, NULL),
(226, 'user_update_successfully', NULL, NULL),
(227, 'user_added_successfully', NULL, NULL),
(228, 'student_edit', NULL, NULL),
(229, 'student edit', NULL, NULL),
(230, 'edit_students', NULL, NULL),
(231, 'student_edit_form', NULL, NULL),
(232, 'update_user', NULL, NULL),
(233, 'enroll history', NULL, NULL),
(234, 'filter', NULL, NULL),
(235, 'user_name', NULL, NULL),
(236, 'enrolled_course', NULL, NULL),
(237, 'enrollment_date', NULL, NULL),
(238, 'biography2', NULL, NULL),
(239, 'home', NULL, NULL),
(240, 'search_for_courses', NULL, NULL),
(241, 'total', NULL, NULL),
(242, 'go_to_cart', NULL, NULL),
(243, 'your_cart_is_empty', NULL, NULL),
(244, 'log_in', NULL, NULL),
(245, 'sign_up', NULL, NULL),
(246, 'what_do_you_want_to_learn', NULL, NULL),
(247, 'online_courses', NULL, NULL),
(248, 'explore_a_variety_of_fresh_topics', NULL, NULL),
(249, 'expert_instruction', NULL, NULL),
(250, 'find_the_right_course_for_you', NULL, NULL),
(251, 'lifetime_access', NULL, NULL),
(252, 'learn_on_your_schedule', NULL, NULL),
(253, 'top_courses', NULL, NULL),
(254, 'last_updater', NULL, NULL),
(255, 'hours', NULL, NULL),
(256, 'add_to_cart', NULL, NULL),
(257, 'top', NULL, NULL),
(258, 'latest_courses', NULL, NULL),
(259, 'added_to_cart', NULL, NULL),
(260, 'admin', NULL, NULL),
(261, 'log_in_to_your_udemy_account', NULL, NULL),
(262, 'by_signing_up_you_agree_to_our', NULL, NULL),
(263, 'terms_of_use', NULL, NULL),
(264, 'and', NULL, NULL),
(265, 'privacy_policy', NULL, NULL),
(266, 'do_not_have_an_account', NULL, NULL),
(267, 'sign_up_and_start_learning', NULL, NULL),
(268, 'check_here_for_exciting_deals_and_personalized_course_recommendations', NULL, NULL),
(269, 'already_have_an_account', NULL, NULL),
(270, 'checkout', NULL, NULL),
(271, 'paypal', NULL, NULL),
(272, 'stripe', NULL, NULL),
(273, 'step', NULL, NULL),
(274, 'how_would_you_rate_this_course_overall', NULL, NULL),
(275, 'write_a_public_review', NULL, NULL),
(276, 'describe_your_experience_what_you_got_out_of_the_course_and_other_helpful_highlights', NULL, NULL),
(277, 'what_did_the_instructor_do_well_and_what_could_use_some_improvement', NULL, NULL),
(278, 'next', NULL, NULL),
(279, 'previous', NULL, NULL),
(280, 'publish', NULL, NULL),
(281, 'search_results', NULL, NULL),
(282, 'ratings', NULL, NULL),
(283, 'search_results_for', NULL, NULL),
(284, 'category_page', NULL, NULL),
(285, 'all', NULL, NULL),
(286, 'category_list', NULL, NULL),
(287, 'by', NULL, NULL),
(288, 'go_to_wishlist', NULL, NULL),
(289, 'hi', NULL, NULL),
(290, 'my_courses', NULL, NULL),
(291, 'my_wishlist', NULL, NULL),
(292, 'my_messages', NULL, NULL),
(293, 'purchase_history', NULL, NULL),
(294, 'user_profile', NULL, NULL),
(295, 'already_purchased', NULL, NULL),
(296, 'all_courses', NULL, NULL),
(297, 'wishlists', NULL, NULL),
(298, 'search_my_courses', NULL, NULL),
(299, 'students_enrolled', NULL, NULL),
(300, 'created_by', NULL, NULL),
(301, 'last_updated', NULL, NULL),
(302, 'what_will_i_learn', NULL, NULL),
(303, 'view_more', NULL, NULL),
(304, 'other_related_courses', NULL, NULL),
(305, 'updated', NULL, NULL),
(306, 'curriculum_for_this_course', NULL, NULL),
(307, 'about_the_instructor', NULL, NULL),
(308, 'reviews', NULL, NULL),
(309, 'student_feedback', NULL, NULL),
(310, 'average_rating', NULL, NULL),
(311, 'preview_this_course', NULL, NULL),
(312, 'includes', NULL, NULL),
(313, 'on_demand_videos', NULL, NULL),
(314, 'full_lifetime_access', NULL, NULL),
(315, 'access_on_mobile_and_tv', NULL, NULL),
(316, 'course_preview', NULL, NULL),
(317, 'instructor_page', NULL, NULL),
(318, 'buy_now', NULL, NULL),
(319, 'shopping_cart', NULL, NULL),
(320, 'courses_in_cart', NULL, NULL),
(321, 'student_name', NULL, NULL),
(322, 'amount_to_pay', NULL, NULL),
(323, 'payment_successfully_done', NULL, NULL),
(324, 'filter_by', NULL, NULL),
(325, 'instructors', NULL, NULL),
(326, 'reset', NULL, NULL),
(327, 'your', NULL, NULL),
(328, 'rating', NULL, NULL),
(329, 'course_detail', NULL, NULL),
(330, 'start_lesson', NULL, NULL),
(331, 'show_full_biography', NULL, NULL),
(332, 'terms_and_condition', NULL, NULL),
(333, 'about', NULL, NULL),
(334, 'terms_&_condition', NULL, NULL),
(335, 'sub categories', NULL, NULL),
(336, 'add_sub_category', NULL, NULL),
(337, 'sub_category_title', NULL, NULL),
(338, 'add sub category', NULL, NULL),
(339, 'add_sub_category_form', NULL, NULL),
(340, 'sub_category_code', NULL, NULL),
(341, 'data_deleted', NULL, NULL),
(342, 'edit_category', NULL, NULL),
(343, 'edit category', NULL, NULL),
(344, 'edit_category_form', NULL, NULL),
(345, 'font', NULL, NULL),
(346, 'awesome class', NULL, NULL),
(347, 'update_category', NULL, NULL),
(348, 'data_updated_successfully', NULL, NULL),
(349, 'edit_sub_category', NULL, NULL),
(350, 'edit sub category', NULL, NULL),
(351, 'sub_category_edit', NULL, NULL),
(352, 'update_sub_category', NULL, NULL),
(353, 'course_added', NULL, NULL),
(354, 'user_deleted_successfully', NULL, NULL),
(355, 'private_messaging', NULL, NULL),
(356, 'private messaging', NULL, NULL),
(357, 'messages', NULL, NULL),
(358, 'select_message_to_read', NULL, NULL),
(359, 'new_message', NULL, NULL),
(360, 'email_duplication', NULL, NULL),
(361, 'your_registration_has_been_successfully_done', NULL, NULL),
(362, 'profile', NULL, NULL),
(363, 'account', NULL, NULL),
(364, 'add_information_about_yourself_to_share_on_your_profile', NULL, NULL),
(365, 'basics', NULL, NULL),
(366, 'add_your_twitter_link', NULL, NULL),
(367, 'add_your_facebook_link', NULL, NULL),
(368, 'add_your_linkedin_link', NULL, NULL),
(369, 'credentials', NULL, NULL),
(370, 'edit_your_account_settings', NULL, NULL),
(371, 'enter_current_password', NULL, NULL),
(372, 'enter_new_password', NULL, NULL),
(373, 're-type_your_password', NULL, NULL),
(374, 'save', NULL, NULL),
(375, 'update_user_photo', NULL, NULL),
(376, 'update_your_photo', NULL, NULL),
(377, 'upload_image', NULL, NULL),
(378, 'updated_successfully', NULL, NULL),
(379, 'invalid_login_credentials', NULL, NULL),
(380, 'blank_page', NULL, NULL),
(381, 'no_section_found', NULL, NULL),
(382, 'select_a_message_thread_to_read_it_here', NULL, NULL),
(383, 'send', NULL, NULL),
(384, 'type_your_message', NULL, NULL),
(385, 'date', NULL, NULL),
(386, 'total_price', NULL, NULL),
(387, 'payment_type', NULL, NULL),
(388, 'edit section', NULL, NULL),
(389, 'edit_section_form', NULL, NULL),
(390, 'reply_message', NULL, NULL),
(391, 'reply', NULL, NULL),
(392, 'log_in_to_your_account', NULL, NULL),
(393, 'no_result_found', NULL, NULL),
(394, 'enrollment', NULL, NULL),
(395, 'enroll_a_student', NULL, NULL),
(396, 'report', NULL, NULL),
(397, 'admin_revenue', NULL, NULL),
(398, 'instructor_revenue', NULL, NULL),
(399, 'instructor_settings', NULL, NULL),
(400, 'view_frontend', NULL, NULL),
(401, 'number_of_active_courses', NULL, NULL),
(402, 'number_of_pending_courses', NULL, NULL),
(403, 'all_instructor', NULL, NULL),
(404, 'active_courses', NULL, NULL),
(405, 'pending_courses', NULL, NULL),
(406, 'no_data_found', NULL, NULL),
(407, 'view_course_on_frontend', NULL, NULL),
(408, 'mark_as_pending', NULL, NULL),
(409, 'add category', NULL, NULL),
(410, 'add_categories', NULL, NULL),
(411, 'category_add_form', NULL, NULL),
(412, 'icon_picker', NULL, NULL),
(413, 'enroll a student', NULL, NULL),
(414, 'enrollment_form', NULL, NULL),
(415, 'admin revenue', NULL, NULL),
(416, 'total_amount', NULL, NULL),
(417, 'instructor revenue', NULL, NULL),
(418, 'status', NULL, NULL),
(419, 'instructor settings', NULL, NULL),
(420, 'allow_public_instructor', NULL, NULL),
(421, 'instructor_revenue_percentage', NULL, NULL),
(422, 'admin_revenue_percentage', NULL, NULL),
(423, 'update_instructor_settings', NULL, NULL),
(424, 'payment_info', NULL, NULL),
(425, 'required_for_instructors', NULL, NULL),
(426, 'paypal_client_id', NULL, NULL),
(427, 'stripe_public_key', NULL, NULL),
(428, 'stripe_secret_key', NULL, NULL),
(429, 'mark_as_active', NULL, NULL),
(430, 'mail_subject', NULL, NULL),
(431, 'mail_body', NULL, NULL),
(432, 'paid', NULL, NULL),
(433, 'pending', NULL, NULL),
(434, 'this_instructor_has_not_provided_valid_paypal_client_id', NULL, NULL),
(435, 'pay_with_paypal', NULL, NULL),
(436, 'this_instructor_has_not_provided_valid_public_key_or_secret_key', NULL, NULL),
(437, 'pay_with_stripe', NULL, NULL),
(438, 'create_course', NULL, NULL),
(439, 'payment_report', NULL, NULL),
(440, 'instructor_dashboard', NULL, NULL),
(441, 'draft', NULL, NULL),
(442, 'view_lessons', NULL, NULL),
(443, 'course_title', NULL, NULL),
(444, 'update_your_payment_settings', NULL, NULL),
(445, 'edit_course_detail', NULL, NULL),
(446, 'edit_basic_informations', NULL, NULL),
(447, 'publish_this_course', NULL, NULL),
(448, 'save_to_draft', NULL, NULL),
(449, 'update_section', NULL, NULL),
(450, 'analyzing_given_url', NULL, NULL),
(451, 'select_a_section', NULL, NULL),
(452, 'update_lesson', NULL, NULL),
(453, 'website_name', NULL, NULL),
(454, 'website_title', NULL, NULL),
(455, 'website_keywords', NULL, NULL),
(456, 'website_description', NULL, NULL),
(457, 'author', NULL, NULL),
(458, 'footer_text', NULL, NULL),
(459, 'footer_link', NULL, NULL),
(460, 'update_backend_logo', NULL, NULL),
(461, 'update_favicon', NULL, NULL),
(462, 'favicon', NULL, NULL),
(463, 'active courses', NULL, NULL),
(464, 'product_updated_successfully', NULL, NULL),
(465, 'course_overview_provider', NULL, NULL),
(466, 'youtube', NULL, NULL),
(467, 'vimeo', NULL, NULL),
(468, 'html5', NULL, NULL),
(469, 'meta_keywords', NULL, NULL),
(470, 'meta_description', NULL, NULL),
(471, 'lesson_type', NULL, NULL),
(472, 'video', NULL, NULL),
(473, 'select_type_of_lesson', NULL, NULL),
(474, 'text_file', NULL, NULL),
(475, 'pdf_file', NULL, NULL),
(476, 'document_file', NULL, NULL),
(477, 'image_file', NULL, NULL),
(478, 'lesson_provider', NULL, NULL),
(479, 'select_lesson_provider', NULL, NULL),
(480, 'analyzing_the_url', NULL, NULL),
(481, 'attachment', NULL, NULL),
(482, 'summary', NULL, NULL),
(483, 'download', NULL, NULL),
(484, 'system_settings_updated', NULL, NULL),
(485, 'course_updated_successfully', NULL, NULL),
(486, 'please_wait_untill_admin_approves_it', NULL, NULL),
(487, 'pending courses', NULL, NULL),
(488, 'course_status_updated', NULL, NULL),
(489, 'smtp_settings', NULL, NULL),
(490, 'free_course', NULL, NULL),
(491, 'free', NULL, NULL),
(492, 'get_enrolled', NULL, NULL),
(493, 'course_added_successfully', NULL, NULL),
(494, 'update_frontend_logo', NULL, NULL),
(495, 'system_currency_settings', NULL, NULL),
(496, 'select_system_currency', NULL, NULL),
(497, 'currency_position', NULL, NULL),
(498, 'left', NULL, NULL),
(499, 'right', NULL, NULL),
(500, 'left_with_a_space', NULL, NULL),
(501, 'right_with_a_space', NULL, NULL),
(502, 'paypal_currency', NULL, NULL),
(503, 'select_paypal_currency', NULL, NULL),
(504, 'stripe_currency', NULL, NULL),
(505, 'select_stripe_currency', NULL, NULL),
(506, 'heads_up', NULL, NULL),
(507, 'please_make_sure_that', NULL, NULL),
(508, 'system_currency', NULL, NULL),
(509, 'are_same', NULL, NULL),
(510, 'smtp settings', NULL, NULL),
(511, 'protocol', NULL, NULL),
(512, 'smtp_host', NULL, NULL),
(513, 'smtp_port', NULL, NULL),
(514, 'smtp_user', NULL, NULL),
(515, 'smtp_pass', NULL, NULL),
(516, 'update_smtp_settings', NULL, NULL),
(517, 'phrase_updated', NULL, NULL),
(518, 'registered_user', NULL, NULL),
(519, 'provide_your_valid_login_credentials', NULL, NULL),
(520, 'registration_form', NULL, NULL),
(521, 'provide_your_email_address_to_get_password', NULL, NULL),
(522, 'reset_password', NULL, NULL),
(523, 'want_to_go_back', NULL, NULL),
(524, 'message_sent!', NULL, NULL),
(525, 'selected_icon', NULL, NULL),
(526, 'pick_another_icon_picker', NULL, NULL),
(527, 'show_more', NULL, NULL),
(528, 'show_less', NULL, NULL),
(529, 'all_category', NULL, NULL),
(530, 'price_range', NULL, NULL),
(531, 'price_range_withing', NULL, NULL),
(532, 'all_categories', NULL, NULL),
(533, 'all_sub_category', NULL, NULL),
(534, 'number_of_results', NULL, NULL),
(535, 'showing_on_this_page', NULL, NULL),
(536, 'welcome', NULL, NULL),
(537, 'my_account', NULL, NULL),
(538, 'logout', NULL, NULL),
(539, 'visit_website', NULL, NULL),
(540, 'navigation', NULL, NULL),
(541, 'add_new_category', NULL, NULL),
(542, 'enrolment', NULL, NULL),
(543, 'enrol_history', NULL, NULL),
(544, 'enrol_a_student', NULL, NULL),
(545, 'language_settings', NULL, NULL),
(546, 'congratulations', NULL, NULL),
(547, 'oh_snap', NULL, NULL),
(548, 'close', NULL, NULL),
(549, 'parent', NULL, NULL),
(550, 'none', NULL, NULL),
(551, 'category_thumbnail', NULL, NULL),
(552, 'the_image_size_should_be', NULL, NULL),
(553, 'choose_thumbnail', NULL, NULL),
(554, 'data_added_successfully', NULL, NULL),
(555, '', NULL, NULL),
(556, 'update_category_form', NULL, NULL),
(557, 'student_list', NULL, NULL),
(558, 'choose_user_image', NULL, NULL),
(559, 'finish', NULL, NULL),
(560, 'thank_you', NULL, NULL),
(561, 'you_are_almost_there', NULL, NULL),
(562, 'you_are_just_one_click_away', NULL, NULL),
(563, 'country', NULL, NULL),
(564, 'website_settings', NULL, NULL),
(565, 'write_down_facebook_url', NULL, NULL),
(566, 'write_down_twitter_url', NULL, NULL),
(567, 'write_down_linkedin_url', NULL, NULL),
(568, 'google_link', NULL, NULL),
(569, 'write_down_google_url', NULL, NULL),
(570, 'instagram_link', NULL, NULL),
(571, 'write_down_instagram_url', NULL, NULL),
(572, 'pinterest_link', NULL, NULL),
(573, 'write_down_pinterest_url', NULL, NULL),
(574, 'update_settings', NULL, NULL),
(575, 'upload_banner_image', NULL, NULL),
(576, 'update_light_logo', NULL, NULL),
(577, 'upload_light_logo', NULL, NULL),
(578, 'update_dark_logo', NULL, NULL),
(579, 'upload_dark_logo', NULL, NULL),
(580, 'update_small_logo', NULL, NULL),
(581, 'upload_small_logo', NULL, NULL),
(582, 'upload_favicon', NULL, NULL),
(583, 'logo_updated', NULL, NULL),
(584, 'favicon_updated', NULL, NULL),
(585, 'banner_image_update', NULL, NULL),
(586, 'frontend_settings_updated', NULL, NULL),
(587, 'setup_payment_informations', NULL, NULL),
(588, 'update_system_currency', NULL, NULL),
(589, 'setup_paypal_settings', NULL, NULL),
(590, 'update_paypal_keys', NULL, NULL),
(591, 'setup_stripe_settings', NULL, NULL),
(592, 'test_mode', NULL, NULL),
(593, 'update_stripe_keys', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `title`, `duration`, `course_id`, `section_id`, `video_type`, `video_url`, `date_added`, `last_modified`, `lesson_type`, `attachment`, `attachment_type`, `summary`, `order`) VALUES
(1, 'Occupational Health and Safety Practitioner ', NULL, 4, 1, NULL, NULL, 1745359200, NULL, 'other', 'c19eb8dce3914fb159e8d08dce297eb6.txt', 'txt', 'This course explores the foundational principles of occupational health and safety in engineering environments. Students will learn risk identification, hazard assessment, regulatory frameworks (e.g., OSHA, ISO 45001), and preventive strategies for maintaining safe workplaces across industrial sectors.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `sender` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message_thread_code`, `message`, `sender`, `timestamp`, `read_status`) VALUES
(1, '12053ab8570f596', 'One two testing', '3', '1745353010', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'Mark Cooper', '09456123789', 'mcooper@sample.com', 'Sample Inquiry only', 1, '2022-01-06 09:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext DEFAULT NULL,
  `sender` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `last_message_timestamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_thread`
--

INSERT INTO `message_thread` (`message_thread_id`, `message_thread_code`, `sender`, `receiver`, `last_message_timestamp`) VALUES
(1, '12053ab8570f596', '3', '4', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) DEFAULT NULL,
  `instructor_revenue` varchar(255) DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number_of_options` int(11) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `correct_answers` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) UNSIGNED NOT NULL,
  `rating` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ratable_id` int(11) DEFAULT NULL,
  `ratable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `review` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_list`
--

CREATE TABLE `reservation_list` (
  `id` int(30) NOT NULL,
  `seat_num` varchar(50) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `schedule` datetime NOT NULL,
  `first_name` text NOT NULL,
  `middlename` text NOT NULL,
  `last_name` text NOT NULL,
  `seat_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=First Class, 2 = Economy',
  `fare_amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_list`
--

INSERT INTO `reservation_list` (`id`, `seat_num`, `schedule_id`, `schedule`, `first_name`, `middlename`, `last_name`, `seat_type`, `fare_amount`, `date_created`, `date_updated`) VALUES
(6, 'E-001', 1, '2022-01-07 07:00:00', 'John', 'D', 'Smith', 2, 25, '2022-01-06 08:35:53', NULL),
(7, 'E-002', 1, '2022-01-07 07:00:00', 'Claire', 'C ', 'Blake', 2, 25, '2022-01-06 08:35:53', NULL),
(8, 'E-003', 2, '2022-01-07 08:00:00', 'Mark', 'D', 'Cooper', 2, 170, '2022-01-06 09:24:57', '2025-04-30 10:37:32'),
(9, 'E-004', 2, '2022-01-07 08:00:00', 'Samantha', 'C', 'Cooper', 2, 170, '2022-01-06 09:24:57', '2025-04-30 10:37:49'),
(1, 'FC-001', 1, '2022-01-07 07:00:00', 'John', 'D', 'Smith', 1, 50, '2022-01-05 16:26:00', NULL),
(3, 'FC-003', 1, '2022-01-07 07:00:00', 'Mark', 'D', 'Cooper', 1, 50, '2022-01-05 16:27:56', NULL),
(4, 'FC-004', 2, '2022-01-07 08:00:00', 'John', 'D', 'Smith', 1, 250, '2022-01-05 16:31:27', '2025-04-30 10:36:21'),
(5, 'FC-005', 2, '2022-01-07 08:00:00', 'Claire', 'C', 'Blake', 1, 250, '2022-01-05 16:31:27', '2025-04-30 10:36:51'),
(10, 'FC-006', 0, '2025-05-01 00:00:00', 'xcvx', '', 'xcvxc', 1, 1, '2025-04-30 01:05:04', '2025-04-30 10:39:50'),
(11, 'FC-007', 0, '2025-05-02 00:00:00', 'Guen', '', 'September', 1, 1, '2025-04-30 01:38:14', '2025-04-30 10:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `date_added`, `last_modified`) VALUES
(1, 'Admin', 1234567890, 1234567890),
(2, 'User', 1234567890, 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `schedule_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= class, 2= meeting,3=others',
  `description` text NOT NULL,
  `location` text NOT NULL,
  `is_repeating` tinyint(1) NOT NULL DEFAULT 1,
  `repeating_data` text NOT NULL,
  `schedule_date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `faculty_id`, `title`, `schedule_type`, `description`, `location`, `is_repeating`, `repeating_data`, `schedule_date`, `time_from`, `time_to`, `date_created`) VALUES
(3, 2, 'Class 101 (M & Th)', 1, 'Sample Only', 'Online', 1, '{\"dow\":\"0,0\",\"start\":\"2025-10-01\",\"end\":\"2026-11-30\"}', '2025-05-03', '09:00:00', '12:00:00', '2020-10-20 15:51:01'),
(4, 0, 'Emergency Preparedness and Disaster Response', 1, '', 'The Canvas Riversands 8 Incubation Drive, Riverside View Ext 15, Fourways, MidrandEmergency Preparedness and Disaster Response', 0, '{\"dow\":\"2\",\"start\":\"-01\",\"end\":\"2025-05-31\"}', '2025-05-05', '06:00:00', '12:00:00', '2025-05-01 00:30:54'),
(0, 0, 'cvxc', 1, 'xzvxz', 'xcvx', 1, '{\"dow\":\"2\",\"start\":\"xcv-01\",\"end\":\"1970-01-01\"}', '0000-00-00', '00:00:00', '00:00:00', '2025-05-01 14:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `train_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `course_id` int(30) NOT NULL,
  `region_location` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Daily, 2 = One-Time Schedule',
  `premium_class_fare` float NOT NULL DEFAULT 0,
  `standard_class_fare` float NOT NULL DEFAULT 0,
  `time_schedule` time NOT NULL,
  `is_repeating` tinyint(1) DEFAULT NULL,
  `repeating_data` varchar(255) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `code`, `course_id`, `region_location`, `type`, `premium_class_fare`, `standard_class_fare`, `time_schedule`, `is_repeating`, `repeating_data`, `schedule_date`, `delete_flag`, `date_created`, `date_updated`) VALUES
(8, 'Code', 2, 'Accolades Boutique Venue\r\n72 Dale Road, Midrand', 1, 250, 100, '11:35:20', 1, '{\"dow\":\"4\",\"start\":\"2025-05-08\",\"end\":\"2025-05-09\"}', '2025-05-08', 0, '2025-05-04 23:40:25', '2025-05-04 23:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `title`, `course_id`, `order`) VALUES
(1, 'Green Technology and Innovation for Healthier Communities', 4, 1),
(2, ',mm', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'language', 'english'),
(2, 'system_name', 'Learning Management System Online'),
(3, 'system_title', 'Learning Management System Online'),
(4, 'system_email', 'admin@example.com'),
(5, 'address', 'Learning Management System Online'),
(6, 'phone', '+143-52-9933631'),
(7, 'purchase_code', 'your-purchase-code'),
(8, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R\",\"production_client_id\":\"1234\"}]'),
(9, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"pk_test_c6VvBEbwHFdulFZ62q1IQrar\",\"secret_key\":\"sk_test_9IMkiM6Ykxr1LCe2dJ3PgaxS\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}]'),
(10, 'youtube_api_key', 'AIzaSyBBJrcS7AhGd1Cgd6GKH3G5aUUj9L9NrFQ'),
(11, 'vimeo_api_key', '39258384b69994dba483c10286825b5c'),
(12, 'slogan', 'A course based video CMS'),
(13, 'text_align', NULL),
(14, 'allow_instructor', '1'),
(15, 'instructor_revenue', '64'),
(16, 'system_currency', 'ZAR'),
(17, 'paypal_currency', 'ZAR'),
(18, 'stripe_currency', 'ZAR'),
(19, 'author', 'Learning Management System Online'),
(20, 'currency_position', 'left'),
(21, 'website_description', 'Nice application'),
(22, 'website_keywords', 'LMS,Learning Management System,Creativeitem,demo,hello,How are you'),
(23, 'footer_text', NULL),
(24, 'footer_link', 'http://lms.com/'),
(25, 'protocol', 'smtp'),
(26, 'smtp_host', 'ssl://smtp.googlemail.com'),
(27, 'smtp_port', '465'),
(28, 'smtp_user', ''),
(29, 'smtp_pass', ''),
(30, 'version', '2.0.1'),
(31, 'student_email_verification', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(30) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject`, `description`) VALUES
(1, 'DBMS', 'Database Management System'),
(2, 'Mathematics', 'Mathematics'),
(3, 'English', 'English'),
(4, 'Computer Hardware', 'Computer Hardware'),
(5, 'History', 'History');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'ONLINE COURSE BOOKING SYSTEM'),
(6, 'short_name', 'SEI-TECH'),
(11, 'logo', 'uploads/logo-1641351863.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1641351863.png'),
(15, 'content', 'Array'),
(16, 'email', 'info@seitechinternational.co.uk'),
(17, 'contact', '+27 67 101 4616'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'XYZ Street, There City, Here, 2306');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tagable_id` int(11) DEFAULT NULL,
  `tagable_type` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `social_links` longtext DEFAULT NULL,
  `biography` longtext DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `watch_history` longtext DEFAULT NULL,
  `wishlist` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `paypal_keys` longtext DEFAULT NULL,
  `stripe_keys` longtext DEFAULT NULL,
  `verification_code` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `social_links`, `biography`, `role_id`, `date_added`, `last_modified`, `watch_history`, `wishlist`, `title`, `paypal_keys`, `stripe_keys`, `verification_code`, `status`) VALUES
(0, 'tenisen', 'mu', 'tenisen@example.com', '83222c548f8ddf6ae569e0aa800b319263d6ba86', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', NULL, 1, 1745844163, NULL, '[]', '[]', NULL, '[{\"production_client_id\":\"\"}]', '[{\"public_live_key\":\"\",\"secret_live_key\":\"\"}]', '99b4c2511948c176216d15665b24e205', 1),
(1, 'admin', 'admin', 'admin@example.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcourseschedule`
-- (See below for the actual view)
--
CREATE TABLE `vcourseschedule` (
`id` int(30)
,`tutor_name` text
,`course_name` varchar(100)
,`description` text
,`code` varchar(100)
,`venue` varchar(255)
,`is_repeating` tinyint(1)
,`repeating_data` varchar(255)
,`schedule_date` date
);

-- --------------------------------------------------------

--
-- Structure for view `vcourseschedule`
--
DROP TABLE IF EXISTS `vcourseschedule`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcourseschedule`  AS SELECT `s`.`id` AS `id`, `c`.`name` AS `tutor_name`, `c`.`code` AS `course_name`, `c`.`course_description` AS `description`, `s`.`code` AS `code`, `s`.`region_location` AS `venue`, `s`.`is_repeating` AS `is_repeating`, `s`.`repeating_data` AS `repeating_data`, `s`.`schedule_date` AS `schedule_date` FROM (`course_list` `c` left join `schedule_list` `s` on(`s`.`course_id` = `c`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrol`
--
ALTER TABLE `enrol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation_list`
--
ALTER TABLE `reservation_list`
  ADD UNIQUE KEY `seat_num` (`seat_num`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `enrol`
--
ALTER TABLE `enrol`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=594;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
