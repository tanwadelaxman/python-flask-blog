-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2021 at 08:22 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thevision`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(200) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` int(100) NOT NULL,
  `Message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `Name`, `Email`, `Phone`, `Message`) VALUES
(1, 'Laxman ', 'laxman@gmail.com', 0, 'the contact'),
(2, 'rahul', 'rahul@gmail.com', 0, 'send message');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(200) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tag_line`, `slug`, `content`, `date`) VALUES
(1, 'TECHNOLOGY', 'technology info', '1st-post', 'Technology, the application of scientific knowledge to the practical aims of human life or, as it is sometimes phrased, to the change and manipulation of the human environment.\r\nThe subject of technology is treated in a number of articles. For general treatment, see technology, history of; hand tool. For description of the materials that are both the object and means of manipulating the environment, see elastomers; industrial ceramics; industrial glass; metallurgy; mineral deposit; mineral processing; mining; plastic. ', '2021-07-04 13:14:36.861557'),
(2, 'FUTURE TECHNOLOGY', 'Future technology info', 'second-post', 'This future revolution has been explored in films, novels, and video games, which have predicted the creation of many inventions, as well as foreseeing future events. Such inventions and events include a government-controlled simulation that resulted from massive robotics advancements, (The Matrix), a society that has rid itself of procreation due to improvements in genetic engineering (Brave New World), and a police state enforced by the government using datamining, nanobots, and drones (Watch Dogs). Humans have already made some of the first steps toward achieving the GNR revolution.', '2021-07-04 13:18:21.136262'),
(3, 'APPROPRIATE TECHNOLOGY', 'Appropriate technology info', '3rd-poost', 'Appropriate technology is a movement (and its manifestations) encompassing technological choice and application that is small-scale, affordable by locals, decentralized, labor-intensive, energy-efficient, environmentally sound, and locally autonomous.[1][2] It was originally articulated as intermediate technology by the economist Ernst Friedrich \"Fritz\" Schumacher in his work Small Is Beautiful. Both Schumacher and many modern-day proponents of appropriate technology also emphasize the technology as people-centered', '2021-07-04 00:00:00.000000'),
(4, 'ARCHIECTURAL TECHNOLOGY', 'Architectural technology info', '4th-post', 'Architectural technology, or building technology, is the application of technology to the design of buildings. It is a component of architecture and building engineering and is sometimes viewed as a distinct discipline or sub-category. New materials and technologies generated new design challenges and construction methods throughout the evolution of building, especially since the advent of industrialisation in the 19th century. Architectural technology is related to the different elements of a building and their interactions; it is closely aligned with advances in building science', '2021-07-04 00:00:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
