-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2019 at 01:37 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_christian_dangl_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charge_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(10) UNSIGNED NOT NULL,
  `fk_model_id` int(10) UNSIGNED NOT NULL,
  `construction_year` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` enum('E','C','I','P') NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `zip_code` int(10) NOT NULL,
  `city` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `title` enum('Mr.','Ms.') NOT NULL,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `tel_no` varchar(55) NOT NULL,
  `email_address` varchar(55) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house_no` varchar(55) NOT NULL,
  `fk_zip_code` int(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `driving_licence_no` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `extra_id` int(10) UNSIGNED NOT NULL,
  `extra` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_options`
--

CREATE TABLE `insurance_options` (
  `insurance_option_id` int(10) UNSIGNED NOT NULL,
  `insurance_option` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house_no` varchar(55) NOT NULL,
  `fk_zip_code` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

CREATE TABLE `makes` (
  `make_id` int(10) UNSIGNED NOT NULL,
  `make` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(55) NOT NULL,
  `fk_make_id` int(10) UNSIGNED NOT NULL,
  `fk_category_id` enum('E','C','I','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(10) UNSIGNED NOT NULL,
  `online_reservation_timestamp` timestamp NULL DEFAULT NULL,
  `fk_location_start` int(10) NOT NULL,
  `fk_location_end` int(10) NOT NULL,
  `datetime_start` datetime NOT NULL,
  `datetime_end` datetime NOT NULL,
  `fk_car_id` int(10) UNSIGNED NOT NULL,
  `fk_customer_id` int(10) UNSIGNED NOT NULL,
  `fk_insurance_option_id` int(10) UNSIGNED NOT NULL,
  `fk_invoice_id` int(10) UNSIGNED NOT NULL,
  `fk_additional_charge_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservations_extras`
--

CREATE TABLE `reservations_extras` (
  `reservation_extra_id` int(10) UNSIGNED NOT NULL,
  `fk_reservation_id` int(10) UNSIGNED NOT NULL,
  `fk_extra_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charge_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_model_id` (`fk_model_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`zip_code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_zip_code` (`fk_zip_code`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`extra_id`);

--
-- Indexes for table `insurance_options`
--
ALTER TABLE `insurance_options`
  ADD PRIMARY KEY (`insurance_option_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_zip_code` (`fk_zip_code`);

--
-- Indexes for table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`make_id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_make_id` (`fk_make_id`),
  ADD KEY `fk_category_id` (`fk_category_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_location_start` (`fk_location_start`),
  ADD KEY `fk_location_end` (`fk_location_end`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_additional_charge_id` (`fk_additional_charge_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_insurance_option_id` (`fk_insurance_option_id`);

--
-- Indexes for table `reservations_extras`
--
ALTER TABLE `reservations_extras`
  ADD PRIMARY KEY (`reservation_extra_id`),
  ADD KEY `reservations_extras_ibfk_1` (`fk_reservation_id`),
  ADD KEY `locations_ibfk_2` (`fk_extra_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `additional_charge_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `extra_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurance_options`
--
ALTER TABLE `insurance_options`
  MODIFY `insurance_option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `makes`
--
ALTER TABLE `makes`
  MODIFY `make_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `model_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations_extras`
--
ALTER TABLE `reservations_extras`
  MODIFY `reservation_extra_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_model_id`) REFERENCES `models` (`model_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`fk_zip_code`) REFERENCES `cities` (`zip_code`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`fk_zip_code`) REFERENCES `cities` (`zip_code`);

--
-- Constraints for table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`fk_make_id`) REFERENCES `makes` (`make_id`),
  ADD CONSTRAINT `models_ibfk_2` FOREIGN KEY (`fk_category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`fk_location_start`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`fk_location_end`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `reservations_ibfk_4` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoices` (`invoice_id`),
  ADD CONSTRAINT `reservations_ibfk_5` FOREIGN KEY (`fk_additional_charge_id`) REFERENCES `additional_charges` (`additional_charge_id`),
  ADD CONSTRAINT `reservations_ibfk_6` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `reservations_ibfk_7` FOREIGN KEY (`fk_insurance_option_id`) REFERENCES `insurance_options` (`insurance_option_id`);

--
-- Constraints for table `reservations_extras`
--
ALTER TABLE `reservations_extras`
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`fk_extra_id`) REFERENCES `extras` (`extra_id`),
  ADD CONSTRAINT `reservations_extras_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservations` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
