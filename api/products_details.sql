-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 01:14 AM
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
-- Database: `products_details`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(9, 'PHARMACY'),
(10, 'BODY SPRAY'),
(11, 'GENERAL ITEM'),
(12, 'HAIR OIL'),
(13, 'COSMETIC'),
(14, 'SKIN CARE'),
(15, 'ELECTRIC'),
(16, 'FOOD');

-- --------------------------------------------------------

--
-- Table structure for table `products_details`
--

CREATE TABLE `products_details` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_id` int(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(255) NOT NULL,
  `description` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_details`
--

INSERT INTO `products_details` (`ID`, `name`, `category_id`, `category`, `image`, `price`, `description`) VALUES
(1, 'NESTLE LACTOGEN 1.200GM', 0, '-', 'uploads/NESTLE LACTOGEN 1.200GM.jpg', 0, ''),
(2, 'VASELINE PUMP LOTION 600ML', 0, '-', 'uploads/VASELINE PUMP LOTION 600ML.jpg', 0, ''),
(3, 'FERROUS SULPHATE 200tv1G', 0, 'PHaARMACY', 'uploads/Ferrous-Sulphate-Tablets-100s.jpg', 0, ''),
(4, 'BOLD BODY SPRAY AQUA120ML', 0, 'BODY SPRAY', 'uploads/bold aqua.jpg', 0, ''),
(5, 'BOLD BODY SPRAY FURY 120ML ', 0, 'BODY SPRAY', 'uploads/bold fury.jpg', 0, ''),
(6, 'BOLD BODY SPRAY NOiR 120ML BOX ', 0, 'BODY SPRAY', 'uploads/bold nior.jpg', 0, ''),
(7, 'BOLD BODY SPRAY NOiR 120ML BOX ', 0, 'BODY SPRAY', 'uploads/bold nior.jpg', 0, ''),
(8, 'BOLD BODY SPRAY REVIVE 120ML ', 0, 'BODY SPRAY', 'uploads/bold-life-revive-120-ml.jpg', 0, ''),
(9, 'CHAP OFF', 0, 'GENERAL ITEM	\n', 'uploads/chap off.jpg', 0, ''),
(10, 'HEMANI BLACK SEED HAIR 0IL  100ML', 0, 'HAIR OIL\n', 'uploads/black seed.jpg', 0, ''),
(11, 'HEMANI BLACK SEED HAIR 0IL  60ML', 0, 'COSMETIC\n', 'uploads/black seed 60 ml.jpg', 0, ''),
(12, 'HEMANICASTOR OIL60M', 0, 'COSMETIC\n', 'uploads/hemani castor oil.jpg', 0, ''),
(13, 'HEMANI FACE WASH ARGAN EXTRACT ', 0, 'SKIN CARE', 'uploads/hemani argan extract.jpg', 0, ''),
(14, 'HEMANI MASSAGE OIL 100ML', 0, 'COSMETIC', 'uploads/hemani message oil.jpg', 0, ''),
(16, 'HEMANI NATURAL ROSE WATER 120ML', 0, 'SKIN CARE', 'uploads/hemani rose ewater.jpeg', 0, ''),
(17, 'HEMANI NEEM OIL 100ML', 0, 'HAIR OIL', 'uploads/hemani neem oil 60 ml.jpg', 0, ''),
(18, 'HEMANI OLIVE HAIR OIL 100ML', 0, 'COSMETIC', 'uploads/hemani olive oil.jpg', 0, ''),
(19, 'HEMANI SESAME OIL 60ML', 0, 'COSMETIC', 'uploads/hemani sesame.jpg', 0, ''),
(20, 'HEMANI SWEET ALMOND OIL 60ML', 0, 'COSMETIC', 'uploads/hemani sweet almond.jpg', 0, ''),
(21, 'HEMANI WHITENING FACE WASH 100ML', 0, 'SKIN CARE', 'uploads/hemani whiting.jpg', 0, ''),
(22, 'HERBOIN FACE WASH EXOLIATING 100ML', 0, 'COSMETIC', 'uploads/HERBOIN FACE WASH EXOLIATING 100ML.png', 0, ''),
(23, 'INSPIRE BODY SPRAY FOR MEN AIR 200ML', 0, 'COSMETIC', 'uploads/inspire body.jpeg', 0, ''),
(24, 'INSPIRE BODY SPRAY FOR MEN CASUAL 200ML', 0, 'COSMETIC', 'uploads/INSPIRE BODY SPRAY FOR MEN CASUAL 200ML.jpg', 0, ''),
(25, 'INSPIRE BODY SPRAY FOR MEN ETERRA 200ML', 0, 'COSMETIC', 'uploads/eternia.jpg', 0, ''),
(26, 'INSPIRE BODY SPRAY FOR MEN PASSIONATE 200ML', 0, 'COSMETIC', 'uploads/INSPIRE BODY SPRAY FOR MEN PASSIONATE 200ML.jpg', 0, ''),
(27, 'KEYCHAIN 19', 0, 'COSMETIC', 'uploads/KEYCHAIN 19.jpg', 0, ''),
(28, 'MEHRAN LED EMERGENCY LIGHT (DP-707)', 0, 'ELECTRIC', 'uploads/LED-DP-707B.jpg', 0, ''),
(29, 'NAIL CLIPPERS', 0, 'ELECTRIC', 'uploads/NAIL CLIPPERS.jpg', 0, ''),
(30, 'POWER PLUS BOLL', 0, 'COSMETIC', 'uploads/original-powerball-basic.jpg', 0, ''),
(31, 'REVLON NATURAL HONEY LOTION 350ML', 0, 'COSMETIC', 'uploads/REVLON NATURAL HONEY LOTION 350ML.jpg', 0, ''),
(32, 'RIVAJ LIP BALM PINK MAGIC 5.5GM', 0, 'COSMETIC', 'uploads/RIVAJ LIP BALM PINK MAGIC 5.5.jpg', 0, ''),
(33, 'VADIL 6.25MG TAB', 0, 'PHARMACY', 'uploads/VADIL 6.25MG TAB.png', 0, ''),
(34, 'RULING 40MG CAP', 0, 'PHARMACY', 'uploads/RULING 40MG CAP.png', 0, ''),
(35, 'ZANAC 0.5MG', 0, 'PHARMACY', 'uploads/ZANAC 0.5MG.jpg', 0, ''),
(36, 'LIFEBUOY CARE PROTECT', 0, 'GENERAL ITEM', 'uploads/LIFEBUOY CARE PROTECT.png', 0, ''),
(37, 'YOUNGS FRENCH MAYONNAISE 300ML', 0, 'FOOD', 'uploads/YOUNGS FRENCH MAYONNAISE 300ML.jpg', 0, ''),
(38, '10 CC SYRING', 0, 'PHARMACY', 'uploads/10 CC SYRING.png', 0, ''),
(39, '10 CC SYRING (BD)', 0, 'PHARMACY', 'uploads/10 CC SYRING (BD).jpg', 0, ''),
(40, '10 CC SYRING (MASTER)', 0, 'PHARMACY', 'uploads/10 CC SYRING (MASTER).jpg', 0, ''),
(41, '5 CC SYRING (MEDI AQUA)', 0, 'PHARMACY', 'uploads/5 CC SYRING (medi aqua).jpg', 0, ''),
(42, '3 CC SYRING (ZINDAGI)', 0, 'PHARMACY', 'uploads/3CC SYRING (ZINDAGI).jpg', 0, ''),
(43, 'ZOPENT 40MG 20 STABS', 0, 'PHARMACY', 'uploads/ZOPENT 40MG 20 STABS.jpg', 0, ''),
(44, 'ZPTAR PLUS LIQUID CLEANSER 100ML', 0, 'PHARMACY', 'uploads/ZPTAR PLUS LIQUID CLEANSER 100ML.png', 0, ''),
(45, 'ZULTRACET  37.50MG TAB', 0, 'PHARMACY', 'uploads/ZULTRACET  37.50MG TAB.png', 0, ''),
(46, 'ZURIG 40MG TAB', 0, 'PHARMACY', 'uploads/ZURIG 40MG TAB.jpg', 0, ''),
(47, 'ZURIG 8ZYBON-D0MG TAB', 0, 'PHARMACY', 'uploads/ZURIG 8ZYBON-D0MG TAB.jpg', 0, ''),
(48, 'ZURIG 8ZYBON-D0MG TAB', 0, 'PHARMACY', 'uploads/ZURIG 8ZYBON-D0MG TAB.jpg', 0, ''),
(49, 'ZYLEXX SR 150MG TAB', 0, 'PHARMACY', 'uploads/ZYLEXX SR 150MG TAB.png', 0, ''),
(50, 'ZYLEXX SR 75MG TAB', 0, 'PHARMACY', 'uploads/ZYLEXX SR 75MG TAB.png', 0, ''),
(51, 'ZYLORIC 100 MG 50 STABS', 0, 'PHARMACY', 'uploads/ZYLORIC 100 MG 50 STABS.jpg', 0, ''),
(52, 'ZYLORIC 300 MG 50 STABS', 0, 'PHARMACY', 'uploads/ZYLORIC 300 MG 50 STABS.png', 0, ''),
(53, 'ZERTEC 10 MG 30 STABS ', 0, 'PHARMACY', 'uploads/ZERTEC 10 MG 30 STABS.jpg', 0, ''),
(54, 'ZERTEC SYRUP 60ML ', 0, 'PHARMACY', 'uploads/ZERTEC SYRUP 60ML.jpg', 0, ''),
(55, 'ZYTO 200MG SYP 30ML', 0, 'PHARMACY', 'uploads/ZYTO 200MG SYP 30ML.jpg', 0, ''),
(56, 'ZYTO 250MG TAB', 0, 'PHARMACY', 'uploads/ZYTO 250MG TAB.jpg', 0, ''),
(57, 'ZYTO 500MG TAB', 0, 'PHARMACY', 'uploads/ZYTO 500MG TAB.png', 0, ''),
(58, '10Z BY SHAHID AFRIDI ORANGE 400ML', 0, 'FOOD', 'uploads/10Z BY SHAHID AFRIDI ORANGE 400ML.jpg', 0, ''),
(59, '10Z BY SHAHID AFRIDI LEMON 400ML', 0, 'FOOD', 'uploads/10Z BY SHAHID AFRIDI LEMON 400ML.jpg', 0, ''),
(60, '1121 RICE 10KG', 0, 'FOOD', 'uploads/1121 RICE 10KG.jpg', 0, ''),
(61, '1121 SELLA', 0, 'FOOD', 'uploads/1121 SELLA.jpg', 0, ''),
(62, '1121 STEAM RICE', 0, 'FOOD', 'uploads/1121 STEAM RICE.jpg', 0, ''),
(63, '1CC SYRINGE (B BRAUN)', 0, 'PHARMACY', 'uploads/1CC SYRINGE (B BRAUN) 3part.jpg', 0, ''),
(64, '1CC SYRINGE BM', 0, 'PHARMACY', 'uploads/1CC SYRINGE BM.jpg', 0, ''),
(65, '1 MILLIONAIRE PERFUME', 0, 'COSMETIC', 'uploads/1 MILLIONAIRE PERFUME.PNG', 0, ''),
(66, '1 MILLIONAIRE BODY SPRAY', 0, 'COSMETIC', 'uploads/2 MILLIONAIRE BODY SPRAY.jpg', 0, ''),
(67, '2&2 CLUB MEN POWDER', 0, 'COSMETIC', 'uploads/2&2 CLUB MEN POWDER.jpg', 0, ''),
(68, '25% DEXTROSE 25ML', 0, '_', 'uploads/25% DEXTROSE 25ML.jpg', 0, ''),
(69, '2 PIN MOBILE SHOW 110AM', 0, '_', 'uploads/2 PIN MOBILE SHOW 110AM.PNG', 0, ''),
(70, '2 PIN PLUG', 0, '_', 'uploads/2 PIN PLUG.PNG', 0, ''),
(71, '2 PIN PLUG SPECIAL', 0, '_', 'uploads/2 PIN PLUG SPECIAL.jpg', 0, ''),
(72, '2 PIN SOCKET MOBILE MULTY', 0, '_', 'uploads/2 PIN SOCKET MOBILE MULTY.jpeg', 0, ''),
(73, '2 PIN SOCKET MOBILE MULTY', 0, '_', 'uploads/2 PIN SOCKET MOBILE MULTYS.jpg', 0, ''),
(74, '4 PIN SOCKET MULTY SMALL', 0, '_', 'uploads/4 PIN SOCKET MULTY SMALL.jpg', 0, ''),
(75, '30 CC SYRING (MASTER)', 0, '_', 'uploads/30 CC SYRING (MASTER).PNG', 0, ''),
(76, 'YARDLEY ENGLISH ROSE SOAP 100GM', 0, 'COSMETIC', 'uploads/YARDLEY ENGLISH ROSE SOAP 100GM.PNG', 0, ''),
(77, 'YARDLEY ENGLISH ROSE SOAP 100GM', 0, 'BODY SPRAY', 'uploads/YARDLEY EQUITY BODY SPRAY 150ML.PNG', 0, ''),
(78, 'YARDLEY GENTLEMAN BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY GENTLEMAN BODY SPRAY 150ML.jpg', 0, ''),
(79, 'YARDLEY JASMINE BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY JASMINE BODY SPRAY 150ML.jpg', 0, ''),
(80, 'YARDLEY JASMINE SOAP 100GM', 0, 'COSMETIC', 'uploads/YARDLEY JASMINE SOAP 100GM.PNG', 0, ''),
(81, 'YARDLEY LEGEND DEODRANT BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY LEGEND DEODRANT BODY SPRAY 150ML.jpg', 0, ''),
(82, 'YARDLEY LONDON ORGINAL DEODRANT  BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY LONDON ORGINAL DEODRANT  BODY SPRAY 150ML.jpeg', 0, ''),
(83, 'YARDLEY NAVY DEODRANT BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY NAVY DEODRANT BODY SPRAY 150ML.png', 0, ''),
(84, 'YARDLEY RED ROSES BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY RED ROSES BODY SPRAY 150ML.png', 0, ''),
(85, 'YARDLEY SANDALWOOD BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY SANDALWOOD BODY SPRAY 150ML.jpg', 0, ''),
(86, 'YARDLEY SOAP +1 FREE', 0, 'COSMETIC', 'uploads/YARDLEY SOAP +1 FREE.jpg', 0, ''),
(87, 'YARDLEY SPORT BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY SPORT BODY SPRAY 150ML.jpg', 0, ''),
(88, 'YARDLEY URBAN BODY SPRAY 150ML', 0, 'BODY SPRAY', 'uploads/YARDLEY URBAN BODY SPRAY 150ML.png', 0, ''),
(89, 'YARDLEY HAIR SPRAY 420ML NOVA GOLD', 0, 'COSMETIC', 'uploads/YARDLEY HAIR SPRAY 420ML NOVA GOLDs.png', 0, ''),
(90, 'YAZ TABLET', 0, 'PHARMACY', 'uploads/YAZ TABLET.jpg', 0, ''),
(91, 'YC FACEWASH (CUCUMBER EXTRACT) 100ML\n', 0, '.', 'uploads/YC FACEWASH (CUCUMBER EXTRACT) 50ML.png', 0, ''),
(92, 'YC FACEWASH (LEMON EXTRACT) 100ML', 0, '.', 'uploads/YC FACEWASH (LEMON EXTRACT) 100ML.jpg', 0, ''),
(93, 'YC WHITENING FACEWASH NEEM EXTRACT', 0, 'COSMETIC', 'uploads/YC WHITENING FACEWASH NEEM EXTRACT.jpg', 0, ''),
(94, 'YELLOW LABEL TEA 50PCS', 0, '.', 'uploads/YELLOW LABEL TEA 50PCS.jpg', 0, ''),
(95, 'YELLOW LABEL TEA BAG 100PCS', 0, '.', 'uploads/YELLOW LABEL TEA BAG 100PCS.png', 0, ''),
(96, 'MINI BOTTLE GLASS', 0, '.', 'uploads/MINI BOTTLE GLASS.jpg', 0, ''),
(97, 'YES GLASS BOTTLE WITH COVER', 0, '.', 'uploads/YES GLASS BOTTLE WITH COVER.jpg', 0, ''),
(98, 'YOGHURT VANILLA HONEY 36ML', 0, 'GENERAL ITEM', 'uploads/YOGHURT VANILLA HONEY 36ML.png', 0, ''),
(99, 'YOUNGS BEE HIWES HONEY 250GM', 0, 'FOOD', 'uploads/YOUNGS BEE HIWES HONEY 250GM.jpg', 0, ''),
(100, 'YOUNGS BEE HIWES HONEY 450GM', 0, 'FOOD', 'uploads/YOUNGS BEE HIWES HONEY 450GM.png', 0, ''),
(101, 'YOUNGS CHICKEN FILLER CHAPLI 275GM', 0, '.', 'uploads/YOUNGS CHICKEN FILLER CHAPLI 275GM.png', 0, ''),
(102, 'YOUNGS CHICKEN FILLER FAJITA 275GM', 0, '.', 'uploads/YOUNGS CHICKEN FILLER FAJITA 275GM.jpg', 0, ''),
(103, 'YOUNGS CHICKEN SPREAD 1 LITRE', 0, 'FOOD', 'uploads/YOUNGS CHICKEN SPREAD 1 LITRE.jpg', 0, ''),
(104, 'YOUNGS CHICKEN SPREAD 500ML', 0, 'FOOD', 'uploads/YOUNGS CHICKEN SPREAD 500ML.jpg', 0, ''),
(105, 'YOUNGS CHICKEN SPREAD FAJITA 100ML', 0, 'FOOD', 'uploads/YOUNGS CHICKEN SPREAD FAJITA 100ML.jpg', 0, ''),
(106, 'YOUNGS CHICKEN SPREAD FAJITA 500ML', 0, 'FOOD', 'uploads/YOUNGS CHICKEN SPREAD FAJITA 200ML.jpg', 0, ''),
(107, 'YOUNGS CHOCO BLISS', 0, 'FOOD', 'uploads/YOUNGS CHOCO BLISS.jpg', 0, ''),
(108, 'YOUNGS CHOCO BLISS HAZELNUT 400GM', 0, 'FOOD', 'uploads/YOUNGS CHOCO BLISS HAZELNUT 400GM.jpg', 0, ''),
(109, 'YOUNGS CHOCO BLISS MILK 350GM', 0, 'FOOD', 'uploads/YOUNGS CHOCO BLISS MILK 350GM.jpg', 0, ''),
(110, 'YOUNGS CHOCO BLISS MILKY 675gm', 0, '-', 'uploads/YOUNGS CHOCO BLISS MILKY 675gm.jpg', 0, ''),
(111, 'YOUNGS CHOCO BLISS PEANUT COCO SP ', 0, '-', 'uploads/YOUNGS CHOCO BLISS PEANUT COCO SP 350gm.jpg', 0, ''),
(112, 'YOUNGS CHOCOLATE SPREAD 170GM', 0, '-', 'uploads/YOUNGS CHOCOLATE SPREAD 170GM.png', 0, ''),
(113, 'YOUNGS CRAVE CHOCO TOPPING SYRUP 623gm', 0, '-', 'uploads/YOUNGS CRAVE CHOCO TOPPING SYRUP 623gm.png', 0, ''),
(114, 'YOUNGS CREAMY AND SALTED MAYONNAISE', 0, 'FOOD', 'uploads/YOUNGS CREAMY AND SALTED MAYONNAISE.png', 0, ''),
(115, 'YOUNGS FRENCH CHICKEN SPREAD 300ML', 0, 'FOOD', 'uploads/YOUNGS FRENCH CHICKEN SPREAD 300ML.jpeg', 0, ''),
(116, 'YOUNGS FRENCH CHICKEN SPREAD  BAR-B-QUE300ML', 0, 'FOOD', 'uploads/YOUNGS FRENCH CHICKEN SPREAD  BAR-B-QUE300ML.jpg', 0, ''),
(117, 'YOUNGS FRENCH CHOCOLATE SPREAD 380ML', 0, 'FOOD', 'uploads/YOUNGS FRENCH CHOCOLATE SPREAD 380ML.jpg', 0, ''),
(118, 'YOUNGS FRENCH MAYONNAISE 300ML', 0, 'FOOD', 'uploads/YOUNGS FRENCH MAYONNAISE 300ML.jpg', 0, ''),
(119, 'YOUNGS FRENCH DRESSING 500ML', 0, 'FOOD', 'uploads/French-Dressing-500 youngs.png', 0, ''),
(120, 'YOUNGS HONEY 125GMS', 0, 'FOOD', 'uploads/YOUNGS HONEY 125GMS.jpg', 0, ''),
(129, 'Test Product', 0, 'Test Category', NULL, 0, ''),
(135, 'Test Product One', 0, 'Logo Category', 'uploads/Untitled-1.jpg', 0, ''),
(140, 'abc', 0, 'pharmacy', 'uploads/complete activuty.png', 0, 'medicine'),
(141, 'abc', 0, '\nPHARMACY', 'uploads/complete activuty.png', 0, 'medicine');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `address`, `password`) VALUES
(1, 'anumakbani', 'furqan akbani', 'anum@gmail.com', '03345678923', 'soldier', '123'),
(3, 'nida', 'naz', 'nida@gmail.com', '123474353', 'nazimabad', '100'),
(4, 'anumakbani', 'furqan akbani', 'anum@gmail.com', '03345678923', 'soldier', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_details`
--
ALTER TABLE `products_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products_details`
--
ALTER TABLE `products_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
