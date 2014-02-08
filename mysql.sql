CREATE DATABASE IF NOT EXISTS `database`;
USE `database`;
CREATE TABLE `EMPLOYEES` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `second_name` varchar(30) NOT NULL,
  `age` int(3) NOT NULL,
  `experience` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;