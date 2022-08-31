-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2022 at 02:07 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_resets_table', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(29, '2022_08_25_100907_create_orders_table', 1),
(30, '2022_08_25_101318_create_order_details_table', 1),
(31, '2022_08_25_101341_create_toppings_table', 1),
(32, '2022_08_25_101359_create_topping_items_table', 1),
(33, '2022_08_26_115523_add_total_toppings_column_in_order_details', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `created_at`, `updated_at`) VALUES
(1, 3343, '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(2, 3344, '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(11, 33436, '2022-08-25 22:29:16', '2022-08-25 22:29:16'),
(14, 334366, '2022-08-25 22:30:11', '2022-08-25 22:30:11'),
(16, 3156465, '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(17, 111, '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(18, 13123, '2022-08-25 23:00:32', '2022-08-25 23:00:32'),
(19, 234234, '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(20, 123, '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(21, 3433, '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(22, 45454, '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(23, 34343, '2022-08-26 02:30:08', '2022-08-26 02:30:08'),
(24, 16464, '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(25, 234234324, '2022-08-26 02:41:20', '2022-08-26 02:41:20'),
(26, 35345345, '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(27, 34543, '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(28, 34542, '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(29, 55435, '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(30, 43544, '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(31, 45344, '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(32, 435435, '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(33, 435345, '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(34, 5345345, '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(35, 22323, '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(38, 343433, '2022-08-26 04:02:35', '2022-08-26 04:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `pizza_number` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crust` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_toppings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `pizza_number`, `type`, `crust`, `size`, `created_at`, `updated_at`, `total_toppings`) VALUES
(1, 1, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 18:45:05', '2022-08-25 18:45:05', NULL),
(2, 1, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 18:45:05', '2022-08-25 18:45:05', NULL),
(3, 2, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 19:30:10', '2022-08-25 19:30:10', NULL),
(4, 2, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 19:30:10', '2022-08-25 19:30:10', NULL),
(5, 11, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 22:29:16', '2022-08-25 22:29:16', NULL),
(6, 11, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 22:29:17', '2022-08-25 22:29:17', NULL),
(7, 14, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 22:30:11', '2022-08-25 22:30:11', NULL),
(8, 14, 2, 'Hawaiian', 'deep dish', 'medium', '2022-08-25 22:30:12', '2022-08-25 22:30:12', NULL),
(9, 16, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 22:58:07', '2022-08-25 22:58:07', NULL),
(10, 16, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 22:58:07', '2022-08-25 22:58:07', NULL),
(11, 17, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 22:59:28', '2022-08-25 22:59:28', NULL),
(12, 17, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 22:59:28', '2022-08-25 22:59:28', NULL),
(13, 18, 1, 'NYF', 'hand-tossed', 'large', '2022-08-25 23:00:32', '2022-08-25 23:00:32', NULL),
(14, 18, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 23:00:32', '2022-08-25 23:00:32', NULL),
(15, 19, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 23:54:04', '2022-08-25 23:54:04', NULL),
(16, 19, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 23:54:04', '2022-08-25 23:54:04', NULL),
(17, 20, 1, 'custom', 'hand-tossed', 'large', '2022-08-25 23:54:28', '2022-08-25 23:54:28', NULL),
(18, 20, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-25 23:54:28', '2022-08-25 23:54:28', NULL),
(19, 21, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 00:04:41', '2022-08-26 00:04:41', NULL),
(20, 21, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 00:04:41', '2022-08-26 00:04:41', NULL),
(21, 22, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:20:45', '2022-08-26 02:20:45', NULL),
(22, 22, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:20:45', '2022-08-26 02:20:45', NULL),
(23, 23, 1, 'Chicken Fajita', 'hand-tossed', 'large', '2022-08-26 02:30:08', '2022-08-26 02:30:08', NULL),
(24, 23, 2, 'Hawaiian', 'deep dish', 'medium', '2022-08-26 02:30:08', '2022-08-26 02:30:08', NULL),
(25, 24, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:40:40', '2022-08-26 02:40:40', NULL),
(26, 24, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:40:40', '2022-08-26 02:40:40', NULL),
(27, 25, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:41:20', '2022-08-26 02:41:20', NULL),
(28, 25, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:41:21', '2022-08-26 02:41:21', NULL),
(29, 26, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:45:30', '2022-08-26 02:45:30', NULL),
(30, 26, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:45:30', '2022-08-26 02:45:30', NULL),
(31, 27, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:54:27', '2022-08-26 02:54:27', NULL),
(32, 27, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:54:27', '2022-08-26 02:54:27', NULL),
(33, 28, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:56:15', '2022-08-26 02:56:15', NULL),
(34, 28, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:56:15', '2022-08-26 02:56:15', NULL),
(35, 29, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 02:58:42', '2022-08-26 02:58:42', NULL),
(36, 29, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 02:58:42', '2022-08-26 02:58:42', NULL),
(37, 30, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 03:02:41', '2022-08-26 03:02:41', NULL),
(38, 30, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 03:02:41', '2022-08-26 03:02:41', NULL),
(39, 31, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 03:02:52', '2022-08-26 03:02:52', NULL),
(40, 31, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 03:02:52', '2022-08-26 03:02:52', NULL),
(41, 32, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 03:03:34', '2022-08-26 03:03:34', NULL),
(42, 32, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 03:03:34', '2022-08-26 03:03:34', NULL),
(43, 33, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 03:08:01', '2022-08-26 03:08:01', NULL),
(44, 33, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 03:08:01', '2022-08-26 03:08:01', NULL),
(45, 34, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 03:10:51', '2022-08-26 03:10:51', NULL),
(46, 34, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 03:10:51', '2022-08-26 03:10:51', NULL),
(47, 35, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 03:11:59', '2022-08-26 03:11:59', NULL),
(48, 35, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 03:11:59', '2022-08-26 03:11:59', NULL),
(49, 35, 3, 'Manhattan Meat Lover', 'thin', 'small', '2022-08-26 03:11:59', '2022-08-26 03:11:59', NULL),
(50, 38, 1, 'custom', 'hand-tossed', 'large', '2022-08-26 04:02:35', '2022-08-26 04:02:35', 4),
(51, 38, 2, 'pepperoni feast', 'deep dish', 'medium', '2022-08-26 04:02:35', '2022-08-26 04:02:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `toppings`
--

CREATE TABLE `toppings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_detail_id` bigint(20) UNSIGNED NOT NULL,
  `topping_number` int(11) NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `toppings`
--

INSERT INTO `toppings` (`id`, `order_detail_id`, `topping_number`, `area`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Whole', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(2, 1, 1, 'First-Half', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(3, 1, 2, 'Second-Half', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(4, 3, 0, 'Whole', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(5, 3, 1, 'First-Half', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(6, 3, 2, 'Second-Half', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(7, 5, 0, 'Whole', '2022-08-25 22:29:16', '2022-08-25 22:29:16'),
(8, 5, 1, 'First-Half', '2022-08-25 22:29:17', '2022-08-25 22:29:17'),
(9, 5, 2, 'Second-Half', '2022-08-25 22:29:17', '2022-08-25 22:29:17'),
(10, 7, 0, 'Whole', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(11, 7, 1, 'First-Half', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(12, 7, 2, 'Second-Half', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(13, 9, 0, 'Whole', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(14, 9, 1, 'First-Half', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(15, 9, 2, 'Second-Half', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(16, 11, 0, 'Whole', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(17, 11, 1, 'First-Half', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(18, 11, 2, 'Second-Half', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(19, 15, 0, 'Whole', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(20, 15, 1, 'First-Half', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(21, 15, 2, 'Second-Half', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(22, 17, 0, 'Whole', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(23, 17, 1, 'First-Half', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(24, 17, 2, 'Second-Half', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(25, 19, 0, 'Whole', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(26, 19, 1, 'First-Half', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(27, 19, 2, 'Second-Half', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(28, 21, 0, 'Whole', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(29, 21, 1, 'First-Half', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(30, 21, 2, 'Second-Half', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(31, 25, 0, 'Whole', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(32, 25, 1, 'First-Half', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(33, 25, 2, 'Second-Half', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(34, 27, 0, 'Whole', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(35, 27, 1, 'First-Half', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(36, 27, 2, 'Second-Half', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(37, 29, 0, 'Whole', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(38, 29, 1, 'First-Half', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(39, 29, 2, 'Second-Half', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(40, 31, 0, 'Whole', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(41, 31, 1, 'First-Half', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(42, 31, 2, 'Second-Half', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(43, 33, 0, 'Whole', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(44, 33, 1, 'First-Half', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(45, 33, 2, 'Second-Half', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(46, 35, 0, 'Whole', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(47, 35, 1, 'First-Half', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(48, 35, 2, 'Second-Half', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(49, 37, 0, 'Whole', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(50, 37, 1, 'First-Half', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(51, 37, 2, 'Second-Half', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(52, 39, 0, 'Whole', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(53, 39, 1, 'First-Half', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(54, 39, 2, 'Second-Half', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(55, 41, 0, 'Whole', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(56, 41, 1, 'First-Half', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(57, 41, 2, 'Second-Half', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(58, 43, 0, 'Whole', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(59, 43, 1, 'First-Half', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(60, 43, 2, 'Second-Half', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(61, 45, 0, 'Whole', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(62, 45, 1, 'First-Half', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(63, 45, 2, 'Second-Half', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(64, 47, 0, 'Whole', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(65, 47, 1, 'First-Half', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(66, 47, 2, 'Second-Half', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(67, 50, 0, 'Whole', '2022-08-26 04:02:35', '2022-08-26 04:02:35'),
(68, 50, 1, 'First-Half', '2022-08-26 04:02:35', '2022-08-26 04:02:35'),
(69, 50, 2, 'Second-Half', '2022-08-26 04:02:35', '2022-08-26 04:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `topping_items`
--

CREATE TABLE `topping_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `topping_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topping_items`
--

INSERT INTO `topping_items` (`id`, `topping_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'pepperoni', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(2, 1, 'extra cheese', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(3, 2, 'sausage', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(4, 3, 'mushrooms', '2022-08-25 18:45:05', '2022-08-25 18:45:05'),
(5, 4, 'pepperoni', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(6, 4, 'extra cheese', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(7, 5, 'sausage', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(8, 6, 'mushrooms', '2022-08-25 19:30:10', '2022-08-25 19:30:10'),
(9, 7, 'pepperoni', '2022-08-25 22:29:17', '2022-08-25 22:29:17'),
(10, 7, 'extra cheese', '2022-08-25 22:29:17', '2022-08-25 22:29:17'),
(11, 8, 'sausage', '2022-08-25 22:29:17', '2022-08-25 22:29:17'),
(12, 9, 'mushrooms', '2022-08-25 22:29:17', '2022-08-25 22:29:17'),
(13, 10, 'pepperoni', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(14, 10, 'extra cheese', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(15, 11, 'sausage', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(16, 12, 'mushrooms', '2022-08-25 22:30:12', '2022-08-25 22:30:12'),
(17, 13, 'pepperoni', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(18, 13, 'extra cheese', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(19, 14, 'sausage', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(20, 15, 'mushrooms', '2022-08-25 22:58:07', '2022-08-25 22:58:07'),
(21, 16, 'pepperoni', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(22, 16, 'extra cheese', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(23, 17, 'sausage', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(24, 18, 'mushrooms', '2022-08-25 22:59:28', '2022-08-25 22:59:28'),
(25, 19, 'pepperoni', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(26, 19, 'extra cheese', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(27, 20, 'sausage', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(28, 21, 'mushrooms', '2022-08-25 23:54:04', '2022-08-25 23:54:04'),
(29, 22, 'pepperoni', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(30, 22, 'extra cheese', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(31, 23, 'sausage', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(32, 24, 'mushrooms', '2022-08-25 23:54:28', '2022-08-25 23:54:28'),
(33, 25, 'pepperoni', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(34, 25, 'extra cheese', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(35, 26, 'sausage', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(36, 27, 'mushrooms', '2022-08-26 00:04:41', '2022-08-26 00:04:41'),
(37, 28, 'pepperoni', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(38, 28, 'extra cheese', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(39, 29, 'sausage', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(40, 30, 'mushrooms', '2022-08-26 02:20:45', '2022-08-26 02:20:45'),
(41, 31, 'pepperoni', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(42, 31, 'extra cheese', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(43, 32, 'sausage', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(44, 33, 'mushrooms', '2022-08-26 02:40:40', '2022-08-26 02:40:40'),
(45, 34, 'pepperoni', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(46, 34, 'extra cheese', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(47, 35, 'sausage', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(48, 36, 'mushrooms', '2022-08-26 02:41:21', '2022-08-26 02:41:21'),
(49, 37, 'pepperoni', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(50, 37, 'extra cheese', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(51, 38, 'sausage', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(52, 39, 'mushrooms', '2022-08-26 02:45:30', '2022-08-26 02:45:30'),
(53, 40, 'pepperoni', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(54, 40, 'extra cheese', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(55, 41, 'sausage', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(56, 42, 'mushrooms', '2022-08-26 02:54:27', '2022-08-26 02:54:27'),
(57, 43, 'pepperoni', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(58, 43, 'extra cheese', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(59, 44, 'sausage', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(60, 45, 'mushrooms', '2022-08-26 02:56:15', '2022-08-26 02:56:15'),
(61, 46, 'pepperoni', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(62, 46, 'extra cheese', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(63, 47, 'sausage', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(64, 48, 'mushrooms', '2022-08-26 02:58:42', '2022-08-26 02:58:42'),
(65, 49, 'pepperoni', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(66, 49, 'extra cheese', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(67, 50, 'sausage', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(68, 51, 'mushrooms', '2022-08-26 03:02:41', '2022-08-26 03:02:41'),
(69, 52, 'pepperoni', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(70, 52, 'extra cheese', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(71, 53, 'sausage', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(72, 54, 'mushrooms', '2022-08-26 03:02:52', '2022-08-26 03:02:52'),
(73, 55, 'pepperoni', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(74, 55, 'extra cheese', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(75, 56, 'sausage', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(76, 57, 'mushrooms', '2022-08-26 03:03:34', '2022-08-26 03:03:34'),
(77, 58, 'pepperoni', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(78, 58, 'extra cheese', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(79, 59, 'sausage', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(80, 60, 'mushrooms', '2022-08-26 03:08:01', '2022-08-26 03:08:01'),
(81, 61, 'pepperoni', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(82, 61, 'extra cheese', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(83, 62, 'sausage', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(84, 63, 'mushrooms', '2022-08-26 03:10:51', '2022-08-26 03:10:51'),
(85, 64, 'pepperoni', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(86, 64, 'extra cheese', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(87, 65, 'sausage', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(88, 66, 'mushrooms', '2022-08-26 03:11:59', '2022-08-26 03:11:59'),
(89, 67, 'pepperoni', '2022-08-26 04:02:35', '2022-08-26 04:02:35'),
(90, 67, 'extra cheese', '2022-08-26 04:02:35', '2022-08-26 04:02:35'),
(91, 68, 'sausage', '2022-08-26 04:02:35', '2022-08-26 04:02:35'),
(92, 69, 'mushrooms', '2022-08-26 04:02:35', '2022-08-26 04:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `toppings`
--
ALTER TABLE `toppings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topping_items`
--
ALTER TABLE `topping_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `toppings`
--
ALTER TABLE `toppings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `topping_items`
--
ALTER TABLE `topping_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
