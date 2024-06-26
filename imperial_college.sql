-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 09:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imperial_college`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_result`
--

CREATE TABLE `class_result` (
  `class_result_id` int(11) NOT NULL,
  `roll_no` varchar(30) NOT NULL,
  `course_code` varchar(30) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `semester` varchar(11) NOT NULL,
  `total_marks` varchar(11) NOT NULL,
  `obtain_marks` varchar(11) NOT NULL,
  `result_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class_result`
--

INSERT INTO `class_result` (`class_result_id`, `roll_no`, `course_code`, `subject_code`, `semester`, `total_marks`, `obtain_marks`, `result_date`) VALUES
(1, 'SBU200848', 'B.Tech CSE', 'WAD', '8', '100', '85', '10-03-20'),
(2, 'SBU200848', 'B.Tech CSE', 'ES', '8', '100', '90', '10-03-20'),
(3, 'SBU200848', 'B.Tech CSE', 'BDA', '8', '100', '80', '10-03-20'),
(55, 'SBU200561', 'B.Tech CSE', 'WAD', '8', '100', '90', '10-03-20'),
(56, 'SBU200561', 'B.Tech CSE', 'ES', '8', '100', '70', '10-03-20'),
(57, 'SBU200561', 'B.Tech CSE', 'BDA', '8', '100', '95', '10-03-20'),
(58, 'SBU200555', 'B.Tech CSE', 'WAD', '8', '100', '95', '10-03-20'),
(59, 'SBU200555', 'B.Tech CSE', 'ES', '8', '100', '87', '10-03-20'),
(60, 'SBU200555', 'B.Tech CSE', 'BDA', '8', '100', '93', '10-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `semester_or_year` varchar(10) NOT NULL,
  `no_of_year` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_code`, `course_name`, `semester_or_year`, `no_of_year`) VALUES
('B.COM', 'Bachelor of Commerce', 'Semester', 3),
('B.Tech CIVIL', 'Bachelor of Technology in Civil Engineering', 'Semester', 4),
('B.Tech CSE', 'Bachelor of Technology in Computer Science & Engineering', 'Semester', 4),
('B.Tech ECE', 'Bachelor of Technology in Electronics and Communication', 'Semester', 4),
('B.Tech EEE', 'Bachelor of Technology in Electrical and Electronics', 'Semester', 4),
('BA English', 'Bachelor of Arts in English', 'Semester', 3),
('BBA', 'Bachelor of Business Administration', 'Semester', 3),
('BCA', 'Bachelor of Computer Applications', 'Semester', 3),
('M.COM', 'Master of Commerce', 'Semester', 2);

-- --------------------------------------------------------

--
-- Table structure for table `course_subjects`
--

CREATE TABLE `course_subjects` (
  `subject_code` varchar(10) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `semester` int(10) NOT NULL,
  `credit_hours` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_subjects`
--

INSERT INTO `course_subjects` (`subject_code`, `subject_name`, `course_code`, `semester`, `credit_hours`) VALUES
('BDA', 'BIG DATA ANALYTICS', 'B.Tech CSE', 8, 4),
('ES', 'EMBEDDED SYSTEMS', 'B.Tech CSE', 8, 4),
('WAD', 'WEB APP DEVELOPMENT', 'B.Tech CSE', 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ID` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Role` varchar(10) NOT NULL,
  `account` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `user_id`, `Password`, `Role`, `account`) VALUES
(2, 'admin@gmail.com', 'admin', 'Admin', ''),
(5, 'faculty@gmail.com', 'faculty', 'Teacher', ''),
(6, 'piyush@gmail.com', 'piyush', 'Student', 'activate'),
(7, 'abhya@gmail.com', 'abhya', 'Student', ''),
(8, 'neha@gmail.com', 'neha', 'Student', '');

-- --------------------------------------------------------

--
-- Table structure for table `mytable`
--

CREATE TABLE `mytable` (
  `id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `course_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mytable`
--

INSERT INTO `mytable` (`id`, `name`, `course_code`) VALUES
('B.Fashion-S19-1', 'husnain', 'B.Fashion'),
('B.Fashion-S19-2', 'razarai663@gmail.com', 'B.Fashion'),
('MCS-S19-1', 'Muhammad Husnain Raza', 'MCS'),
('MCS-S19-2', 'razarai663@gmail.com', 'MCS'),
('MIT-S19-1', 'Muhammad Husnain Raza', 'MIT');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `session` varchar(30) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `session`, `created_date`) VALUES
(1, '2020', '2024-04-10 18:07:22'),
(2, '2021', '2024-04-10 18:07:22'),
(3, '2022', '2024-04-10 18:07:22'),
(4, '2023', '2024-04-10 18:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `attendance_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `attendance` int(11) NOT NULL,
  `attendance_date` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`attendance_id`, `course_code`, `subject_code`, `semester`, `student_id`, `attendance`, `attendance_date`) VALUES
(1, 'B.Tech', 'WAD', 8, 'SBU200848', 30, '18-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `student_course_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `roll_no` varchar(10) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `session` varchar(10) NOT NULL,
  `assign_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_courses`
--

INSERT INTO `student_courses` (`student_course_id`, `course_code`, `semester`, `roll_no`, `subject_code`, `session`, `assign_date`) VALUES
(1, 'B.Tech CSE', 8, 'SBU200848', 'WAD', '2020', '15-03-20'),
(2, 'B.Tech CSE', 8, 'SBU200848', 'ES', '2020', '15-03-20'),
(3, 'B.Tech CSE', 8, 'SBU200848', 'BDA', '2020', '15-03-20'),
(7, 'B.Tech CSE', 8, 'SBU200555', 'WAD', '2020', '15-03-20'),
(8, 'B.Tech CSE', 8, 'SBU200561', 'WAD', '2020', '15-03-20'),
(9, 'B.Tech CSE', 8, 'SBU200555', 'ES', '2020', '15-03-20'),
(10, 'B.Tech CSE', 8, 'SBU200561', 'ES', '2020', '15-03-20'),
(11, 'B.Tech CSE', 8, 'SBU200555', 'BDA', '2020', '15-03-20'),
(12, 'B.Tech CSE', 8, 'SBU200561', 'BDA', '2020', '15-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `student_fee`
--

CREATE TABLE `student_fee` (
  `fee_voucher` int(11) NOT NULL,
  `roll_no` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_fee`
--

INSERT INTO `student_fee` (`fee_voucher`, `roll_no`, `amount`, `posting_date`, `status`) VALUES
(1, 'SBU200848', 54500, '2024-04-18 14:06:00', 'Paid'),
(3, 'SBU200555', 54500, '2024-04-18 18:16:09', 'Paid'),
(4, 'SBU200561', 54500, '2024-04-18 19:47:33', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `roll_no` varchar(20) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile_no` varchar(11) NOT NULL,
  `course_code` varchar(11) NOT NULL,
  `session` varchar(10) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `current_address` varchar(150) NOT NULL,
  `semester` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `obtain_marks` int(11) NOT NULL,
  `state` varchar(20) NOT NULL,
  `admission_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`roll_no`, `first_name`, `middle_name`, `last_name`, `email`, `mobile_no`, `course_code`, `session`, `dob`, `gender`, `current_address`, `semester`, `total_marks`, `obtain_marks`, `state`, `admission_date`) VALUES
('SBU200555', 'Abhya ', '', 'Gupta', 'abhya@gmail.com', '8765431092', 'B.Tech', '2020', '2002-10-20', 'Female', '', 0, 0, 0, '', '2024-04-18 18:07:20'),
('SBU200561', 'Neha ', '', 'Karmakar', 'Neha@gmail.com', '9876543210', 'B.Tech', '2020', '2001-01-01', 'Female', '', 0, 0, 0, '', '2024-04-18 18:10:27'),
('SBU200848', 'Piyush', '', 'Kumar', 'student@gmail.com', '8210428747', 'B.Tech CSE', '2020', '', 'male', '', 0, 0, 0, '', '2024-04-18 15:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `attendance_id` int(11) NOT NULL,
  `teacher_id` varchar(30) NOT NULL,
  `attendance` int(11) NOT NULL,
  `attendance_date` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teacher_attendance`
--

INSERT INTO `teacher_attendance` (`attendance_id`, `teacher_id`, `attendance`, `attendance_date`) VALUES
(1, '3', 1, '09-03-20'),
(2, '3', 1, '10-03-20'),
(3, '3', 1, '11-04-20'),
(4, '3', 1, '30-03-20'),
(5, '2', 0, '30-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_courses`
--

CREATE TABLE `teacher_courses` (
  `teacher_courses_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `teacher_id` varchar(10) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `assign_date` varchar(10) NOT NULL,
  `total_classes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`teacher_courses_id`, `course_code`, `semester`, `teacher_id`, `subject_code`, `assign_date`, `total_classes`) VALUES
(1, 'B.Tech CSE', 8, '3', 'ES', '27-03-20', 30),
(2, 'B.Tech CSE', 8, '2', 'WAD', '27-03-20', 30),
(3, 'B.Tech CSE', 8, '1', 'BDA', '27-03-20', 30);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_info`
--

CREATE TABLE `teacher_info` (
  `teacher_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_no` varchar(11) NOT NULL,
  `profile_image` blob NOT NULL,
  `teacher_status` varchar(10) NOT NULL,
  `application_status` varchar(10) NOT NULL,
  `cnic` varchar(15) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `other_phone` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `permanent_address` varchar(100) NOT NULL,
  `current_address` varchar(100) NOT NULL,
  `place_of_birth` varchar(50) NOT NULL,
  `matric_complition_date` varchar(10) NOT NULL,
  `matric_awarded_date` varchar(10) NOT NULL,
  `matric_certificate` varchar(100) NOT NULL,
  `fa_complition_date` varchar(10) NOT NULL,
  `fa_awarded_date` varchar(10) NOT NULL,
  `fa_certificate` varchar(100) NOT NULL,
  `ba_complition_date` varchar(10) NOT NULL,
  `ba_awarded_date` varchar(10) NOT NULL,
  `ba_certificate` varchar(100) NOT NULL,
  `ma_complition_date` varchar(10) NOT NULL,
  `ma_awarded_date` varchar(100) NOT NULL,
  `ma_certificate` varchar(101) NOT NULL,
  `last_qualification` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `hire_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teacher_info`
--

INSERT INTO `teacher_info` (`teacher_id`, `first_name`, `middle_name`, `last_name`, `father_name`, `email`, `phone_no`, `profile_image`, `teacher_status`, `application_status`, `cnic`, `dob`, `other_phone`, `gender`, `permanent_address`, `current_address`, `place_of_birth`, `matric_complition_date`, `matric_awarded_date`, `matric_certificate`, `fa_complition_date`, `fa_awarded_date`, `fa_certificate`, `ba_complition_date`, `ba_awarded_date`, `ba_certificate`, `ma_complition_date`, `ma_awarded_date`, `ma_certificate`, `last_qualification`, `state`, `hire_date`) VALUES
(1, 'Faculty', '', '1', '', 'Faculty@gmail.com', '9876543210', 0x696d616765732e706e67, 'Permanent', 'Yes', '8793', '1987-01-17', 0, 'Male', 'abc', 'def', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '18-06-21'),
(2, 'Faculty', '', '2', '', 'Faculty2@gmail.com', '9876543210', '', 'Permanent', 'Yes', '8793', '1987-01-17', 0, 'Male', 'abc', 'def', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '18-06-21'),
(3, 'Faculty', '', '3', '', 'Faculty3@gmail.com', '9876543210', '', 'Permanent', 'Yes', '8793', '1987-01-17', 0, 'Male', 'abc', 'def', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '18-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_salary_allowances`
--

CREATE TABLE `teacher_salary_allowances` (
  `teacher_id` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `medical_allowance` int(11) NOT NULL,
  `hr_allowance` int(11) NOT NULL,
  `scale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teacher_salary_allowances`
--

INSERT INTO `teacher_salary_allowances` (`teacher_id`, `basic_salary`, `medical_allowance`, `hr_allowance`, `scale`) VALUES
(1, 40000, 5, 10, 15),
(2, 55000, 7, 15, 18),
(3, 43000, 5, 8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_salary_report`
--

CREATE TABLE `teacher_salary_report` (
  `salary_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `paid_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teacher_salary_report`
--

INSERT INTO `teacher_salary_report` (`salary_id`, `teacher_id`, `total_amount`, `status`, `paid_date`) VALUES
(1, 1, 46000, 'Paid', '2020-03-27 11:28:57'),
(2, 2, 67100, 'Paid', '2020-03-27 11:50:13'),
(3, 3, 48590, 'Paid', '2020-03-27 11:55:58'),
(4, 1, 46000, 'Paid', '2020-03-27 12:33:39'),
(5, 3, 48590, 'Paid', '2020-03-28 08:26:59'),
(6, 2, 67100, 'Paid', '2020-03-28 08:30:46'),
(7, 2, 67100, 'Paid', '2020-03-28 08:32:06'),
(8, 2, 67100, 'Paid', '2020-03-28 08:32:46'),
(9, 2, 67100, 'Paid', '2020-03-28 08:33:59'),
(10, 2, 67100, 'Paid', '2020-03-28 08:35:54'),
(11, 2, 67100, 'Paid', '2020-03-28 08:38:17'),
(12, 2, 67100, 'Paid', '2020-03-28 08:39:22'),
(13, 2, 67100, 'Paid', '2020-03-28 08:40:44'),
(14, 2, 67100, 'Paid', '2020-03-28 08:41:26'),
(15, 2, 67100, 'Paid', '2020-03-28 08:42:25'),
(16, 2, 67100, 'Paid', '2020-03-28 08:43:32'),
(17, 2, 67100, 'Paid', '2020-03-28 08:44:03'),
(18, 2, 67100, 'Paid', '2020-03-28 08:44:39'),
(19, 2, 67100, 'Paid', '2020-03-28 08:45:09'),
(20, 2, 67100, 'Paid', '2020-03-28 08:45:22'),
(21, 2, 67100, 'Paid', '2020-03-28 08:45:36'),
(22, 2, 67100, 'Paid', '2020-03-28 08:45:45'),
(23, 2, 67100, 'Paid', '2020-03-28 08:45:59'),
(24, 2, 67100, 'Paid', '2020-03-28 08:47:42'),
(25, 2, 67100, 'Paid', '2020-03-28 08:48:11'),
(26, 3, 48590, 'Paid', '2020-03-28 08:48:22'),
(27, 3, 48590, 'Paid', '2020-03-28 08:48:40'),
(28, 3, 48590, 'Paid', '2020-03-28 10:48:28'),
(29, 3, 48590, 'Paid', '2020-03-28 10:49:47'),
(30, 3, 48590, 'Paid', '2020-03-30 12:37:11');

-- --------------------------------------------------------

--
-- Table structure for table `time_table`
--

CREATE TABLE `time_table` (
  `id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `timing_from` varchar(10) NOT NULL,
  `timing_to` varchar(10) NOT NULL,
  `day` varchar(20) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `room_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `time_table`
--

INSERT INTO `time_table` (`id`, `course_code`, `semester`, `timing_from`, `timing_to`, `day`, `subject_code`, `room_no`) VALUES
(1, 'B.TECH CSE', 8, '09:00', '09:45', '1', 'ES', 302),
(2, 'B.TECH CSE', 8, '09:50', '10:35', '1', 'WAD', 302),
(3, 'B.TECH CSE', 8, '10:40', '12:15', '1', 'BDA', 302);

-- --------------------------------------------------------

--
-- Table structure for table `weekdays`
--

CREATE TABLE `weekdays` (
  `day_id` int(11) NOT NULL,
  `day_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `weekdays`
--

INSERT INTO `weekdays` (`day_id`, `day_name`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_result`
--
ALTER TABLE `class_result`
  ADD PRIMARY KEY (`class_result_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `course_subjects`
--
ALTER TABLE `course_subjects`
  ADD PRIMARY KEY (`subject_code`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mytable`
--
ALTER TABLE `mytable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`student_course_id`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `student_fee`
--
ALTER TABLE `student_fee`
  ADD PRIMARY KEY (`fee_voucher`),
  ADD KEY `roll_no` (`roll_no`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`roll_no`);

--
-- Indexes for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD PRIMARY KEY (`teacher_courses_id`);

--
-- Indexes for table `teacher_info`
--
ALTER TABLE `teacher_info`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `teacher_salary_allowances`
--
ALTER TABLE `teacher_salary_allowances`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `teacher_salary_report`
--
ALTER TABLE `teacher_salary_report`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weekdays`
--
ALTER TABLE `weekdays`
  ADD PRIMARY KEY (`day_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_result`
--
ALTER TABLE `class_result`
  MODIFY `class_result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `student_course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_fee`
--
ALTER TABLE `student_fee`
  MODIFY `fee_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `teacher_courses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacher_info`
--
ALTER TABLE `teacher_info`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teacher_salary_report`
--
ALTER TABLE `teacher_salary_report`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `time_table`
--
ALTER TABLE `time_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `weekdays`
--
ALTER TABLE `weekdays`
  MODIFY `day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teacher_salary_report`
--
ALTER TABLE `teacher_salary_report`
  ADD CONSTRAINT `teacher_salary_report_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_salary_allowances` (`teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
