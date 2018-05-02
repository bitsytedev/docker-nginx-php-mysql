-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 30, 2018 at 05:02 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enterprise_resource_mgt`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Human Resource', 'hr', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Programming', 'programming', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `salary_type` enum('hourly','weekly','monthly') DEFAULT NULL,
  `salary_amount` float DEFAULT NULL,
  `salary_starting_date` date DEFAULT NULL,
  `file_id` varchar(250) DEFAULT NULL,
  `file_cv` varchar(250) DEFAULT NULL,
  `file_proof_of_residence` varchar(250) DEFAULT NULL,
  `account_type` enum('checking','saving') DEFAULT NULL,
  `account_number` varchar(250) NOT NULL,
  `routing_number` varchar(250) DEFAULT NULL,
  `clabe` varchar(250) DEFAULT NULL,
  `area_code` varchar(250) DEFAULT NULL,
  `employment_ending_reason` varchar(250) DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `last_working_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `user_id`, `salary_type`, `salary_amount`, `salary_starting_date`, `file_id`, `file_cv`, `file_proof_of_residence`, `account_type`, `account_number`, `routing_number`, `clabe`, `area_code`, `employment_ending_reason`, `notice_date`, `last_working_date`) VALUES
(2, 7, 'weekly', 1500, '2018-03-07', '5109ae1c0582a5e6e02bb269bd82e12d.pdf', 'b186d3ce5a2a241911147d7c2d6a0a09.jpg', '02fd2e282550fec104739fef8e06ad35.jpg', 'saving', '78788778 update', '454545 update', '121212 update', '3333 update', 'why update', NULL, NULL),
(3, 8, 'weekly', 1200, '2018-03-30', '', '', '', '', '', '', '', '', '', NULL, NULL),
(4, 9, 'weekly', 1100, '2018-03-30', '', '', '', '', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notification_type_id` int(11) DEFAULT NULL,
  `user_role_relation_id` int(11) NOT NULL,
  `url_arguments` varchar(250) DEFAULT NULL,
  `message` text,
  `is_read` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE `notification_types` (
  `id` int(11) NOT NULL,
  `code` enum('create_project') DEFAULT NULL,
  `url` text,
  `icon` varchar(50) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_types`
--

INSERT INTO `notification_types` (`id`, `code`, `url`, `icon`, `target`) VALUES
(1, 'create_project', 'project/project_detailo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `gateway` enum('stripe') NOT NULL,
  `gateway_transaction_id` varchar(250) NOT NULL,
  `json_data` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(11) NOT NULL,
  `pay_period` varchar(25) DEFAULT NULL,
  `status` enum('pending','paid') DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `pay_period`, `status`, `created_by`, `created_at`) VALUES
(8, 'Mar, 2018', 'paid', 1, '2018-03-30 08:42:21'),
(9, 'Jun, 2018', 'pending', 1, '2018-03-30 09:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_details`
--

CREATE TABLE `payroll_details` (
  `id` int(11) NOT NULL,
  `payroll_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_method` varchar(250) DEFAULT NULL,
  `salary_amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payroll_details`
--

INSERT INTO `payroll_details` (`id`, `payroll_id`, `user_id`, `payment_method`, `salary_amount`) VALUES
(34, 8, 7, 'sfsd', 1500),
(35, 8, 8, 'fsdfds', 1200),
(36, 8, 9, 'fdssfd', 1100),
(37, 9, 7, 'a1', 121),
(38, 9, 8, 'b11', 131),
(39, 9, 9, 'c1111', 141);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `type` enum('project','sprint','story','task') DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `css_class` varchar(250) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `type`, `name`, `icon`, `css_class`, `sort_order`) VALUES
(1, 'project', 'High', NULL, 'bg-danger', 3),
(2, 'project', 'Medium', NULL, 'bg-primary', 2),
(3, 'project', 'Low', NULL, 'bg-success', 1),
(4, 'sprint', 'High', NULL, 'bg-danger', 3),
(5, 'sprint', 'Medium', NULL, 'bg-primary', 2),
(6, 'sprint', 'Low', NULL, 'bg-success', 1),
(7, 'story', 'High', NULL, 'bg-danger', 3),
(8, 'story', 'Medium', NULL, 'bg-primary', 2),
(9, 'story', 'Low', NULL, 'bg-success', 1),
(10, 'task', 'High', NULL, 'bg-danger', 3),
(11, 'task', 'Medium', NULL, 'bg-primary', 2),
(12, 'task', 'Low', NULL, 'bg-success', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `wiki` text,
  `code` varchar(50) NOT NULL,
  `url` text NOT NULL,
  `price` float NOT NULL,
  `client_id` int(11) NOT NULL,
  `btc_address` text,
  `eth_address` text,
  `ltc_address` text,
  `delivery_date` datetime DEFAULT NULL,
  `estimated_time` time NOT NULL,
  `logged_time` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` enum('potential','pending','development','production') NOT NULL DEFAULT 'potential',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `wiki`, `code`, `url`, `price`, `client_id`, `btc_address`, `eth_address`, `ltc_address`, `delivery_date`, `estimated_time`, `logged_time`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mynowmining', '<p>\r\n\r\nt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters\r\n\r\n<br></p>', '<p>\r\n\r\nt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters\r\n\r\n<br></p>', 'mynowmining.com', 'https://mynowmining.com/', 6000, 3, NULL, NULL, NULL, '1970-01-01 00:00:00', '10:30:00', '07:24:00', 0, 'development', '0000-00-00 00:00:00', '2018-04-11 12:11:55'),
(2, 'members.bitgamepro', '', '', 'members.bitgamepro.com', 'https://members.bitgamepro.com/', 5000, 4, 'aaaaaa', NULL, NULL, '1970-01-01 00:00:00', '05:00:00', '00:00:00', 0, 'potential', '0000-00-00 00:00:00', '2018-04-18 15:15:04'),
(3, 'mybitrush.net', '', NULL, 'mybitrush.net', 'https://mybitrush.net/', 0, 5, NULL, NULL, NULL, '1970-01-01 00:00:00', '00:00:00', '00:00:00', 0, 'potential', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'my.epic911.net', '', NULL, 'my.epic911.net', 'https://my.epic911.net/', 0, 6, NULL, NULL, NULL, '1970-01-01 00:00:00', '00:00:00', '00:00:00', 0, 'potential', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'my.firsttradinguniversity.com', '', NULL, 'my.firsttradinguniversity.com', 'https://my.firsttradinguniversity.com/', 0, 4, NULL, NULL, NULL, '1970-01-01 00:00:00', '00:00:00', '00:00:00', 0, 'potential', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'office.mybitsuccess.com', '', NULL, 'office.mybitsuccess.com', 'https://office.mybitsuccess.com/', 0, 5, NULL, NULL, NULL, '1970-01-01 00:00:00', '00:00:00', '00:00:00', 0, 'potential', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'office.vipmining.co', '', NULL, 'office.vipmining.co', 'https://office.vipmining.co/', 0, 6, NULL, NULL, NULL, '1970-01-01 00:00:00', '00:00:00', '00:00:00', 0, 'potential', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`) VALUES
(1, 'Super Admin', 'super_admin'),
(2, 'Admin', 'admin'),
(3, 'Project Manager', 'project_manager'),
(4, 'Manager', 'manager'),
(5, 'Employee', 'employee'),
(6, 'Client', 'client');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `site_menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `site_menu_id`, `role_id`, `department_id`) VALUES
(1, 101, 2, NULL),
(2, 102, 2, NULL),
(3, 103, 2, NULL),
(4, 104, 2, NULL),
(5, 105, 2, NULL),
(6, 106, 2, NULL),
(7, 109, 2, NULL),
(8, 112, 2, NULL),
(9, 115, 2, NULL),
(10, 116, 2, NULL),
(11, 119, 2, NULL),
(12, 120, 2, NULL),
(13, 121, 2, NULL),
(14, 122, 2, NULL),
(15, 123, 2, NULL),
(16, 124, 2, NULL),
(23, 109, 3, 1),
(24, 110, 3, 1),
(25, 111, 3, 1),
(26, 123, 3, 1),
(27, 102, 3, 1),
(29, 122, 5, NULL),
(30, 123, 5, NULL),
(31, 104, 5, NULL),
(32, 116, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_menus`
--

CREATE TABLE `site_menus` (
  `id` int(11) NOT NULL,
  `site_url_id` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `is_navbar_item` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_menus`
--

INSERT INTO `site_menus` (`id`, `site_url_id`, `parent_id`, `name`, `icon`, `status`, `is_navbar_item`, `sort_order`) VALUES
(101, NULL, 0, 'Admin', 'fa fa-shield', 'show', 1, 2),
(102, NULL, 0, 'Employee', 'fa fa-users', 'show', 1, 3),
(103, NULL, 0, 'Client', 'fa fa-handshake-o', 'show', 1, 4),
(104, NULL, 0, 'Project', 'fa fa-suitcase', 'show', 1, 5),
(105, NULL, 0, 'Department', 'fa fa-building', 'show', 1, 6),
(106, 1, 101, 'Admin Listing', '', 'show', 1, 0),
(107, 2, 101, 'Create Admin', '', 'show', 1, 0),
(108, 3, 106, 'Update Admin', '', 'show', 0, 0),
(109, 4, 102, 'Employee Listing', '', 'show', 1, 0),
(110, 5, 102, 'Create Employee', '', 'show', 1, 0),
(111, 6, 109, 'Update Employee', '', 'show', 0, 0),
(112, 7, 103, 'Client Listing', '', 'show', 1, 0),
(113, 8, 103, 'Create Client', '', 'show', 1, 0),
(114, 9, 112, 'Update Client', '', 'show', 0, 0),
(115, 10, 0, 'Update Profile', '', 'show', 0, 0),
(116, 11, 104, 'Project Listing', '', 'show', 1, 1),
(117, 12, 104, 'Create Project', '', 'show', 1, 2),
(118, 13, 116, 'Update Project', '', 'show', 0, 1),
(119, 14, 105, 'Department Listing', '', 'show', 1, 0),
(120, 15, 105, 'Create Department', '', 'show', 1, 0),
(121, 16, 119, 'Update Department', '', 'show', 0, 0),
(122, 17, 116, 'View Transactions', '', 'show', 0, 2),
(123, 18, 0, 'Dashboard', '', 'show', 1, 1),
(124, 19, 0, 'Upgrade Employee', '', 'show', 0, 0),
(125, 20, 0, 'Role Permissions', '', 'show', 1, 8),
(126, 21, 116, 'View Transactions (PostPaid)', '', 'hide', 0, 3),
(127, 22, 116, 'Project Detail', '', 'show', 0, 4),
(128, 23, 116, 'Task Listing', '', 'show', 0, 5),
(129, 24, 128, 'Create Task', '', 'show', 0, 0),
(130, 25, 128, 'Update Task', '', 'show', 0, 0),
(131, 26, 116, 'Gernate Invoice', '', 'show', 0, 6),
(132, 27, 122, 'Update Blockchain ID', '', 'hide', 0, 0),
(133, NULL, 0, 'Payroll', 'fa fa-handshake-o', 'show', 1, 7),
(134, 28, 133, 'Payroll Listing', '', 'show', 1, 1),
(135, 29, 133, 'Create Payroll', '', 'show', 1, 2),
(136, 30, 134, 'Update Payroll', '', 'show', 0, 0),
(137, 31, 134, 'View Payroll', '', 'show', 0, 0),
(138, 32, 127, 'Payment', '', 'show', 0, 1),
(139, 33, 127, 'Stripe Payment', '', 'show', 0, 2),
(140, 34, 104, 'Payment History', '', 'show', 1, 3),
(141, 35, 116, 'Project Board', '', 'show', 0, 7),
(142, 36, 141, 'Create Sprint', '', 'show', 0, 1),
(143, 37, 141, 'Update Sprint', '', 'show', 0, 2),
(144, 38, 141, 'Create Story', '', 'show', 0, 3),
(145, 39, 141, 'Update Story', '', 'show', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `site_urls`
--

CREATE TABLE `site_urls` (
  `id` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `target` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_urls`
--

INSERT INTO `site_urls` (`id`, `url`, `status`, `target`) VALUES
(1, 'user_management/admin_listing', 1, NULL),
(2, 'user_management/create_admin', 1, NULL),
(3, 'user_management/update_admin', 1, NULL),
(4, 'user_management/employee_listing', 1, NULL),
(5, 'user_management/create_employee', 1, NULL),
(6, 'user_management/update_employee', 1, NULL),
(7, 'user_management/client_listing', 1, NULL),
(8, 'user_management/create_client', 1, NULL),
(9, 'user_management/update_client', 1, NULL),
(10, 'user_management/update_profile', 1, NULL),
(11, 'project/project_listing', 1, NULL),
(12, 'project/create_project', 1, NULL),
(13, 'project/update_project', 1, NULL),
(14, 'department/department_listing', 1, NULL),
(15, 'department/create_department', 1, NULL),
(16, 'department/update_department', 1, NULL),
(17, 'project/ewallet_credit_transactions', 1, NULL),
(18, 'dashboard/index', 1, NULL),
(19, 'user_management/upgrade_employee', 1, NULL),
(20, 'role_permission/index', 1, NULL),
(21, 'project/ewallet_credit_transactions_postpaid', 1, NULL),
(22, 'project/project_detail', 1, NULL),
(23, 'task/task_listing', 1, NULL),
(24, 'task/create_task', 1, NULL),
(25, 'task/update_task', 1, NULL),
(26, 'project/gernate_invoice', 1, NULL),
(27, 'project/update_blockchain_id', 1, NULL),
(28, 'payroll/payroll_listing', 1, NULL),
(29, 'payroll/create_payroll', 1, NULL),
(30, 'payroll/update_payroll', 1, NULL),
(31, 'payroll/view_payroll', 1, NULL),
(32, 'payment/stripe_payment', 1, NULL),
(33, 'payment/stripe_single_payment', 1, NULL),
(34, 'payment/payment_history', 1, NULL),
(35, 'project/project_board', 1, NULL),
(36, 'sprint/create_sprint', 1, NULL),
(37, 'sprint/update_sprint', 1, NULL),
(38, 'story/create_story', 1, NULL),
(39, 'story/update_story', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sprints`
--

CREATE TABLE `sprints` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `assignee_id` int(11) NOT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `estimated_time` time DEFAULT NULL,
  `logged_time` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sprints`
--

INSERT INTO `sprints` (`id`, `project_id`, `assignee_id`, `priority_id`, `status_id`, `name`, `description`, `estimated_time`, `logged_time`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 4, 2, 6, 5, 'first sprint', '<p>des</p>', NULL, NULL, '2018-04-11 09:05:49', 1, NULL),
(2, 1, 1, 6, 5, 'development', '<p>sfdfdsf</p>', NULL, '07:24:00', '2018-04-11 11:28:16', 1, NULL),
(3, 1, 1, 6, 5, 'Design', '<p>des</p>', NULL, NULL, '2018-04-12 06:33:46', 1, NULL),
(4, 1, 1, 6, 5, 'Testing', '<p>des</p>', NULL, NULL, '2018-04-12 06:34:08', 1, NULL),
(5, 1, 1, 6, 5, 'seo', '<p>des</p>', NULL, NULL, '2018-04-12 08:11:57', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `type` enum('project','sprint','story','task') DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `css_class` varchar(250) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `type`, `name`, `icon`, `css_class`, `sort_order`) VALUES
(1, 'project', 'Pending', NULL, 'bg-info', 1),
(2, 'project', 'In-Progress', NULL, 'bg-primary', 2),
(3, 'project', 'In-Review', NULL, 'bg-warning', 3),
(4, 'project', 'Completed', NULL, 'bg-success', 4),
(5, 'sprint', 'Pending', NULL, 'bg-info', 1),
(6, 'sprint', 'In-Progress', NULL, 'bg-primary', 2),
(7, 'sprint', 'In-Review', NULL, 'bg-warning', 3),
(8, 'sprint', 'Completed', NULL, 'bg-success', 4),
(9, 'story', 'Pending', NULL, 'bg-info', 1),
(10, 'story', 'In-Progress', NULL, 'bg-primary', 2),
(11, 'story', 'In-Review', NULL, 'bg-warning', 3),
(12, 'story', 'Completed', NULL, 'bg-success', 4),
(13, 'task', 'Pending', NULL, 'bg-info', 1),
(14, 'task', 'In-Progress', NULL, 'bg-primary', 2),
(15, 'task', 'In-Review', NULL, 'bg-warning', 3),
(16, 'task', 'Completed', NULL, 'bg-success', 4);

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `sprint_id` int(11) NOT NULL,
  `assignee_id` int(11) NOT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `estimated_time` time DEFAULT NULL,
  `logged_time` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `sprint_id`, `assignee_id`, `priority_id`, `status_id`, `name`, `description`, `estimated_time`, `logged_time`, `created_at`, `created_by`, `updated_at`) VALUES
(1, 2, 7, NULL, NULL, 'User Management', '<p>des</p>', NULL, '07:24:00', '2018-04-11 12:00:35', 1, '2018-04-18 09:56:12'),
(2, 2, 1, 9, 9, 'Vacation Management', '<p>des</p>', NULL, NULL, '2018-04-12 06:49:35', 1, NULL),
(3, 2, 1, 9, 9, 'Payroll System', '<p>des</p>', NULL, NULL, '2018-04-12 06:50:15', 1, NULL),
(4, 3, 1, 9, 9, 'Front end design', '<p>des</p>', NULL, NULL, '2018-04-12 06:50:37', 1, NULL),
(5, 3, 1, 9, 9, 'backend design', '<p>des</p>', NULL, NULL, '2018-04-12 06:50:55', 1, NULL),
(6, 4, 1, 9, 9, 'qa testing', '<p>des</p>', NULL, NULL, '2018-04-12 06:51:27', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `assignee_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `start_date` datetime NOT NULL,
  `description` text NOT NULL,
  `estimated_time` time NOT NULL,
  `logged_time` time NOT NULL,
  `watch_list` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `story_id`, `department_id`, `assignee_id`, `priority_id`, `status_id`, `name`, `start_date`, `description`, `estimated_time`, `logged_time`, `watch_list`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 2, 7, 12, 13, 'task testing', '0000-00-00 00:00:00', '<p>des</p>', '05:30:00', '02:20:00', '', '2018-04-02 07:07:44', 1, '2018-04-18 09:56:12', 1),
(2, 2, 1, 7, 1, 13, 'task testing of dep', '0000-00-00 00:00:00', '<p>sdfdsf</p>', '05:00:00', '00:00:00', '', '2018-04-05 09:50:24', 1, '2018-04-05 09:57:04', 1),
(3, 2, 1, 7, 1, 13, 'status and p', '0000-00-00 00:00:00', '<p>sddds</p>', '00:00:00', '00:00:00', '7,8,1', '2018-04-06 08:20:25', 1, '2018-04-09 12:03:07', 1),
(6, 1, 1, 7, 12, 14, 'test update', '0000-00-00 00:00:00', '', '00:00:00', '05:04:00', '', '2018-04-18 08:37:20', 1, '2018-04-18 09:50:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `task_uploads`
--

CREATE TABLE `task_uploads` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `ext` varchar(20) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `social_security_number` varchar(250) NOT NULL,
  `profile_img` varchar(250) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `confirmation_key` varchar(32) NOT NULL,
  `notification_is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `first_name`, `last_name`, `email`, `dob`, `address`, `social_security_number`, `profile_img`, `status`, `confirmation_key`, `notification_is_read`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', 'Super', 'Admin', 'superadmin@email.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-06 00:00:00', '2018-02-06 00:00:00'),
(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'Admin', 'admin@email.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(3, 'client01', 'e10adc3949ba59abbe56e057f20f883e', 'client', '01', 'info@xonnova.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(4, 'client02', 'e10adc3949ba59abbe56e057f20f883e', 'client', '02', 'info@xonnova.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(5, 'client03', 'e10adc3949ba59abbe56e057f20f883e', 'client', '03', 'info@xonnova.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(6, 'client04', 'e10adc3949ba59abbe56e057f20f883e', 'client', '04', 'info@xonnova.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(7, 'employee01', 'e10adc3949ba59abbe56e057f20f883e', 'employee first name', 'employee last name', 'employee@email.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(8, 'employee02', 'e10adc3949ba59abbe56e057f20f883e', 'employee first name', 'employee last name', 'employee@email.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00'),
(9, 'project_manager', 'e10adc3949ba59abbe56e057f20f883e', 'Project', 'Manager', 'pm@email.com', '0000-00-00', '', '', NULL, 'active', '', 0, '2018-02-20 08:08:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_relations`
--

CREATE TABLE `user_role_relations` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `assignee_id` int(11) NOT NULL,
  `assignor_id` int(11) NOT NULL,
  `assigning_date` datetime NOT NULL,
  `unassignor_id` int(11) DEFAULT NULL,
  `unassigning_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role_relations`
--

INSERT INTO `user_role_relations` (`id`, `role_id`, `department_id`, `assignee_id`, `assignor_id`, `assigning_date`, `unassignor_id`, `unassigning_date`) VALUES
(1, 1, 0, 1, 0, '2018-02-06 00:00:00', NULL, NULL),
(2, 2, 0, 2, 1, '2018-02-20 08:08:22', NULL, NULL),
(3, 6, 0, 3, 0, '2018-02-20 08:08:22', NULL, NULL),
(4, 6, 0, 4, 0, '2018-02-20 08:08:22', NULL, NULL),
(5, 6, 0, 5, 0, '2018-02-20 08:08:22', NULL, NULL),
(6, 6, 0, 6, 0, '2018-02-20 08:08:22', NULL, NULL),
(7, 4, 1, 7, 0, '2018-02-20 08:08:22', NULL, NULL),
(8, 5, 2, 7, 0, '2018-02-20 08:08:22', 2, '2018-02-20 09:08:22'),
(9, 5, 2, 2, 1, '2018-02-20 08:08:22', NULL, NULL),
(10, 5, 2, 1, 0, '2018-02-20 08:08:22', NULL, NULL),
(11, 4, 2, 7, 2, '2018-02-20 08:08:22', 1, '2018-03-30 00:00:00'),
(12, 5, 2, 8, 7, '2018-02-20 08:08:22', NULL, NULL),
(13, 5, 2, 7, 1, '2018-02-20 08:08:22', NULL, NULL),
(14, 3, 0, 9, 0, '2018-02-20 08:08:22', NULL, NULL),
(15, 4, 2, 1, 0, '2018-02-20 08:08:22', NULL, NULL),
(16, 4, 1, 1, 0, '2018-02-20 08:08:22', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_details`
--
ALTER TABLE `payroll_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_menus`
--
ALTER TABLE `site_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_urls`
--
ALTER TABLE `site_urls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sprints`
--
ALTER TABLE `sprints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_uploads`
--
ALTER TABLE `task_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_relations`
--
ALTER TABLE `user_role_relations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `payroll_details`
--
ALTER TABLE `payroll_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `site_menus`
--
ALTER TABLE `site_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `site_urls`
--
ALTER TABLE `site_urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `sprints`
--
ALTER TABLE `sprints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `task_uploads`
--
ALTER TABLE `task_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user_role_relations`
--
ALTER TABLE `user_role_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
