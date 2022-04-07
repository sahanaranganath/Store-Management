-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2022 at 04:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `countcategory` ()  SELECT category ,categoryName, COUNT(*) AS Total from products JOIN category 
WHERE products.category=category.id
group by category$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `report` (IN `startdate` DATE, IN `enddate` DATE)  SELECT U.name,U.contactno,P.productName,O.quantity,P.productPrice,P.shippingCharge,O.orderDate FROM products AS P JOIN ORDERS AS O JOIN users AS U  WHERE P.id=O.productId AND O.userId=U.id
AND O.orderStatus='Delivered'
AND orderDate BETWEEN startdate AND enddate$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '2017-01-24 16:21:18', '23-03-2022 09:48:44 AM'),
(2, 'admin1', '81dc9bdb52d04dc20036dbd8313ed055', '2022-02-06 07:53:38', '23-03-2022 09:50:58 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Books', 'A wide variety of academic, thriller, horror books.', '2022-01-24 19:17:37', '06-02-2022 02:12:27 PM'),
(4, 'Appliances', 'Electronic Products', '2022-01-24 19:19:32', ''),
(5, 'Furniture', 'Furnish your space with out wide variety of furnitures ', '2022-01-24 19:19:54', ''),
(6, 'Fashion', 'We never go out of style!', '2022-02-20 19:18:52', ''),
(7, 'Stationery', 'commercially manufactured writing materials, including cut paper, envelopes, writing implements, continuous form paper, and other office supplies', '2022-02-01 17:07:14', '01-02-2022 10:37:21 PM'),
(16, 'Fruits&Vegetables', 'Fresh fruits and vegetables handpicked at the farm.', '2022-02-05 10:51:10', NULL),
(17, 'Pet Products', 'Some items for your pet.', '2022-02-05 10:54:40', NULL),
(18, 'Home Décor', 'Everything you need to make your house fell like home.', '2022-02-05 13:52:53', NULL),
(19, 'Demo', 'adca', '2022-02-06 15:21:25', NULL);

--
-- Triggers `category`
--
DELIMITER $$
CREATE TRIGGER `deletesubcategory` BEFORE DELETE ON `category` FOR EACH ROW DELETE FROM subcategory WHERE subcategory.categoryid=OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(8, 4, '21', 1, '2022-02-01 17:23:55', 'COD', 'Delivered'),
(9, 4, '15', 2, '2022-02-01 17:35:43', 'COD', 'Delivered'),
(10, 5, '21', 1, '2022-02-03 16:12:11', 'COD', 'Delivered'),
(11, 5, '21', 1, '2022-02-03 16:17:01', 'COD', 'Delivered'),
(12, 5, '15', 1, '2022-02-03 16:19:16', 'COD', 'Delivered'),
(16, 4, '1', 2, '2022-02-04 11:21:15', 'Internet Banking', NULL),
(25, 4, '22', 1, '2022-02-04 12:09:04', 'COD', NULL),
(26, 4, '22', 1, '2022-02-04 12:14:14', 'COD', NULL),
(30, 4, '22', 1, '2022-02-04 14:44:21', 'COD', NULL),
(31, 4, '22', 4, '2022-02-04 15:07:47', 'COD', NULL),
(32, 4, '15', 1, '2022-02-04 15:09:19', 'COD', 'Delivered'),
(36, 4, '16', 17, '2022-02-05 00:45:44', 'COD', NULL),
(37, 4, '2', 1, '2022-02-05 00:57:58', 'COD', NULL),
(38, 4, '19', 2, '2022-02-05 03:30:21', 'Internet Banking', 'Delivered'),
(40, 4, '2', 7, '2022-02-05 03:48:18', 'COD', NULL),
(41, 4, '2', 3, '2022-02-05 03:49:04', 'COD', NULL),
(42, 4, '17', 8, '2022-02-05 05:54:30', 'COD', NULL),
(43, 4, '22', 10, '2022-02-05 09:48:37', 'COD', NULL),
(44, 4, '19', 10, '2022-02-05 10:33:07', 'COD', NULL),
(45, 6, '26', 10, '2022-02-05 10:43:40', 'Internet Banking', 'Delivered'),
(46, 6, '30', 1, '2022-02-05 10:52:26', 'COD', NULL),
(47, 6, '28', 1, '2022-02-05 10:52:57', 'COD', NULL),
(48, 7, '32', 4, '2022-02-05 13:57:57', 'Internet Banking', 'Delivered'),
(49, 4, '31', 1, '2022-02-06 04:42:20', 'COD', 'Delivered'),
(51, 6, '31', 1, '2022-02-06 17:21:38', 'COD', NULL),
(52, 7, '19', 1, '2022-02-06 17:32:18', 'Internet Banking', NULL),
(53, 4, '2', 1, '2022-03-23 03:36:15', 'COD', 'Delivered'),
(54, 4, '15', 1, '2022-03-23 03:39:16', 'COD', 'Delivered'),
(55, 8, '30', 1, '2022-03-23 03:42:15', 'COD', 'Delivered'),
(56, 4, '16', 1, '2022-03-23 03:51:41', 'COD', 'Delivered'),
(57, 4, '37', 1, '2022-03-26 05:37:15', 'COD', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(5, 8, 'in Process', 'ASas', '2022-02-01 17:27:36'),
(6, 8, 'Delivered', 'saa', '2022-02-01 17:29:25'),
(7, 1, 'Delivered', 'asd', '2022-02-01 17:29:56'),
(8, 9, 'Delivered', 'sgrf', '2022-02-01 17:37:15'),
(9, 10, 'Delivered', 'dv', '2022-02-03 16:12:57'),
(10, 11, 'Delivered', 'SX', '2022-02-03 16:18:14'),
(11, 12, 'Delivered', 'vgu', '2022-02-03 16:19:34'),
(12, 38, 'in Process', 'Order in process', '2022-02-05 03:30:53'),
(13, 38, 'Delivered', 'delivered', '2022-02-05 03:32:03'),
(14, 32, 'Delivered', 'gv', '2022-02-05 06:17:52'),
(15, 45, 'Delivered', 'sdvzv', '2022-02-05 10:43:53'),
(16, 48, 'in Process', 'zdcS Cva', '2022-02-05 13:58:36'),
(17, 48, 'Delivered', 'Its deliverd', '2022-02-05 13:58:59'),
(18, 49, 'Delivered', 'its delivered', '2022-02-06 08:41:23'),
(19, 53, 'Delivered', 'delivered', '2022-03-23 03:36:46'),
(20, 54, 'Delivered', 'hm', '2022-03-23 03:40:49'),
(21, 55, 'in Process', 'asdas', '2022-03-23 03:42:37'),
(22, 55, 'Delivered', 'sdsad', '2022-03-23 03:42:53'),
(23, 56, 'Delivered', 'sf', '2022-03-23 04:20:06'),
(24, 57, 'Delivered', 'dr', '2022-03-26 05:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `productlog`
--

CREATE TABLE `productlog` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `sucategoryid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productlog`
--

INSERT INTO `productlog` (`id`, `productid`, `categoryid`, `sucategoryid`, `quantity`, `action`, `cdate`) VALUES
(1, 35, 18, 22, 12, 'INSERTED', '2022-02-05'),
(2, 1, 4, 3, 20, 'UPDATED', '2022-02-05'),
(3, 32, 18, 22, 10, 'DELETED', '2022-02-05'),
(4, 31, 17, 21, 0, 'UPDATED', '2022-02-06'),
(5, 31, 17, 21, 0, 'UPDATED', '2022-02-06'),
(6, 22, 7, 13, 10, 'UPDATED', '2022-02-06'),
(7, 21, 7, 13, 0, 'UPDATED', '2022-02-06'),
(8, 21, 7, 13, 10, 'UPDATED', '2022-02-06'),
(9, 21, 7, 13, 10, 'UPDATED', '2022-02-06'),
(10, 21, 7, 13, 10, 'UPDATED', '2022-02-06'),
(11, 21, 7, 13, 10, 'UPDATED', '2022-02-06'),
(12, 22, 7, 13, 10, 'UPDATED', '2022-02-06'),
(13, 22, 7, 13, 10, 'UPDATED', '2022-02-06'),
(14, 22, 7, 13, 10, 'UPDATED', '2022-02-06'),
(15, 22, 7, 13, 10, 'UPDATED', '2022-02-06'),
(16, 19, 6, 12, 8, 'UPDATED', '2022-02-06'),
(17, 20, 6, 12, 10, 'UPDATED', '2022-02-06'),
(18, 30, 16, 20, 14, 'UPDATED', '2022-02-06'),
(19, 30, 16, 20, 14, 'UPDATED', '2022-02-06'),
(20, 30, 16, 20, 14, 'UPDATED', '2022-02-06'),
(21, 30, 16, 20, 14, 'UPDATED', '2022-02-06'),
(22, 34, 18, 22, 12, 'UPDATED', '2022-02-06'),
(23, 34, 18, 22, 12, 'UPDATED', '2022-02-06'),
(24, 34, 18, 22, 12, 'UPDATED', '2022-02-06'),
(25, 34, 18, 22, 12, 'UPDATED', '2022-02-06'),
(26, 35, 18, 22, 12, 'UPDATED', '2022-02-06'),
(27, 35, 18, 22, 12, 'UPDATED', '2022-02-06'),
(28, 35, 18, 22, 12, 'UPDATED', '2022-02-06'),
(29, 35, 18, 22, 12, 'UPDATED', '2022-02-06'),
(30, 31, 17, 21, 10, 'UPDATED', '2022-02-06'),
(31, 31, 17, 21, 10, 'UPDATED', '2022-02-06'),
(32, 31, 17, 21, 10, 'UPDATED', '2022-02-06'),
(33, 31, 17, 21, 10, 'UPDATED', '2022-02-06'),
(34, 33, 17, 21, 12, 'UPDATED', '2022-02-06'),
(35, 33, 17, 21, 12, 'UPDATED', '2022-02-06'),
(36, 33, 17, 21, 12, 'UPDATED', '2022-02-06'),
(37, 33, 17, 21, 12, 'UPDATED', '2022-02-06'),
(38, 36, 6, 23, 14, 'INSERTED', '2022-02-06'),
(39, 37, 19, 24, 12, 'INSERTED', '2022-02-06'),
(40, 36, 6, 23, 13, 'UPDATED', '2022-02-06'),
(41, 31, 17, 21, 9, 'UPDATED', '2022-02-06'),
(42, 19, 6, 12, 7, 'UPDATED', '2022-02-06'),
(43, 1, 4, 3, 0, 'UPDATED', '2022-02-06'),
(44, 13, 4, 6, 0, 'UPDATED', '2022-02-06'),
(45, 2, 4, 4, 9, 'UPDATED', '2022-03-23'),
(46, 15, 3, 8, 1, 'UPDATED', '2022-03-23'),
(47, 30, 16, 20, 13, 'UPDATED', '2022-03-23'),
(48, 16, 3, 8, 9, 'UPDATED', '2022-03-23'),
(49, 37, 19, 24, 11, 'UPDATED', '2022-03-26'),
(50, 37, 19, 24, 11, 'UPDATED', '2022-03-31'),
(51, 37, 19, 24, 11, 'UPDATED', '2022-03-31'),
(52, 38, 4, 6, 1, 'INSERTED', '2022-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `quantity`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', 139900, 0, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Sales Package</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Model Name</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">32T6175MHD</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Display Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">81 cm (32)</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Screen Type</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">LED</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">HD Technology &amp; Resolutiontest</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">HD Ready, 1366 x 768</li></ul></li></ul>', 'micromax1.jpeg', 'micromax main image.jpg', 'logo.png', 1200, 'Out of Stock', '2017-01-30 16:54:35', '', 0),
(2, 4, 4, 'Apple iPhone 6 (Silver, 16 GB)', 'Apple INC', 36990, 0, '<div class=\"_2PF8IO\" style=\"box-sizing: border-box; margin: 0px 0px 0px 110px; padding: 0px; flex: 1 1 0%; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px;\"><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">1 GB RAM | 16 GB ROM |</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">4.7 inch Retina HD Display</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">8MP Primary Camera | 1.2MP Front</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Li-Ion Battery</li><li class=\"_1tMfkh\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">A8 Chip with 64-bit Architecture and M8 Motion Co-processor Processor</li></ul></div>', 'apple-iphone-6-1.jpeg', 'apple-iphone-6-2.jpeg', 'apple-iphone-6-3.jpeg', 0, 'In Stock', '2017-01-30 16:59:00', '', 9),
(3, 4, 4, 'Redmi Note 4 (Gold, 32 GB)  (With 3 GB RAM)', 'Redmi', 10999, 0, '<br><div><ol><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>4100 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 625 64-bit Processor<br></li></ol></div>', 'mi-redmi-note-4-1.jpeg', 'mi-redmi-note-4-2.jpeg', 'mi-redmi-note-4-3.jpeg', 10, 'In Stock', '2017-02-04 04:03:15', '', 10),
(4, 4, 4, 'Lenovo K6 Power (Silver, 32 GB) ', 'Lenovo', 9999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>4000 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 430 Processor<br></li></ul>', 'lenovo-k6-power-k33a42-1.jpeg', 'lenovo-k6-power-k33a42-2.jpeg', 'lenovo-k6-power-k33a42-3.jpeg', 45, 'In Stock', '2017-02-04 04:04:43', '', 10),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', 11999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>3500 mAh Li-Ion Polymer Battery<br></li><li>Helio P10 64-bit Processor<br></li></ul>', 'lenovo-k5-note-pa330010in-1.jpeg', 'lenovo-k5-note-pa330116in-2.jpeg', 'lenovo-k5-note-pa330116in-3.jpeg', 0, 'In Stock', '2017-02-04 04:06:17', '', 12),
(6, 4, 4, 'Micromax Canvas Mega 4G', 'Micromax', 6999, 0, '<ul><li>3 GB RAM | 16 GB ROM |<br></li><li>5.5 inch HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>2500 mAh Battery<br></li><li>MT6735 Processor<br></li></ul>', 'micromax-canvas-mega-4g-1.jpeg', 'micromax-canvas-mega-4g-2.jpeg', 'micromax-canvas-mega-4g-3.jpeg', 35, 'In Stock', '2017-02-04 04:08:07', '', 14),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', 7490, 0, '<ul><li>1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch HD Display<br></li><li>8MP Primary Camera | 5MP Front<br></li><li>2600 mAh Li-Ion Battery<br></li><li>Exynos 3475 Processor<br></li></ul>', 'samsung-galaxy-on7-sm-1.jpeg', 'samsung-galaxy-on5-sm-2.jpeg', 'samsung-galaxy-on5-sm-3.jpeg', 20, 'In Stock', '2017-02-04 04:10:17', '', 10),
(8, 4, 4, 'OPPO A57', 'OPPO', 14990, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 256 GB<br></li><li>5.2 inch HD Display<br></li><li>13MP Primary Camera | 16MP Front<br></li><li>2900 mAh Battery<br></li><li>Qualcomm MSM8940 64-bit Processor<br></li></ul>', 'oppo-a57-na-original-1.jpeg', 'oppo-a57-na-original-2.jpeg', 'oppo-a57-na-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:11:54', '', 16),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', 259, 0, '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', 'amzer-amz98947-original-1.jpeg', 'amzer-amz98947-original-2.jpeg', 'amzer-amz98947-original-3.jpeg', 10, 'In Stock', '2017-02-04 04:17:03', '', 12),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', 19990, 0, '<ul><li>Intel Pentium Quad Core Processor ( )<br></li><li>4 GB DDR3 RAM<br></li><li>Linux/Ubuntu Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul>', 'acer-aspire-notebook-original-1.jpeg', 'acer-aspire-notebook-original-2.jpeg', 'acer-aspire-notebook-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:26:17', '', 14),
(12, 4, 6, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', 'Micromax', 10999, 0, '<ul><li>Intel Atom Processor ( 4th Gen )<br></li><li>2 GB DDR3 RAM<br></li><li>32 bit Windows 10 Operating System<br></li><li>11.6 inch Touchscreen Display<br></li></ul>', 'micromax-lt777w-2-in-1-laptop-original-1.jpeg', 'micromax-lt777w-2-in-1-laptop-original-2.jpeg', 'micromax-lt777w-2-in-1-laptop-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:28:17', '', 8),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', 41990, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">HP Core i5 5th Gen - (4 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) N8M28PA 15-ac123tx Notebook</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(15.6 inch, Turbo SIlver, 2.19 kg)</span><br><div><ul><li>Intel Core i5 Processor ( 5th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'hp-notebook-original-1.jpeg', 'hp-notebook-original-2.jpeg', 'hp-notebook-original-3.jpeg', 0, 'Out of Stock', '2017-02-04 04:30:24', '', 0),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', 22990, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">Lenovo Ideapad 110 APU Quad Core A6 6th Gen - (4 GB/500 GB HDD/Windows 10 Home) 80TJ00D2IH IP110 15ACL Notebook</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(15.6 inch, Black, 2.2 kg)</span><br><div><ul><li>AMD APU Quad Core A6 Processor ( 6th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>500 GB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'lenovo-ideapad-notebook-original-1.jpeg', 'lenovo-ideapad-notebook-original-2.jpeg', 'lenovo-ideapad-notebook-3.jpeg', 0, 'In Stock', '2017-02-04 04:32:15', '', 12),
(15, 3, 8, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', 205, 250, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">The Wimpy Kid Do -It- Yourself Book</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 50, 'In Stock', '2017-02-04 04:35:13', '', 1),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', 240, 0, '<ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Scholastic<br></li><li>ISBN: 9789351032083, 9351032086<br></li><li>Edition: 2015<br></li><li>Pages: 176<br></li></ul>', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', 30, 'In Stock', '2017-02-04 04:36:23', '', 9),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', 32566, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">Induscraft Solid Wood King Bed With Storage</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(Finish Color - Honey Brown)</span><br><div><ul><li>Material Subtype: Rosewood (Sheesham)<br></li><li>W x H x D: 1850 mm x 875 mm x 2057.5 mm<br></li><li>Floor Clearance: 8 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-1.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-2.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:40:37', '', 12),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', 6523, 0, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">@home by Nilkamal Ursa Metal Queen Bed</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(Finish Color - NA)</span><br><div><ul><li>Material Subtype: Carbon Steel<br></li><li>W x H x D: 1590 mm x 910 mm x 2070 mm<br></li><li>Floor Clearance: 341 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-1.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-2.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:42:27', '', 3),
(19, 6, 12, 'Asian Casuals  (White, White)', 'Asian', 379, 0, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Colour: White, White</li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Outer Material: Denim</li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><br></div></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 45, 'In Stock', '2022-02-03 20:16:03', '', 7),
(20, 6, 12, 'Adidas MESSI 16.3 TF Football turf Shoes  (Blue)', 'Adidas', 4129, 5000, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Colour: Blue</li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Closure: Laced</li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Weight</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>200 g (per single Shoe) - Weight of the product may vary depending on size.</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Style</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>Panel and Stitch Detail, Textured Detail</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Tip Shape</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>Round</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Season</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>AW16</b></li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><b>Closure</b></div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\"><b>Laced</b></li></ul></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 0, 'In Stock', '2022-02-03 20:19:22', '', 10),
(21, 7, 13, 'Colour Pencils', 'Apsara', 100, 120, '28 shades of color pencils to create art', 'pencils.jpg', 'pencils1.jpg', 'pencils2.jpg', 0, 'In Stock', '2022-02-01 17:10:48', NULL, 10),
(22, 7, 13, 'Paint box', 'Apsara', 350, 500, 'Get free paint brushed with it', 'paint1.jpg', 'paint2.jpg', 'paint3.jpg', 10, 'In Stock', '2022-02-04 09:17:53', NULL, 10),
(30, 16, 20, 'Fruit Basket', 'Freshmart', 750, 800, 'Fresh variety of fruits.', 'fruit1.jpg', 'fruit2.png', 'fruit3.jpg', 50, 'In Stock', '2022-02-05 10:51:51', NULL, 13),
(31, 17, 21, 'Pedigree', 'Pedigree', 800, 1000, 'Healthy snack for your dog', 'pedigree1.jpg', 'pedigree2.jpg', 'pedigree3.jpg', 10, 'In Stock', '2022-02-05 10:55:14', NULL, 9),
(33, 17, 21, 'Leash', 'Petcare', 800, 1500, 'Leash', 'leash1.jpg', 'leash2.jpg', 'leash3.jpg', 10, 'In Stock', '2022-02-05 16:45:47', NULL, 12),
(34, 18, 22, 'Photo Frame', 'Lighter', 1000, 1500, 'Capture memories on walls', 'frame3.jpeg', 'frame1.jpg', 'frame2.jpg', 10, 'In Stock', '2022-02-05 16:47:55', NULL, 12),
(35, 18, 22, 'Wall Stickers', 'Stikerly', 250, 300, 'Decoration', 'sticker1.jpeg', 'sticker2.jpg', 'sticker3.jpeg', 0, 'In Stock', '2022-02-05 17:04:25', NULL, 12),
(36, 6, 23, 'Formal Shirt', 'Trends', 500, 1000, 'A set of 3 formal shirts', 'shirt1.jpg', 'shirt2.jpg', 'shirt3.jpg', 10, 'In Stock', '2022-02-06 10:26:43', NULL, 13),
(37, 19, 24, 'Demo object', 'Demozone', 100, 1000, 'ascaca', 'taj.jpg', 'image.png', 'image (2).png', 50, 'In Stock', '2022-02-06 15:22:14', NULL, 11),
(38, 4, 6, 'Demo object', 'Demozone', 10, 1000, 'ZSX', '20201002_091204.jpg', 'taj.jpg', 'GSI.JPG', 10, 'In Stock', '2022-03-31 00:43:01', NULL, 1);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `deleteproduct` BEFORE DELETE ON `products` FOR EACH ROW INSERT INTO productlog VALUES(null,OLD.id,OLD.category,OLD.subCategory,OLD.quantity,'DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertintoproduct` AFTER INSERT ON `products` FOR EACH ROW INSERT INTO productlog VALUES(null,NEW.id,NEW.category,NEW.subCategory,NEW.quantity,'INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `instock` BEFORE UPDATE ON `products` FOR EACH ROW IF (NEW.quantity)>1 THEN
            SET NEW.productAvailability='In Stock';
      
      END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `outofstock` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
      IF (NEW.quantity)<1 THEN
            SET NEW.productAvailability='Out of Stock';
      
      END IF;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateProducts` AFTER UPDATE ON `products` FOR EACH ROW INSERT INTO productlog VALUES(null,NEW.id,NEW.category,NEW.subCategory,NEW.quantity,'UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Led Television', '2022-01-26 16:24:52', '05-02-2022 11:51:16 AM'),
(3, 4, 'Television', '2022-01-26 16:29:09', '05-02-2022 11:51:03 AM'),
(4, 4, 'Mobiles', '2022-01-30 16:55:48', ''),
(5, 4, 'Mobile Accessories', '2022-02-04 04:12:40', ''),
(6, 4, 'Laptops', '2022-02-04 04:13:00', ''),
(7, 4, 'Computers', '2022-02-04 04:13:27', ''),
(8, 3, 'Comics', '2022-02-04 04:13:54', ''),
(9, 5, 'Beds', '2022-02-04 04:36:45', ''),
(10, 5, 'Sofas', '2022-02-04 04:37:02', ''),
(11, 5, 'Dining Tables', '2022-02-04 04:37:51', ''),
(12, 6, 'Footwears', '2022-01-31 20:12:59', ''),
(13, 7, 'Art and craft', '2022-02-01 17:09:28', '06-02-2022 03:24:32 PM'),
(20, 16, 'Fruits', '2022-02-05 10:51:26', '06-02-2022 03:38:22 PM'),
(21, 17, 'Dogs', '2022-02-05 10:54:49', '06-02-2022 03:47:44 PM'),
(22, 18, 'Wall', '2022-02-05 13:53:04', '06-02-2022 03:42:12 PM'),
(23, 6, 'Clothes', '2022-02-06 10:25:32', NULL),
(24, 19, 'Demo1', '2022-02-06 15:21:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:05:52', '01-02-2022 10:46:45 PM', 1),
(25, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:16:58', '01-02-2022 10:52:17 PM', 1),
(26, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:22:32', '01-02-2022 10:58:19 PM', 1),
(27, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:28:30', '01-02-2022 11:02:56 PM', 1),
(28, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:33:05', '01-02-2022 11:11:52 PM', 1),
(29, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:42:04', '01-02-2022 11:23:50 PM', 1),
(30, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:55:12', '01-02-2022 11:25:20 PM', 1),
(31, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-01 17:55:32', '03-02-2022 07:06:46 AM', 1),
(32, 'eren@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-03 16:11:35', '03-02-2022 09:43:29 PM', 1),
(33, 'eren@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-03 16:16:51', '03-02-2022 09:54:08 PM', 1),
(34, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 10:57:44', '04-02-2022 04:29:14 PM', 1),
(35, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 10:59:22', '04-02-2022 04:41:51 PM', 1),
(36, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 11:12:02', '04-02-2022 04:44:19 PM', 1),
(37, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 11:14:28', '04-02-2022 04:45:55 PM', 1),
(38, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 11:16:10', '04-02-2022 04:49:56 PM', 1),
(39, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 11:20:04', '04-02-2022 05:15:14 PM', 1),
(40, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 11:45:21', '04-02-2022 06:04:42 PM', 1),
(41, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 12:34:52', '04-02-2022 08:13:53 PM', 1),
(42, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 14:44:01', '04-02-2022 08:37:12 PM', 1),
(43, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-04 15:07:20', '04-02-2022 09:23:39 PM', 1),
(44, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 00:30:03', '05-02-2022 06:04:08 AM', 1),
(45, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 00:34:24', '05-02-2022 08:40:33 AM', 1),
(46, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 03:29:25', '05-02-2022 09:01:05 AM', 1),
(47, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 03:31:13', '05-02-2022 09:03:43 AM', 1),
(48, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 03:33:50', NULL, 0),
(49, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 03:33:58', '05-02-2022 09:15:32 AM', 1),
(50, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 03:48:06', '05-02-2022 10:12:54 AM', 1),
(51, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 05:54:26', '05-02-2022 11:25:05 AM', 1),
(52, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 09:48:22', '05-02-2022 03:27:51 PM', 1),
(53, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 10:32:34', '05-02-2022 04:06:00 PM', 1),
(54, 'grisha@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 10:43:23', '05-02-2022 04:25:34 PM', 1),
(55, 'armin@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-05 13:57:36', '05-02-2022 07:29:15 PM', 1),
(56, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-06 02:40:02', '06-02-2022 08:10:51 AM', 1),
(57, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-06 04:36:36', '06-02-2022 10:12:28 AM', 1),
(58, '', 0x3a3a3100000000000000000000000000, '2022-02-06 17:06:31', '23-03-2022 09:15:01 AM', 0),
(59, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-06 17:06:38', '06-02-2022 10:49:34 PM', 1),
(60, 'grisha@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-06 17:19:46', '06-02-2022 10:52:53 PM', 1),
(61, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-06 17:23:01', '06-02-2022 10:53:18 PM', 1),
(62, 'shruthi@gmail.com', 0x3a3a3100000000000000000000000000, '2022-02-06 17:32:05', '06-02-2022 11:02:24 PM', 1),
(63, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:35:54', NULL, 0),
(64, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:36:00', '23-03-2022 09:07:44 AM', 1),
(65, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:37:53', '23-03-2022 09:09:48 AM', 1),
(66, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:39:56', '23-03-2022 09:11:08 AM', 1),
(67, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:41:49', '23-03-2022 09:13:50 AM', 1),
(68, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:44:03', NULL, 1),
(69, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:50:04', '23-03-2022 09:21:15 AM', 1),
(70, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:51:25', '23-03-2022 09:41:10 AM', 1),
(71, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:58:21', '23-03-2022 09:29:13 AM', 1),
(72, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 03:59:32', NULL, 1),
(73, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 04:15:22', '23-03-2022 09:45:24 AM', 1),
(74, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 08:13:59', NULL, 0),
(75, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 08:14:08', NULL, 0),
(76, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-23 08:14:14', '23-03-2022 01:45:17 PM', 1),
(77, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-25 23:29:36', '26-03-2022 04:59:43 AM', 1),
(78, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 02:14:50', '26-03-2022 07:45:07 AM', 1),
(79, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 02:44:55', '26-03-2022 08:30:52 AM', 1),
(80, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 03:01:32', '26-03-2022 08:56:04 AM', 1),
(81, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 05:26:01', '26-03-2022 11:07:18 AM', 1),
(82, 'abc@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 05:43:22', NULL, 0),
(83, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 05:43:30', NULL, 0),
(84, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 05:43:38', NULL, 0),
(85, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-26 05:43:48', '26-03-2022 11:14:57 AM', 1),
(86, 'demo@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-29 16:48:01', NULL, 0),
(87, 'sahana@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-29 16:48:16', '29-03-2022 10:18:29 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'Sahana', 'sahana@gmail.com', 9876543212, '25d55ad283aa400af464c76d713c07ad', 'Goa', 'Karnataka', 'Bangalore', 560061, 'Goa Coast', 'Karnataka', 'Bangalore', 560061, '2022-02-01 17:05:37', NULL),
(5, 'eren', 'eren@gmail.com', 9876543212, '25d55ad283aa400af464c76d713c07ad', 'Khaglipur', 'Karnataka', 'Bangalore', 560061, 'Mumbai', 'Karnataka', 'Bangalore', 560061, '2022-02-03 16:11:21', NULL),
(6, 'Grisha', 'grisha@gmail.com', 9876543212, '25d55ad283aa400af464c76d713c07ad', 'Mumbai', 'Maharashtra', 'Mumbai', 560061, 'Mumbai', 'Maharashtra', 'Mumbai', 560061, '2022-02-05 10:43:00', NULL),
(7, 'Shruthi', 'shruthi@gmail.com', 7987654312, '25d55ad283aa400af464c76d713c07ad', 'Agra', 'Uttar Pradesh', 'Agra', 560061, 'Agra', 'Uttar Pradesh', 'Agra', 560061, '2022-02-05 13:57:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(6, 4, 1, '2022-02-01 17:55:18'),
(7, 5, 16, '2022-02-03 16:22:44'),
(9, 5, 21, '2022-02-03 16:23:46'),
(11, 6, 19, '2022-02-06 17:19:57'),
(12, 6, 35, '2022-02-06 17:20:09'),
(13, 6, 33, '2022-02-06 17:20:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productlog`
--
ALTER TABLE `productlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `productlog`
--
ALTER TABLE `productlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
