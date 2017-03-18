/*\
|*|  ----------------------------------
|*|  --- [  Oli Default SQL file  ] ---
|*|  --- [   Revision 17.03-01    ] ---
|*|  ----------------------------------
|*|  / Built for Oli Beta 1.7.1
|*|  
|*|  The default SQL file for Oli, an open source PHP Framework made by Matiboux.
|*|  You can use this SQL template to setup a MySQL database with the framework.
|*|  Created and developed by Matiboux (Mathieu Guérin).
|*|  
|*|  Oli Default SQL Github repository: https://github.com/OliFramework/Oli-Default-SQL/
|*|  Oli Github repository: https://github.com/OliFramework/Oli/
|*|  
|*|  --- --- ---
|*|  
|*|  Changelog for v17.03-01:
|*|  - Created its own Repository!
|*|  
|*|  Stuff to do next: (Oli Beta 1.8.0)
|*|  - Add the `accounts_login_limits` table
|*|  - Add the `accounts_permissions` table
|*|  
|*|  --- --- ---
|*|  
|*|  Summary:
|*|  
|*|  I. Oli General Tables
|*|    I. 1. Table `settings`
|*|    I. 2. Table `shortcut_links`
|*|    I. 3. Table `translations`
|*|  II. Oli Accounts Tables
|*|    II. 1. Table `accounts`
|*|    II. 2. Table `accounts_infos`
|*|    II. 3. Table `accounts_requests`
|*|    II. 4. Table `accounts_rights`
|*|    II. 5. Table `accounts_sessions`
|*|  
|*|  --- --- ---
|*|  
|*|  MIT License
|*|  
|*|  Copyright (c) 2017 Mathieu Guérin (aka Matiboux)
|*|  
|*|    Permission is hereby granted, free of charge, to any person obtaining a copy
|*|    of this software and associated documentation files (the "Software"), to deal
|*|    in the Software without restriction, including without limitation the rights
|*|    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
|*|    copies of the Software, and to permit persons to whom the Software is
|*|    furnished to do so, subject to the following conditions:
|*|    
|*|    The above copyright notice and this permission notice shall be included in all
|*|    copies or substantial portions of the Software.
|*|    
|*|    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
|*|    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
|*|    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
|*|    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
|*|    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
|*|    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
|*|    SOFTWARE.
\*/

-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 22, 2017 at 02:32 PM
-- Server version: 5.6.25-1~dotdeb+7.1
-- PHP Version: 5.6.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- *** *** *** --

-- --------------------------- --
-- [  I. Oli General Tables  ] --
-- --------------------------- --

-- I. 1. Table `settings`

	-- I. 1. A. Create the table

	CREATE TABLE `settings` (
	  `id` int(11) NOT NULL,
	  `name` varchar(64) NOT NULL,
	  `value` text NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	-- I. 1. B. Insert the data

	INSERT INTO `settings` (`id`, `name`, `value`) VALUES
	(1, 'url', 'urwebs.it/'),
	(2, 'name', 'Your own Oli website!'),
	(3, 'description', 'Is that your website?'),
	(4, 'media_path', 'content/media/'),
	(5, 'theme_path', 'content/theme/'),
	(6, 'force_https', '0'),
	(7, 'version', '1.0'),
	(8, 'creation_date', '2014-11-15'),
	(9, 'status', ''),
	(10, 'owner', '');

	-- I. 1. C. Table Extras

	ALTER TABLE `settings`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `accounts`
	  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

-- I. 2. Table `shortcut_links`

	-- I. 2. A. Create the table
	CREATE TABLE `shortcut_links` (
	  `id` int(11) NOT NULL,
	  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
	  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

	-- III. 2. B. Insert the data

	INSERT INTO `shortcut_links` (`id`, `name`, `url`) VALUES
	(1, 'matiboux', 'http://matiboux.com/');

	-- III. 2. C. Table Extras

	ALTER TABLE `shortcut_links`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `shortcut_links`
	  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- I. 3. Table `translations`

	-- I. 3. A. Create the table

	CREATE TABLE `translations` (
	  `id` bigint(20) NOT NULL,
	  `en` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	  `fr` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	  `es` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

	-- I. 3. B. Insert the data

	INSERT INTO `translations` (`id`, `en`, `fr`, `es`) VALUES
	(1, 'Hello World!', '', '');

	-- I. 3. C. Table Extras

	ALTER TABLE `translations`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `translations`
	  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


-- ----------------------------- --
-- [  II. Oli Accounts Tables  ] --
-- ----------------------------- --

-- II. 1. Table `accounts`

	-- II. 1. A. Create the table

	CREATE TABLE `accounts` (
	  `id` int(11) NOT NULL,
	  `username` varchar(64) NOT NULL,
	  `password` varchar(128) NOT NULL,
	  `email` varchar(128) NOT NULL,
	  `birthday` date DEFAULT NULL,
	  `register_date` datetime NOT NULL,
	  `user_right` varchar(32) NOT NULL,
	  `language` varchar(32) NOT NULL,
	  `admin_note` text NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	-- II. 1. B. Insert the data

	-- Note:
	-- This is the default admin account.
	-- As an example, the user "admin" below use "admin" as its password. You should change the password as soon as possible.
	-- You can use the official Oli Login page for that.

	INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `birthday`, `register_date`, `user_right`, `language`, `admin_note`) VALUES
	(1, 'admin', '$2y$10$LT7/.sifpEzEExpeddMoj.ShOJTdQJdkE56NFIIh2iVOEtjIy9Ovq', 'matiboux@gmail.com', '2000-10-20', '2016-01-13 17:21:35', 'OWNER', 'en', 'Default Oli Admin Account');

	-- II. 1. C. Table Extras

	ALTER TABLE `accounts`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `accounts`
	  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- II. 2. Table `accounts_infos`

	-- II. 2. A. Create the table

	CREATE TABLE `accounts_infos` (
	  `id` int(11) NOT NULL,
	  `username` varchar(64) NOT NULL,
	  `pseudonym` varchar(64) NOT NULL,
	  `nickname` varchar(64) NOT NULL,
	  `firstname` varchar(64) NOT NULL,
	  `lastname` varchar(64) NOT NULL,
	  `displayed_name` varchar(32) NOT NULL,
	  `add_pseudonym` tinyint(1) NOT NULL,
	  `biography` text NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	-- II. 2. B. Insert the data

	INSERT INTO `accounts_infos` (`id`, `username`, `pseudonym`, `nickname`, `firstname`, `lastname`, `displayed_name`, `add_pseudonym`, `gender`, `sexuality`, `biography`, `theme`, `address`, `country`, `city`, `postal_code`, `phone`) VALUES
	(1, 'admin', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '');

	-- II. 3. C. Table Extras

	ALTER TABLE `accounts_infos`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `accounts_infos`
	  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

	ALTER TABLE `accounts_infos`
	  ADD CONSTRAINT `accounts_infos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

-- II. 3. Table `accounts_requests`

	-- II. 3. A. Create the table

	CREATE TABLE `accounts_requests` (
	  `id` bigint(20) NOT NULL,
	  `username` varchar(64) NOT NULL,
	  `pseudonym` varchar(64) NOT NULL,
	  `nickname` varchar(64) NOT NULL,
	  `firstname` varchar(64) NOT NULL,
	  `lastname` varchar(64) NOT NULL,
	  `displayed_name` varchar(32) NOT NULL,
	  `add_pseudonym` tinyint(1) NOT NULL,
	  `biography` text NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	-- II. 3. B. Insert the data

	-- No data to insert

	-- II. 3. C. Table Extras

	ALTER TABLE `accounts_requests`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `accounts_requests`
	  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

	ALTER TABLE `accounts_requests`
	  ADD CONSTRAINT `accounts_requests_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

-- II. 4. Table `accounts_rights`

	-- II. 4. A. Create the table

	CREATE TABLE `accounts_rights` (
	  `id` int(11) NOT NULL,
	  `user_right` varchar(64) NOT NULL,
	  `acronym` varchar(64) NOT NULL,
	  `name` varchar(64) NOT NULL,
	  `permissions` text NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	-- II. 4. B. Insert the data

	INSERT INTO `accounts_rights` (`id`, `user_right`, `acronym`, `name`, `permissions`) VALUES
	(1, 'NEW-USER', 'NEW', 'New user', '{"0":"no","1":"permissions","2":"yet"}'),
	(2, 'BANNED', 'BAN', 'Banned user', '{"0":"no","1":"permissions","2":"yet"}'),
	(3, 'USER', '', 'Regular user', '{"0":"no","1":"permissions","2":"yet"}'),
	(4, 'VIP', '', 'VIP user', '{"0":"no","1":"permissions","2":"yet"}'),
	(5, 'MODERATOR', 'MOD', 'Moderator', '{"0":"no","1":"permissions","2":"yet"}'),
	(6, 'ADMINISTRATOR', 'ADMIN', 'Administrator', '{"0":"no","1":"permissions","2":"yet"}'),
	(7, 'OWNER', '', 'Owner', '*');

	-- II. 4. C. Table Extras

	ALTER TABLE `accounts_rights`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `accounts_rights`
	  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-- II. 5. Table `accounts_sessions`

	-- II. 5. A. Create the table

	CREATE TABLE `accounts_sessions` (
	  `id` bigint(20) NOT NULL,
	  `username` varchar(64) NOT NULL,
	  `auth_key` varchar(256) NOT NULL,
	  `user_ip` varchar(64) NOT NULL,
	  `port` varchar(32) NOT NULL,
	  `login_date` datetime NOT NULL,
	  `expire_date` datetime NOT NULL,
	  `update_date` datetime NOT NULL,
	  `last_seen_page` varchar(256) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	-- II. 5. B. Insert the data

	-- No data to insert

	-- II. 5. C. Table Extras

	ALTER TABLE `accounts_sessions`
	  ADD PRIMARY KEY (`id`);

	ALTER TABLE `accounts_sessions`
	  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

	ALTER TABLE `accounts_sessions`
	  ADD CONSTRAINT `accounts_sessions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

-- *** *** *** --

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;