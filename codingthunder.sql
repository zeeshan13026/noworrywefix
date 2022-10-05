-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2022 at 02:27 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `data` datetime DEFAULT current_timestamp(),
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `data`, `email`) VALUES
(1, 'first post', '8989767654', 'first message in the post', '0000-00-00 00:00:00', 'firstpost@gmail.com'),
(4, 'zeeshan ahmad', '1234567890', 'uyjbujkydc jjvfjvj', '2022-01-12 01:28:05', 'shan.13026@gmail.com'),
(5, ';dflj', 'lkjljl', 'lklkalf', '2022-01-13 00:27:26', 'lklj@gmail.com'),
(6, 'Harry', '1234567890', 'Hi Zeeshan \r\nhow are you brother.', '2022-01-13 00:31:52', 'harry@gmail.com'),
(7, 'Hi', '1234567879', 'Hi hello', '2022-01-17 00:25:06', 'Hi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` varchar(500) NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Corona Virus', 'A virus which comes from chine', 'first-post', 'Coronavirus disease 2019 (COVID-19) is a contagious disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). The first known case was identified in Wuhan, China, in December 2019.[7] The disease has since spread worldwide, leading to an ongoing pandemic.[8]\n\nSymptoms of COVID‑19 are variable, but often include fever,[9] cough, headache,[10] fatigue, breathing difficulties, and loss of smell and taste.[11][12][13] Symptoms may begin one to fourteen days after exposure to th', 'post-bg.jpg', '2022-01-13 19:33:14'),
(2, 'Android (operating system)', 'iPhone killer', 'second-post', 'Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. Android is developed by a consortium of developers known as the Open Handset Alliance and commercially sponsored by Google. It was unveiled in November 2007, with the first commercial Android device, the HTC Dream, being launched in September 2008.\n\nIt is free and open-source software; its source co', 'post-bg.jpg', '2022-01-13 19:35:34'),
(3, 'white-space', 'The white-space CSS property sets how white space inside an element is handled.', 'third-slug', 'The behavior is identical to that of pre-wrap, except that:\r\n\r\nAny sequence of preserved white space always takes up space, including at the end of the line.\r\nA line breaking opportunity exists after every preserved white space character, including between white space characters.\r\nSuch preserved spaces take up space and do not hang, and thus affect the box’s intrinsic sizes (min-content size and max-content size).', 'post-bg.jpg', '2022-01-13 18:30:00'),
(4, 'What Is a Database?', 'A database is an organized collection of structured information', 'fourth-post', 'A database is an organized collection of structured information, or data, typically stored electronically in a computer system. A database is usually controlled by a database management system (DBMS). Together, the data and the DBMS, along with the applications that are associated with them, are referred to as a database system, often shortened to just database.\r\n\r\nData within the most common types of databases in operation today is typically modeled in rows and columns in a series of tables to ', 'post-bg.jpg', '2022-01-13 18:30:00'),
(5, 'Python (programming language)', 'Python is an interpreted high-level general-purpose programming language. ', 'fifth-post', 'Python is an interpreted high-level general-purpose programming language. Its design philosophy emphasizes code readability with its use of significant indentation. Its language constructs as well as its object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.[31]\r\n\r\nPython is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly, procedural), object-oriented and functional pro', 'post-bg.jpg', '2022-01-13 18:30:00');

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
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
