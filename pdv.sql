-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10-Jul-2020 às 22:07
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdv`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'Bebidas', 'fe71884b38b50fd00b18d3fb2305dc9f.jpg'),
(2, 'G02', 'Alimentos', '29170e7ecbb92b9a35bdfab60757617b.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,2) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_combo_items`
--

INSERT INTO `tec_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `price`, `cost`) VALUES
(5, 18, '03', '1.0000', NULL, NULL),
(6, 18, '02', '1.0000', NULL, NULL),
(7, 18, '0015', '1.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Cliente Padrão', '9999999999', '99999999', '012345678', 'cliente@pdvparatodos.com.br'),
(2, 'Rafael Thomas Flores de Souza', '0000000000', '000000000', '(18) 99818-9919', 'contato.rafaelthomas@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,2) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_expenses`
--

INSERT INTO `tec_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`) VALUES
(1, '2015-11-02 13:52:00', 'Frete da Empada', '5.00', '', '1', NULL),
(2, '2016-01-25 23:22:00', 'batata', '2.00', '', '1', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,2) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,2) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,2) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,2) DEFAULT '0.00',
  `pos_balance` decimal(25,2) DEFAULT '0.00',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`) VALUES
(1, '2015-11-02 13:47:00', 1, 1, NULL, 'CC', '', '', '', '', '', 'Visa', '4.00', NULL, 1, NULL, '', '0.00', '0.00', '', '', NULL, NULL),
(2, '2015-11-03 12:43:13', 2, 1, NULL, 'cash', '', '', '', '', '', '', '16.00', NULL, 1, NULL, '', '20.00', '4.00', '', NULL, NULL, NULL),
(3, '2015-12-12 19:10:09', 4, 1, NULL, 'cash', '', '', '', '', '', '', '10.99', NULL, 2, NULL, '', '50.00', '39.01', '', NULL, NULL, NULL),
(4, '2015-12-12 19:13:40', 5, 1, NULL, 'cash', '', '', '', '', '', '', '32.97', NULL, 2, NULL, '', '70.00', '37.03', '', NULL, NULL, NULL),
(5, '2016-01-22 17:29:59', 6, 1, NULL, 'cash', '', '', '', '', '', '', '20.00', NULL, 1, NULL, '', '20.00', '0.00', '', NULL, NULL, NULL),
(6, '2016-01-25 23:15:47', 7, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '10.00', '6.00', '', NULL, NULL, NULL),
(7, '2016-01-25 23:50:55', 8, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '10.00', '6.00', '', NULL, NULL, NULL),
(8, '2016-01-25 23:54:16', 10, 1, NULL, 'cash', '', '', '', '', '', '', '6.00', NULL, 1, NULL, '', '50.00', '44.00', '', NULL, NULL, NULL),
(9, '2016-01-26 00:00:29', 11, 1, NULL, 'cash', '', '', '', '', '', '', '4.00', NULL, 1, NULL, '', '4.00', '6.00', '', NULL, NULL, NULL),
(10, '2016-01-26 00:02:46', 12, 1, NULL, 'cash', '', '', '', '', '', '', '7.00', NULL, 1, NULL, '', '10.00', '3.00', '', NULL, NULL, NULL),
(11, '2016-01-26 00:04:10', 13, 1, NULL, 'cash', '', '', '', '', '', '', '2.00', NULL, 1, NULL, '', '5.00', '3.00', '', NULL, NULL, NULL),
(12, '2016-01-26 00:04:47', 14, 1, NULL, 'cash', '', '', '', '', '', '', '8.00', NULL, 1, NULL, '', '10.00', '2.00', '', NULL, NULL, NULL),
(13, '2016-01-26 00:11:13', 15, 1, NULL, 'cash', '', '', '', '', '', '', '24.00', NULL, 1, NULL, '', '50.00', '26.00', '', NULL, NULL, NULL),
(14, '2016-02-01 05:03:58', 16, 1, NULL, 'cash', '', '', '', '', '', '', '6.00', NULL, 1, NULL, '', '50.00', '44.00', '', NULL, NULL, NULL),
(15, '2020-07-10 14:06:38', 18, 2, NULL, 'cash', '', '', '', '', '', '', '2.00', NULL, 2, NULL, '', '10.00', '8.00', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,2) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,2) DEFAULT '0.00',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(1, '0001', 'Hambúrguer', 2, '2.00', '99ba81363ddbfe5a92c93023e1fd550a.jpg', '0', '4.00', 0, '3.00', 'code39', 'standard', 'Hamburguer com P?o de Hamburguer, queijo, carne, presunto e salada', '5.00'),
(2, '0002', 'Mixto Quente', 2, '1.00', '3ba18844e23b27e8224f8fa6b1752208.jpg', '0', '3.00', 0, '9.00', 'code39', 'standard', '', '5.00'),
(3, '0003', 'Cahorro Quente', 2, '2.00', '573bc5101fabefd864960416b1752899.jpg', '0', '3.00', 0, '7.00', 'code39', 'standard', '', '5.00'),
(4, '0004', 'Bolo de Chocolate', 2, '2.00', '8ad58758122f3a886e859def53da6a6a.jpg', '0', '3.00', 0, '9.00', 'code39', 'standard', '', '5.00'),
(5, '0005', 'Coxinha de Frango', 2, '2.00', 'd3115abf501ce492bdf449f72f185fb1.jpg', '0', '3.00', 0, '10.00', 'code39', 'standard', '', '5.00'),
(6, '0006', 'Empada', 2, '2.00', '76fed631b7861010869172aa83d78e0a.jpg', '0', '3.00', 0, '19.00', 'code39', 'standard', '', '5.00'),
(7, '0007', 'Monteiro Lopes', 2, '2.00', '3274477f5b7d3ef257c4562c56ef387e.jpg', '0', '3.00', 0, '10.00', 'code39', 'standard', '', '5.00'),
(8, '0008', 'Risole de Carne', 2, '2.00', '32a3ac97716a9dc68812aecbaf11840a.jpg', '0', '4.00', 0, '8.00', 'code39', 'standard', '', '5.00'),
(9, '0009', 'Coxinha de Caranguejo', 2, '4.00', '8bd5b89b645b1bc2d4d08816b5ad3d0b.jpg', '0', '6.00', 0, '8.00', 'code39', 'standard', '', '5.00'),
(10, '0010', 'Coxinha de Camarão', 2, '4.00', '272825062f261b126f1996ed099b4b87.jpg', '0', '6.00', 0, '8.00', 'code39', 'standard', '', '5.00'),
(11, '0011', 'Sonho', 2, '2.00', '1f56837339171226e7e33eb0c5e8eae0.jpg', '0', '3.00', 0, '8.00', 'code39', 'standard', '', '5.00'),
(12, '0012', 'Lasanha', 2, '6.00', 'fd1c25461a5fbb0597c68bb78100c6ec.jpg', '0', '9.00', 0, '10.00', 'code39', 'standard', '', '5.00'),
(13, '0013', 'Torta de Chocolate', 2, '3.00', '11fcdf61a2d8c2d6b7c3e9c0a6996a54.jpg', '0', '6.00', 0, '10.00', 'code39', 'standard', '', '5.00'),
(14, '0014', 'Fanta Laranja Lata', 1, '2.00', 'f0ed23add960528f5da95d8fb2a8a106.jpg', '0', '4.00', 0, '10.00', 'code39', 'standard', '', '5.00'),
(15, '0015', 'Coca-Cola Lata', 1, '2.00', 'd1ae8344e2fdfc3fcd80a96bb1f00240.jpg', '0', '4.00', 0, '-3.00', 'code39', 'standard', '', '5.00'),
(16, '0016', 'Água Mineral', 1, '2.00', '91b3bcff369f45e167c3544bad752912.jpg', '0', '3.00', 0, '9.00', 'code39', 'standard', '', '5.00'),
(17, '0017', 'Suco de Laranja', 1, '4.00', 'f4cab501731cb47389a6c1a9a54cf736.jpg', '0', '6.00', 0, '7.00', 'code39', 'standard', '', '5.00'),
(18, '01', 'Combo M', 2, '10.99', 'no_image.png', '5', '8.71', 0, '0.00', 'code39', 'combo', '', '0.00'),
(19, '02', 'Batata M', 2, '7.99', 'no_image.png', '0', '4.72', 0, '0.00', 'code39', 'standard', '', '0.00'),
(20, '03', 'Cobertura Cheddar', 2, '1.00', 'no_image.png', '0', '0.27', 0, '0.00', 'code39', 'standard', '', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_purchases`
--

INSERT INTO `tec_purchases` (`id`, `reference`, `date`, `note`, `total`, `attachment`, `supplier_id`, `received`) VALUES
(1, '', '2015-11-02 13:51:00', '', '30.00', NULL, NULL, NULL),
(2, '', '2016-01-25 23:19:00', '', '40.00', NULL, NULL, NULL),
(3, '', '2016-01-26 00:09:00', '', '40.00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `cost` decimal(25,2) NOT NULL,
  `subtotal` decimal(25,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_purchase_items`
--

INSERT INTO `tec_purchase_items` (`id`, `purchase_id`, `product_id`, `quantity`, `cost`, `subtotal`) VALUES
(1, 1, 6, '10.00', '3.00', '30.00'),
(2, 2, 14, '10.00', '4.00', '40.00'),
(3, 3, 1, '10.00', '4.00', '40.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,2) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,2) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2015-11-02 12:39:22', 1, '0.00', 'close', '0.00', 0, 1, '0.00', 0, 1, '', '2015-11-02 13:49:29', NULL, 1),
(2, '2015-11-02 14:00:24', 1, '0.00', 'close', '36.00', 0, 0, '36.00', 0, 0, '', '2016-01-25 23:11:28', NULL, 1),
(3, '2015-12-12 18:59:48', 2, '50.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2016-01-25 23:12:25', 1, '0.00', 'close', '2.00', 0, 0, '2.00', 0, 0, '', '2016-01-25 23:28:28', '0', 1),
(5, '2016-01-25 23:46:53', 1, '0.00', 'close', '0.00', 0, 0, '0.00', 0, 0, '', '2016-01-25 23:48:44', NULL, 1),
(6, '2016-01-25 23:50:22', 1, '100.00', 'close', '110.00', 0, 0, '110.00', 0, 0, '', '2016-01-25 23:56:02', NULL, 1),
(7, '2016-01-25 23:59:31', 1, '100.00', 'close', '104.00', 0, 0, '104.00', 0, 0, '', '2016-01-26 00:01:16', NULL, 1),
(8, '2016-01-26 00:01:58', 1, '100.00', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `product_discount` decimal(25,2) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,2) DEFAULT NULL,
  `total_discount` decimal(25,2) DEFAULT NULL,
  `product_tax` decimal(25,2) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,2) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`) VALUES
(1, '2015-11-02 11:42:47', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, 1, '2015-11-02 11:47:25', '', 'paid', '0.00'),
(2, '2015-11-03 10:43:13', 1, 'Cliente Padr?o', '16.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '16.00', 5, '6.00', '16.00', 1, NULL, NULL, '', 'paid', '0.00'),
(3, '2015-12-12 17:08:16', 1, 'Cliente Padr?o', '10.47', '0.00', NULL, '0.00', '0.00', '0.52', '0%', '0.00', '0.52', '10.99', 1, '1.00', '0.00', 2, NULL, NULL, '', 'due', '0.00'),
(4, '2015-12-12 17:10:09', 1, 'Cliente Padr?o', '10.99', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '10.99', 3, '3.00', '10.99', 2, NULL, NULL, '', 'paid', '0.00'),
(5, '2015-12-12 17:13:40', 1, 'Cliente Padr?o', '31.41', '0.00', NULL, '0.00', '0.00', '1.56', '0%', '0.00', '1.56', '32.97', 1, '3.00', '32.97', 2, NULL, NULL, '', 'paid', '0.00'),
(6, '2016-01-22 15:29:59', 1, 'Cliente Padr?o', '20.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '20.00', 6, '8.00', '20.00', 1, NULL, NULL, '', 'paid', '0.00'),
(7, '2016-01-25 21:15:47', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, NULL, NULL, '', 'paid', '0.00'),
(8, '2016-01-25 21:50:55', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, NULL, NULL, '', 'paid', '0.00'),
(9, '2016-01-25 21:52:35', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 3, '3.00', '6.00', 1, NULL, NULL, '', 'paid', '0.00'),
(10, '2016-01-25 21:54:16', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 3, '3.00', '6.00', 1, NULL, NULL, '', 'paid', '0.00'),
(11, '2016-01-25 22:00:29', 1, 'Cliente Padr?o', '4.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '4.00', 2, '2.00', '4.00', 1, NULL, NULL, '', 'paid', '0.00'),
(12, '2016-01-25 22:02:46', 1, 'Cliente Padr?o', '7.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '7.00', 3, '3.00', '7.00', 1, NULL, NULL, '', 'paid', '0.00'),
(13, '2016-01-25 22:04:10', 1, 'Cliente Padr?o', '2.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '2.00', 1, '1.00', '2.00', 1, NULL, NULL, '', 'paid', '0.00'),
(14, '2016-01-25 22:04:47', 1, 'Cliente Padr?o', '8.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '8.00', 3, '3.00', '8.00', 1, NULL, NULL, '', 'paid', '0.00'),
(15, '2016-01-25 22:11:13', 1, 'Cliente Padr?o', '24.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '24.00', 1, '12.00', '24.00', 1, NULL, NULL, '', 'paid', '0.00'),
(16, '2016-02-01 02:03:58', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 2, '2.00', '6.00', 1, NULL, NULL, '', 'paid', '0.00'),
(17, '2020-07-10 10:45:56', 1, 'Cliente Padrão', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 2, '3.00', '0.00', 2, NULL, NULL, '', 'due', '0.00'),
(18, '2020-07-10 11:06:38', 2, 'Rafael Thomas Flores de Souza', '2.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '2.00', 1, '1.00', '2.00', 2, NULL, NULL, '', 'paid', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `net_unit_price` decimal(25,2) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,2) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,2) DEFAULT NULL,
  `subtotal` decimal(25,2) NOT NULL,
  `real_unit_price` decimal(25,2) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`) VALUES
(3, 1, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(4, 1, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(5, 2, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(6, 2, 3, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(7, 2, 9, '2.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '8.00', '4.00', '6.00'),
(8, 2, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(9, 2, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(10, 3, 18, '1.00', '10.99', '10.47', '0', '0.00', 5, '0.52', '10.99', '10.99', '8.71'),
(11, 4, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(12, 4, 19, '1.00', '7.99', '7.99', '0', '0.00', 0, '0.00', '7.99', '7.99', '4.72'),
(13, 4, 20, '1.00', '1.00', '1.00', '0', '0.00', 0, '0.00', '1.00', '1.00', '0.27'),
(14, 5, 18, '3.00', '10.99', '10.47', '0', '0.00', 5, '1.56', '32.97', '10.99', '8.71'),
(15, 6, 6, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(16, 6, 10, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(17, 6, 11, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(18, 6, 14, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(19, 6, 15, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(20, 6, 17, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(21, 7, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(22, 7, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(23, 8, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(24, 8, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(25, 9, 4, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(26, 9, 8, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(27, 9, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(28, 10, 8, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(29, 10, 11, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(30, 10, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(31, 11, 3, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(32, 11, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(33, 12, 1, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(34, 12, 2, '1.00', '1.00', '1.00', '0', '0.00', 0, '0.00', '1.00', '1.00', '3.00'),
(35, 12, 17, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(36, 13, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(37, 14, 10, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(38, 14, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(39, 14, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00'),
(40, 15, 1, '12.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '24.00', '2.00', '4.00'),
(41, 16, 16, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(42, 16, 17, '1.00', '4.00', '4.00', '0', '0.00', 0, '0.00', '4.00', '4.00', '6.00'),
(43, 17, 3, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '3.00'),
(44, 17, 15, '2.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '4.00', '2.00', '4.00'),
(45, 18, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00', '4.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0353961dce6eeed1bf13f8e12ae52dbdc177b344', '::1', 1594384626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338343632363b),
('07adc459ba0c732c077735a462c1830e2a9e4e7f', '::1', 1594410830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343431303536323b),
('198513ee53a0b421637703647aeedb241fa4c736', '::1', 1594385475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338353230323b),
('2b3574527a960a08903b18a4a57f4475425fb9e6', '::1', 1594381622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338313439333b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333234383733223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('4aee182acb2723e9c18de9a382126d562b0eedd4', '::1', 1594411402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343431313233343b6964656e746974797c733a32313a2272657374617572616e746540676d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a32313a2272657374617572616e746540676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343131323033223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('64c82171eba137e9ce2a2d7b1a356039d50a0c72', '::1', 1594385511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338353530363b),
('6d2a1b17d0aef47843eb32f019865e100de2637c', '::1', 1594390168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343339303136303b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333832303739223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('a43f11fbc1482e7a8ae1f42878d03089c6c6a4f3', '::1', 1594388964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338383538383b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333832303739223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('b3f7948f8ef5b32f50c3370ee2c03b1efb9d1207', '::1', 1594398233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343339383233333b),
('b4bb29cb7a165d2522ac3ff4c9a73bdaecf8e1cf', '::1', 1594391546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343339313534363b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333832303739223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('cbfcaeef137a7ae19d55d090cd3e23e8ff591f3a', '::1', 1594384403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338323036373b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333831363231223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('ea3e5a5bb5cc57d111456b22c6320a1fef3c68e4', '::1', 1594389998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338393730363b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333832303739223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b726d73706f737c693a313b6d6573736167657c733a32363a2256656e646120656665747561646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('f251170e92e0c9604ab0eb03d5c1106c02c272ef', '::1', 1594391152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343339303836373b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333832303739223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b),
('f9c79efa9683ed7c806e315725c39ee22cb4e90c', '::1', 1594386435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343338363230343b6964656e746974797c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365726e616d657c733a383a2276656e6465646f72223b656d61696c7c733a33333a22706f6e746f6469676974616c70726f6772616d617340686f746d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a383a2276656e6465646f72223b6c6173745f6e616d657c733a333a22706476223b637265617465645f6f6e7c733a32323a2231322f31322f323031352031323a33393a323720414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934333832303739223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a353a2235302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031352d31322d31322031353a35393a3438223b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) NOT NULL,
  `footer` varchar(1000) NOT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) NOT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`) VALUES
(1, 'logo1.png', 'Marmitaria', '+55 18 99720-7134', 'd/m/Y', 'h:i:s A', 'pontodigitalprogramas@hotmail.com', 'portugues', '4.0', 'default', 'Amercia/Belem', 'mail', 'pop.gmail.com', 'geraldopatricio.melo@gmail.com', '', '25', '', 0, 0, NULL, 'REA', 1, '0%', 10, 30, '<h2><strong>CUPIM DOURADO</strong></h2>\r\n       Rua Honorio Oliveira Camargo Jr, 508 - Pedro Perri<br>\r\n                                                                                              CEP 16026-340, Araçatuba-SP<br>', 'Volte Sempre!\r\n<br>', 3, 0, 1, '0', 1, '', 100, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 0, '2122', 1, 'sk_test_jHf4cEzAYtgcXvgWPCsQAn50', 'pk_test_beat8SWPORb0OVdF2H77A7uG', 'ff2400d9-f3aa-4db5-9dc5-4eee236c6254', 'patriciomelo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Fornecedor Padr?o', '1', '2', '0123456789', 'fornecedor@pdvparatodos.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `net_unit_price` decimal(25,2) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,2) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,2) DEFAULT NULL,
  `subtotal` decimal(25,2) NOT NULL,
  `real_unit_price` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_suspended_items`
--

INSERT INTO `tec_suspended_items` (`id`, `suspend_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`) VALUES
(9, 4, 14, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00'),
(10, 4, 15, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00'),
(11, 4, 16, '1.00', '2.00', '2.00', '0', '0.00', 0, '0.00', '2.00', '2.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `product_discount` decimal(25,2) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,2) DEFAULT NULL,
  `total_discount` decimal(25,2) DEFAULT NULL,
  `product_tax` decimal(25,2) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,2) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_suspended_sales`
--

INSERT INTO `tec_suspended_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `hold_ref`) VALUES
(4, '2016-02-01 02:03:37', 1, 'Cliente Padr?o', '6.00', '0.00', NULL, '0.00', '0.00', '0.00', '0%', '0.00', '0.00', '6.00', 3, '3.00', '0.00', 1, NULL, NULL, '', '01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`) VALUES
(1, 0x3a3a31, 0x3132372e302e302e31, 'admin', '0944ac2da688d44e978d579d44111909ea560c4d', NULL, 'temdetudoprogramas@hotmail.com', NULL, NULL, NULL, NULL, 1435204774, 1454302937, 1, 'Tem de Tudo', 'Programas', 'Tecdiary', '55  75 99189-4547', 'geraldo.png', 'male', 1),
(2, 0x3a3a31, 0x3138372e3131362e3233312e313231, 'vendedor', 'c9c7537a1fe1275298d2e2df08426ee51513bb9f', NULL, 'restaurante@gmail.com', NULL, NULL, NULL, NULL, 1449891567, 1594411402, 1, 'vendedor', 'pdv', NULL, '999', NULL, 'male', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 12:33:39'),
(2, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 12:53:18'),
(3, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 13:15:21'),
(4, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 13:15:30'),
(5, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:20:35'),
(6, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:30:36'),
(7, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:31:22'),
(8, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2015-11-03 12:34:44'),
(9, 1, NULL, 0x3137372e3134352e352e313135, 'geraldopatricio.melo@gmail.com', '2015-11-11 20:38:46'),
(10, 1, NULL, 0x3230302e3232322e32312e313338, 'geraldopatricio.melo@gmail.com', '2015-11-25 10:45:05'),
(11, 1, NULL, 0x3138372e3131362e3233312e313231, 'geraldopatricio.melo@gmail.com', '2015-12-12 03:37:53'),
(12, 2, NULL, 0x3138372e3131342e39302e3834, 'pdv@pdvparatodos.com.br', '2015-12-12 19:59:25'),
(13, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-16 13:56:15'),
(14, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-21 16:22:16'),
(15, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-21 19:06:56'),
(16, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-22 14:44:26'),
(17, 1, NULL, 0x3137372e3137322e31362e323232, 'geraldopatricio.melo@gmail.com', '2016-01-22 15:06:16'),
(18, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-22 18:29:43'),
(19, 1, NULL, 0x3137372e3137322e31362e323232, 'geraldopatricio.melo@gmail.com', '2016-01-22 22:51:12'),
(20, 1, NULL, 0x3139312e3139352e3235302e3333, 'geraldopatricio.melo@gmail.com', '2016-01-25 23:15:36'),
(21, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:11:10'),
(22, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:11:52'),
(23, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:49:37'),
(24, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:49:56'),
(25, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:59:18'),
(26, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 01:01:39'),
(27, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-02-01 04:39:25'),
(28, 2, NULL, 0x3a3a31, 'pontodigitalprogramas@hotmail.com', '2016-02-01 04:58:54'),
(29, 1, NULL, 0x3a3a31, 'temdetudoprogramas@hotmail.com', '2016-02-01 05:02:17'),
(30, 2, NULL, 0x3a3a31, 'pontodigitalprogramas@hotmail.com', '2020-07-09 20:01:13'),
(31, 2, NULL, 0x3a3a31, 'pontodigitalprogramas@hotmail.com', '2020-07-10 11:47:01'),
(32, 2, NULL, 0x3a3a31, 'pontodigitalprogramas@hotmail.com', '2020-07-10 11:54:39'),
(33, 2, NULL, 0x3a3a31, 'pontodigitalprogramas@hotmail.com', '2020-07-10 13:03:24'),
(34, 2, NULL, 0x3a3a31, 'pontodigitalprogramas@hotmail.com', '2020-07-10 19:55:49'),
(35, 2, NULL, 0x3a3a31, 'restaurante@gmail.com', '2020-07-10 20:00:04'),
(36, 2, NULL, 0x3a3a31, 'restaurante@gmail.com', '2020-07-10 20:03:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
