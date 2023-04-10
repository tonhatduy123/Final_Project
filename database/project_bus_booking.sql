-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2023 at 02:19 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `address` varchar(250) NOT NULL,
  `phone` int(10) NOT NULL,
  `confirm_from` varchar(250) NOT NULL,
  `confirm_to` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`, `address`, `phone`, `confirm_from`, `confirm_to`) VALUES
(6, 6, '202304028575', 'Hoa Minh', 1, 0, '2023-04-02 22:59:27', 'Bac Lieu', 91845307, 'Bus station, Bac Lieu', 'Bus station, Kien Giang');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(5, 'Phuong Trang', '20', 1, '2023-04-02 22:37:33'),
(6, 'Giap Diep', '30', 1, '2023-04-02 22:38:09'),
(7, 'Phuoc Thanh', '40', 1, '2023-04-02 22:38:26'),
(8, 'Ngoc Anh', '50', 1, '2023-04-02 22:38:38'),
(9, 'Thao Vy', '60', 1, '2023-04-02 22:38:50'),
(10, 'Hoa Hiep', '70', 1, '2023-04-02 23:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(3, 'Bus Station', 'Ca Mau', 'Ca Mau', 1, '2023-04-02 22:40:08'),
(4, 'Bus Station', 'Bac Lieu', 'Bac Lieu', 1, '2023-04-02 22:40:21'),
(5, 'Bus Station', 'Soc Trang', 'Soc Trang', 1, '2023-04-02 22:40:31'),
(6, 'Bus Station', 'Rach Gia', 'Kien Giang', 1, '2023-04-02 22:40:46'),
(7, 'Bus Station', 'Can Tho', 'Can Tho', 1, '2023-04-02 22:40:58'),
(8, 'Bus Station', 'Vinh Long', 'Vinh Long', 1, '2023-04-02 22:41:17'),
(9, 'Bus Station', 'Ho Chi Minh', 'Ho Chi Minh', 1, '2023-04-02 22:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 3, 1, 1, '2020-09-11 16:00:00', '2020-09-12 02:00:00', 1, 30, '250', '2020-09-08 07:49:57'),
(2, 3, 2, 1, '2020-09-12 02:45:00', '2020-09-12 05:00:00', 1, 30, '250', '2020-09-08 07:37:52'),
(4, 4, 3, 7, '2023-04-05 20:00:00', '2023-04-06 00:00:00', 1, 45, '100', '2023-04-02 15:44:30'),
(5, 5, 3, 7, '2023-04-07 18:00:00', '2023-04-07 23:00:00', 1, 30, '150', '2023-04-02 15:46:37'),
(6, 7, 4, 6, '2023-04-09 18:00:00', '2023-04-09 23:00:00', 1, 30, '200', '2023-04-02 15:47:47'),
(7, 6, 5, 9, '2023-04-09 18:00:00', '2023-04-10 03:00:00', 1, 45, '200', '2023-04-02 15:48:28'),
(8, 9, 3, 9, '2023-04-07 18:00:00', '2023-04-08 04:00:00', 1, 45, '250', '2023-04-02 15:49:10'),
(9, 8, 6, 9, '2023-04-10 18:00:00', '2023-04-02 02:00:00', 1, 45, '210', '2023-04-02 15:49:57'),
(10, 6, 3, 9, '2023-04-12 18:00:00', '2023-06-13 02:00:00', 1, 45, '250', '2023-04-02 16:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Administrator', 1, 'admin123', '123', 1, '2023-04-02 23:27:10'),
(3, 'To Nhat Duy', 1, 'duyto', '123', 1, '2023-04-02 22:50:35'),
(4, 'Nguyen Phu Vinh', 1, 'phuvinh', '123', 1, '2023-04-02 22:50:59'),
(5, 'Truong Hoang Yen', 1, 'Yenchupi', '123', 1, '2023-04-02 22:51:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
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
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
