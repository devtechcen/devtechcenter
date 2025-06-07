-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2025 at 04:33 PM
-- Server version: 8.0.42
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devtech`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add feedback', 7, 'add_feedback'),
(26, 'Can change feedback', 7, 'change_feedback'),
(27, 'Can delete feedback', 7, 'delete_feedback'),
(28, 'Can view feedback', 7, 'view_feedback'),
(29, 'Can add submission', 8, 'add_submission'),
(30, 'Can change submission', 8, 'change_submission'),
(31, 'Can delete submission', 8, 'delete_submission'),
(32, 'Can view submission', 8, 'view_submission'),
(33, 'Can add user profile', 9, 'add_userprofile'),
(34, 'Can change user profile', 9, 'change_userprofile'),
(35, 'Can delete user profile', 9, 'delete_userprofile'),
(36, 'Can view user profile', 9, 'view_userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$5i60HuN8bADxxPgTk9TpPL$s3Qt/gdNmwctScrA76gJkR2HREzmSmzECfRgCoI+DeQ=', '2025-06-07 13:50:20.517403', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2025-06-06 15:30:55.733136'),
(2, 'pbkdf2_sha256$1000000$wkTlR0bZTOpDDpvh5vUWhW$KTnVHp1NGeRBEj8oPx4kBZDG6hsmgRPmGpjdk7c6Gd8=', '2025-06-07 12:49:00.879189', 0, 'vasiliy', '', '', 'vasya@gmail.com', 0, 1, '2025-06-06 16:27:49.905028'),
(3, 'pbkdf2_sha256$1000000$QH8TJYaFEVifBwkWpxGzLc$JxFfifkAAE0JvhwccSmbE/WVV7kIC5TZtt02roSKiiE=', '2025-06-07 15:16:17.076211', 0, 'dima', '', '', 'dima@gmail.com', 0, 1, '2025-06-06 16:29:43.219839'),
(4, 'pbkdf2_sha256$1000000$cRsJB5w7ZzdXkaK5el63Wu$fONht+QtpYScatIrt+/TdZ7Gz23Ip4MIzN8iSt66yhQ=', '2025-06-07 15:16:24.754113', 0, 'nataly', '', '', 'nataly@gmail.com', 0, 1, '2025-06-06 16:32:52.454765'),
(5, 'pbkdf2_sha256$1000000$Nocj8KS1ah5F7NMuPwbGMt$KiVues8/3Jy6so6+mDuxR10zMMnuCFfj+Fyq+S/yc6Y=', '2025-06-07 13:49:48.483675', 0, 'ivan', '', '', 'ivan@gmail.com', 0, 1, '2025-06-06 16:35:11.169289'),
(6, 'pbkdf2_sha256$1000000$Ueq8JCW0YbdTBSHTZ8ZlRr$dQ26Fnu0dYKwyN56okMdV8XQbC0tTsl2EP+vRWRF5ns=', '2025-06-06 16:40:01.469961', 0, 'alina', '', '', 'alina@gmail.com', 0, 1, '2025-06-06 16:40:00.791883');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'feedback'),
(8, 'main', 'submission'),
(9, 'main', 'userprofile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-06 15:24:01.755111'),
(2, 'auth', '0001_initial', '2025-06-06 15:24:02.578474'),
(3, 'admin', '0001_initial', '2025-06-06 15:24:02.747928'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-06 15:24:02.757077'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-06 15:24:02.768653'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-06 15:24:02.927965'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-06 15:24:03.022058'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-06 15:24:03.117568'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-06 15:24:03.126086'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-06 15:24:03.218681'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-06 15:24:03.222242'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-06 15:24:03.229634'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-06 15:24:03.328570'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-06 15:24:03.432645'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-06 15:24:03.522754'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-06 15:24:03.530425'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-06 15:24:03.635985'),
(18, 'main', '0001_initial', '2025-06-06 15:24:03.766331'),
(19, 'sessions', '0001_initial', '2025-06-06 15:24:03.824046'),
(20, 'main', '0002_userprofile', '2025-06-06 16:05:54.748870'),
(21, 'main', '0003_remove_submission_surname_submission_email', '2025-06-06 16:44:09.406887'),
(22, 'main', '0004_submission_user_alter_submission_category_and_more', '2025-06-06 17:19:56.001577'),
(23, 'main', '0005_alter_submission_category', '2025-06-07 13:29:49.455495');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7zwhkpnkcmpbb4q1yxle3hre1klimbcv', '.eJxVjDsOwyAQRO9CHSG-xqRM7zOgZReCkwhLxq6i3D1YcpGU8-bNvFmAfSthb2kNM7ErU-zyyyLgM9WjoAfU-8Jxqds6R34o_GwbnxZKr9vp_h0UaKWvQZAflAMAEkpiznbEHI3I3mmJyfoeUrJORxxIOqUxGjKQqcNRg2efLwwWOSE:1uNsip:G2lYg37yYX9K0Z-azX736YkzH_rUhxQFb3RzdGnxBMY', '2025-06-21 12:32:27.800020'),
('fi9t19phcd14gzrviaby6a1khm219mpv', '.eJxVjDsOwjAQBe_iGlm2s_5R0nMGa_1ZHEC2FCcV4u4QKQW0b2beiwXc1hq2UZYwZ3ZmwE6_W8T0KG0H-Y7t1nnqbV3myHeFH3Twa8_leTncv4OKo37rkj04BYSEwgMZNJAmIZC09gajltJYNykETwbAJjAaUVkLPjtJk2DvD9ueNyA:1uNvHU:1a2NdTRcZDDxwCZmsGbV88NIDc-dpbvmLRTNU7yjbAU', '2025-06-21 15:16:24.758103');

-- --------------------------------------------------------

--
-- Table structure for table `main_feedback`
--

CREATE TABLE `main_feedback` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `submission_date` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `main_feedback`
--

INSERT INTO `main_feedback` (`id`, `name`, `email`, `phone`, `description`, `submission_date`, `status`) VALUES
(1, 'Ильнар', 'ilnar@gmail.com', '12482374', 'Не могу зарегистрироватся на сайте, выдает ошибку', '2025-06-06 17:02:03.323642', 'рассмотрено'),
(2, 'Сослан', 'soslan@gmail.com', '4923871', 'Выдает ошибку когда отправляю заявку', '2025-06-07 15:27:13.325949', 'не рассмотрено');

-- --------------------------------------------------------

--
-- Table structure for table `main_submission`
--

CREATE TABLE `main_submission` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `submission_date` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `processed_at` datetime(6) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `main_submission`
--

INSERT INTO `main_submission` (`id`, `name`, `category`, `description`, `submission_date`, `status`, `processed_at`, `employee_id`, `email`, `user_id`) VALUES
(6, 'Создание предприятия', 'Bureaucracy', 'Мне нужна консультация по поводу создания предприятия и организации документов.', '2025-06-07 13:31:48.311722', 'рассматривается', NULL, 4, 'admin@gmail.com', 1),
(7, 'Помощь по рекламе бизнеса', 'Marketing', 'Здравствуйте. Мне нужна помощь. Не могу выбрать подходящий рекламный подход для своего бизнеса по доставке букетов.', '2025-06-07 13:35:40.227765', 'рассматривается', NULL, 2, 'dima@gmail.com', 3),
(8, 'Набор квалифицированного персонала', 'Organization', 'Мне нужны совету по набору опытного персонала.', '2025-06-07 13:50:14.059316', 'не рассмотрено', NULL, NULL, 'ivan@gmail.com', 5),
(9, 'Игорь', 'Automatization', 'Нужна помощь с интеграцией CRM систем', '2025-06-07 15:30:59.696919', 'не рассмотрено', NULL, NULL, 'igor@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `main_userprofile`
--

CREATE TABLE `main_userprofile` (
  `id` bigint NOT NULL,
  `role` varchar(10) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `main_userprofile`
--

INSERT INTO `main_userprofile` (`id`, `role`, `user_id`) VALUES
(1, 'admin', 1),
(2, 'manager', 2),
(4, 'user', 3),
(6, 'manager', 4),
(8, 'user', 5),
(9, 'user', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_feedback`
--
ALTER TABLE `main_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_submission`
--
ALTER TABLE `main_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_submission_employee_id_7d19c040_fk_auth_user_id` (`employee_id`),
  ADD KEY `main_submission_user_id_3808c258_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `main_userprofile`
--
ALTER TABLE `main_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `main_feedback`
--
ALTER TABLE `main_feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `main_submission`
--
ALTER TABLE `main_submission`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `main_userprofile`
--
ALTER TABLE `main_userprofile`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_submission`
--
ALTER TABLE `main_submission`
  ADD CONSTRAINT `main_submission_employee_id_7d19c040_fk_auth_user_id` FOREIGN KEY (`employee_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `main_submission_user_id_3808c258_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_userprofile`
--
ALTER TABLE `main_userprofile`
  ADD CONSTRAINT `main_userprofile_user_id_15c416f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
