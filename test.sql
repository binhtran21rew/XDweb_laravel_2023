-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 09:29 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(19, 'SamSung', 0, 'samsung', 0, '2023-03-20 01:23:54', '2023-03-20 01:23:54'),
(20, 'Samsung Galaxy Z Flip4 512GB', 19, 'samsung-galaxy-z-flip4-512gb', 0, '2023-03-20 01:24:11', '2023-03-20 01:24:11'),
(21, 'SamSung Galaxy', 19, 'samsung-galaxy', 0, '2023-03-20 01:24:24', '2023-03-20 01:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_02_23_031704_create_categories_table', 2),
(7, '2023_02_24_092255_create_products_table', 3),
(9, '2023_02_24_101836_add_image_to_product_table', 4),
(10, '2023_03_06_223628_create_carts_table', 5),
(11, '2023_03_11_135153_create_orders_table', 6),
(12, '2023_03_11_135753_create_orderitems_table', 6),
(13, '2023_03_11_144730_create_orders_table', 7),
(14, '2023_03_11_144850_create_orderitems_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(21, 47, 14, 1, 36500000, '2023-03-20 08:07:32', '2023-03-20 08:07:32'),
(20, 46, 12, 1, 29000000, '2023-03-20 08:06:40', '2023-03-20 08:06:40'),
(19, 45, 12, 1, 29000000, '2023-03-20 08:05:57', '2023-03-20 08:05:57'),
(18, 42, 11, 1, 32500000, '2023-03-20 08:03:23', '2023-03-20 08:03:23'),
(17, 41, 12, 1, 29000000, '2023-03-20 08:02:02', '2023-03-20 08:02:02'),
(16, 39, 14, 1, 36500000, '2023-03-20 08:00:40', '2023-03-20 08:00:40'),
(15, 38, 12, 1, 29000000, '2023-03-20 03:51:55', '2023-03-20 03:51:55'),
(14, 37, 11, 1, 32500000, '2023-03-20 03:46:48', '2023-03-20 03:46:48'),
(13, 37, 12, 1, 29000000, '2023-03-20 03:46:48', '2023-03-20 03:46:48'),
(12, 36, 12, 1, 29000000, '2023-03-20 02:50:48', '2023-03-20 02:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `email`, `address`, `city`, `state`, `zipcode`, `payment_id`, `payment_mode`, `tracking_no`, `status`, `remark`, `created_at`, `updated_at`) VALUES
(47, 7, 'hgf', 'gfh', 'fgh', 'fgh', 'fg', 'hgfh', 'gfh', 'fgh', NULL, 'cod', 'BKShop8815', '0', NULL, '2023-03-20 08:07:32', '2023-03-20 08:07:32'),
(46, 7, 'gfd', 'gfdg', 'fdg', 'dfg', 'fdg', 'fdg', 'dfg', 'fdg', NULL, 'cod', 'BKShop6033', '0', NULL, '2023-03-20 08:06:40', '2023-03-20 08:06:40'),
(44, 7, 'test', 'test', 'test', 'binh@gmail.com', 'test', 'test', 'test', 'test', NULL, 'cod', 'BKShop2309', '0', NULL, '2023-03-20 08:04:02', '2023-03-20 08:04:02'),
(45, 7, 'jgh', 'hjg', 'hgj', 'ghj', 'hgj', 'hgj', 'hgj', 'ghj', NULL, 'cod', 'BKShop9075', '0', NULL, '2023-03-20 08:05:57', '2023-03-20 08:05:57'),
(43, 7, 'test', 'test', 'test', 'binh@gmail.com', 'test', 'test', 'test', 'test', NULL, 'cod', 'BKShop9821', '0', NULL, '2023-03-20 08:03:59', '2023-03-20 08:03:59'),
(42, 7, 'test', 'test', 'test', 'binh@gmail.com', 'test', 'test', 'test', 'test', NULL, 'cod', 'BKShop9869', '0', NULL, '2023-03-20 08:03:23', '2023-03-20 08:03:23'),
(41, 7, 'gfd', 'fdg', 'fdg', 'dfg', 'dfg', 'dfg', 'fdg', 'dfg', '0TK75351567807613', 'Paid by Paypal', 'BKShop6636', '0', NULL, '2023-03-20 08:02:02', '2023-03-20 08:02:02'),
(40, 7, 'binh', 'tran', '123', '123', '123', '123', '123', '123', NULL, 'cod', 'BKShop5022', '0', NULL, '2023-03-20 08:00:46', '2023-03-20 08:00:46'),
(39, 7, 'binh', 'tran', '123', '123', '123', '123', '123', '123', NULL, 'cod', 'BKShop9754', '0', NULL, '2023-03-20 08:00:40', '2023-03-20 08:00:40'),
(38, 7, 'binh', 'tran', 'asd', 'asd@gmail.com', 'asd', 'asd', 'asd', 'asd', NULL, 'cod', 'BKShop2754', '0', NULL, '2023-03-20 03:51:55', '2023-03-20 03:51:55'),
(37, 7, 'binh', 'tran', '123', 'binh@gmail.com', '123', '123', '123', '123', '54K44615T24690151', 'Paid by Paypal', 'BKShop1643', '0', NULL, '2023-03-20 03:46:48', '2023-03-20 03:46:48'),
(36, 7, 'binh', 'tran', '123123', 'binh@gmail.com', '123', 'Ho Chi Minh', '123', '123', '93U48771CS338570X', 'Paid by Paypal', 'BKShop6412', '0', NULL, '2023-03-20 02:50:48', '2023-03-20 02:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'xuan@gmail.comsdf_Token', '4a0b561f85f32976f494fd59dad10c5c7ae19fe8a133a3a834ea63abe34d6f26', '[\"*\"]', NULL, NULL, '2023-02-22 04:14:18', '2023-02-22 04:14:18'),
(2, 'App\\Models\\User', 3, 'xuan1@gmail.comsdf_Token', '218838185c000238da0f642a176ea1f926cafd1a9db5963464b51d7f293b0e42', '[\"*\"]', NULL, NULL, '2023-02-22 04:31:04', '2023-02-22 04:31:04'),
(3, 'App\\Models\\User', 4, 'sf_Token', '788f11aba39ee1e9ba13a2797a88bd7420ec284ad7b2e88c236cb2cdebf4a044', '[\"*\"]', NULL, NULL, '2023-02-22 04:34:46', '2023-02-22 04:34:46'),
(4, 'App\\Models\\User', 5, '1_Token', '8f6143a6c55b229839a1630b22a2a1aef1a434a18c1dc86ef2220d07fecc208a', '[\"*\"]', NULL, NULL, '2023-02-22 04:35:16', '2023-02-22 04:35:16'),
(47, 'App\\Models\\User', 7, 'admin123@gmail.com_AdminToken', 'e05db8a0e86bb9d9e0dc8032280b18e4223bcd38d707bb70f62f94ab0f05fd3c', '[\"server:admin\"]', '2023-03-20 08:17:20', NULL, '2023-03-20 05:37:42', '2023-03-20 08:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `slug`, `brand`, `color`, `description`, `seller_price`, `origin_price`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(11, 20, 'Samsung Galaxy Z Flip4 512GB', 'uploads/product/1679300703.jpg', 'samsung-galaxy-z-flip4-512gb', 'SamSung', 'Black', 'Samsung Galaxy Z Flip4 512GB', '32500000', '34000000', '97', '0', '2023-03-20 01:25:03', '2023-03-20 08:03:23'),
(12, 21, 'SamSung galaxy 12', 'uploads/product/1679300747.jpg', 'samsung-galaxy-12', 'Samsung Galaxy', 'black', 'SamSung galaxy 12', '29000000', '30000000', '93', '0', '2023-03-20 01:25:47', '2023-03-20 08:06:40'),
(13, 20, 'Samsung', 'uploads/product/1679312622.jpg', 'samsung', 'Samsung', 'White', 'Samsung Galaxy Z Flip4 512GB', '34500000', '36000000', '100', '0', '2023-03-20 04:43:42', '2023-03-20 04:43:42'),
(14, 21, 'Samsung Galaxy Z Flip4', 'uploads/product/1679312665.jpg', 'samsung-galaxy-z-flip4', 'Samsung', 'Gray', 'Samsung Galaxy Z Flip4', '36500000', '38000000', '98', '0', '2023-03-20 04:44:25', '2023-03-20 08:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giam gia X-max 65%', 'sieu giam gia mua X-max', 'uploads/slider/1678525868.png', 0, NULL, NULL),
(2, 'Sale cuoi nam 50%', 'Sale cuoi nam 50%', 'uploads/slider/1678525903.jpg', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_as` int(11) NOT NULL DEFAULT 0 COMMENT '0=guest, 1=admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_as`) VALUES
(1, 'xuan123', 'xuan@gmail.comsdf', NULL, '$2y$10$fJrNOlyJWHp9Qdga/s1Kpu6zlev6rwTjLJdyiXRqH01Tu2sY.2jzW', NULL, '2023-02-22 04:14:18', '2023-02-22 04:14:18', 0),
(3, 'xuan123', 'xuan1@gmail.comsdf', NULL, '$2y$10$qdp1A7lb9OVrQQrVavl5DOvHNCmIvFrI/Y81CXhMrqiGs3K7r3R0u', NULL, '2023-02-22 04:31:04', '2023-02-22 04:31:04', 0),
(4, 'fdsf', 'sf', NULL, '$2y$10$uRSWeS4IKCg7GPBI.k6tVu6RBcGe5jcpJ0IoWDhNZSHBQlhS9kEk.', NULL, '2023-02-22 04:34:46', '2023-02-22 04:34:46', 0),
(5, 'xuan123', '1', NULL, '$2y$10$mBvBxxBbZAIxWw7Il62auet7HNbmeV3KamObKAtqIJ9VaTbytNWOa', NULL, '2023-02-22 04:35:16', '2023-02-22 04:35:16', 0),
(6, 'admin', 'admin@gmail.com', NULL, '$2y$10$Bufxj9PL/N9AOO.x3dkvF.yjOXovfUyR4DKgW.cW8G2K.AbLeK1b2', NULL, '2023-02-22 04:49:45', '2023-02-22 04:49:45', 0),
(7, 'admin', 'admin123@gmail.com', NULL, '$2y$10$hGPnywrNcYzcrpuKooN5xOw8pNNkuwkHyg5VI4LOoMXoPGU2o68qm', NULL, '2023-02-22 04:50:38', '2023-02-22 04:50:38', 1),
(8, 'binh', 'binh@gmail.com', NULL, '$2y$10$eV/y7cmwlrr.12GsxZHiIO1YH5L/rAE1bVWNBoihx8Q6IBFQibAUy', NULL, '2023-02-22 18:18:57', '2023-02-22 18:18:57', 0),
(9, 'asd', 'asd@gmail.com', NULL, '$2y$10$GGAJl0ezsRZB0cY8MwhQfuVtayVsElrsLS8Eukks12QLdzupKKgF2', NULL, '2023-03-05 01:51:23', '2023-03-05 01:51:23', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
