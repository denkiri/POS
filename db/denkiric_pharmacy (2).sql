-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2023 at 09:21 AM
-- Server version: 10.5.18-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `denkiric_pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(50) NOT NULL,
  `brand_name` varchar(250) NOT NULL,
  `status` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `status`) VALUES
(1, 'N/A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` int(10) NOT NULL,
  `cashier_name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(250) NOT NULL,
  `business_code` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `cashier_name`, `position`, `username`, `password`, `token`, `business_code`) VALUES
(9, 'dennis', 'Cashier', 'guest', 'guest2020', '29fd7f8af68e7f90208487dc9f256115253557fea4b1eb9cda016d74406339ddeb7afa35094d0fcec7350adc2f19a98aa6b7d31c6f41d6bb4d1e95cf497e42c7', 'C-27433250'),
(11, 'wit', 'Cashier', 'delle', '01468', '', 'C-27433250');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(100) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `status` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `status`) VALUES
(1, 'Cream', 1),
(2, 'Saline', 1),
(3, 'Inhaler', 1),
(4, 'Powder', 1),
(5, 'Spray', 1),
(6, 'Paediatric Drop', 1),
(7, 'Nebuliser Solution', 1),
(8, 'Powder Suspension', 1),
(9, 'Drops', 1),
(10, 'Eye Ointment', 1),
(11, 'Ear Band', 0),
(12, 'Sanitary', 1),
(15, 'Kit', 1),
(16, 'Liquid', 1),
(17, 'Pessaries', 1),
(18, 'Lotion', 1),
(19, 'Ointment', 1),
(22, 'Capsule', 1),
(24, 'Eye Drop', 1),
(27, 'wines $ Spirit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `transaction_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `amount_received` varchar(100) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`transaction_id`, `date`, `name`, `invoice`, `amount_received`, `remarks`, `balance`) VALUES
(2, '09/13/2020', 'RS-373022', 'IN-333393', '2700', '', 10),
(3, '09/13/2020', 'RS-373022', 'IN-2220393', '0', '', 10),
(4, '09/13/2020', 'RS-605230', 'IN-8223323', '200', '', 50),
(7, '10/25/2020', 'RS-3066254', 'IN-37207', '0', '', 2405),
(8, '10/25/2020', 'RS-3066254', 'IN-8333330', '2405', '', 0),
(9, '08/12/2021', 'RS-35093', 'IN-3474532', '800.0', '', 0),
(10, '08/13/2021', 'RS-373022', 'IN-2322332', '10.0', '', 0),
(11, '08/13/2021', 'RS-GM6UFC02', 'IN-8533305', '190.0', '', 0),
(12, '08/20/2021', 'RS-2M0JX2JS', 'IN-034433', '150.0', '', 0),
(13, '11/09/2021', 'RS-322UO000', 'IN-0223336', '10', '', 16),
(14, '11/20/2021', 'RS-322UO000', 'IN-933305', '16.2', '', 0),
(15, '04/12/2022', 'RS-2WI7020H', 'IN-73222', '50', '', 855),
(16, '04/14/2022', 'RS-2WI7020H', 'IN-32830', '855.0', '', 0),
(17, '04/14/2022', 'RS-605230', 'IN-3324272', '50.0', '', 0),
(18, '04/19/2022', 'RS-FJ203Y3X', 'IN-338023', '100.0', '', 0),
(19, '04/19/2022', 'RS-X33Z302Z', 'IN-33542003', '480.0', '', 0),
(20, '04/19/2022', 'RS-32823', 'IN-2322223', '30', '', 0),
(21, '04/21/2022', 'RS-NK333U6F', 'IN-230932', '9000.0', '', 0),
(22, '05/18/2022', 'RS-8325', 'IN-23232', '500', '', 550),
(23, '05/18/2022', 'RS-8325', 'IN-4502202', '550.0', '', 0),
(24, '05/18/2022', 'RS-2VQXR320', 'IN-20222', '15', '', 0),
(25, '10/25/2022', 'RS-50M33KNM', 'IN-23302332', '10', '', 40),
(26, '01/23/2023', 'RS-J2220IP7', 'IN-3223422', '30.0', '', 0),
(27, '01/23/2023', 'RS-3230590', 'IN-3232292', '30.0', '', 0),
(28, '01/23/2023', 'RS-0223302', 'IN-0603082', '70.0', '', 0),
(29, '01/23/2023', 'RS-27034', 'IN-203034', '900.0', '', 0),
(30, '01/23/2023', 'RS-3303', 'IN-423422', '50.0', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `membership_number` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `status` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `address`, `contact`, `membership_number`, `first_name`, `middle_name`, `last_name`, `status`) VALUES
(1, 'paul mwenda meru  ', '', '0700107838', '', 'paul', 'mwenda', 'meru', 0),
(2, 'mwandaga  kirimi John  ', '', '0795445138', '', 'mwandaga ', 'kirimi', 'John', 1),
(4, 'ABDALLA WAFAA W', 'MOMBASA', '0732232332', '', 'ABDALLA', 'WAFAA', 'W', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(150) NOT NULL,
  `expense` varchar(250) NOT NULL,
  `amount` varchar(250) NOT NULL DEFAULT '0',
  `month` varchar(240) NOT NULL,
  `time` varchar(250) NOT NULL,
  `date` varchar(250) NOT NULL,
  `year` varchar(250) NOT NULL,
  `payee` varchar(250) NOT NULL,
  `receipt_number` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `total_amount` varchar(250) NOT NULL DEFAULT '0',
  `status` int(150) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`id`, `name`, `total_amount`, `status`) VALUES
(13, 'salaries', '23658', 0),
(14, 'water', '2000.0', 0),
(20, 'phone cover', '500', 1),
(21, 'k7 screen', '1000', 1),
(22, 'samsung', '5000', 1),
(23, 'motorola', '65000', 1),
(24, 'nokia', '63500', 1),
(25, 'infinix', '69000', 1),
(26, 'fee', '5888', 1),
(28, 'accessories', '0', 1),
(29, 'battery replacement', '5', 1),
(30, 'sunsung phone cover', '500', 1),
(31, 'tÃ¤gliche auszahlung', '13000', 1),
(32, 'FRESHMILK1LTR', '80', 1),
(33, 'Gtech', '65.00', 1),
(34, 'Parafenelia Package', '300.00', 1),
(35, 'classic', '152', 1),
(36, 'family gathering', '200.00', 1),
(37, 'yudcv', '500', 1),
(38, 'Silicone gris ', '70', 1);

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `service_id` int(150) NOT NULL,
  `service` varchar(250) NOT NULL,
  `amount` varchar(150) NOT NULL DEFAULT '0',
  `month` varchar(150) NOT NULL,
  `time` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `year` varchar(150) NOT NULL,
  `service_cashier` varchar(150) NOT NULL DEFAULT '0',
  `receipt_number` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lose`
--

CREATE TABLE `lose` (
  `p_id` int(10) NOT NULL,
  `product_code` varchar(30) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `description_name` varchar(30) NOT NULL,
  `amount_lose` varchar(30) NOT NULL DEFAULT '0',
  `qty` varchar(30) NOT NULL,
  `cost` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `category` varchar(20) NOT NULL,
  `exdate` varchar(30) NOT NULL,
  `month` varchar(250) NOT NULL,
  `year` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_payments`
--

CREATE TABLE `mpesa_payments` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `cashier` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `paymentStatus` varchar(100) DEFAULT NULL,
  `payment_details` varchar(100) DEFAULT NULL,
  `mpesa_amount` varchar(100) DEFAULT NULL,
  `MpesaReceiptNumber` varchar(100) DEFAULT NULL,
  `TransactionDate` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mpesa_payments`
--

INSERT INTO `mpesa_payments` (`id`, `invoice_number`, `cashier`, `date`, `type`, `amount`, `name`, `month`, `year`, `paymentStatus`, `payment_details`, `mpesa_amount`, `MpesaReceiptNumber`, `TransactionDate`, `PhoneNumber`) VALUES
(13, 'RS-D7SC2P3U', 'dennis', 'January 12, 2023', 'mpesa', '1.0', 'null', 'January', '2023', '1', 'Payment Recieved The service request is processed successfully.', '1', 'RAC28HRW3K', '20230112141828', '254700107838'),
(12, 'RS-39O00ZX3', 'dennis', 'January 08, 2023', 'mpesa', '1.0', 'mwandaga  kirimi John  ', 'January', '2023', '2', 'Payment Not Recieved Request cancelled by user', NULL, NULL, NULL, '254729599885'),
(11, 'RS-W0202JJH', 'dennis', 'January 08, 2023', 'mpesa', '1.0', 'ABDALLA WAFAA W', 'January', '2023', '0', NULL, NULL, NULL, NULL, '254729599885'),
(10, 'RS-XW0LGLZ7', 'dennis', 'January 08, 2023', 'mpesa', '1.0', 'ABDALLA WAFAA W', 'January', '2023', '0', NULL, NULL, NULL, NULL, '254700107838'),
(9, 'RS-VSCYD3G3', 'dennis', 'January 08, 2023', 'mpesa', '1.0', 'mwandaga  kirimi John  ', 'January', '2023', '1', 'Payment Recieved The service request is processed successfully.', '1', 'RA88XT033A', '20230108142728', '254700107838'),
(14, 'RS-2G265M2L', 'dennis', 'January 25, 2023', 'mpesa', '5.0', 'null', 'January', '2023', '1', 'Payment Recieved The service request is processed successfully.', '1', 'RAP854N3VM', '20230125085110', '254701602300');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description_name` varchar(50) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `vat` int(250) NOT NULL DEFAULT 0,
  `supplier` varchar(100) NOT NULL,
  `qty_left` int(10) NOT NULL,
  `category` varchar(100) NOT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `date_delivered` varchar(20) NOT NULL,
  `expiration_date` varchar(20) NOT NULL,
  `reorder` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_name`, `description_name`, `unit`, `cost`, `price`, `vat`, `supplier`, `qty_left`, `category`, `brand`, `date_delivered`, `expiration_date`, `reorder`) VALUES
(1, 'P-0420223', 'Sanitizer 60ml', '60ml', 'Per Bottle', '120', '150', 0, '6', 6, 'Liquid', 'N/A', '', '2023-05-05', '0'),
(2, 'P-220620', 'Scabion Lotion', '', 'Per Bottle', '192.0', '250.0', 0, '1', 2, 'Lotion', 'N/A', '', '2023-11-11', '0'),
(3, 'P-03203700', 'cipladon', '', 'Per Tablet', '15.0', '25.0', 0, '1', 32, 'Tablet', 'N/A', '', '2023-02-04', '0'),
(4, 'P-360283', 'Ketoplus Shampoo', '', 'Per Bottle', '950', '1300', 0, '1', 1, 'Liquid', 'N/A', '', '2022-06-02', '0'),
(5, 'P-32093', 'LA Wash', '', 'per Item', '330', '450', 0, '1', 1, 'Liquid', 'N/A', '', '2024-02-02', '0'),
(6, 'P-332350', 'Clobederm', '', 'Per Pieces', '150', '200', 0, '1', 2, 'Cream', 'N/A', '', '2021-10-01', '0'),
(7, 'P-2333202', 'Remidin', '', 'Per Bottle', '220', '350', 0, '1', 2, 'syrup', 'N/A', '', '2022-10-01', '0'),
(8, 'P-08292320', 'Listerine', '', 'Per Pack', '490.0', '650.0', 0, '6', 3, 'syrup', 'N/A', '', '2022-10-10', '0'),
(9, 'P-93208922', 'Sonatec', '', 'Per Bottle', '226', '300', 0, '1', 2, 'Liquid', 'N/A', '', '2023-10-10', '0'),
(10, 'P-342726', 'Betadine mouth wash', '', 'Per Bottle', '520', '700', 0, '1', 1, 'Liquid', 'N/A', '', '2021-11-01', '0'),
(11, 'P-23722', 'Touch Go', '', 'Per Bottle', '200', '300', 0, '1', 3, 'Cream', 'N/A', '', '2025-10-01', '0'),
(12, 'P-320024', 'Bloscab', '', 'Per Bottle', '113', '150', 0, '1', 2, 'Liquid', 'N/A', '', '2023-07-01', '0'),
(13, 'P-324272', 'Kenzene', '', 'Per Bottle', '135.0', '200.0', 0, '1', 2, 'Liquid', 'N/A', '', '2023-04-01', '0'),
(14, 'P-2232363', 'Candid-Tv', '', 'Per Bottle', '295', '450', 0, '1', 0, 'Liquid', 'N/A', '', '', '0'),
(15, 'P-2333630', 'flugon', '', 'Per Tablet', '11.0', '15.0', 0, '1', 50, 'Tablet', 'N/A', '', '2023-11-12', '0'),
(16, 'P-333233', 'flucoldex', '', 'Per Tablet', '7.0', '10.0', 0, '1', 114, 'Tablet', 'N/A', '', '2023-01-05', '0'),
(17, 'P-040233', 'Calamine lotion', '', 'Per Bottle', '30.0', '80.0', 0, '1', 3, 'Liquid', 'N/A', '', '2024-06-01', '0'),
(18, 'P-322000', 'contus 650', '', 'Per Tablet', '11.0', '15.0', 0, '1', 16, 'Tablet', 'N/A', '', '2023-04-04', '0'),
(19, 'P-2032300', 'Grabacin', '', 'Per Pack', '86', '120', 0, '1', 3, 'Cream', 'N/A', '', '2023-01-01', '0'),
(20, 'P-0232302', 'cold cap', '', 'Per Tablet', '8', '10', 0, '1', 225, 'Tablet', '', '', '2024-05-01', '0'),
(21, 'P-8020260', 'montus', '', 'Per Tablet', '8', '10', 0, '1', 1, 'Tablet', 'N/A', '', '2022-04-01', '0'),
(22, 'P-9323022', 'On Call Strips', '', 'Per Pack', '650.0', '900.0', 0, '1', 6, 'Other', 'N/A', '', '2023-06-03', '0'),
(23, 'P-228462', 'montana 5mg', '', 'Per Tablet', '45', '60', 0, '1', 7, 'Tablet', '', '', '2022-05-01', '0'),
(24, 'P-00032', 'montana 10mg', '', 'Per Tablet', '38', '50', 0, '1', 0, 'Tablet', 'N/A', '', '', '0'),
(25, 'P-33322', 'Blood Lancets', '', 'per Item', '2', '5', 0, '1', 2, 'Other', 'N/A', '', '', '0'),
(26, 'P-323052', 'lorhistina 10mg', '', 'Per Tablet', '11', '15', 0, '1', 14, 'Tablet', 'N/A', '', '2023-06-01', '0'),
(27, 'P-3033', 'Alcohol Swab', '', 'per Item', '2', '5', 0, '1', 3, 'Other', 'N/A', '', '', '0'),
(28, 'P-33202324', 'zyrtec 10mg', '', 'Per Tablet', '64', '85', 0, '1', 5, 'Tablet', 'N/A', '', '2024-02-28', '0'),
(29, 'P-33233202', 'yescort', '', 'Per Tablet', '26', '35', 0, '1', 15, 'Tablet', 'N/A', '', '2021-11-01', '0'),
(30, 'P-72002322', 'Surgical blade', '', 'per Item', '8', '10', 0, '1', 96, 'Other', 'N/A', '', '', '0'),
(31, 'P-973932', 'Castor oil 100ml', '', 'Per Pack', '113', '150', 0, '1', 5, 'Liquid', 'N/A', '', '2024-02-01', '0'),
(32, 'P-97733323', 'erostin', '', 'Per Tablet', '49', '65', 0, '1', 11, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(33, 'P-3833809', 'monterllerg', '', 'Per Tablet', '53', '70', 0, '1', 6, 'Tablet', 'N/A', '', '2022-10-01', '0'),
(34, 'P-43332752', 'Castor oil 50ml', '', 'Per Bottle', '75.0', '100.0', 0, '1', 4, 'Liquid', 'N/A', '', '2024-01-01', '0'),
(35, 'P-2338303', 'fexet', '', 'Per Tablet', '38', '50', 0, '1', 12, 'Tablet', 'N/A', '', '2022-11-01', '0'),
(36, 'P-0033333', 'lobak', '', 'Per Tablet', '8.0', '10.0', 0, '1', 147, 'Tablet', 'N/A', '', '2023-10-01', '0'),
(37, 'P-63330', 'Demol Cream 50g', '', 'Per Pack', '226', '300', 0, '1', 2, 'Cream', 'N/A', '', '2023-05-01', '0'),
(38, 'P-302390', 'trifast', '', 'Per Tablet', '8', '10', 0, '1', 66, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(39, 'P-5003333', 'Demol Cream 500ml', '', 'Per Pack', '1090', '1450', 0, '1', 1, 'Cream', 'N/A', '', '2023-05-01', '0'),
(40, 'P-030203', 'zerodol p', '', 'Per Tablet', '30', '40', 0, '1', 31, 'Tablet', 'N/A', '', '2021-04-01', '0'),
(41, 'P-4373723', 'myozox', '', 'Per Pack', '22', '300', 0, '1', 29, 'Tablet', 'N/A', '', '2022-11-01', '0'),
(42, 'P-32033592', 'Sudocream 60g', '', 'Per Pack', '564', '750', 0, '1', 1, 'Cream', 'N/A', '', '2023-03-18', '0'),
(43, 'P-26332', 'pontan forte', '', 'Per Tablet', '26', '35', 0, '1', 32, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(44, 'P-33239306', 'Hydrogen Peroxide', '', 'Per Pack', '75', '100', 0, '1', 3, 'Liquid', 'N/A', '', '2022-08-01', '0'),
(45, 'P-35235', 'ibut 200mg', '', 'Per Tablet', '4', '5', 0, '1', 105, 'Tablet', 'N/A', '', '2022-11-01', '0'),
(46, 'P-24202273', 'Iodine', '', 'Per Pack', '70', '100', 0, '1', 2, 'Liquid', 'N/A', '', '2023-01-01', '0'),
(47, 'P-92223202', 'ibufil 400mg', '', 'Per Tablet', '3', '10', 0, '1', 118, 'Tablet', 'N/A', '', '2023-08-01', '0'),
(48, 'P-33332', 'Surgical 100ml Spirit', '', 'Per Pack', '45.0', '100.0', 0, '1', 12, 'Liquid', 'N/A', '', '2022-12-01', '0'),
(49, 'P-0432402', 'menthylated 100ml spirit', '', 'Per Pack', '45.0', '100.0', 0, '1', 12, 'Cream', 'N/A', '', '2022-07-01', '0'),
(50, 'P-0020233', 'Surgical 50ml', '', 'Per Pack', '26.0', '50.0', 0, '1', 4, 'Liquid', 'N/A', '', '2024-02-01', '0'),
(51, 'P-632040', 'menthylated 50ml spirit', '', 'Per Pack', '26', '50', 0, '1', 4, 'Liquid', 'N/A', '', '2024-12-01', '0'),
(52, 'P-083338', 'Otorex ear drops', '', 'Per Pack', '175', '250', 0, '1', 1, 'Drops', 'N/A', '', '2022-07-01', '0'),
(53, 'P-47088', 'Onazine eye', '', 'Per Pack', '288', '360', 0, '1', 1, 'Liquid', 'N/A', '', '2023-10-01', '0'),
(54, 'P-3363325', 'Dexa G Eye', '', 'Per Bottle', '376', '500', 0, '1', 1, 'Liquid', 'N/A', '', '2021-11-01', '0'),
(55, 'P-328232', 'Gentamilin eye', '', 'Per Pieces', '15.0', '100.0', 0, '1', 3, 'Liquid', 'N/A', '', '2024-06-01', '0'),
(56, 'P-22', 'meftal forte', '', 'Per Tablet', '23', '30', 0, '1', 25, 'Tablet', 'N/A', '', '2022-12-01', '0'),
(57, 'P-305022', 'Maxitrol', '', 'Per Pack', '200', '350', 0, '1', 0, 'Liquid', 'N/A', '', '2022-05-01', '0'),
(58, 'P-03322633', 'Tears naturalle', '', 'Per Pack', '226', '300', 0, '1', 0, 'Liquid', 'N/A', '', '2021-10-01', '0'),
(59, 'P-02220', 'Beuflox -D', '', 'Per Pack', '220', '400', 0, '1', 1, 'Cream', 'N/A', '', '2022-03-01', '0'),
(60, 'P-38922', 'Ceprolen', '', 'Per Pack', '226', '300', 0, '1', 1, 'Liquid', 'N/A', '', '2021-10-01', '0'),
(61, 'P-2392332', 'Cproken', '', 'Per Pack', '150', '200', 0, '1', 0, 'Liquid', 'N/A', '', '2023-01-01', '0'),
(62, 'P-0423', 'Otobiotic', '', 'Per Pack', '0', '0', 0, '1', 0, 'Liquid', 'N/A', '', '', '0'),
(63, 'P-2222237', 'Probeta N', '', 'Per Pack', '86.0', '150.0', 0, '1', 4, 'Liquid', 'N/A', '', '2022-12-01', '0'),
(64, 'P-35803320', 'Candid', '', 'Per Pack', '150', '200', 0, '1', 0, 'Cream', 'N/A', '', '2021-12-01', '0'),
(65, 'P-0490338', 'powergisic tabs', '', 'Per Tablet', '23', '30', 0, '1', 14, 'Tablet', 'N/A', '', '2023-02-01', '0'),
(66, 'P-20250', 'zerodol', '', 'Per Tablet', '19', '25', 0, '1', 17, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(67, 'P-023063', 'Otrivin Children nasal drops', '', 'Per Pack', '376', '500', 0, '1', 2, 'Drops', 'N/A', '', '2022-06-01', '0'),
(68, 'P-420293', 'zyrtal sp', '', 'Per Tablet', '34', '45', 0, '1', 18, 'Tablet', 'N/A', '', '2023-12-01', '0'),
(69, 'P-0234330', 'Cerumol Ear drops', '', 'Per Pack', '301', '400', 0, '1', 2, 'Eye Drop', 'N/A', '', '2023-01-01', '0'),
(70, 'P-39335', 'stugeron', '', 'Per Tablet', '15', '20', 0, '1', 80, 'Tablet', 'N/A', '', '2023-04-01', '0'),
(71, 'P-33382405', 'Novorin', '', 'Per Pack', '226', '300', 0, '1', 3, 'Drops', 'N/A', '', '2022-11-01', '0'),
(72, 'P-2039443', 'Nosalla', '', 'Per Pack', '113', '150', 0, '1', 2, 'Drops', 'N/A', '', '2024-01-01', '0'),
(73, 'P-30640', 'Nasosal drops', '', 'Per Pack', '580', '800', 0, '1', 0, 'Drops', 'N/A', '', '2023-08-01', '0'),
(74, 'P-34497372', 'Isoryn paed nasal drops', '', 'Per Pack', '75', '100', 0, '1', 2, 'Drops', 'N/A', '', '2023-05-01', '0'),
(75, 'P-0302829', 'salbutamol', '', 'Per Tablet', '4', '5', 0, '1', 129, 'Tablet', 'N/A', '', '2025-01-01', '0'),
(76, 'P-3085233', 'Hedex', '', 'Per Pack', '7.0', '10.0', 0, '1', 61, 'Tablet', 'N/A', '', '', '0'),
(77, 'P-325323', 'predisolone', '', 'Per Tablet', '3.0', '5.0', 0, '1', 455, 'Tablet', 'N/A', '', '2024-05-01', '0'),
(78, 'P-8050430', 'zathin', '', 'Per Tablet', '4', '5', 0, '1', 178, 'Tablet', 'N/A', '', '2023-06-01', '0'),
(79, 'P-02220329', 'Panadol Extra', '', 'Per Pack', '9.0', '10.0', 0, '1', 354, 'Tablet', 'N/A', '', '2022-07-01', '0'),
(80, 'P-3229023', 'Panadol  Advance', '', 'Per Pieces', '7.0', '10.0', 0, '1', 397, 'Tablet', 'N/A', '', '2024-01-01', '0'),
(81, 'P-3332200', 'Mandera', '', 'per Item', '113', '150', 0, '1', 11, 'Liquid', 'N/A', '', '2026-01-01', '0'),
(82, 'P-029232', 'Ventolin Inhaler', '', 'per Item', '230.0', '300.0', 0, '1', 4, 'Inhaler', 'N/A', '', '2023-01-01', '0'),
(83, 'P-32882', 'Avamys', '', 'Per Pack', '900', '1200', 0, '1', 0, 'Spray', 'N/A', '', '2022-09-01', '0'),
(84, 'P-2233273', 'Medisalant', '', 'Per Pack', '150', '200', 0, '1', 2, 'Spray', 'N/A', '', '2022-07-01', '0'),
(85, 'P-0072333', 'predilone', '', 'Per Tablet', '1', '5', 0, '1', 70, 'Tablet', 'N/A', '', '2024-09-01', '0'),
(86, 'P-223232', 'Zincat OD', '', 'Per Pack', '150.0', '200.0', 0, '1', 2, 'syrup', 'N/A', '', '2021-10-01', '0'),
(87, 'P-3623220', 'Nycostat', '', 'Per Pack', '113', '150', 0, '1', 3, 'syrup', 'N/A', '', '2022-05-01', '0'),
(88, 'P-4300023', 'Nycodeal', '', 'Per Pack', '113', '150', 0, '1', 0, 'syrup', 'N/A', '', '2022-08-01', '0'),
(89, 'P-8952332', 'Dawastin', '', 'Per Pieces', '48.0', '100.0', 0, '1', 5, 'Eye Drop', 'N/A', '', '2023-02-01', '0'),
(90, 'P-2323550', 'Cyclopam', '', 'Per Tablet', '226', '300', 0, '1', 1, 'Tablet', 'N/A', '', '2023-02-01', '0'),
(91, 'P-33035', 'doloact ', '', 'Per Pieces', '19.0', '25.0', 0, '1', 175, 'Tablet', 'N/A', '', '2023-10-31', '0'),
(92, 'P-230322', 'Domnac', '', 'Per Tablet', '113', '150', 0, '1', 4, 'Tablet', 'N/A', '', '2023-10-01', '0'),
(93, 'P-40622033', 'myospaz', '', 'Per Tablet', '19.0', '25.0', 0, '1', 117, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(94, 'P-227230', 'Promethazine', '', 'Per Tablet', '3', '10', 0, '1', 114, 'Tablet', 'N/A', '', '2024-04-01', '0'),
(95, 'P-223235', 'biomal (paracetamol tabs)', '', 'Per Tablet', '1.0', '5.0', 0, '1', 226, 'Tablet', 'N/A', '', '2024-05-01', '0'),
(96, 'P-9333333', 'paradol (paracetamol tabs)', '', 'Per Tablet', '1', '5', 0, '1', 27, 'Tablet', 'N/A', '', '2023-02-01', '0'),
(97, 'P-2327277', 'piriton (white)', '', 'Per Tablet', '1.0', '5.0', 0, '1', 1270, 'Tablet', 'N/A', '', '2023-11-02', '0'),
(98, 'P-237235', 'piriton (white) tin', '', 'Per Tablet', '1', '5', 0, '1', 490, 'Tablet', 'N/A', '', '2023-05-01', '0'),
(99, 'P-8330323', 'paracetamol tin', '', 'Per Tablet', '1', '2', 0, '1', 234, 'Tablet', 'N/A', '', '2024-02-01', '0'),
(100, 'P-0203302', 'ascorbic tabs', '', 'Per Tablet', '1', '5', 0, '1', 864, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(101, 'P-033302', 'predisone (tin)', '', 'Per Tablet', '1', '1', 0, '1', 700, 'Tablet', 'N/A', '', '2023-02-01', '0'),
(102, 'P-32823302', 'Rinalin', '', 'Per Bottle', '45.0', '100.0', 0, '1', 2, 'syrup', 'N/A', '', '2023-10-08', '0'),
(103, 'P-3362333', 'Piriton Original', '', 'Per Bottle', '348.0', '400.0', 0, '1', 2, 'syrup', 'N/A', '', '2023-05-01', '0'),
(104, 'P-60063933', 'Piriton Linticus', '', 'Per Bottle', '318', '400', 0, '1', 2, 'syrup', 'N/A', '', '2023-07-01', '0'),
(105, 'P-2220336', 'Dawa CPM 100ml', '', 'Per Pieces', '28', '100.0', 0, '1', 3, 'syrup', 'N/A', '', '2024-02-01', '0'),
(106, 'P-23322430', 'Solvin Plus ', '', 'Per Bottle', '226', '300', 0, '1', 3, 'syrup', 'N/A', '', '2022-07-01', '0'),
(107, 'P-432004', 'Solvin Plus 120ml', '', 'Per Bottle', '300', '400', 0, '1', 2, 'syrup', 'N/A', '', '2022-10-01', '0'),
(108, 'P-0323002', 'Tridex 100ml', '', 'Per Bottle', '150', '200', 0, '1', 2, 'syrup', 'N/A', '', '2022-09-01', '0'),
(109, 'P-2393432', 'Tridex 60ml', '', 'Per Bottle', '75', '100', 0, '1', 2, 'syrup', 'N/A', '', '2023-02-01', '0'),
(110, 'P-230233', 'Sabulin', '', 'Per Bottle', '0.26', '100', 0, '1', 2, 'syrup', 'N/A', '', '2022-07-01', '0'),
(111, 'P-3543809', 'Lastmol', '', 'Per Bottle', '150', '300', 0, '1', 0, 'syrup', 'N/A', '', '2022-09-01', '0'),
(112, 'P-0865332', 'Neoptine Capsules', '', 'Per Pieces', '34', '45', 0, '1', 26, 'Capsule', 'N/A', '', '2022-06-17', '0'),
(113, 'P-03226322', 'Neoptine drops', '', 'Per Pack', '263', '350', 0, '1', 0, 'Eye Drop', 'N/A', '', '2022-11-05', '0'),
(114, 'P-332343', 'Ondasteron solution', '', 'Per Pack', '550', '750', 0, '1', 2, 'Liquid', 'N/A', '', '2023-03-01', '0'),
(115, 'P-33720', 'Infacol', '', 'Per Pack', '639.0', '850.0', 0, '1', 2, 'Liquid', 'N/A', '', '2023-02-01', '0'),
(116, 'P-2223202', 'Ondarian tabs', '', 'Per Tablet', '38', '50', 0, '1', 7, 'Tablet', 'N/A', '', '2023-08-01', '0'),
(117, 'P-338322', 'Nosic ', '', 'Per Tablet', '19', '25', 0, '1', 57, 'Tablet', 'N/A', '', '2023-03-01', '0'),
(118, 'P-3322333', 'Zental Suspension', '', 'Per Pack', '170', '220', 0, '1', 10, 'Suspension', 'N/A', '', '2023-09-01', '0'),
(119, 'P-0938250', 'Zental tabs', '', 'Per Tablet', '129.0', '200.0', 0, '1', 7, 'Tablet', 'N/A', '', '2025-03-01', '0'),
(120, 'P-3380352', 'Natoa suspension', '', 'Per Pack', '45', '150', 0, '1', 5, 'Suspension', 'N/A', '', '2023-04-01', '0'),
(121, 'P-222802', 'Natoa tabs', '', 'Per Tablet', '35', '100.0', 0, '1', 8, 'Tablet', 'N/A', '', '2023-04-01', '0'),
(122, 'P-222843', 'ABZ Tabs', '', 'Per Tablet', '18.4', '50.0', 0, '1', 6, 'Tablet', 'N/A', '', '2025-02-01', '0'),
(123, 'P-3330', 'Kaluma', '', 'Per Pack', '7', '10', 0, '1', 9, 'Tablet', 'N/A', '', '2022-04-01', '0'),
(124, 'P-05433223', 'Action tabs', '', 'Per Pack', '7', '10', 0, '1', 14, 'Tablet', 'N/A', '', '2025-01-01', '0'),
(125, 'P-23624323', 'Sonamoja', '', 'Per Tablet', '7', '10', 0, '1', 69, 'Tablet', 'N/A', '', '2022-05-01', '0'),
(126, 'P-302', 'Mara moja ', '', 'Per Tablet', '7.0', '10.0', 0, '1', 213, 'Tablet', 'N/A', '', '2025-12-01', '0'),
(127, 'P-0328222', 'Asprin tabs', '', 'Per Pieces', '7', '10', 0, '1', 195, 'Tablet', 'N/A', '', '2023-12-01', '0'),
(128, 'P-33307622', 'Flugone DM 120ml', '', 'Per Bottle', '207', '300', 0, '1', 2, 'syrup', 'N/A', '', '2023-11-01', '0'),
(129, 'P-23330383', 'Flugone 120ml', '', 'Per Pieces', '207.0', '300.0', 0, '1', 3, 'syrup', 'N/A', '', '2023-01-01', '0'),
(130, 'P-32227', 'Flugone 60ml', '', 'Per Pieces', '135.0', '200.0', 0, '1', 4, 'syrup', 'N/A', '', '2023-05-01', '0'),
(131, 'P-633230', 'Lung tonic (Good morning)', '', 'Per Bottle', '65.0', '100.0', 0, '1', 2, 'syrup', 'N/A', '', '2024-01-01', '0'),
(132, 'P-9333232', 'Trimex (Paed)', '', 'Per Bottle', '150', '200', 0, '1', 2, 'syrup', 'N/A', '', '2024-04-01', '0'),
(133, 'P-2300602', 'Upacof (Paed)', '', 'Per Bottle', '95', '160', 0, '1', 0, 'syrup', 'N/A', '', '2022-08-01', '0'),
(134, 'P-2524227', 'Trimex Adult', '', 'Per Bottle', '150', '200', 0, '1', 2, 'syrup', 'N/A', '', '2022-12-01', '0'),
(135, 'P-034072', 'Tuspel plus', '', 'Per Bottle', '125', '200', 0, '1', 3, 'syrup', 'N/A', '', '2024-03-01', '0'),
(136, 'P-2022', 'Tuspel 60ml', '', 'Per Bottle', '95', '150', 0, '1', 2, 'syrup', 'N/A', '', '2023-05-01', '0'),
(137, 'P-220233', 'Tuspel 100ml', '', 'Per Bottle', '125', '250', 0, '1', 3, 'syrup', 'N/A', '', '2024-02-01', '0'),
(138, 'P-32522078', 'Phinathiol (adult)', '', 'Per Bottle', '414', '550', 0, '1', 2, 'syrup', 'N/A', '', '2022-01-01', '0'),
(139, 'P-32830', 'Cadiphen', '', 'Per Bottle', '89.0', '200.0', 0, '1', 3, 'syrup', 'N/A', '', '2024-08-01', '0'),
(140, 'P-023083', 'Flora norm', '', 'Per Pack', '98.0', '130.0', 0, '1', 12, 'Liquid', 'N/A', '', '2023-05-14', '0'),
(141, 'P-2322003', 'Bronchopped', '', 'Per Bottle', '344', '500', 0, '1', 0, 'syrup', 'N/A', '', '2022-01-01', '0'),
(142, 'P-062583', 'Cold cap Syrup', '', 'Per Bottle', '78.0', '150.0', 0, '1', 3, 'syrup', 'N/A', '', '', '0'),
(143, 'P-08032', 'camera bottle 150ml', '', 'Per Bottle', '130.0', '180.0', 0, '1', 9, 'Liquid', 'N/A', '', '', '0'),
(144, 'P-0303220', 'camera bottle 250ml', '', 'Per Bottle', '150', '300', 0, '1', 4, 'Liquid', 'N/A', '', '', '0'),
(145, 'P-2305503', 'Tricohist 100ml', '', 'Per Bottle', '150', '200', 0, '1', 3, 'syrup', 'N/A', '', '2023-12-01', '0'),
(146, 'P-042393', 'Tricohist 60ml', '', 'Per Bottle', '70', '100', 0, '1', 2, 'syrup', 'N/A', '', '2024-04-01', '0'),
(147, 'P-32022', 'Benahist 100ml', '', 'Per Bottle', '95.0', '150.0', 0, '1', 3, 'syrup', 'N/A', '', '2024-05-01', '0'),
(148, 'P-20326', 'Benahist 60ml', '', 'Per Bottle', '75', '100', 0, '1', 2, 'syrup', 'N/A', '', '2023-06-01', '0'),
(149, 'P-7029338', 'Contus Susp paed', '', 'Per Bottle', '165', '220', 0, '1', 1, 'syrup', 'N/A', '', '2023-05-01', '0'),
(150, 'P-30022032', 'Teat', '', 'Per Pieces', '60.0', '80.0', 0, '1', 12, 'Powder', '', '', '', '0'),
(151, 'P-90725', 'Erostin Syrup', '', 'Per Bottle', '451', '600', 0, '1', 2, 'syrup', 'N/A', '', '2022-01-01', '0'),
(152, 'P-234297', 'NaN 1', '', 'Per Pieces', '950', '1200', 0, '1', 4, 'Powder Suspension', 'N/A', '', '2022-10-01', '0'),
(153, 'P-22320', 'NaN 2', '', 'Per Pack', '950', '1200', 0, '1', 3, 'Powder', 'N/A', '', '2022-06-01', '0'),
(154, 'P-302233', 'zycet', '', 'Per Bottle', '220.0', '300.0', 0, '1', 5, 'syrup', 'N/A', '', '2022-02-01', '0'),
(155, 'P-2233', 'Senna', '', 'Per Tablet', '4', '5', 0, '1', 22, 'Tablet', 'N/A', '', '2022-04-01', '0'),
(156, 'P-30032', 'NaN 3', '', 'Per Pack', '950', '1200', 0, '1', 1, 'Powder', 'N/A', '', '2022-08-01', '0'),
(157, 'P-220323', 'Zyncet', '', 'Per Bottle', '150.0', '200.0', 0, '1', 3, 'syrup', 'N/A', '', '2022-05-01', '0'),
(158, 'P-536302', 'Predsol Forte', '', 'Per Bottle', '850', '1150', 0, '1', 1, 'syrup', 'N/A', '', '2024-01-01', '0'),
(159, 'P-32382302', 'Aryur baby wipes', '', 'per Item', '170', '230', 0, '1', 6, 'Pessaries', 'N/A', '', '2022-12-27', '0'),
(160, 'P-2393952', 'Benylin original', '', 'Per Pieces', '450.0', '600.0', 0, '1', 23, 'syrup', 'N/A', '', '2022-12-7', '0'),
(161, 'P-03324733', 'Gripe water', 'Woodwards', 'Per Bottle', '110.0', '200.0', 0, '1', 4, 'Liquid', 'N/A', '', '2024-02-01', '0'),
(162, 'P-0222482', 'Benylin dry cough', '', 'Per Bottle', '489.0', '660.0', 0, '1', 2, 'syrup', 'N/A', '', '', '0'),
(163, 'P-07200', 'Gripe water(Universals)', '', 'Per Bottle', '75', '100', 0, '1', 1, 'Liquid', 'N/A', '', '2022-05-01', '0'),
(164, 'P-20223232', 'Benylin paed', '', 'Per Bottle', '489.0', '660.0', 0, '1', 2, 'syrup', 'N/A', '', '2022-01-01', '0'),
(165, 'P-00300', 'Benylin 4 flu', '', 'Per Bottle', '330', '600', 0, '1', 2, 'syrup', 'N/A', '', '2022-07-01', '0'),
(166, 'P-302333', 'Delased (paed)', '', 'Per Bottle', '95', '200.0', 0, '1', 5, 'syrup', 'N/A', '', '2023-09-01', '0'),
(167, 'P-3723055', 'Delaxed (chesty)', '', 'Per Bottle', '96.0', '200.0', 0, '1', 6, 'syrup', 'N/A', '', '2022-01-01', '0'),
(168, 'P-328250', 'cadistin', '', 'Per Bottle', '95.0', '150.0', 0, '1', 3, 'syrup', 'N/A', '', '2024-10-01', '0'),
(169, 'P-2973033', 'aromel plus', '', 'Per Bottle', '263', '350', 0, '1', 0, 'syrup', '', '', '2023-01-01', '0'),
(170, 'P-932502', 'Brozelin', '', 'Per Pieces', '226.0', '300.0', 0, '1', 3, 'syrup', 'N/A', '', '2021-10-9', '0'),
(171, 'P-50855309', 'zefcolin', '', 'Per Pieces', '226.0', '300.0', 0, '1', 4, 'syrup', '', '', '2022-02-01', '0'),
(172, 'P-00020423', 'Ascoril 100ml', '', 'Per Pieces', '188.0', '250.0', 0, '1', 4, 'syrup', 'N/A', '', '2022-04-01', '0'),
(173, 'P-2838832', 'Zecuf', '', 'Per Bottle', '188.0', '250.0', 0, '1', 2, 'syrup', 'N/A', '', '2024-02-01', '0'),
(174, 'P-3073322', 'Flucoldex syrup', '', 'Per Bottle', '75', '100', 0, '1', 2, 'syrup', 'N/A', '', '2023-10-01', '0'),
(175, 'P-2035202', 'Ascoril ', '', 'Per Pieces', '340.0', '450.0', 0, '1', 5, 'syrup', 'N/A', '', '2023-12-1', '0'),
(176, 'P-2023980', 'Predsol', '', 'Per Bottle', '450.0', '600.0', 0, '1', 1, 'syrup', 'N/A', '', '2024-04-16', '0'),
(177, 'P-372639', 'Fabrex', '', 'Per Bottle', '225', '300', 0, '1', 1, 'syrup', 'N/A', '', '2021-09-01', '0'),
(178, 'P-92023568', 'Bro Zedex', '', 'Per Bottle', '145', '300', 0, '1', 3, 'syrup', 'N/A', '', '2023-02-01', '0'),
(179, 'P-222223', 'Zedex', '', 'Per Bottle', '225', '300', 0, '1', 1, 'syrup', 'N/A', '', '2021-11-01', '0'),
(180, 'P-30200', 'Olsolone', '', 'Per Pieces', '225', '300', 0, '1', 2, 'syrup', 'N/A', '', '2023-01-01', '0'),
(181, 'P-353222', 'Cetrizine', '', 'Per Pieces', '179', '300.0', 0, '1', 2, 'syrup', 'N/A', '', '2022-04-01', '0'),
(182, 'P-223256', 'Aerius', '', 'Per Bottle', '375', '500', 0, '1', 3, 'syrup', 'N/A', '', '2021-10-01', '0'),
(183, 'P-023320', 'Bonissan', '', 'Per Pieces', '225.0', '300.0', 0, '1', 4, 'syrup', 'N/A', '', '2023-08-7', '0'),
(184, 'P-3383', 'Delased (dry cough)', '', 'Per Pack', '96.0', '200.0', 0, '1', 2, 'syrup', 'N/A', '', '2024-02-01', '0'),
(185, 'P-0073228', 'Amizole 100ml', '', 'Per Bottle', '75', '100', 0, '1', 2, 'syrup', 'N/A', '', '', '0'),
(186, 'P-3620202', 'Amizole 50ml', '', 'Per Bottle', '45', '80', 0, '1', 3, 'syrup', 'N/A', '', '2023-07-01', '0'),
(187, 'P-320333', 'Daboral', '', 'Per Tablet', '226', '300', 0, '1', 3, 'Suspension', 'N/A', '', '2022-01-01', '0'),
(188, 'P-2032932', 'Flugyl sud', '', 'Per Pieces', '526', '700', 0, '1', 1, 'Powder Suspension', 'N/A', '', '2022-04-01', '0'),
(189, 'P-02033233', 'Diracip ', '', 'Per Pieces', '188', '300', 0, '1', 0, 'Powder Suspension', 'N/A', '', '2022-10-01', '0'),
(190, 'P-703332', 'E flaron ', '', 'Per Bottle', '113', '150', 0, '1', 2, 'syrup', '', '', '2024-02-01', '0'),
(191, 'P-3230223', 'Flagyl megyl-400', '', 'Per Pieces', '3.0', '10.0', 0, '1', 443, 'syrup', '', '', '2024-07-01', '0'),
(192, 'P-223372', 'Triconazole', '', 'Per Pieces', '3', '10', 0, '1', 800, 'Tablet', '', '', '2023-03-01', '0'),
(193, 'P-002032', 'Eflaron', '', 'Per Tablet', '3', '5', 0, '1', 60, 'Tablet', 'N/A', '', '2022-12-01', '0'),
(194, 'P-980000', 'Consapram', '', 'Per Tablet', '75', '100', 0, '1', 1, 'Tablet', '', '', '2024-05-01', '0'),
(195, 'P-00200', 'Buscopain plus', '', 'Per Tablet', '38.0', '50.0', 0, '1', 26, 'Tablet', 'N/A', '', '2023-04-01', '0'),
(196, 'P-2320603', 'Buscopan-plain', '', 'Per Pieces', '19.0', '30.0', 0, '1', 37, 'Tablet', '', '', '2023-03-7', '0'),
(197, 'P-60232', 'Dialin', '', 'Per Tablet', '38', '50', 0, '1', 2, 'Tablet', '', '', '2023-12-01', '0'),
(198, 'P-3222339', 'Immodium', '', 'Per Pieces', '190.0', '300.0', 0, '1', 3, 'Tablet', '', '', '2024-12-01', '0'),
(199, 'P-20033', 'Ivermectol', '', 'Per Tablet', '350', '400', 0, '1', 2, 'Tablet', '', '', '2024-02-29', '0'),
(200, 'P-233272', 'Ivermectol 6', '', 'Per Pieces', '340.0', '550.0', 0, '1', 3, 'Tablet', 'N/A', '', '2024-02-29', '0'),
(201, 'P-2223033', 'Immoben', '', 'Per Pieces', '11.0', '50.0', 0, '1', 12, 'Tablet', 'N/A', '', '2024-06-01', '0'),
(202, 'P-0303363', 'Lactulac', '', 'Per Pack', '350.0', '450.0', 0, '1', 1, 'Suspension', 'N/A', '', '2022-11-01', '0'),
(203, 'P-80883', 'Smolax', '', 'Per Bottle', '489', '650', 0, '1', 10, 'syrup', 'N/A', '', '2021-09-01', '0'),
(204, 'P-0043722', 'Cital', '', 'Per Pack', '235', '400', 0, '1', 2, 'syrup', 'N/A', '', '2023-09-01', '0'),
(205, 'P-9320003', 'Osmolar 100ml', '', 'Per Pack', '225', '300', 0, '1', 1, 'syrup', 'N/A', '', '2022-01-01', '0'),
(206, 'P-333260', 'Micronema', '', 'Per Bottle', '75', '100', 0, '1', 0, 'syrup', 'N/A', '', '2021-10-01', '0'),
(207, 'P-2323253', 'Duphalac', '', 'Per Bottle', '677', '900', 0, '1', 1, 'syrup', 'N/A', '', '2021-11-01', '0'),
(208, 'P-203233', 'Protoken 200ml', '', 'Per Bottle', '295', '500.0', 0, '1', 3, 'syrup', 'N/A', '', '2022-06-01', '0'),
(209, 'P-23323', 'Amoniguard', '', 'Per Bottle', '827', '1100', 0, '1', 1, 'Cream', 'N/A', '', '2022-03-01', '0'),
(210, 'P-3332200A', 'Cypro b plus', '', 'Per Bottle', '245.0', '400.0', 0, '1', 3, 'syrup', 'N/A', '', '2022-12-01', '0'),
(211, 'P-203022', 'Cypon 200ml', '', 'Per Bottle', '250.0', '400.0', 0, '1', 2, 'syrup', 'N/A', '', '2023-02-02', '0'),
(212, 'P-380303', 'Cypon 100ml', '', 'Per Bottle', '165.0', '250.0', 0, '1', 3, 'syrup', 'N/A', '', '2023-11-01', '0'),
(213, 'P-3060422', 'Becoatin Syrup', '', 'Per Bottle', '295', '450', 0, '1', 2, 'syrup', 'N/A', '', '2022-06-01', '0'),
(214, 'P-3060', 'Calamax', '', 'Per Bottle', '0', '0', 0, '1', 0, 'syrup', 'N/A', '', '2022-09-01', '0'),
(215, 'P-833803', 'Nutrivita', '', 'Per Bottle', '150.0', '200.0', 0, '1', 2, 'syrup', 'N/A', '', '2023-03-01', '0'),
(216, 'P-3862040', 'Astymin', '', 'Per Bottle', '376.0', '500.0', 0, '1', 1, 'syrup', 'N/A', '', '2022-01-01', '0'),
(217, 'P-0303333', 'Scotts 200ml', '', 'Per Pieces', '510.0', '800.0', 0, '1', 2, 'syrup', 'N/A', '', '2022-05-01', '0'),
(218, 'P-037003', 'scotts 100ml', '', 'Per Bottle', '325', '400.0', 0, '1', 3, 'syrup', 'N/A', '', '2022-06-01', '0'),
(219, 'P-528087', 'Tresorix', '', 'Per Bottle', '677', '900', 0, '1', 2, 'syrup', 'N/A', '', '2023-01-01', '0'),
(220, 'P-2000362', 'Multivitamin 7seas', '', 'Per Bottle', '550', '750', 0, '1', 3, 'Cream', 'N/A', '', '2023-04-01', '0'),
(221, 'P-383220', 'Hovite Syrup', '', 'Per Bottle', '230', '350', 0, '1', 2, 'syrup', 'N/A', '', '2022-01-28', '0'),
(222, 'P-32303223', 'Fricks Honey', '', 'Per Pieces', '23', '30', 0, '1', 19, 'Tablet', 'N/A', '', '2022-05-01', '0'),
(223, 'P-427033', 'Frick\'s ginger', '', 'Per Pieces', '23.0', '30.0', 0, '1', 87, 'Tablet', 'N/A', '', '2022-05-01', '0'),
(224, 'P-2332232', 'Orange', '', 'Per Bottle', '23.0', '30.0', 0, '1', 54, 'Cream', 'N/A', '', '2022-05-01', '0'),
(225, 'P-38566', 'Zecuf Strawberies', '', 'Per Pieces', '14', '25', 0, '1', 9, 'Tablet', 'N/A', '', '2025-02-01', '0'),
(226, 'P-303323', 'Pineapple', '', 'Per Pack', '14', '25', 0, '1', 3, 'Tablet', 'N/A', '', '2025-02-01', '0'),
(227, 'P-82053', 'Rasberry', '', 'Per Pack', '14', '25', 0, '1', 9, 'Tablet', 'N/A', '', '2025-04-01', '0'),
(228, 'P-22083336', 'Herbal', '', 'Per Pack', '14', '25', 0, '1', 7, 'Tablet', 'N/A', '', '2025-07-01', '0'),
(229, 'P-26300', 'Strepsils regular', '', 'Per Tablet', '19', '25', 0, '1', 0, 'Tablet', 'N/A', '', '2023-08-01', '0'),
(230, 'P-0392023', 'Honey and  lemon', '', 'Per Pieces', '19.0', '25.0', 0, '1', 48, 'Tablet', 'N/A', '', '2024-01-25', '0'),
(231, 'P-25222732', 'Eno Satchets', '', 'per sachet', '11.0', '15.0', 0, '1', 44, 'Cream', 'N/A', '', '2022-11-01', '0'),
(232, 'P-006372', 'Flatameal Tabs', '', 'Per Pack', '15', '20', 0, '1', 26, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(233, 'P-243232', 'Eno tabs', '', 'Per Pack', '8.0', '10.0', 0, '1', 409, 'Tablet', 'N/A', '', '2025-06-01', '0'),
(234, 'P-92326300', 'ORS', '', 'Per Tablet', '15', '20', 0, '1', 9, 'Tablet', 'N/A', '', '2022-05-01', '0'),
(235, 'P-329088', 'Glucose', '', 'Per Pack', '38', '50', 0, '1', 1, 'Powder', 'N/A', '', '2022-08-31', '0'),
(236, 'P-333300', 'Zedcal', '', 'Per Bottle', '450', '600', 0, '1', 2, 'syrup', 'N/A', '', '2022-12-01', '0'),
(237, 'P-9302238', 'Ranferon', '', 'Per Bottle', '505', '700', 0, '1', 2, 'syrup', 'N/A', '', '2022-09-01', '0'),
(238, 'P-2250223', 'Saferon', '', 'Per Bottle', '375', '500', 0, '1', 2, 'syrup', 'N/A', '', '2022-01-01', '0'),
(239, 'P-387056', 'Byofer12', '', 'Per Bottle', '375', '500', 0, '1', 2, 'syrup', 'N/A', '', '2022-04-01', '0'),
(240, 'P-230323', 'Ferro B 100ML', '', 'Per Bottle', '150', '200', 0, '1', 2, 'syrup', 'N/A', '', '2022-02-01', '0'),
(241, 'P-232823', 'Ferro B 60 ml', '', 'Per Bottle', '75', '100', 0, '1', 2, 'syrup', 'N/A', '', '2022-09-01', '0'),
(242, 'P-8332428', 'Alugel', '', 'Per Bottle', '46.0', '100.0', 0, '1', 3, 'syrup', 'N/A', '', '2023-05-01', '0'),
(243, 'P-04233', 'Relcer 100ml', '', 'Per Bottle', '185', '250', 0, '1', 1, 'syrup', 'N/A', '', '2023-05-01', '0'),
(244, 'P-323333', 'Relcer 200ml', '', 'Per Bottle', '260.0', '350.0', 0, '1', 1, 'syrup', 'N/A', '', '2024-09-7', '0'),
(245, 'P-45272033', 'Peptica Gel', '', 'Per Bottle', '226', '300', 0, '1', 1, 'syrup', 'N/A', '', '2023-05-01', '0'),
(246, 'P-003333', 'Digeva -F', '', 'Per Bottle', '236', '350', 0, '1', 2, 'syrup', 'N/A', '', '2022-04-01', '0'),
(247, 'P-2872035', 'Castro Gel ', '', 'Per Bottle', '188.0', '250.0', 0, '1', 3, 'syrup', 'N/A', '', '2023-12-31', '0'),
(248, 'P-5382600', 'Flatameal -Ds syrup', '', 'Per Bottle', '219.0', '350.0', 0, '1', 3, 'syrup', 'N/A', '', '2023-01-8', '0'),
(249, 'P-2352023', 'Gaviscon', '', 'Per Bottle', '595.0', '800.0', 0, '1', 1, 'syrup', 'N/A', '', '2022-07-01', '0'),
(250, 'P-3500008', 'Gaviscon peppermint', '', 'Per Bottle', '595.0', '800.0', 0, '1', 0, 'syrup', 'N/A', '', '2022-08-01', '0'),
(251, 'P-2930332', 'Ulqicid mint', '', 'Per Bottle', '320', '450', 0, '1', 1, 'syrup', 'N/A', '', '2022-11-01', '0'),
(252, 'P-32208332', 'Ulqicid cherry', '', 'Per Bottle', '320', '450', 0, '1', 0, 'Cream', 'N/A', '', '2022-10-31', '0'),
(253, 'P-3038602', 'Uliquicid pineapple', '', 'Per Bottle', '320', '450', 0, '1', 1, 'syrup', 'N/A', '', '2022-08-01', '0'),
(254, 'P-02323', 'Calpol 60ml', '', 'Per Bottle', '188.0', '250.0', 0, '1', 5, 'syrup', 'N/A', '', '2024-04-30', '0'),
(255, 'P-333324', 'Calpol 100ml', '', 'Per Bottle', '260.0', '350.0', 0, '1', 3, 'syrup', 'N/A', '', '2023-07-31', '0'),
(256, 'P-0322323', 'Panadol Exilir', '', 'Per Bottle', '300.0', '400.0', 0, '1', 4, 'syrup', 'N/A', '', '2023-08-01', '0'),
(257, 'P-42803', 'Panadol Baby Infant', '', 'Per Bottle', '250', '350.0', 0, '1', 10, 'syrup', 'N/A', '', '2023-01-01', '0'),
(258, 'P-00238', 'Curamol 100ml', '', 'Per Bottle', '75', '100', 0, '1', 0, 'syrup', 'N/A', '', '2024-03-01', '0'),
(259, 'P-32232', 'Curamol 60ml', '', 'Per Bottle', '50.0', '80.0', 0, '1', 5, 'syrup', 'N/A', '', '2024-06-01', '0'),
(260, 'P-3024332', 'Cetamol', '', 'Per Bottle', '75', '100', 0, '1', 2, 'syrup', 'N/A', '', '2024-02-01', '0'),
(261, 'P-332237', 'Paradol 60ml', '', 'Per Bottle', '50', '100', 0, '1', 3, 'syrup', 'N/A', '', '2023-02-28', '0'),
(262, 'P-343002', 'Paradol 100ml', '', 'Per Bottle', '75.0', '80.0', 0, '1', 3, 'syrup', 'N/A', '', '2022-05-01', '0'),
(263, 'P-23330', 'Daprofen', '', 'Per Bottle', '38', '100', 0, '1', 2, 'syrup', 'N/A', '', '2024-02-01', '0'),
(264, 'P-332388', 'Ferapyn', '', 'Per Bottle', '19', '100', 0, '1', 2, 'syrup', 'N/A', '', '2024-04-01', '0'),
(265, 'P-63223532', 'Ibugesic', '', 'Per Bottle', '75', '100', 0, '1', 1, 'Cream', 'N/A', '', '2022-06-01', '0'),
(266, 'P-230382', 'Ibumex 100ml', '', 'Per Bottle', '113', '150', 0, '1', 3, 'syrup', 'N/A', '', '2023-09-28', '0'),
(267, 'P-33332332', 'Ibumex 60ml', '', 'Per Bottle', '50.0', '80.0', 0, '1', 4, 'syrup', 'N/A', '', '2023-10-31', '0'),
(268, 'P-220033', 'Babymol Syrup', '', 'Per Bottle', '189', '250', 0, '1', 2, 'syrup', 'N/A', '', '2022-12-30', '0'),
(269, 'P-46220', 'Brustan', '', 'Per Bottle', '235.0', '350.0', 0, '1', 4, 'syrup', 'N/A', '', '2023-03-01', '0'),
(270, 'P-339420', 'Escomac 40', '', 'Per Tablet', '53.0', '75.0', 0, '1', 304, 'syrup', 'N/A', '', '2022-05-16', '0'),
(271, 'P-2240204', 'Escomac 20', '', 'Per Tablet', '23.0', '40.0', 0, '1', 61, 'Tablet', 'N/A', '', '2022-05-01', '0'),
(272, 'P-0363', 'Esose 40', '', 'Per Tablet', '50.0', '60.0', 0, '1', 27, 'Tablet', 'N/A', '', '2022-11-30', '0'),
(273, 'P-823039', 'ULZO', '', 'Per Pieces', '4.0', '10.0', 0, '1', 58, 'Tablet', 'N/A', '', '2021-03-01', '0'),
(274, 'P-2334822', 'Pantocid 40mg', '', 'Per Tablet', '60', '80', 0, '1', 98, 'Tablet', 'N/A', '', '2022-09-01', '0'),
(275, 'P-03225022', 'Nexium 40', '', 'Per Tablet', '83.0', '110.0', 0, '1', 23, 'Tablet', 'N/A', '', '2022-04-01', '0'),
(276, 'P-293340', 'Cyclopam tabs', '', 'Per Tablet', '19', '25', 0, '1', 16, 'Tablet', 'N/A', '', '2024-02-01', '0'),
(277, 'P-3004232', 'Dulcolax', '', 'Per Tablet', '11', '15', 0, '1', 37, 'Tablet', 'N/A', '', '2023-07-27', '0'),
(278, 'P-24002472', 'Nexium powder', '', 'Per Pack', '98', '130', 0, '1', 5, 'Powder', 'N/A', '', '2022-12-12', '0'),
(279, 'P-753229', 'Maalox sachet', '', 'per sachet', '30', '40', 0, '1', 22, 'Other', 'N/A', '', '2022-08-01', '0'),
(280, 'P-2422202', 'Actilife', '', 'per sachet', '677', '900', 0, '1', 7, 'Other', 'N/A', '', '2022-08-01', '0'),
(281, 'P-2403330', 'Clencee', '', 'per sachet', '603', '800', 0, '1', 3, 'Other', 'N/A', '', '2022-07-01', '0'),
(282, 'P-0393323', 'Clencee Kinds', '', 'per sachet', '489', '650', 0, '1', 3, 'Other', 'N/A', '', '2022-12-01', '0'),
(283, 'P-83236333', 'Fizz', '', 'Per Tablet', '1090', '1450', 0, '1', 1, 'Tablet', 'N/A', '', '2022-04-01', '0'),
(284, 'P-49239025', 'Cevion', '', 'Per Tablet', '212.0', '450.0', 0, '1', 3, 'Tablet', 'N/A', '', '2023-04-01', '0'),
(285, 'P-692323', 'Cac -1000', '', 'Per Tablet', '489', '650', 0, '1', 4, 'Tablet', 'N/A', '', '2023-06-01', '0'),
(286, 'P-3933262', 'Parafast 500mg', '', 'Per Tablet', '9.0', '15.0', 0, '1', 202, 'Tablet', 'N/A', '', '2023-04-01', '0'),
(287, 'P-303242', 'parafast 1000mg', '', 'Per Tablet', '18.0', '30.0', 0, '1', 98, 'Tablet', 'N/A', '', '2024-01-01', '0'),
(288, 'P-3622333', 'cipladon 100mg', '', 'Per Tablet', '29.0', '50.0', 0, '1', 170, 'Tablet', 'N/A', '', '2024-02-01', '0'),
(289, 'P-72002943', 'Jumbo pampers no 3', '', 'per Item', '1220', '1450', 0, '1', 1, 'Sanitary', 'N/A', '', '2023-06-04', '0'),
(290, 'P-3232222', 'DS', '', 'per Item', '70', '100', 0, '1', 3, 'Other', 'N/A', '', '2023-06-01', '0'),
(291, 'P-5338329', 'D10', '', 'per Item', '70', '100', 0, '1', 5, 'Other', 'N/A', '', '2023-04-01', '0'),
(292, 'P-05330', 'RL', '', 'per Item', '70', '100', 0, '1', 7, 'Other', 'N/A', '', '2023-10-01', '0'),
(293, 'P-20352222', '10D', '', 'per Item', '70', '100', 0, '1', 2, 'Other', 'N/A', '', '2022-10-01', '0'),
(294, 'P-422280', 'NS', '', 'per Item', '70.0', '100.0', 0, '1', 2, 'Other', 'N/A', '', '2023-10-01', '0'),
(295, 'P-0232', 'Sterilized Water', '', 'Per Bottle', '8', '10', 0, '1', 8, 'Liquid', 'N/A', '', '2023-10-01', '0'),
(296, 'P-883363', 'Large Giggles Adult Diaper', '', 'Per Pack', '600', '900', 0, '1', 2, 'Sanitary', 'N/A', '', '2025-04-02', '0'),
(297, 'P-2270', 'Cow n gate1', '', 'Per Pack', '760', '1030', 0, '1', 3, 'Powder', 'N/A', '', '2022-01-24', '0'),
(298, 'P-30332030', 'Cow n gate 2', '', 'Per Pack', '760', '1050', 0, '1', 2, 'Cream', '', '', '2022-10-17', '0'),
(299, 'P-072335', 'Cow n gate 3', '', 'Per Pack', '760', '1050', 0, '1', 1, 'Powder', 'N/A', '', '2022-10-08', '0'),
(300, 'P-3220303', 'Mucosolvan', '', 'Per Pack', '450.0', '600.0', 0, '1', 1, 'Liquid', 'N/A', '', '2023-08-21', '0'),
(301, 'P-608782', 'GIggles extra large', '', 'Per Pack', '600', '800', 0, '1', 3, 'Liquid', 'N/A', '', '2025-04-02', '0'),
(302, 'P-022023', 'Joint Fix', '', 'per Item', '820', '1100', 0, '1', 1, 'Other', 'N/A', '', '', '0'),
(303, 'P-0042230', 'pregnacare original', '', 'Per Tablet', '23.0', '30.0', 0, '1', 30, 'Tablet', 'N/A', '', '2022-05-01', '0'),
(304, 'P-32632233', 'pregnacare plus', '', 'Per Tablet', '1500', '2000', 0, '1', 56, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(305, 'P-322272', 'Osteocare', '', 'Per Tablet', '450', '900', 0, '1', 48, 'Tablet', 'N/A', '', '2024-06-01', '0'),
(306, 'P-922207', 'Enat 400', '', 'Per Tablet', '1353', '1800', 0, '1', 30, 'Tablet', 'N/A', '', '2021-10-17', '0'),
(307, 'P-322222', 'NAT B', '', 'Per Tablet', '26', '35', 0, '1', 20, 'Tablet', 'N/A', '', '2022-03-15', '0'),
(308, 'P-0382350', 'pregnacare with folic', '', 'Per Tablet', '677', '900', 0, '1', 28, 'Tablet', 'N/A', '', '2022-08-01', '0'),
(309, 'P-38900306', 'Ginsomin ', '', 'Per Pieces', '34', '45', 0, '1', 41, 'Capsule', 'N/A', '', '2022-08-05', '0'),
(310, 'P-3022753', 'Safecal ', '', 'Per Tablet', '26', '35', 0, '1', 60, 'Tablet', 'N/A', '', '2021-11-01', '0'),
(311, 'P-34003023', 'Prigabalin 150mg', '', 'Per Pieces', '0.0', '200.0', 0, '1', 28, 'Capsule', 'N/A', '', '2022-06-28', '0'),
(312, 'P-8200998', 'Gabix caps', '', 'Per Pieces', '15', '45', 0, '1', 9, 'Capsule', 'N/A', '', '2023-03-01', '0'),
(313, 'P-233245', 'Becoactin ', '', 'Per Tablet', '26', '35', 0, '1', 42, 'Tablet', 'N/A', '', '2023-01-03', '0'),
(314, 'P-2620027', 'Ranferon caps', '', 'Per Pieces', '13', '35', 0, '1', 9, 'Capsule', 'N/A', '', '2022-03-01', '0'),
(315, 'P-33330206', 'Cyro b plus', '', 'Per Pieces', '26', '35', 0, '1', 6, 'Tablet', 'N/A', '', '2021-12-01', '0'),
(316, 'P-763722', 'vita-uv caps', '', 'Per Pieces', '260', '350', 0, '1', 8, 'Capsule', 'N/A', '', '2022-09-01', '0'),
(317, 'P-223223', 'Neuro  -40', '', 'Per Pieces', '19.0', '25.0', 0, '1', 22, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(318, 'P-234286', 'Calciplex 500', '', 'Per Pack', '105.0', '220.0', 0, '1', 1, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(319, 'P-223303', 'Zeenk 20mg', '', 'Per Tablet', '3', '5', 0, '1', 110, 'Tablet', 'N/A', '', '2023-08-01', '0'),
(320, 'P-0932045', 'Junior zinc ', '', 'Per Tablet', '3', '5', 0, '1', 72, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(321, 'P-7220202', 'Zinc 20mg ', '', 'Per Tablet', '8', '10', 0, '1', 5, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(322, 'P-297363', 'MRDT injection', '', 'per Item', '12', '20', 0, '1', 6, 'Injection', 'N/A', '', '2023-10-01', '0'),
(323, 'P-22422', 'Gentamycin Injection', '', 'per Item', '6', '10', 0, '1', 10, 'Injection', 'N/A', '', '2022-06-01', '0'),
(324, 'P-22328', 'Hydrocorticone injection', '', 'per Item', '0', '40', 0, '1', 6, 'Injection', 'N/A', '', '2024-01-01', '0'),
(325, 'P-0227922', 'Vitamin b injection', '', 'per Item', '60.0', '150.0', 0, '1', 24, 'Injection', 'N/A', '', '2023-11-16', '0'),
(326, 'P-00222333', 'Bascopan Injection', '', 'per Item', '23', '30', 0, '1', 8, 'Injection', 'N/A', '', '2022-11-01', '0'),
(327, 'P-322322', 'Diclofenac injection', '', 'per Item', '15', '20', 0, '1', 14, 'Injection', 'N/A', '', '2022-06-01', '0'),
(328, 'P-92322023', 'Cefriaxone injection', '', 'per Item', '30.0', '70.0', 0, '1', 6, 'Injection', 'N/A', '', '2023-07-01', '0'),
(329, 'P-22307806', 'Esomeprazole injection', '', 'Per Pieces', '150.0', '250.0', 0, '1', 3, 'Injection', 'N/A', '', '2023-11-29', '0'),
(330, 'P-032323', 'Metronidazole', '', 'per Item', '38', '50', 0, '1', 2, 'Injection', 'N/A', '', '2023-09-01', '0'),
(331, 'P-04022293', 'Paracetamol injection', '', 'per Item', '69', '150', 0, '1', 3, 'Injection', 'N/A', '', '2023-03-01', '0'),
(332, 'P-2282302', 'Pampers Pants NO.5', '', 'Per Pack', '200.0', '230.0', 0, '1', 3, 'Sanitary', 'N/A', '', '2023-11-10', '0'),
(333, 'P-23252383', 'Pampers Pants NO.3', '', 'Per Pack', '200', '230', 0, '1', 5, 'Sanitary', 'N/A', '', '2023-01-01', '0'),
(334, 'P-552203', 'Pampers NO.5', '', 'Per Pieces', '200.0', '230.0', 0, '1', 4, 'Cream', 'N/A', '', '2023-02-23', '0'),
(335, 'P-322832', 'Pampers NO.4', '', 'Per Pack', '17', '200', 0, '1', 17, 'Sanitary', 'N/A', '', '2022-07-21', '0'),
(336, 'P-2323222', 'Pampers NO.2', '', 'Per Pack', '200', '230', 0, '1', 9, 'Sanitary', 'N/A', '', '2023-11-26', '0'),
(337, 'P-323820', 'Colgate herbal 70g', '', 'Per Pack', '95', '150', 0, '1', 7, 'Cream', 'N/A', '', '2022-11-01', '0'),
(338, 'P-932032', 'Sensodyne multi-care 75ml', '', 'Per Pack', '450', '600', 0, '1', 3, 'Cream', 'N/A', '', '2022-11-01', '0'),
(339, 'P-309232', 'Sensodyne Fresh mint', '', 'Per Pack', '188.0', '250.0', 0, '1', 2, 'Cream', 'N/A', '', '2022-05-01', '0'),
(340, 'P-33220252', 'RObb Ointment 25g', '', 'Per Pack', '50.0', '100.0', 0, '1', 5, 'Ointment', 'N/A', '', '2025-12-17', '0'),
(341, 'P-20083', 'Kaluma Balm 9ml', '', 'Per Pack', '30.0', '50.0', 0, '1', 8, 'Cream', 'N/A', '', '2026-01-01', '0'),
(342, 'P-230302', 'Methoplus Balm 30ml', '', 'Per Pack', '95', '120', 0, '1', 5, 'Cream', 'N/A', '', '2023-11-01', '0'),
(343, 'P-6333', 'Menthoplus Balm 9ml', '', 'Per Pack', '30.0', '50.0', 0, '1', 8, 'Cream', 'N/A', '', '2023-10-01', '0'),
(344, 'P-323092', 'Car buds', '', 'per Item', '40', '80', 0, '1', 16, 'Other', 'N/A', '', '2025-10-01', '0'),
(345, 'P-3733333', 'Always Pantie liners', '', 'per Item', '100', '150', 0, '1', 3, 'Pessaries', 'N/A', '', '', '0'),
(346, 'P-32223', 'Alwats Blue', '', 'Per Pack', '65', '100', 0, '1', 5, 'Sanitary', 'N/A', '', '', '0'),
(347, 'P-092039', 'Always green', '', 'Per Pack', '65', '90', 0, '1', 20, 'Sanitary', 'N/A', '', '', '0'),
(348, 'P-88233', 'MedicoH', '', 'Per Pieces', '58.0', '80.0', 0, '1', 11, 'Other', 'N/A', '', '2024-04-01', '0'),
(349, 'P-959940', 'Aspa sweet', '', 'Per Tablet', '295', '400', 0, '1', 1, 'Tablet', 'N/A', '', '2022-04-01', '0'),
(350, 'P-9092853', 'Avoca', '', 'Per Tablet', '260', '350', 0, '1', 3, 'Tablet', 'N/A', '', '2024-10-01', '0'),
(351, 'P-30300306', 'Airtal', '', 'Per Tablet', '90', '120', 0, '1', 10, 'Tablet', 'N/A', '', '', '0'),
(352, 'P-0933572', 'Small baby bottle', '', 'Per Bottle', '135', '200', 0, '1', 1, 'Other', 'N/A', '', '', '0'),
(353, 'P-3072833', 'Toothbrush', '', 'per Item', '30', '80', 0, '1', 0, 'Other', 'N/A', '', '', '0'),
(354, 'P-0004563', 'Bpyn', '', 'Per Tablet', '17', '25', 0, '1', 19, 'Tablet', 'N/A', '', '2023-09-01', '0'),
(355, 'P-2092333', 'clanoxy 625', '', 'Per Box', '180.0', '250.0', 0, '1', 2, 'Tablet', 'N/A', '', '2023-02-01', '0'),
(356, 'P-8502374', 'Claxy 625', '', 'Per Pieces', '180.0', '250.0', 0, '1', 6, 'Capsule', 'N/A', '', '2023-04-01', '0'),
(357, 'P-4203', 'Claxy', '', 'Per Pieces', '335.0', '450.0', 0, '1', 6, 'Capsule', 'N/A', '', '2022-11-01', '0'),
(358, 'P-03020232', 'Cetrizine tabs', '', 'Per Pieces', '3.0', '10.0', 0, '1', 823, 'Tablet', 'N/A', '', '2024-01-8', '0'),
(359, 'P-393030', 'Domadol', '', 'Per Tablet', '75.0', '150.0', 0, '1', 44, 'Tablet', 'N/A', '', '2023-02-01', '0'),
(360, 'P-0220623', 'Combivent', '', 'Per Tablet', '123', '160', 0, '1', 25, 'Tablet', 'N/A', '', '2022-03-10', '0'),
(361, 'P-42033960', 'Neurobine', '', 'Per Pieces', '150.0', '250.0', 0, '1', 6, 'Injection', 'N/A', '', '2023-06-01', '0'),
(362, 'P-23022082', 'Subsitories', '', 'Per Pieces', '19.0', '40.0', 0, '1', 16, 'Capsule', 'N/A', '', '2022-11-01', '0'),
(363, 'P-3272320', 'Femiplan', '', 'per Item', '150', '200', 0, '1', 14, 'Injection', 'N/A', '', '2023-09-01', '0'),
(364, 'P-920400', 'Predisolone(tin)', '', 'Per Pieces', '1', '1', 0, '1', 655, 'Other', 'N/A', '', '2023-02-02', '0'),
(365, 'P-94333300', 'Salbutamol(tin)', '', 'Per Pieces', '1', '1', 0, '1', 500, 'Other', 'N/A', '', '2023-04-10', '0'),
(366, 'P-33330606', 'Procenol', '', 'per Item', '1', '5', 0, '1', 80, 'Tablet', 'N/A', '', '2025-07-17', '0'),
(367, 'P-082030', 'Elymol', '', 'Per Pieces', '2', '5', 0, '1', 49, 'Tablet', 'N/A', '', '2024-09-02', '0'),
(368, 'P-63232032', 'Carolight Small', '', 'Per Pack', '110.0', '150.0', 0, '1', 8, 'Cream', 'N/A', '', '2023-03-29', '0'),
(369, 'P-8323306', 'Carolight Big ', '', 'Per Pack', '220', '350', 0, '1', 5, 'Cream', 'N/A', '', '2022-04-06', '0'),
(370, 'P-00322830', 'Caro Water', '', 'Per Bottle', '90', '120', 0, '1', 1, 'Liquid', 'N/A', '', '2022-09-02', '0'),
(371, 'P-373230', 'Cussons baby powder', '', 'Per Pack', '128', '170', 0, '1', 2, 'Powder', 'N/A', '', '2024-02-02', '0'),
(372, 'P-23352', 'Johnsonns baby powder', '', 'Per Pack', '120', '160', 0, '1', 1, 'Powder', 'N/A', '', '2022-12-02', '0'),
(373, 'P-3022328', 'Cussons soap', '', 'per Item', '75', '100', 0, '1', 3, 'Other', 'N/A', '', '2023-12-02', '0'),
(374, 'P-22932', 'Johnsonns soap', '', 'per Item', '75', '100', 0, '1', 2, 'Other', 'N/A', '', '2022-08-02', '0'),
(375, 'P-232083', 'Olive oil 50ml', '', 'Per Bottle', '95', '150', 0, '1', 5, 'Liquid', 'N/A', '', '2022-05-02', '0'),
(376, 'P-32225000', 'Olive oil 25ml', '', 'Per Pack', '60', '80', 0, '1', 3, 'Liquid', 'N/A', '', '2023-10-02', '0'),
(377, 'P-83230289', 'Ideal castor 25ml', '', 'Per Pack', '60', '80', 0, '1', 1, 'Liquid', 'N/A', '', '2023-07-02', '0'),
(378, 'P-2430323', 'Big Tetmosal soap', '', 'per Item', '150.0', '260.0', 0, '1', 4, 'Other', 'N/A', '', '', '0'),
(379, 'P-2202228', 'Small Tetmosal soap', '', 'per Item', '108.0', '150.0', 0, '1', 5, 'Other', 'N/A', '', '', '0'),
(380, 'P-8229325', 'Lemonvate', '', 'per Item', '95.0', '130.0', 0, '1', 6, 'Cream', 'N/A', '', '2023-02-02', '0'),
(381, 'P-630228', 'Movate', '', 'per Item', '95.0', '130.0', 0, '1', 8, 'Cream', 'N/A', '', '2023-09-02', '0'),
(382, 'P-3324523', 'Diproson Creme', '', 'Per Pack', '45', '60', 0, '1', 9, 'Cream', 'N/A', '', '2023-08-02', '0'),
(383, 'P-806239', 'Diproson lotion', '', 'Per Pack', '53', '70', 0, '1', 5, 'Liquid', 'N/A', '', '2022-08-02', '0'),
(384, 'P-22233', 'Nivea Lotion 200ml', '', 'Per Pack', '226', '300', 0, '1', 2, 'Cream', 'N/A', '', '2023-11-02', '0'),
(385, 'P-339326', 'Nivea lotion ', '', 'Per Pack', '135', '180', 0, '1', 5, 'Liquid', 'N/A', '', '2024-05-02', '0'),
(386, 'P-2023', 'Black Shampoo', '', 'Per Pack', '38', '50', 0, '1', 11, 'Liquid', 'N/A', '', '2023-06-02', '0'),
(387, 'P-2034336', 'Nivea deodrant', '', 'Per Pack', '250.0', '350.0', 0, '1', 4, 'Liquid', 'N/A', '', '2022-04-02', '0'),
(388, 'P-20933622', 'Nivea Rolion', '', 'Per Pieces', '145.0', '250.0', 0, '1', 5, 'Cream', 'N/A', '', '2023-01-02', '0'),
(389, 'P-2970822', 'Dettol', '', 'Per Pieces', '75.0', '120.0', 0, '1', 6, 'Liquid', 'N/A', '', '2023-06-02', '0'),
(390, 'P-8225320', 'Savlon', '', 'Per Pack', '95', '120', 0, '1', 4, 'Liquid', 'N/A', '', '2024-09-02', '0'),
(391, 'P-3037204', 'Tropical Coconut 65 ml', '', 'Per Pack', '90', '120', 0, '1', 6, 'Liquid', 'N/A', '', '2023-09-02', '0'),
(392, 'P-03320326', 'Tropical Coconut Oil 120ml', '', 'Per Pack', '135', '180', 0, '1', 6, 'Liquid', 'N/A', '', '2023-09-02', '0'),
(393, 'P-2222230', 'Clere Lotion', '', 'Per Pack', '95', '150', 0, '1', 3, 'Liquid', 'N/A', '', '2023-09-21', '0'),
(394, 'P-370202', 'Pyary Soap', '', 'Per Pack', '60', '100', 0, '1', 5, 'Other', 'N/A', '', '', '0'),
(395, 'P-3072702', 'Asante soap Tamarind', '', 'per Item', '95.0', '120.0', 0, '1', 7, 'Other', 'N/A', '', '2025-06-02', '0'),
(396, 'P-930', 'Euthyrox', '', 'Per Tablet', '15', '20', 0, '1', 28, 'Tablet', 'N/A', '', '2022-03-02', '0'),
(397, 'P-2223005', 'Asante Soap Papaya', '', 'Per Pack', '95.0', '120.0', 0, '1', 7, 'Other', 'N/A', '', '2025-08-02', '0'),
(398, 'P-23339236', 'cripton', '', 'Per Tablet', '30', '40', 0, '1', 30, 'Tablet', 'N/A', '', '2023-11-02', '0'),
(399, 'P-203725', 'Carambola soap', '', 'per Item', '95', '120', 0, '1', 5, 'Other', 'N/A', '', '2023-05-02', '0'),
(400, 'P-03923', 'Daflon -500', '', 'Per Pieces', '23.0', '30.0', 0, '1', 4, 'Tablet', 'N/A', '', '2023-04-02', '0'),
(401, 'P-03263', 'enapril 5mg', '', 'Per Tablet', '3', '5', 0, '1', 40, 'Tablet', 'N/A', '', '2022-07-02', '0'),
(402, 'P-330230', 'Dettol Soap', '', 'per Item', '66', '100', 0, '1', 8, 'Cream', 'N/A', '', '2024-10-02', '0'),
(403, 'P-29033333', 'enapril 10mg', '', 'Per Tablet', '3.0', '5.0', 0, '1', 0, 'Tablet', 'N/A', '', '2022-06-02', '0'),
(404, 'P-2630033', 'Veet', '', 'Per Pack', '175', '250', 0, '1', 3, 'Cream', 'N/A', '', '', '0'),
(405, 'P-333225', 'nefin cr 20 f8', '', 'Per Tablet', '1', '5', 0, '1', 170, 'Tablet', 'N/A', '', '2023-12-02', '0'),
(406, 'P-323359', 'Mask', '', 'per Item', '3.0', '5.0', 0, '1', 526, 'Sanitary', 'N/A', '', '2026-08-02', '0'),
(407, 'P-233802', 'Trust Classic', '', 'per Item', '35', '50', 0, '1', 14, 'Other', 'N/A', '', '2024-12-02', '0'),
(408, 'P-3283932', 'telmi 80h', '', 'Per Tablet', '1955', '2600', 0, '1', 30, 'Tablet', 'N/A', '', '2023-06-02', '0'),
(409, 'P-98703', 'Trust Standard', '', 'per Item', '35', '50', 0, '1', 1, 'Other', 'N/A', '', '2024-08-02', '0'),
(410, 'P-2252203', 'amlozaar', '', 'Per Tablet', '52', '70', 0, '1', 22, 'Tablet', 'N/A', '', '2023-06-02', '0'),
(411, 'P-26345', 'Panadol cold and flu', '', 'Per Tablet', '11.0', '15.0', 0, '1', 122, 'Tablet', 'N/A', '', '2023-09-02', '0'),
(412, 'P-90026272', 'arbitel 40', '', 'Per Tablet', '41', '55', 0, '1', 24, 'Tablet', 'N/A', '', '2023-01-02', '0'),
(413, 'P-5592343', 'Diclomal', '', 'Per Tablet', '3.0', '10.0', 0, '1', 249, 'Tablet', 'N/A', '', '2024-01-02', '0'),
(414, 'P-322239', 'asomex 25', '', 'Per Tablet', '53', '70', 0, '1', 30, 'Tablet', 'N/A', '', '2023-06-02', '0'),
(415, 'P-0933326', 'ETCOX -90', '', 'Per Tablet', '34', '45', 0, '1', 7, 'Tablet', 'N/A', '', '2022-01-02', '0'),
(416, 'P-05302322', 'vebilong', '', 'Per Tablet', '37', '50', 0, '1', 20, 'Tablet', 'N/A', '', '2021-11-02', '0'),
(417, 'P-0488622', 'Celabat', '', 'Per Tablet', '15.0', '20.0', 0, '1', 132, 'Cream', 'N/A', '', '2022-11-11', '0'),
(418, 'P-342200', 'Zulu', '', 'Per Pieces', '23.0', '30.0', 0, '1', 7, 'Tablet', 'N/A', '', '2023-04-02', '0'),
(419, 'P-3203095', 'cardisprin 75mg', '', 'Per Tablet', '3', '5', 0, '1', 20, 'Tablet', 'N/A', '', '2021-09-02', '0'),
(420, 'P-9043', 'Zulu MR ', '', 'Per Tablet', '29.0', '40.0', 0, '1', 55, 'Tablet', 'N/A', '', '2022-11-11', '0'),
(421, 'P-302030', 'pyridoxine', '', 'Per Tablet', '3', '5', 0, '1', 63, 'Tablet', 'N/A', '', '2024-07-02', '0'),
(422, 'P-830333', 'Rovista 20mg', '', 'Per Tablet', '68', '90', 0, '1', 30, 'Tablet', 'N/A', '', '2023-03-02', '0'),
(423, 'P-3232333', 'ascard  75mg', '', 'Per Tablet', '95', '150', 0, '1', 29, 'Tablet', 'N/A', '', '2023-06-02', '0'),
(424, 'P-320008', 'methyldopa', '', 'Per Tablet', '3', '5', 0, '1', 100, 'Tablet', 'N/A', '', '2024-04-02', '0'),
(425, 'P-022662', 'amlozaar 5mg', '', 'Per Tablet', '53', '70', 0, '1', 60, 'Tablet', 'N/A', '', '2021-12-02', '0'),
(426, 'P-292534', 'amlodipine 5mg', '', 'Per Tablet', '3.0', '5.0', 0, '1', 56, 'Tablet', 'N/A', '', '2024-02-02', '0'),
(427, 'P-333327', 'lorsatas HT', '', 'Per Tablet', '26', '35', 0, '1', 110, 'Tablet', 'N/A', '', '2023-06-02', '0'),
(428, 'P-225684', 'hydralazine', '', 'Per Tablet', '3', '10', 0, '1', 100, 'Tablet', 'N/A', '', '2023-06-02', '0'),
(429, 'P-333303', 'amlodipine 10mg', '', 'Per Tablet', '3.0', '10.0', 0, '1', 54, 'Tablet', 'N/A', '', '2023-12-01', '0'),
(430, 'P-72760', 'RIlif MR ', '', 'Per Tablet', '26', '35', 0, '1', 62, 'Tablet', 'N/A', '', '2022-10-11', '0'),
(431, 'P-5089732', 'Zithrox 500mg', '', 'Per Tablet', '75.0', '200.0', 0, '1', 2, 'Tablet', 'N/A', '', '2025-01-02', '0'),
(432, 'P-5286220', 'teltas 40', '', 'Per Tablet', '0', '0', 0, '1', 38, 'Tablet', 'N/A', '', '2022-09-02', '0');
INSERT INTO `products` (`product_id`, `product_code`, `product_name`, `description_name`, `unit`, `cost`, `price`, `vat`, `supplier`, `qty_left`, `category`, `brand`, `date_delivered`, `expiration_date`, `reorder`) VALUES
(433, 'P-030900', 'Zithrox 200gm', '', 'Per Tablet', '75.0', '200.0', 0, '1', 22, 'Tablet', 'N/A', '', '', '0'),
(434, 'P-622807', 'dermazine', '', 'Per Pack', '150', '200', 0, '1', 2, 'Cream', 'N/A', '', '2024-01-02', '0'),
(435, 'P-3323223', 'Cyclovax Cream', '', 'Per Pack', '150', '200', 0, '1', 0, 'Cream', 'N/A', '', '2021-11-02', '0'),
(436, 'P-30295027', 'terbibact mixi', '', 'Per Pieces', '260', '300', 0, '1', 2, 'Cream', 'N/A', '', '2021-12-02', '0'),
(437, 'P-26835200', 'Biotrim Ds', '', 'Per Tablet', '3', '10', 0, '1', 200, 'Tablet', 'N/A', '', '2023-09-01', '0'),
(438, 'P-225004', 'bonjela teehing gel', '', 'Per Pieces', '605', '800', 0, '1', 1, 'Cream', 'N/A', '', '2021-09-02', '0'),
(439, 'P-372332', 'zupricin', '', 'Per Pieces', '430', '600.0', 0, '1', 0, 'Cream', 'N/A', '', '2022-07-02', '0'),
(440, 'P-223562', 'Doxy cap', '', 'Per Tablet', '3', '10', 0, '1', 105, 'Capsule', 'N/A', '', '2023-08-01', '0'),
(441, 'P-06504603', 'Ampiclo davoa 500', '', 'Per Pieces', '3.0', '10.0', 0, '1', 291, 'Capsule', 'N/A', '', '2024-01-01', '0'),
(442, 'P-223020', 'Moxacil 500mg', '', 'Per Pieces', '3.0', '10.0', 0, '1', 99, 'Capsule', 'N/A', '', '2022-12-01', '0'),
(443, 'P-7602323', 'Omacillin 500mg', '', 'Per Pieces', '3', '10', 0, '1', 375, 'Capsule', 'N/A', '', '2023-10-12', '0'),
(444, 'P-032203', 'Dawa Floxacillin 250', '', 'Per Pieces', '4', '20', 0, '1', 70, 'Capsule', 'N/A', '', '2024-01-12', '0'),
(445, 'P-322320', 'bonjela teething gel', '', 'Per Pack', '605', '800', 0, '6', 2, 'Cream', 'N/A', '', '2021-12-02', '0'),
(446, 'P-55303920', 'zupricin', '', 'Per Pieces', '476.0', '600.0', 0, '4', 3, 'Cream', 'N/A', '', '2022-07-02', '0'),
(447, 'P-03022049', 'Dawa Floxacillin 500', '', 'Per Pieces', '4', '20', 0, '1', 166, 'Capsule', 'N/A', '', '2024-01-01', '0'),
(448, 'P-220593030', 'unisten', '', 'Per Pack', '75', '100', 0, '1', 2, 'Cream', 'N/A', '', '2023-10-02', '0'),
(449, 'P-330620', 'oncosil cream', '', 'Per Pack', '0', '0', 0, '1', 1, 'Cream', 'N/A', '', '2023-05-01', '0'),
(450, 'P-393243', 'Moximed 250ng', '', 'Per Pieces', '3', '10', 0, '1', 145, 'Cream', 'N/A', '', '2023-08-01', '0'),
(451, 'P-3006290', 'kly jelly', '', 'Per Pack', '175.0', '300.0', 0, '4', 3, 'Cream', 'N/A', '', '2030-11-02', '0'),
(452, 'P-23302240', 'daktarin oral gel', '', 'Per Pack', '0', '0', 0, '4', 1, 'Cream', 'N/A', '', '2022-09-02', '0'),
(453, 'P-82322230', 'miconazole oral gel', '', 'Per Pack', '0', '400', 0, '1', 1, 'Cream', 'N/A', '', '2023-05-02', '0'),
(454, 'P-320332', 'Alimox 250mg', '', 'Per Pieces', '3', '10', 0, '1', 90, 'Capsule', 'N/A', '', '2023-03-01', '0'),
(455, 'P-4322327', 'Ampiclo original', '', 'Per Tablet', '226', '300', 0, '1', 118, 'Tablet', 'N/A', '', '2023-06-01', '0'),
(456, 'P-320320', 'ocid (omeprazole)', '', 'Per Tablet', '3.0', '10.0', 0, '1', 812, 'Tablet', 'N/A', '', '2022-08-02', '0'),
(457, 'P-00324320', 'omis', '', 'Per Tablet', '3.0', '10.0', 0, '1', 296, 'Tablet', '', '', '2023-11-02', '0'),
(458, 'P-2322200', 'Bulkot-B', '', 'Per Pack', '45', '100', 0, '1', 2, 'Cream', 'N/A', '', '2024-01-02', '0'),
(459, 'P-203726', 'Elyvate', '', 'Per Pieces', '45', '100', 0, '1', 2, 'Cream', 'N/A', '', '2022-01-02', '0'),
(460, 'P-234002', 'medivine', '', 'Per Pack', '45.0', '80.0', 0, '1', 2, 'Cream', 'N/A', '', '2024-02-02', '0'),
(461, 'P-2033259', 'sulphur ointment', '', 'Per Pack', '45', '100', 0, '1', 0, 'Cream', 'N/A', '', '2023-08-02', '0'),
(462, 'P-72253230', 'Medivine-S', '', 'Per Pieces', '150', '200', 0, '1', 2, 'Cream', 'N/A', '', '2023-08-02', '0'),
(463, 'P-852323', 'Ciprofloxacin', '', 'Per Tablet', '3', '10', 0, '1', 38, 'Tablet', 'N/A', '', '2023-08-01', '0'),
(464, 'P-960730', 'beclomin', '', 'Per Pack', '130.0', '200.0', 0, '1', 3, 'Cream', 'N/A', '', '2022-11-16', '0'),
(465, 'P-2043302', 'Drex Ointment', '', 'Per Pack', '130', '200', 0, '1', 3, 'Cream', 'N/A', '', '2022-01-02', '0'),
(466, 'P-39036252', 'Amoxillin Original', '', 'Per Pieces', '19', '25', 0, '1', 52, 'Capsule', 'N/A', '', '2023-06-01', '0'),
(467, 'P-0572220', 'Olycort', '', 'Per Pieces', '75', '100', 0, '1', 0, 'Cream', 'N/A', '', '2023-09-02', '0'),
(468, 'P-28328223', 'Ankle support', '', 'Per Pack', '650', '950', 0, '1', 0, 'Cream', 'N/A', '', '2025-01-02', '0'),
(469, 'P-0222823', 'Satrim Ds', '', 'Per Tablet', '3', '10', 0, '1', 85, 'Tablet', 'N/A', '', '2023-08-01', '0'),
(470, 'P-2233003', 'exevate-MF', '', 'Per Pack', '300', '400', 0, '1', 2, 'Cream', 'N/A', '', '2021-10-02', '0'),
(471, 'P-85222', 'fungistat', '', 'Per Pieces', '40', '100', 0, '1', 3, 'Cream', 'N/A', '', '2022-12-02', '0'),
(472, 'P-73307233', 'chlorhexidine gel', '', 'Per Pack', '75.0', '150', 0, '1', 1, 'Cream', 'N/A', '', '2022-05-02', '0'),
(473, 'P-203000', 'anustat', '', 'Per Pack', '300', '400', 0, '1', 1, 'Cream', 'N/A', '', '2022-05-02', '0'),
(474, 'P-502370', 'sonaderm dm', '', 'Per Pack', '150.0', '200.0', 0, '1', 1, 'Cream', 'N/A', '', '2022-11-02', '0'),
(475, 'P-04334223', 'probax', '', 'Per Pack', '75', '100', 0, '1', 2, 'Cream', 'N/A', '', '2023-11-02', '0'),
(476, 'P-36090322', 'norash', '', 'Per Pack', '270.0', '400.0', 0, '1', 3, 'Cream', 'N/A', '', '2022-11-02', '0'),
(477, 'P-222330', 'Nogluc', '', 'Per Tablet', '3', '5', 0, '1', 187, 'Tablet', 'N/A', '', '2024-04-01', '0'),
(478, 'P-3200520', 'Alito', '', 'Per Bottle', '95', '150', 0, '1', 4, 'Cream', 'N/A', '', '2023-12-01', '0'),
(479, 'P-822930', 'Tripride Z', '', 'Per Tablet', '40', '55', 0, '1', 30, 'Tablet', 'N/A', '', '2024-04-01', '0'),
(480, 'P-6723200', 'funbact', '', 'Per Pack', '150.0', '200.0', 0, '1', 3, 'Cream', 'N/A', '', '2023-01-02', '0'),
(481, 'P-370332', 'Zithroox', '', 'Per Tablet', '75', '200', 0, '1', 0, 'Cream', 'N/A', '', '2024-12-01', '0'),
(482, 'P-420333', 'Treviamet 50/100mg', '', 'Per Pieces', '49.0', '65.0', 0, '1', 51, 'Tablet', 'N/A', '', '2022-11-01', '0'),
(483, 'P-3823703', 'Acepar Capsules', '', 'Per Pieces', '23', '30', 0, '1', 14, 'Capsule', 'N/A', '', '2023-12-02', '0'),
(484, 'P-30332027', 'Treviamet 50/500mg', '', 'Per Pieces', '49', '65', 0, '1', 0, 'Tablet', 'N/A', '', '2022-11-01', '0'),
(485, 'P-0569332', 'Acepar MR Caps', '', 'Per Pieces', '23', '30', 0, '1', 10, 'Capsule', 'N/A', '', '2023-06-02', '0'),
(486, 'P-333032', 'Acephar sp capsule', '', 'Per Pieces', '19', '25', 0, '1', 1, 'Capsule', 'N/A', '', '2021-11-02', '0'),
(487, 'P-903329', 'Glucomet 850mg', '', 'Per Tablet', '6.0', '10.0', 0, '1', 112, 'Tablet', 'N/A', '', '2023-04-01', '0'),
(488, 'P-32537', 'grabacin 3 ointment', '', 'Per Pack', '188', '250', 0, '1', 1, 'Cream', 'N/A', '', '2022-01-02', '0'),
(489, 'P-003', 'Zytal MR', '', 'Per Tablet', '29.0', '40.0', 0, '1', 99, 'Tablet', 'N/A', '', '2023-11-02', '0'),
(490, 'P-62002003', 'Axylin neo drops', '', 'Per Pieces', '75.0', '150.0', 0, '1', 2, 'Cream', 'N/A', '', '2023-01-08', '0'),
(491, 'P-2033234', 'fusidin', '', 'Per Pack', '526', '700', 0, '1', 1, 'Cream', 'N/A', '', '2022-05-02', '0'),
(492, 'P-92002234', 'Tetracyclin', '', 'Per Pack', '75', '100', 0, '1', 0, 'Cream', 'N/A', '', '2022-12-02', '0'),
(493, 'P-02232230', 'Zithromax', '', 'Per Tablet', '1430', '1900', 0, '1', 1, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(494, 'P-2823233', 'deep heat spray', '', 'Per Pack', '450', '600', 0, '1', 1, 'Cream', 'N/A', '', '2024-06-02', '0'),
(495, 'P-04727323', 'Flamox', '', 'Per Tablet', '260', '350', 0, '1', 1, 'Cream', 'N/A', '', '2023-01-02', '0'),
(496, 'P-00603563', 'Diamcron MR 60mg', '', 'Per Tablet', '41', '55', 0, '1', 17, 'Tablet', 'N/A', '', '2023-06-01', '0'),
(497, 'P-2223230', 'Brustan', '', 'Per Tablet', '19', '25', 0, '4', 15, 'Tablet', 'N/A', '', '2024-04-05', '0'),
(498, 'P-3290309', 'deep freeze spray', '', 'Per Pack', '650', '900', 0, '1', 1, 'Cream', 'N/A', '', '2023-03-02', '0'),
(499, 'P-263002', 'Karvol', '', 'Per Pieces', '45.0', '60.0', 0, '1', 17, 'Capsule', 'N/A', '', '2023-02-02', '0'),
(500, 'P-5532288', 'deep heat 35g', '', 'Per Pack', '300', '4000', 0, '1', 2, 'Cream', 'N/A', '', '2022-12-02', '0'),
(501, 'P-302222', 'Ampiclo-dawa leo', '', 'Per Tablet', '49.0', '150.0', 0, '1', 1, 'Tablet', 'N/A', '', '2023-01-12', '0'),
(502, 'P-5302980', 'zyrtal gel 30g', '', 'Per Pack', '345', '450', 0, '1', 2, 'Cream', 'N/A', '', '2021-11-02', '0'),
(503, 'P-223283', 'Amoklavin-BD', '', 'Per Tablet', '230.0', '300.0', 0, '1', 0, 'Cream', 'N/A', '', '2023-01-11', '0'),
(504, 'P-92323390', 'zyrtal gel 30g', '', 'Per Pack', '345', '450', 0, '4', 2, 'Cream', 'N/A', '', '2021-12-02', '0'),
(505, 'P-3296208', 'nauma bala', '', 'Per Pack', '75', '100', 0, '1', 1, 'Cream', 'N/A', '', '2023-08-02', '0'),
(506, 'P-20042', 'pharmasal', '', 'Per Pack', '75', '100', 0, '1', 2, 'Cream', 'N/A', '', '2023-08-02', '0'),
(507, 'P-80833', 'Amoxyl dispersible tabs', '', 'Per Tablet', '1', '5', 0, '1', 9, 'Tablet', 'N/A', '', '2022-01-06', '0'),
(508, 'P-26032363', 'rufenac gel', '', 'Per Pack', '30.0', '100.0', 0, '1', 3, 'Cream', 'N/A', '', '2024-01-02', '0'),
(509, 'P-23057723', 'volini', '', 'Per Pieces', '220', '300', 0, '1', 0, 'Cream', 'N/A', '', '2023-02-02', '0'),
(510, 'P-3203200', 'powergesic gel', '', 'Per Pack', '225.0', '300.0', 0, '5', 3, 'Cream', 'N/A', '', '2022-09-02', '0'),
(511, 'P-2027', 'Elymox', '', 'Per Tablet', '45', '100', 0, '1', 0, 'Tablet', 'N/A', '', '2023-07-01', '0'),
(512, 'P-8220670', 'novasept', '', 'Per Pack', '188', '250', 0, '4', 1, 'Cream', 'N/A', '', '2023-07-02', '0'),
(513, 'P-2235238', 'Dynapar plus', '', 'Per Tablet', '8.0', '10.0', 0, '1', 115, 'Tablet', 'N/A', '', '2024-09-02', '0'),
(514, 'P-23323222', 'Amoxil125/5ml', '', 'Per Bottle', '260.0', '350.0', 0, '1', 2, 'Cream', 'N/A', '', '2023-12-01', '0'),
(515, 'P-2356200', 'knee support', '', 'Per Pack', '650', '900', 0, '1', 1, 'Cream', 'N/A', '', '2025-01-01', '0'),
(516, 'P-222500', 'Ibucap', '', 'Per Pieces', '8', '10', 0, '1', 93, 'Capsule', 'N/A', '', '2022-12-02', '0'),
(517, 'P-36202229', 'Betason ', '', 'Per Pack', '60.0', '80.0', 0, '1', 2, 'Cream', 'N/A', '', '2022-12-23', '0'),
(518, 'P-2323232', 'Flucoxacillion Dawa flox', '', 'Per Tablet', '75', '100', 0, '1', 1, 'Cream', 'N/A', '', '2024-03-01', '0'),
(519, 'P-0220320', 'Betason G', '', 'Per Pieces', '95.0', '150.0', 0, '1', 2, 'Cream', 'N/A', '', '2023-06-02', '0'),
(520, 'P-2220025', 'Moxacil 60ml', '', 'Per Bottle', '35', '100', 0, '1', 1, 'Cream', 'N/A', '', '2023-12-01', '0'),
(521, 'P-3022283', 'Moxacil 100ml', '', 'Per Pieces', '75.0', '100.0', 0, '1', 5, 'Cream', 'N/A', '', '2024-04-01', '0'),
(522, 'P-233260', 'Glores', '', 'per Item', '26', '35', 0, '1', 118, 'Other', 'N/A', '', '2025-10-01', '0'),
(523, 'P-38390', 'Betason s', '', 'Per Pieces', '75', '100', 0, '1', 1, 'Cream', 'N/A', '', '2023-06-02', '0'),
(524, 'P-2272227', '5ml Syringe', '', 'per Item', '1', '5', 0, '1', 122, 'Injection', 'N/A', '', '2025-06-01', '0'),
(525, 'P-34397222', 'Clindar 7 plus', '', 'Per Pack', '480', '650', 0, '1', 2, 'Cream', 'N/A', '', '2022-11-02', '0'),
(526, 'P-2322', 'Kemoxil 100ml', '', 'Per Bottle', '75', '100', 0, '1', 0, 'Cream', 'N/A', '', '2024-01-01', '0'),
(527, 'P-880200', 'Glob -B', '', 'Per Pack', '95', '150', 0, '1', 3, 'Cream', 'N/A', '', '2023-11-02', '0'),
(528, 'P-2432202', 'Kemoxil 60ml', '', 'Per Bottle', '75', '100', 0, '1', 6, 'Cream', 'N/A', '', '2024-01-01', '0'),
(529, 'P-3008', '10ml Syringe', '', 'per Item', '1', '10', 0, '1', 62, 'Injection', 'N/A', '', '', '0'),
(530, 'P-602255', 'Drox 500mg', '', 'Per Pieces', '0', '0', 0, '1', 80, 'Cream', 'N/A', '', '2022-08-01', '0'),
(531, 'P-302323', 'Candid B  30gm', '', 'Per Pack', '340', '450', 0, '1', 2, 'Cream', 'N/A', '', '2023-01-02', '0'),
(532, 'P-43623023', 'Candid B 15gm', '', 'Per Pack', '175.0', '250.0', 0, '1', 3, 'Cream', 'N/A', '', '2023-09-02', '0'),
(533, 'P-2749', 'Clarized -500', '', 'Per Pieces', '226.0', '300.0', 0, '1', 2, 'Tablet', 'N/A', '', '2023-05-7', '0'),
(534, 'P-525300', 'Dentinox', '', 'Per Pack', '540', '720', 0, '1', 1, 'Cream', 'N/A', '', '2025-01-31', '0'),
(535, 'P-3233627', 'Bulkot  mixi', '', 'Per Pack', '150', '200', 0, '1', 2, 'Cream', 'N/A', '', '2023-11-02', '0'),
(536, 'P-3322832', 'Momate Cream', '', 'Per Pack', '450', '600', 0, '1', 1, 'Cream', 'N/A', '', '2021-12-01', '0'),
(537, 'P-2722032', 'Cotton 100grms', '', 'per Item', '55', '150', 0, '1', 13, 'Other', 'N/A', '', '2025-06-07', '0'),
(538, 'P-5332234', 'Scabion cream', '', 'Per Pack', '110', '150', 0, '1', 2, 'Cream', 'N/A', '', '2023-06-02', '0'),
(539, 'P-932473', 'Flmox 250', '', 'Per Pieces', '15', '20', 0, '1', 40, 'Cream', 'N/A', '', '2023-02-01', '0'),
(540, 'P-002053', 'Benzoxyl peroxide gel', '', 'Per Pack', '295.0', '450.0', 0, '1', 2, 'Cream', 'N/A', '', '2022-09-02', '0'),
(541, 'P-84803232', 'Cotton 50grms', '', 'per Item', '28.0', '50.0', 0, '1', 16, 'Other', 'N/A', '', '2025-03-02', '0'),
(542, 'P-02032', 'Quadrajel', '', 'Per Pieces', '210.0', '300.0', 0, '1', 0, 'Cream', 'N/A', '', '2022-09-24', '0'),
(543, 'P-28242060', 'Bactolav-625', '', 'Per Box', '19', '30', 0, '1', 20, 'Tablet', 'N/A', '', '2022-02-01', '0'),
(544, 'P-2039', 'Cotton 400grms', '', 'per Item', '150', '350', 0, '1', 2, 'Other', 'N/A', '', '2025-09-05', '0'),
(545, 'P-340228', 'Exoricocid tabs', '', 'Per Tablet', '34', '45', 0, '1', 8, 'Tablet', 'N/A', '', '2021-11-11', '0'),
(546, 'P-3223602', 'Cotton 200grms', '', 'per Item', '75', '200', 0, '1', 2, 'Other', 'N/A', '', '2025-02-01', '0'),
(547, 'P-0099207', 'Crepe Bandage 3', '', 'per Item', '22.0', '40.0', 0, '1', 22, 'Other', 'N/A', '', '2025-04-25', '0'),
(548, 'P-89300803', 'Crepe Bandages 4', '', 'per Item', '35.0', '60.0', 0, '1', 14, 'Other', 'N/A', '', '2025-01-24', '0'),
(549, 'P-325394', 'Crepe Bandages 6', '', 'per Item', '60.0', '100.0', 0, '1', 8, 'Other', 'N/A', '', '2025-08-12', '0'),
(550, 'P-35336422', 'Crepe Bandage 2', '', 'Per Pieces', '20.0', '30.0', 0, '1', 35, 'Other', 'N/A', '', '2026-06-5', '0'),
(551, 'P-0303222', 'Branula', '', 'per Item', '19', '25', 0, '1', 9, 'Other', 'N/A', '', '2025-02-04', '0'),
(552, 'P-22333', 'Glucophage 850mg', '', 'Per Tablet', '9', '15', 0, '1', 93, 'Cream', 'N/A', '', '2024-02-07', '0'),
(553, 'P-323232', 'Giving Set', '', 'per Item', '9.0', '30.0', 0, '1', 8, 'Other', 'N/A', '', '2025-01-09', '0'),
(554, 'P-40862333', 'Glucophage 500mg', '', 'Per Tablet', '8', '10', 0, '1', 164, 'Cream', 'N/A', '', '2024-02-10', '0'),
(555, 'P-0632230', 'Ampiclox 2', '', 'Per Pieces', '588', '800.0', 0, '1', 1, 'syrup', 'N/A', '', '2025-01-14', '0'),
(556, 'P-502230', 'Pregnancy test', '', 'Per Tablet', '12', '50', 0, '1', 256, 'Cream', 'N/A', '', '2023-11-01', '0'),
(557, 'P-22302239', 'Ampiclox Neo', '', 'Per Pieces', '340', '450', 0, '1', 1, 'syrup', 'N/A', '', '2025-04-14', '0'),
(558, 'P-0390226', 'Lonart tabs 120mg', '', 'Per Pieces', '55.0', '150.0', 0, '1', 7, 'Cream', 'N/A', '', '2023-11-01', '0'),
(559, 'P-2336032', 'Lonart tabs 480mg', '', 'Per Tablet', '260', '350', 0, '1', 2, 'Cream', 'N/A', '', '2022-05-01', '0'),
(560, 'P-836233', 'Ridimal 40/320mg', '', 'Per Tablet', '290', '390', 0, '1', 1, 'Tablet', 'N/A', '', '2021-12-01', '0'),
(561, 'P-30002', 'malodar', '', 'Per Pieces', '38.0', '50.0', 0, '1', 2, 'Cream', 'N/A', '', '2024-02-01', '0'),
(562, 'P-3320233', 'Gloves', '', 'Per Pieces', '26.0', '35.0', 0, '1', 197, 'Other', 'N/A', '', '2025-10-01', '0'),
(563, 'P-233642', 'Artequick', '', 'Per Tablet', '526', '700', 0, '1', 2, 'Cream', 'N/A', '', '2023-03-01', '0'),
(564, 'P-009230', 'Mask (black)', '', 'per Item', '4.0', '15.0', 0, '4', 159, 'Other', 'N/A', '', '2025-04-01', '0'),
(565, 'P-0320304', 'Gauze', '', 'Per Pieces', '11', '15', 0, '1', 49, 'Cream', 'N/A', '', '2025-05-01', '0'),
(566, 'P-32939002', 'MEDICLOAMP', '', 'Per Pieces', '95', '150', 0, '1', 1, 'Drops', 'N/A', '', '2022-07-20', '0'),
(567, 'P-27333023', 'Aleze-100(Alloprinol)', '', 'Per Tablet', '8', '10', 0, '1', 30, 'Cream', '', '', '2023-06-01', '0'),
(568, 'P-82230', 'Carbamazpine', '', 'Per Tablet', '0', '0', 0, '1', 0, 'Cream', 'N/A', '', '2023-05-01', '0'),
(569, 'P-9332053', '(23) Syringe', '', 'per Item', '1', '5', 0, '1', 86, 'Injection', 'N/A', '', '2025-11-01', '0'),
(570, 'P-23328337', '(21) Syringe', '', 'per Liter', '1', '5', 0, '1', 94, 'Injection', 'N/A', '', '2028-08-01', '0'),
(571, 'P-2326827', 'Amitaptyline', '', 'Per Tablet', '3', '5', 0, '1', 211, 'Cream', 'N/A', '', '2024-04-01', '0'),
(572, 'P-33003230', 'Duphaston', '', 'Per Tablet', '79', '113', 0, '1', 34, 'Cream', 'N/A', '', '2024-11-01', '0'),
(573, 'P-2200222', 'silent 500', '', 'Per Tablet', '34', '45', 0, '1', 11, 'Cream', 'N/A', '', '2023-06-01', '0'),
(574, 'P-325722', 'clomid', '', 'Per Tablet', '60', '80', 0, '1', 11, 'Cream', 'N/A', '', '2024-09-01', '0'),
(575, 'P-003722', 'Steron', '', 'Per Tablet', '15', '20', 0, '1', 59, 'Cream', 'N/A', '', '2023-12-01', '0'),
(576, 'P-202033', 'Euthyrox 25mg', '', 'Per Tablet', '15', '20', 0, '1', 30, 'Cream', 'N/A', '', '2022-04-01', '0'),
(577, 'P-327323', 'Euthyrox 50mg', '', 'Per Tablet', '11', '15', 0, '1', 58, 'Cream', 'N/A', '', '2022-03-01', '0'),
(578, 'P-62622374', 'Femiplan pills', '', 'Per Tablet', '50.0', '70.0', 0, '1', 6, 'Tablet', 'N/A', '', '', '0'),
(579, 'P-23032233', 'Candid v3', '', 'Per Tablet', '290', '500.0', 0, '1', 3, 'Cream', 'N/A', '', '2023-08-01', '0'),
(580, 'P-33093223', 'Canazol', '', 'Per Tablet', '30', '150', 0, '1', 0, 'Cream', 'N/A', '', '2022-09-01', '0'),
(581, 'P-04380232', 'candid-v6', '', 'Per Tablet', '375', '500', 0, '1', 0, 'Cream', 'N/A', '', '2023-11-01', '0'),
(582, 'P-2632289', 'candid v-1', '', 'Per Pieces', '300.0', '400.0', 0, '1', 1, 'Cream', 'N/A', '', '2023-05-01', '0'),
(583, 'P-243953', 'acyclorir 800mg', '', 'Per Tablet', '0', '0', 0, '1', 10, 'Tablet', 'N/A', '', '2022-04-02', '0'),
(584, 'P-2370082', 'Aradern', '', 'Per Tablet', '125', '180', 0, '1', 3, 'Cream', 'N/A', '', '2022-10-01', '0'),
(585, 'P-42023', 'kotoziral ketocorazol', '', 'Per Tablet', '3', '10', 0, '1', 6, 'Tablet', 'N/A', '', '2023-04-02', '0'),
(586, 'P-8222222', 'cozepam', '', 'Per Pieces', '3.0', '10.0', 0, '1', 1514, 'Cream', 'N/A', '', '2024-04-01', '0'),
(587, 'P-33322330', 'hiv test', '', 'Per Kit', '120.0', '160.0', 0, '1', 12, 'Cream', 'N/A', '', '2023-09-02', '0'),
(588, 'P-522932', 'MRDY', '', 'Per Tablet', '41', '55', 0, '1', 19, 'Tablet', 'N/A', '', '2023-12-02', '0'),
(589, 'P-634204', 'cipro-7', '', 'Per Pieces', '150', '200', 0, '1', 3, 'Tablet', 'N/A', '', '2022-07-02', '0'),
(590, 'P-238052', 'packs secnid DS', '', 'Per Tablet', '75', '100', 0, '1', 6, 'Tablet', 'N/A', '', '2021-11-02', '0'),
(591, 'P-622403', 'taosdirdcip m', '', 'Per Tablet', '5', '10', 0, '1', 30, 'Tablet', 'N/A', '', '2022-09-02', '0'),
(592, 'P-03032330', 'Ecce', '', 'Per Tablet', '28.0', '100.0', 0, '1', 4, 'Cream', 'N/A', '', '2024-02-01', '0'),
(593, 'P-2222922', 'triokit', '', 'Per Pack', '450', '600', 0, '1', 1, 'Tablet', 'N/A', '', '2022-12-02', '0'),
(594, 'P-022029', 'Tamepyn', '', 'Per Tablet', '19.0', '25.0', 0, '1', 175, 'Cream', 'N/A', '', '2023-07-01', '0'),
(595, 'P-27330226', 'Tetracyclin', '', 'Per Tablet', '3', '10', 0, '1', 0, 'Tablet', 'N/A', '', '2022-02-01', '0'),
(596, 'P-37622274', 'Soother', '', 'Per Tablet', '50', '70', 0, '1', 6, 'Cream', 'N/A', '', '', '0'),
(597, 'P-032622', 'dazel kit', '', 'Per Pack', '375', '500', 0, '1', 1, 'Tablet', 'N/A', '', '2022-12-02', '0'),
(598, 'P-3329339', 'Presatan 50mg', '', 'Per Pieces', '15.0', '25.0', 0, '1', 9, 'Cream', 'N/A', '', '2023-01-01', '0'),
(599, 'P-6223222', 'paraflash', '', 'Per Tablet', '17.25', '25', 0, '1', 133, 'Tablet', 'N/A', '', '2022-12-01', '0'),
(600, 'P-3502022', 'Netazox', '', 'Per Pack', '600', '800', 0, '1', 1, 'Tablet', 'N/A', '', '2023-04-02', '0'),
(601, 'P-25002333', 'cataflam drops', '', 'Per Bottle', '690', '900', 0, '1', 2, 'Liquid', 'N/A', '', '2022-07-01', '0'),
(602, 'P-239202', 'P2 (option 2)', '', 'Per Pieces', '30.0', '100.0', 0, '1', 4, 'Tablet', 'N/A', '', '2023-01-01', '0'),
(603, 'P-2335', 'vicks', '', 'per sachet', '170', '200', 0, '1', 0, 'Cream', 'N/A', '', '2022-02-01', '0'),
(604, 'P-0302023', 'fredluco', '', 'Per Pack', '39', '50', 0, '1', 1, 'Cream', 'N/A', '', '2023-12-02', '0'),
(605, 'P-33362', 'Menthoking', '', 'Per Tablet', '7', '15', 0, '1', 88, 'Cream', 'N/A', '', '2023-12-01', '0'),
(606, 'P-24008228', 'loobid', '', 'Per Pack', '375', '500', 0, '1', 0, 'Tablet', 'N/A', '', '2021-12-02', '0'),
(607, 'P-623352', 'Goodmorning', '', 'Per Tablet', '6', '10', 0, '1', 98, 'Cream', 'N/A', '', '2024-02-01', '0'),
(608, 'P-093225', 'trinisky 500', '', 'Per Pack', '38', '50', 0, '1', 7, 'Tablet', 'N/A', '', '2023-09-02', '0'),
(609, 'P-38603', 'trex ', '', 'Per Pack', '38', '50', 0, '1', 1, 'Tablet', 'N/A', '', '2024-01-02', '0'),
(610, 'P-2520332', 'nexiken kit', '', 'Per Pack', '1650', '2400', 0, '1', 1, 'Tablet', 'N/A', '', '2021-11-02', '0'),
(611, 'P-3330332', 'sildenafil 100', '', 'Per Pieces', '45.0', '100.0', 0, '1', 49, 'Tablet', 'N/A', '', '2022-12-02', '0'),
(612, 'P-2333342', 'sildenafil 50', '', 'Per Tablet', '35.0', '50.0', 0, '1', 52, 'Tablet', 'N/A', '', '2022-12-02', '0'),
(613, 'P-33302', 'kamagra oral jelly', '', 'Per Pieces', '71.0', '100.0', 0, '1', 37, 'Other', 'N/A', '', '2023-11-02', '0'),
(614, 'P-2362285', 'kamagra  50', '', 'Per Tablet', '56', '75', 0, '1', 22, 'Tablet', 'N/A', '', '2023-07-02', '0'),
(615, 'P-090223', 'kamagra  100', '', 'Per Tablet', '75', '100', 0, '1', 14, 'Tablet', 'N/A', '', '2023-02-02', '0'),
(616, 'P-0207968', 'microgynon 30', '', 'Per Pieces', '300.0', '400.0', 0, '1', 3, 'Tablet', 'N/A', '', '2022-07-02', '0'),
(617, 'P-22236373', 'microgynon  fe', '', 'Per Pieces', '85', '150', 0, '1', 1, 'Tablet', 'N/A', '', '2022-09-02', '0'),
(618, 'P-33427370', 'candid gel', '', 'Per Pieces', '375', '500', 0, '1', 1, 'Cream', 'N/A', '', '2022-06-02', '0'),
(619, 'P-380207', 'Kaluma Inhaler', '', 'per Item', '25.0', '50.0', 0, '1', 20, 'Inhaler', 'N/A', '', '2023-10-02', '0'),
(620, 'P-0323327', 'P2.', '', 'Per Pieces', '30.0', '200.0', 0, '1', 6, 'Tablet', 'N/A', '', '2024-11-28', '0'),
(621, 'P-423330', 'Zupricin-B', '', 'Per Pieces', '556.0', '800.0', 0, '1', 1, 'Cream', 'N/A', '', '2022-08-01', '0'),
(622, 'P-023633', 'Avas 20', '', 'Per Tablet', '15', '20', 0, '1', 10, 'Tablet', 'N/A', '', '2023-12-01', '0'),
(623, 'P-02329', 'Avex 20', '', 'Per Tablet', '15', '20', 0, '1', 20, 'Cream', 'N/A', '', '2023-12-01', '0'),
(624, 'P-30020230', 'Lorsatas-50', '', 'Per Tablet', '23', '30', 0, '1', 129, 'Tablet', 'N/A', '', '2021-11-22', '0'),
(625, 'P-330403', 'Hydrochlorothiazide', '', 'Per Pack', '3', '5', 0, '1', 100, 'Tablet', 'N/A', '', '2024-05-01', '0'),
(626, 'P-32326333', 'Nepin SR 20', '', 'Per Tablet', '1', '5', 0, '1', 60, 'Tablet', 'N/A', '', '2022-09-01', '0'),
(627, 'P-023500', 'Rustares 20', '', 'Per Tablet', '34', '45', 0, '1', 34, 'Cream', 'N/A', '', '2022-10-01', '0'),
(628, 'P-0600002', 'Teitas 80mg', '', 'Per Tablet', '64', '85', 0, '1', 30, 'Cream', 'N/A', '', '2023-02-01', '0'),
(629, 'P-3233286', 'Amlong 5 mg', '', 'Per Tablet', '13', '25', 0, '1', 20, 'Cream', 'N/A', '', '2023-01-01', '0'),
(630, 'P-72537204', 'Zaart-H', '', 'Per Tablet', '34.0', '45.0', 0, '1', 30, 'Cream', 'N/A', '', '2021-10-01', '0'),
(631, 'P-232826', 'Gripe water', '', 'Per Tablet', '69', '150', 0, '1', 0, 'Cream', 'N/A', '', '2021-09-24', '0'),
(632, 'P-294026', 'lasix', '', 'Per Tablet', '45', '60', 0, '1', 11, 'Cream', 'N/A', '', '2023-01-01', '0'),
(633, 'P-3322302', 'concer 5', '', 'Per Tablet', '30', '40', 0, '1', 23, 'Cream', 'N/A', '', '2024-10-01', '0'),
(634, 'P-230028', 'cadizole 200', '', 'Per Tablet', '185', '250', 0, '1', 6, 'Cream', 'N/A', '', '', '0'),
(635, 'P-2202900', 'ketoconazde', '', 'Per Tablet', '3', '10', 0, '1', 100, 'Cream', 'N/A', '', '2024-04-01', '0'),
(636, 'P-2339302', 'Grisactin-500', '', 'Per Tablet', '11', '15', 0, '1', 108, 'Cream', 'N/A', '', '2023-05-01', '0'),
(637, 'P-2927230', 'Griseofulvin -200', '', 'Per Tablet', '8', '10', 0, '1', 21, 'Tablet', 'N/A', '', '2022-12-01', '0'),
(638, 'P-232232', 'Terbinaforce-250', '', 'Per Tablet', '41', '55', 0, '1', 10, 'Cream', 'N/A', '', '2023-03-01', '0'),
(639, 'P-0566032', 'Acyclovir 200mg', '', 'Per Tablet', '0', '0', 0, '1', 30, 'Cream', 'N/A', '', '2022-10-01', '0'),
(640, 'P-0332232', 'Cyclovax 400mg', '', 'Per Tablet', '30', '40', 0, '1', 10, 'Cream', 'N/A', '', '2024-05-01', '0'),
(641, 'P-933376', 'Amax-10', '', 'Per Tablet', '8', '10', 0, '1', 30, 'Cream', 'N/A', '', '2023-05-01', '0'),
(642, 'P-0730020', 'Evac', '', 'Per Pack', '150', '200', 0, '1', 2, 'Suspension', 'N/A', '', '2023-11-03', '0'),
(643, 'P-9538202', 'Jumbo pampers no:2', '', 'Per Pack', '1220', '1450', 0, '1', 1, 'Sanitary', 'N/A', '', '2023-07-12', '0'),
(644, 'P-2923322', 'Jumbo pampers no 5', '', 'Per Pack', '1220.0', '1450.0', 0, '1', 1, 'Sanitary', 'N/A', '', '2023-04-05', '0'),
(645, 'P-32032', 'Azito suspension', '', 'Per Pack', '95', '150', 0, '1', 4, 'Suspension', 'N/A', '', '2023-12-12', '0'),
(646, 'P-332323', 'Cefiz 400mg', '', 'Per Tablet', '23', '30', 0, '1', 15, 'Tablet', 'N/A', '', '2022-06-22', '0'),
(647, 'P-23632', 'Clevonix 750', '', 'Per Tablet', '113', '150', 0, '1', 7, 'Tablet', 'N/A', '', '2023-04-03', '0'),
(648, 'P-3033308', 'Zinnat tabs', '', 'Per Box', '1250', '1550', 0, '1', 2, 'Tablet', 'N/A', '', '2023-05-18', '0'),
(649, 'P-250324', 'flamox 250', '', 'Per Pieces', '15', '20', 0, '1', 40, 'Tablet', 'N/A', '', '2023-02-02', '0'),
(650, 'P-85333022', 'Nitrofurantoin', '', 'Per Pieces', '8', '10', 0, '1', 38, 'Tablet', 'N/A', '', '2022-12-03', '0'),
(651, 'P-328022', 'Candizole 200', '', 'Per Pieces', '185', '250', 0, '1', 6, 'Tablet', 'N/A', '', '', '0'),
(652, 'P-230033', 'Amlong 10', '', 'Per Pieces', '26', '35', 0, '1', 17, 'Tablet', 'N/A', '', '2023-01-16', '0'),
(653, 'P-38036', 'Vustarel mr', '', 'Per Tablet', '34', '45', 0, '1', 31, 'Tablet', 'N/A', '', '2022-10-03', '0'),
(654, 'P-4703', 'Malafin 500mg', '', 'Per Pieces', '75', '100', 0, '1', 1, 'Tablet', 'N/A', '', '2023-04-27', '0'),
(655, 'P-32803222', 'Glucophage 100mg', '', 'Per Pieces', '0', '0', 0, '1', 76, 'Tablet', 'N/A', '', '2022-01-18', '0'),
(656, 'P-4522932', 'Metrinim 500mg', '', 'Per Pieces', '3', '5', 0, '1', 95, 'Tablet', 'N/A', '', '2023-10-31', '0'),
(657, 'P-280043', 'Deep Heat  15g', '', 'Per Pack', '185', '250', 0, '1', 3, 'Cream', 'N/A', '2023-11-4', '2023-11-4', '0'),
(658, 'P-5302222', 'augmentin 457mg', '', 'Per Bottle', '922', '1300', 0, '1', 4, 'Suspension', 'N/A', '2021-09-3', '2021-09-3', '0'),
(659, 'P-39830', 'piriton yellow', '', 'Per Tablet', '0.1', '2', 0, '1', 0, 'Tablet', 'N/A', '2021-09-3', '2021-09-3', '0'),
(660, 'P-32393', 'steramine', '', 'Per Tablet', '3.0', '10.0', 0, '1', 83, 'Tablet', 'N/A', '2023-09-3', '2023-09-3', '0'),
(661, 'P-3237333', 'amoxil forte', '', 'Per Pieces', '310.0', '450.0', 0, '1', 3, 'Suspension', 'null', '2022-09-5', '2024-04-16', '0'),
(662, 'P-23532738', 'augmentin 228', '', 'Per Bottle', '450.0', '700.0', 0, '1', 3, 'Suspension', 'null', '2021-09-5', '2022-10-5', '0'),
(663, 'P-52287', 'clozole b', '', 'Per Pieces', '69.0', '100.0', 0, '1', 1, 'Cream', 'N/A', '2024-03-5', '2024-03-5', '0'),
(664, 'P-30522203', 'rhinathiol promethazine', '', 'Per Bottle', '353.0', '400.0', 0, '1', 1, 'syrup', 'N/A', '2022-08-5', '2022-08-5', '0'),
(665, 'P-23223220', 'netazox susp', '', 'Per Bottle', '365', '500', 0, '1', 2, 'Suspension', 'N/A', '2022-11-5', '2022-11-5', '0'),
(666, 'P-243032', 'xtraderm', '', 'Per Pieces', '125.0', '200.0', 0, '4', 11, 'Cream', 'null', '2022-09-6', '2022-09-6', '0'),
(667, 'P-28230', 'pulmocef', '', 'Per Box', '250.0', '400.0', 0, '1', 2, 'Tablet', 'null', '2023-06-7', '2023-06-7', '0'),
(668, 'P-023202', 'augmentin 625g', '', 'Per Box', '45.0', '70.0', 0, '1', 7, 'Tablet', 'null', '2023-08-7', '2023-08-7', '0'),
(669, 'P-225332', 'augmentin 1g', '', 'Per Box', '1980.0', '2640.0', 0, '1', 0, 'Tablet', 'null', '2022-08-7', '2022-08-7', '0'),
(670, 'P-22002349', 'clauvlin', '', 'Per Pieces', '68.0', '90.0', 0, '1', 41, 'Tablet', 'null', '2022-02-6', '2022-02-6', '0'),
(671, 'P-393320', 'stud spray', '', 'Per Bottle', '655.0', '900.0', 0, '5', 1, 'Spray', 'null', '2026-02-7', '2026-02-7', '0'),
(672, 'P-2228', 'hitoral shampoo', '', 'Per Pieces', '200', '300', 0, '1', 1, 'Liquid', 'null', '2023-01-7', '2023-01-7', '0'),
(673, 'P-2222909', 'otrivin adult', '', 'Per Pieces', '430.0', '600.0', 0, '1', 3, 'Drops', 'null', '2021-12-7', '2021-12-7', '0'),
(674, 'P-3223020', 'flugone dm 60ml', '', 'Per Bottle', '120.0', '200.0', 0, '4', 4, 'syrup', 'null', '2023-01-8', '2023-01-8', '0'),
(675, 'P-22030306', 'piriclor piriton', '', 'Per Tablet', '1', '2', 0, '4', 142, 'Tablet', 'null', '2023-09-8', '2023-09-8', '0'),
(676, 'P-7322923', 'clere cream', '', 'Per Pieces', '65.0', '100.0', 0, '6', 4, 'Cream', 'null', '2024-03-8', '2024-03-8', '0'),
(677, 'P-282022', 'betapyn', '', 'Per Pack', '320', '500', 0, '1', 0, 'Tablet', 'null', '2023-01-9', '2023-01-9', '0'),
(678, 'P-073080', 'elycort', '', 'Per Pieces', '55.0', '100.0', 0, '4', 3, 'Cream', 'null', '2023-08-16', '2023-08-16', '0'),
(679, 'P-3043330', 'suppositories', '', 'Per Pieces', '13', '40', 0, '4', 17, 'Other', 'null', '2023-09-16', '2023-09-16', '0'),
(680, 'P-3202824', 'immunix', '', 'Per Pieces', '30', '40', 0, '5', 10, 'Tablet', 'null', '2021-10-16', '2021-10-16', '0'),
(681, 'P-52332', 'dafraclav', '', 'Per Bottle', '480', '650', 0, '5', 0, 'Suspension', 'null', '2022-12-16', '2022-12-16', '0'),
(682, 'P-402238', 'bioscab', '', 'Per Bottle', '55.0', '200.0', 0, '1', 6, 'Lotion', 'null', '2024-05-16', '2024-05-16', '0'),
(683, 'P-3223306', 'enterogemina', '', 'Per Pieces', '52', '80', 0, '1', 8, 'Other', 'null', '2022-02-18', '2022-02-18', '0'),
(684, 'P-233030', 'dawacpm 60ml', '', 'Per Pieces', '17', '100', 0, '4', 3, 'Suspension', 'null', '2024-07-18', '2024-07-18', '0'),
(685, 'P-23339', 'seven seas original', '', 'Per Bottle', '395', '700', 0, '1', 2, 'syrup', 'N/A', '2023-03-21', '2023-03-21', '0'),
(686, 'P-39338293', 'emitino', '', 'Per Pieces', '55', '75', 0, '1', 7, 'Tablet', 'null', '2023-05-21', '2023-05-21', '0'),
(687, 'P-505334', 'eflaron100ml', '', 'Per Bottle', '42.0', '100.0', 0, '1', 5, 'Suspension', 'N/A', '2024-02-21', '2024-02-21', '0'),
(688, 'P-087320', 'eflaron 60ml', '', 'Per Bottle', '29', '100', 0, '1', 1, 'Suspension', 'null', '2024-02-21', '2024-02-21', '0'),
(689, 'P-5593258', 'Kortex pads', '', 'Per Pack', '85', '100', 0, '6', 6, 'Sanitary', 'N/A', '2025-10-2', '2025-10-2', '0'),
(690, 'P-40408233', 'defraklav', '', 'Per Bottle', '480', '650', 0, '5', 1, 'Suspension', 'null', '2022-12-29', '2022-12-29', '0'),
(691, 'P-3232220', 'contricet', '', 'Per Bottle', '20', '100', 0, '4', 2, 'Suspension', 'null', '2023-09-29', '2023-09-29', '0'),
(692, 'P-2230207', 'axe', '', 'Per Bottle', '220.0', '350.0', 0, '6', 2, 'Spray', 'N/A', '2023-10-2', '2023-10-2', '0'),
(693, 'P-3266228', 'face milk cleanser', '', 'Per Pieces', '150', '250', 0, '6', 2, 'Other', 'null', '2025-10-2', '2025-10-2', '0'),
(694, 'P-22330084', 'strapping6', '', 'Per Pieces', '155', '250', 0, '1', 2, 'Plaster', 'N/A', '2025-10-4', '2025-10-4', '0'),
(695, 'P-02283220', 'strapping4', '', 'Per Pieces', '100', '150', 0, '1', 2, 'Plaster', 'null', '2024-10-4', '2024-10-4', '0'),
(696, 'P-02325', 'strapping1', '', 'Per Pieces', '30', '50', 0, '1', 1, 'Plaster', 'N/A', '2024-10-5', '2024-10-5', '0'),
(697, 'P-3280', 'strapping 2', '', 'Per Pieces', '55', '100', 0, '1', 1, 'Plaster', 'N/A', '2026-10-5', '2026-10-5', '0'),
(698, 'P-33236320', 'strapping3', '', 'Per Pieces', '80', '150', 0, '1', 1, 'Plaster', 'N/A', '2025-10-5', '2025-10-5', '0'),
(699, 'P-3322220', 'amoklavin bd forte', '', 'Per Pieces', '420.0', '600.0', 0, '1', 3, 'syrup', 'N/A', '2024-07-5', '2024-07-5', '0'),
(700, 'P-5323', 'candistat 200mg', '', 'Per Pieces', '59', '200', 0, '1', 3, 'Pessaries', 'N/A', '2024-02-5', '2024-02-5', '0'),
(701, 'P-82003530', 'clotrine', '', 'Per Pieces', '55', '250', 0, '1', 2, 'Pessaries', 'null', '2023-10-5', '2023-10-5', '0'),
(702, 'P-2072', 'enapril encardil', '', 'Per Pieces', '2', '5', 0, '1', 100, 'Tablet', 'N/A', '2024-01-5', '2024-01-5', '0'),
(703, 'P-03283623', 'rhinathiol infant', '', 'Per Pieces', '445.0', '600.0', 0, '1', 1, 'Suspension', 'N/A', '2022-07-5', '2022-07-5', '0'),
(704, 'P-627', 'sabulin 100', '', 'Per Pieces', '33', '100', 0, '1', 1, 'Suspension', 'N/A', '2022-09-5', '2022-09-5', '0'),
(705, 'P-32020', 'abz susp', '', 'Per Pieces', '35.0', '50.0', 0, '1', 31, 'Suspension', 'N/A', '2024-10-5', '2024-10-5', '0'),
(706, 'P-22223293', 'emmittino', '', 'Per Box', '51', '65', 0, '1', 10, 'Tablet', 'null', '2025-10-6', '2025-10-6', '0'),
(707, 'P-22203230', 'flazine', '', 'Per Pieces', '26', '100', 0, '1', 2, 'Cream', 'N/A', '2023-12-14', '2023-12-14', '0'),
(708, 'P-32203237', 'zinnat', '', 'Per Pieces', '720', '950', 0, '1', 1, 'Suspension', 'N/A', '2023-02-14', '2023-02-14', '0'),
(709, 'P-633032', 'jotonol', '', 'Per Pieces', '30', '100', 0, '1', 1, 'Suspension', 'N/A', '2024-02-14', '2024-02-14', '0'),
(710, 'P-037223', 'micropore', '', 'Per Pieces', '120', '200', 0, '5', 1, 'Plaster', 'N/A', '2026-10-15', '2026-10-15', '0'),
(711, 'P-28232', 'sensodyne repair & protect', '', 'Per Pieces', '450', '600', 0, '6', 2, 'Cream', 'N/A', '2023-10-20', '2023-10-20', '0'),
(712, 'P-2763225', 'neurobine forte', '', 'Per Pieces', '15.0', '25.0', 0, '1', 8, 'Other', 'N/A', '2023-10-20', '2023-10-20', '0'),
(713, 'P-0302086', 'rinacet', '', 'Per Pack', '22.0', '100.0', 0, '1', 1, 'Suspension', 'N/A', '2024-06-22', '2024-06-22', '0'),
(714, 'P-3000222', 'amoklavin finemox', '', 'Per Pieces', '88', '300', 0, '1', 2, 'Capsule', 'null', '2023-02-8', '2023-02-8', '0'),
(715, 'P-3287324', 'azithromycin', '', 'Per Pieces', '43', '200', 0, '1', 16, 'Tablet', 'null', '2024-05-8', '2024-05-8', '0'),
(716, 'P-062004', 'piricet ', '', 'Per Pieces', '30', '100', 0, '1', 2, 'Suspension', 'N/A', '2024-07-8', '2024-07-8', '0'),
(717, 'P-22233799', 'Durex condom', '', 'Per Pieces', '250', '400', 0, '1', 2, 'Other', 'N/A', '2021-11-8', '2021-11-8', '0'),
(718, 'P-722323', 'erostin 10mg', '', 'Per Pieces', '40', '55', 0, '5', 0, 'Tablet', 'null', '2026-11-18', '2026-11-18', '0'),
(719, 'P-200982', 'vickd vapour rub', '', 'Per Pieces', '150', '200', 0, '6', 6, 'Ointment', 'null', '2023-12-1', '2023-12-1', '0'),
(720, 'P-6553332', 'chlorhexidine gel 10grm', '', 'Per Pieces', '55', '100', 0, '1', 1, 'Ointment', 'N/A', '2023-12-1', '2023-12-1', '0'),
(721, 'P-324533', 'azogyl metronidazole', '', 'Per Pieces', '30', '100', 0, '4', 2, 'Suspension', 'null', '2023-12-1', '2023-12-1', '0'),
(722, 'P-32302', 'jotonol', '', 'Per Pieces', '30', '100', 0, '4', 2, 'Suspension', 'null', '2023-12-1', '2023-12-1', '0'),
(723, 'P-7630233', 'cefuroxime 50ml', '', 'Per Bottle', '160', '300', 0, '1', 1, 'Suspension', 'N/A', '2023-09-1', '2023-09-1', '0'),
(724, 'P-38283', 'cefuroxime 100ml', '', 'Per Pieces', '300', '450', 0, '4', 1, 'Suspension', 'null', '2024-07-1', '2024-07-1', '0'),
(725, 'P-0230372', 'dacoff', '', 'Per Pieces', '100', '250', 0, '1', 3, 'syrup', 'N/A', '2023-12-1', '2023-12-1', '0'),
(726, 'P-393723', 'lotem', '', 'Per Pieces', '326', '450', 0, '1', 1, 'syrup', 'null', '2022-12-2', '2022-12-2', '0');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `transaction_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `date_order` varchar(100) NOT NULL,
  `suplier` varchar(100) NOT NULL,
  `date_deliver` varchar(100) NOT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `qty` varchar(30) DEFAULT NULL,
  `cost` varchar(30) NOT NULL DEFAULT '0',
  `payment_status` varchar(25) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `receipt_number` varchar(250) NOT NULL,
  `due_date` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`transaction_id`, `invoice_number`, `date_order`, `suplier`, `date_deliver`, `p_name`, `qty`, `cost`, `payment_status`, `remark`, `receipt_number`, `due_date`) VALUES
(1, 'PO-N79K2H2J', '', '3', '2021-08-12', NULL, NULL, '0', 'Complete', NULL, 'mab133', 'null'),
(2, 'PO-0203OJ3A', '', '11', '2021-08-24', NULL, NULL, '0', 'Pending', NULL, 'kkkk. ', '2021-09-30'),
(3, 'PO-T220RB2R', '', '1', '2021-09-20', NULL, NULL, '0', 'Complete', NULL, 'xcjcjc', 'null'),
(4, 'PO-DT343L03', '', '1', '2022-05-19', NULL, NULL, '0', 'Complete', NULL, 'xfxtcy', '2022-11-1'),
(5, 'PO-V2222FX3', '', '1', '2022-10-25', NULL, NULL, '0', 'Complete', NULL, 'cbhd', '2024-12-1');

-- --------------------------------------------------------

--
-- Table structure for table `purchases_item`
--

CREATE TABLE `purchases_item` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `status` varchar(25) NOT NULL,
  `date` varchar(25) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `tax` varchar(250) NOT NULL,
  `discount` varchar(250) NOT NULL,
  `total_cost` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchases_item`
--

INSERT INTO `purchases_item` (`id`, `name`, `qty`, `cost`, `invoice`, `status`, `date`, `remark`, `tax`, `discount`, `total_cost`) VALUES
(1, 'P-23252', 1, '55.0', 'PO-N79K2H2J', 'Received', '08/13/2021', NULL, '0', '0', '55'),
(2, 'P-0662303', 1, '150.0', 'PO-UF202639', 'Received', '08/20/2021', NULL, '0', '0', '150'),
(3, 'P-07230029', 5, '4000.0', 'PO-0203OJ3A', 'Received', '08/24/2021', NULL, '0', '0', '20000'),
(4, 'P-222843', 1, '18.4', 'PO-T220RB2R', 'Received', '09/18/2021', NULL, '0', '0', '18.4'),
(5, 'P-2272227', 1, '1.0', 'PO-T220RB2R', 'Received', '09/18/2021', NULL, '0', '0', '1'),
(6, 'P-2272227', 10, '1.0', 'PO-DT343L03', 'Received', '05/18/2022', NULL, '0', '0', '10'),
(7, 'P-05433223', 1, '7.0', 'PO-DT343L03', 'Received', '05/18/2022', NULL, '0', '0', '7'),
(9, 'P-8220670', 1, '188.0', 'PO-2S023RA3', 'Received', '08/11/2022', NULL, '0', '0', '188'),
(10, 'P-009230', 1, '4.0', 'PO-I5DN0OCR', 'Received', '08/11/2022', NULL, '0', '0', '4'),
(11, 'P-9332053', 10, '1.0', 'PO-V2222FX3', 'Received', '10/25/2022', NULL, '0', '0', '10'),
(12, 'P-222843', 1, '18.4', 'PO-05UP3Z03', 'Received', '12/18/2022', NULL, '0', '0', '18.4'),
(13, 'P-30300306', 1, '90.0', 'PO-05UP3Z03', 'Received', '12/18/2022', NULL, '0', '0', '90');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `transaction_id` int(11) NOT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `cashier` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `due_date` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `balance` varchar(100) NOT NULL DEFAULT '0',
  `total_amount` varchar(30) NOT NULL DEFAULT '0',
  `cash` varchar(100) DEFAULT NULL,
  `month` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL,
  `p_amount` varchar(30) NOT NULL DEFAULT '0',
  `vat` varchar(30) NOT NULL,
  `time` varchar(100) NOT NULL,
  `mobile_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`transaction_id`, `invoice_number`, `cashier`, `date`, `type`, `amount`, `due_date`, `name`, `balance`, `total_amount`, `cash`, `month`, `year`, `p_amount`, `vat`, `time`, `mobile_number`) VALUES
(1, 'RS-20ET33SB', 'dennis', '01/25/2023', 'cash', '100.0', NULL, 'null', '0', '0', 'null', 'January', '2023', '100.0', '0', '08:49:am', NULL),
(2, 'RS-2G265M2L', 'dennis', '01/25/2023', 'mpesa', '5.0', NULL, 'null', '0', '0', 'mpesa', 'January', '2023', '5.0', '0', '08:50:am', '254701602300');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `transaction_id` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `discount` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `brand` varchar(250) NOT NULL,
  `date` varchar(25) NOT NULL,
  `omonth` varchar(25) NOT NULL,
  `oyear` varchar(25) NOT NULL,
  `qtyleft` varchar(25) NOT NULL,
  `dname` varchar(50) NOT NULL,
  `vat` varchar(20) NOT NULL,
  `expiry` varchar(100) NOT NULL,
  `total_amount` varchar(30) NOT NULL,
  `total_cost` varchar(100) NOT NULL,
  `vat_value` varchar(250) NOT NULL DEFAULT '0',
  `commission_value` varchar(250) NOT NULL DEFAULT '0',
  `discount_value` varchar(250) NOT NULL DEFAULT '0',
  `cost_value` varchar(250) NOT NULL DEFAULT '0',
  `product_id` int(250) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`transaction_id`, `invoice`, `product`, `qty`, `amount`, `name`, `price`, `discount`, `category`, `brand`, `date`, `omonth`, `oyear`, `qtyleft`, `dname`, `vat`, `expiry`, `total_amount`, `total_cost`, `vat_value`, `commission_value`, `discount_value`, `cost_value`, `product_id`) VALUES
(1, 'RS-20ET33SB', 'P-05433223', '10', '100', 'Action tabs', '10', '0', 'Tablet', 'N/A', '01/25/2023', 'January', '2023', '16', '', '0', '2022-05-23', '100', '70', '0', '0', '0', '7.0', 124),
(2, 'RS-2G265M2L', 'P-9332053', '1', '5', '(23) Syringe', '5', '0', 'Injection', 'N/A', '01/25/2023', 'January', '2023', '86', '', '0', '2025-11-01', '5', '1', '0', '0', '0', '1', 569);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supliers`
--

CREATE TABLE `supliers` (
  `suplier_id` int(11) NOT NULL,
  `suplier_name` varchar(100) NOT NULL,
  `suplier_address` varchar(100) NOT NULL,
  `suplier_contact` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `status` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supliers`
--

INSERT INTO `supliers` (`suplier_id`, `suplier_name`, `suplier_address`, `suplier_contact`, `contact_person`, `status`) VALUES
(1, 'philmed limited', 'mombasa', '0745209112', 'Dorothy ', 1),
(4, 'Costaris', 'mombasa', '0115595765', 'costaris ', 1),
(5, 'Shifa Chem', 'mombasa', '0718876993', 'Janet', 0),
(6, 'Zed Wholesalers', 'mombasa', '0791287646', 'Zed Wholesalers ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `token` varchar(250) NOT NULL,
  `business_code` varchar(50) NOT NULL,
  `business_name` varchar(250) NOT NULL,
  `business_type` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `position`, `secret`, `email`, `mobile`, `token`, `business_code`, `business_name`, `business_type`) VALUES
(1, 'dele', 'b8e36850775d1b29c1c2273a259f5216', 'Dennis', 'Admin', 'system2020', 'demo.@gmail.com', '0700107838', 'a7d0e9b099adcd6a4f8a02e2067f8769fdcf5fd2dd7201d6ee1fa4611c6a55955798e48b89bd54d14772a69c1ac15fd6528d2fb60c887a1ee10456251fb8ceb6', 'C-27433250', 'Dele Tech', 'POS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `lose`
--
ALTER TABLE `lose`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `purchases_item`
--
ALTER TABLE `purchases_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supliers`
--
ALTER TABLE `supliers`
  ADD PRIMARY KEY (`suplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `cashier_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `service_id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `lose`
--
ALTER TABLE `lose`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=727;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchases_item`
--
ALTER TABLE `purchases_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supliers`
--
ALTER TABLE `supliers`
  MODIFY `suplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
