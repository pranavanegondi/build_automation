create database if not exists whmain;
create database if not exists v2_db;
create database if not exists teacher_rec;
GRANT ALL PRIVILEGES ON *.* TO 'vikram'@'%';

-- MySQL dump 10.13  Distrib 5.7.24, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: v2_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config_master`
--


use v2_db;
DROP TABLE IF EXISTS `config_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_master` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `schema` varchar(255) DEFAULT 'default',
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `is_public` tinyint(1) DEFAULT '0',
  `region_name` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schema_name_idx` (`schema`,`name`),
  KEY `public_idx` (`is_public`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `region_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_grade` int(11) DEFAULT NULL,
  `to_grade` int(11) DEFAULT NULL,
  `course_short_name` varchar(255) DEFAULT NULL,
  `course_description` varchar(255) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT 'CODING',
  `curriculum_link` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_activity`
--

DROP TABLE IF EXISTS `course_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `course_class_id` int(11) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `channel` enum('M','L') DEFAULT 'L',
  `activity_link` varchar(255) DEFAULT NULL,
  `sequence_no` int(11) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_class_id` (`course_class_id`),
  CONSTRAINT `course_activity_ibfk_1` FOREIGN KEY (`course_class_id`) REFERENCES `course_class` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_class`
--

DROP TABLE IF EXISTS `course_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `course_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `class_number` varchar(255) DEFAULT NULL,
  `sequence_no` int(11) DEFAULT NULL,
  `doc_link` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `summary_doc_link` varchar(255) DEFAULT NULL,
  `is_trial` tinyint(1) DEFAULT NULL,
  `training_doc_link` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_number` (`class_number`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_class_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11298 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_item`
--

DROP TABLE IF EXISTS `course_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_item` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `course_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `class_type` varchar(255) DEFAULT NULL,
  `max_student` int(11) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_item_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_level`
--

DROP TABLE IF EXISTS `course_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_level` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_price`
--

DROP TABLE IF EXISTS `course_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_item_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `region_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` enum('ONE_TIME','SUBSCRIPTION') DEFAULT 'ONE_TIME',
  `subscription_mode` enum('DAY','MONTH','YEAR') DEFAULT NULL,
  `subscription_tenure` int(11) DEFAULT NULL,
  `mrp` int(11) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `per_class_price` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `total_credits` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_item_id` (`course_item_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `course_price_ibfk_1` FOREIGN KEY (`course_item_id`) REFERENCES `course_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `course_price_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) DEFAULT NULL,
  `inr_conversion` double DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposition`
--

DROP TABLE IF EXISTS `disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposition` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_command_config`
--

DROP TABLE IF EXISTS `event_command_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_command_config` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `command` varchar(255) DEFAULT NULL,
  `command_data` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_type`
--

DROP TABLE IF EXISTS `issue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `issue_type` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_config`
--

DROP TABLE IF EXISTS `notification_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `config` text,
  `notification_type` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `template_type` varchar(255) DEFAULT NULL,
  `default_account` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_beta_enabled` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4670 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_log`
--

DROP TABLE IF EXISTS `notification_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(255) DEFAULT NULL,
  `sent_to` varchar(255) DEFAULT NULL,
  `sent_status` varchar(255) DEFAULT NULL,
  `is_error` tinyint(1) DEFAULT NULL,
  `error` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `notification_type` varchar(255) DEFAULT NULL,
  `open_count` int(11) DEFAULT '0',
  `notification_uuid` char(36) DEFAULT NULL,
  `last_open_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sent_to_created_at` (`sent_to`,`created_at`),
  KEY `created_at_idx` (`created_at`),
  KEY `sent_to_idx` (`sent_to`),
  KEY `notification_uuid` (`notification_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_master` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `dial_code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `student_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `course_item_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `course_price_id` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `max_credits` int(11) DEFAULT NULL,
  `region_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mrp` double DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `additional_discount` double DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `discount_value` varchar(255) DEFAULT NULL,
  `discount_description` varchar(255) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `final_amount` double DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `final_inr_amount` double DEFAULT NULL,
  `ops_notes` text,
  `parent_notes` text,
  `expiry` datetime DEFAULT NULL,
  `is_coupon_allowed` tinyint(1) DEFAULT '1',
  `is_ncemi_allowed` tinyint(1) DEFAULT '1',
  `guest_address` text,
  `guest_country_code` varchar(255) DEFAULT NULL,
  `guest_city` varchar(255) DEFAULT NULL,
  `guest_state` varchar(255) DEFAULT NULL,
  `guest_postal_code` varchar(255) DEFAULT NULL,
  `guest_latitude` varchar(255) DEFAULT NULL,
  `guest_longitude` varchar(255) DEFAULT NULL,
  `guest_timezone` varchar(255) DEFAULT NULL,
  `additional_name` varchar(255) DEFAULT NULL,
  `additional_email` varchar(255) DEFAULT NULL,
  `additional_dial_code` varchar(255) DEFAULT NULL,
  `additional_mobile` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `order_confirmed_at` datetime DEFAULT NULL,
  `preferred_gateway` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `link_generated_by` varchar(255) DEFAULT NULL,
  `referred_by` varchar(255) DEFAULT NULL,
  `referral_link` text,
  `order_type` varchar(255) DEFAULT NULL,
  `subscription_id` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_item_id` (`course_item_id`),
  KEY `course_price_id` (`course_price_id`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`),
  CONSTRAINT `order_master_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_master_ibfk_2` FOREIGN KEY (`course_item_id`) REFERENCES `course_item` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_master_ibfk_3` FOREIGN KEY (`course_price_id`) REFERENCES `course_price` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `course_class_id` int(11) DEFAULT NULL,
  `document_url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `solution_url` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `due_date_days` int(11) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_class_id` (`course_class_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`course_class_id`) REFERENCES `course_class` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_event`
--

DROP TABLE IF EXISTS `project_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_event` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `student_project_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `event_data` text,
  `event_name` varchar(255) DEFAULT NULL,
  `user_entity_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_entity_type` varchar(255) DEFAULT NULL,
  `project_submission_url` varchar(255) DEFAULT NULL,
  `project_file_data` text,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_project_id` (`student_project_id`),
  CONSTRAINT `project_event_ibfk_1` FOREIGN KEY (`student_project_id`) REFERENCES `student_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_master`
--

DROP TABLE IF EXISTS `region_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_master` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resolution_type`
--

DROP TABLE IF EXISTS `resolution_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolution_type` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `dial_code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `additional_email` varchar(255) DEFAULT NULL,
  `additional_dial_code` varchar(255) DEFAULT NULL,
  `additional_contact_no` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','others') DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `grade_updated_at` datetime DEFAULT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `referral_type` varchar(255) DEFAULT NULL,
  `user_referral_code` varchar(255) DEFAULT NULL,
  `user_referral_link` varchar(255) DEFAULT NULL,
  `is_codeorg_created` int(11) DEFAULT NULL,
  `codeorg_user_name` varchar(255) DEFAULT NULL,
  `codeorg_password` varchar(255) DEFAULT NULL,
  `is_laptop` tinyint(1) DEFAULT NULL,
  `is_onetime_allowed` tinyint(1) DEFAULT '0',
  `is_notification_subscribed` tinyint(1) DEFAULT '1',
  `hobby` varchar(255) DEFAULT NULL,
  `website_user_name` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `is_migration_synced` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `email_idx` (`email`),
  KEY `mobile_idx` (`mobile`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_personality_profile`
--

DROP TABLE IF EXISTS `student_personality_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_personality_profile` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `student_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `teacher_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `warm_up_wrap_up_response` int(11) DEFAULT NULL,
  `child_asked_question_response` int(11) DEFAULT NULL,
  `child_initiated_connection_response` int(11) DEFAULT NULL,
  `child_focussed_playful_response` int(11) DEFAULT NULL,
  `student_personality_code` varchar(255) DEFAULT NULL,
  `percentage_allocation_each_question` text,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_personality_profile_student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_project`
--

DROP TABLE IF EXISTS `student_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_project` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `student_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `course_class_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `teacher_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `notification_status` varchar(255) DEFAULT NULL,
  `last_submitted_date` datetime DEFAULT NULL,
  `last_submission_url` varchar(255) DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `uploaded_file_data` text,
  `is_published` tinyint(1) DEFAULT '0',
  `publish_date` datetime DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_project_student_id_project_id_teacher_id` (`student_id`,`project_id`,`teacher_id`),
  KEY `course_class_id` (`course_class_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `student_project_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `student_project_ibfk_2` FOREIGN KEY (`course_class_id`) REFERENCES `course_class` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `student_project_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_disposition`
--

DROP TABLE IF EXISTS `sub_disposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_disposition` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `disposition_type_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_issue_type`
--

DROP TABLE IF EXISTS `sub_issue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_issue_type` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `sub_issue_type` varchar(255) DEFAULT NULL,
  `issue_type_id` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_task_type`
--

DROP TABLE IF EXISTS `sub_task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_task_type` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `task_type_id` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) DEFAULT 'active',
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `system_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_user_properties`
--

DROP TABLE IF EXISTS `system_user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user_properties` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_action`
--

DROP TABLE IF EXISTS `task_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_action` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `task_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `task_action_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_addl_data`
--

DROP TABLE IF EXISTS `task_addl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_addl_data` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `task_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `task_addl_data_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_master`
--

DROP TABLE IF EXISTS `task_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_master` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sub_type_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disposition_type_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sub_disposition_type_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `entity_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `owner` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data` text,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `disposition_type_id` (`disposition_type_id`),
  KEY `sub_disposition_type_id` (`sub_disposition_type_id`),
  KEY `entity_id` (`entity_id`),
  CONSTRAINT `task_master_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `task_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `task_master_ibfk_2` FOREIGN KEY (`sub_type_id`) REFERENCES `sub_task_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `task_master_ibfk_3` FOREIGN KEY (`disposition_type_id`) REFERENCES `disposition` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `task_master_ibfk_4` FOREIGN KEY (`sub_disposition_type_id`) REFERENCES `sub_disposition` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `task_master_ibfk_5` FOREIGN KEY (`entity_id`) REFERENCES `student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_type` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_table`
--

DROP TABLE IF EXISTS `temp_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_table` (
  `max(cb.course_class_id)` int(11) DEFAULT NULL,
  `student_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_table1`
--

DROP TABLE IF EXISTS `temp_table1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_table1` (
  `maxClassId` int(11) DEFAULT NULL,
  `student_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_table2`
--

DROP TABLE IF EXISTS `temp_table2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_table2` (
  `maxClassId` int(11) DEFAULT NULL,
  `student_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempStudentProjectTable`
--

DROP TABLE IF EXISTS `tempStudentProjectTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempStudentProjectTable` (
  `maxStudentProjectCourseCLassId` int(11) DEFAULT NULL,
  `student_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `studentProjectId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trial_cuttoff_result`
--

DROP TABLE IF EXISTS `trial_cuttoff_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_cuttoff_result` (
  `teacher_id` varchar(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `total_wkly_opened` decimal(24,4) DEFAULT NULL,
  `paid_student_count` bigint(21) DEFAULT '0',
  `wkly_students_with_bookings` bigint(21) NOT NULL DEFAULT '0',
  `wkly_slot_booked` decimal(23,0) DEFAULT NULL,
  `slots_needed_for_stud_with_no_wkly_bk` decimal(50,4) DEFAULT NULL,
  `FreeCapacity` decimal(51,4) DEFAULT NULL,
  `teacherOccupancy` decimal(34,4) DEFAULT NULL,
  `TrialStatus` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dial_code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `jwt_token` varchar(255) DEFAULT NULL,
  `mobile_verified` tinyint(1) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `social_login_id` varchar(255) DEFAULT NULL,
  `social_login_type` varchar(255) DEFAULT NULL,
  `is_profile_updated` tinyint(1) DEFAULT '0',
  `updated_by_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `updated_by_type` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `token_version` int(11) DEFAULT NULL,
  `user_version` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `user_version_idx` (`user_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_addr_type` (`user_id`,`address_type`,`record_status`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_device`
--

DROP TABLE IF EXISTS `user_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_device` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `device_os` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `last_seen_ip` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `browser_version` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-05 13:12:11
