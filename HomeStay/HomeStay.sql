-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 11, 2018 at 12:51 AM
-- Server version: 5.7.21
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HomeStay`
--

-- --------------------------------------------------------

--
-- Table structure for table `City`
--

CREATE TABLE `City` (
  `CityId` int(11) NOT NULL,
  `CityName` varchar(20) NOT NULL,
  `CityCode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `City`
--

INSERT INTO `City` (`CityId`, `CityName`, `CityCode`) VALUES
(1, 'SanJose', 'SJC'),
(2, 'Charlotte', 'CLT');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `roomName` varchar(50) DEFAULT NULL,
  `distance` varchar(100) DEFAULT NULL,
  `bedroom` int(11) DEFAULT NULL,
  `bathroom` int(11) DEFAULT NULL,
  `maxPeople` int(11) DEFAULT NULL,
  `cityId` int(11) NOT NULL,
  `roomurl` varchar(200) NOT NULL,
  `CostPerDay` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `roomName`, `distance`, `bedroom`, `bathroom`, `maxPeople`, `cityId`, `roomurl`, `CostPerDay`) VALUES
(1, 'Comfort Suites San Jose ', '0.5 mile from airport', 3, 2, 5, 1, 'http://d1ah1il5j7hxtz.cloudfront.net/wp-content/uploads/2018/01/homestays-himalayan-theluxecafe.jpg', 200),
(2, 'Extended Stay America ', '0.7 mile from airport', 1, 1, 2, 1, 'http://cdn.cheersbye.com/public/images/collections/eco-homestays.jpg', 100),
(3, 'Doubletree by Hilton San Jose ', '2.5 mile from airport', 2, 1, 2, 1, 'http://www.coorghomestays.co.in/wp-content/uploads/2016/10/coorg-udaya-homestay-4.jpg', 50),
(4, 'Hyatt house Charlotte  ', '3.5 mile from airport', 3, 2, 5, 2, 'https://i.pinimg.com/originals/79/f5/d9/79f5d9bca8889019c03722d6e3ec1340.jpg', 75),
(5, 'Doubletree by Hilton  ', '2.0 mile from airport', 1, 1, 2, 2, 'http://d1ah1il5j7hxtz.cloudfront.net/wp-content/uploads/2018/01/homestays-himalayan-theluxecafe.jpg', 80);

-- --------------------------------------------------------

--
-- Table structure for table `UserDetails`
--

CREATE TABLE `UserDetails` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` bigint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserDetails`
--

INSERT INTO `UserDetails` (`UserId`, `FirstName`, `LastName`, `Email`, `PhoneNumber`) VALUES
(1, 'a', 'a', 'anjanisri.vemula@gmail.com', 7348468195),
(5, 'Anjani Sri', 'Vemula', 'avemula@uncc.edu', 7348468195),
(6, 'Anjani Sri', 'Vemula', 'avemua@uncc.edu', 7348468195),
(7, 'Anusha Reddy', 'Amula', 'aamula@uncc.edu', 9803392688),
(8, 'prutha', 'shi', 'sghh@gmail.com', 1234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `City`
--
ALTER TABLE `City`
  ADD PRIMARY KEY (`CityId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `cityId` (`cityId`);

--
-- Indexes for table `UserDetails`
--
ALTER TABLE `UserDetails`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `UserDetails`
--
ALTER TABLE `UserDetails`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `City` (`CityId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
