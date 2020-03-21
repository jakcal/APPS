-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 14, 2019 at 05:29 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oxoo_v110_blank`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `comments_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `video_id` int(20) NOT NULL,
  `comment_type` int(5) NOT NULL DEFAULT '1',
  `replay_for` int(10) DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `comment_at` datetime DEFAULT NULL,
  `publication` int(5) DEFAULT '0',
  PRIMARY KEY (`comments_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`config_id`, `title`, `value`) VALUES
(NULL, 'system_name', 'OXOO - Android Live TV & Movie Portal'),
(NULL, 'site_name', 'My APPS'),
(NULL, 'business_address', 'My Address'),
(NULL, 'business_phone', '880170000000'),
(NULL, 'contact_email', 'contact@mydomain.com'),
(NULL, 'system_email', 'email@mydomain.com'),
(NULL, 'system_short_name', 'OXOO'),
(NULL, 'slider_type', 'disable'),
(NULL, 'slide_per_page', '5'),
(NULL, 'protocol', 'smtp'),
(NULL, 'mailpath', '/usr/bin/sendmail'),
(NULL, 'smtp_host', 'smtp.gmail.com'),
(NULL, 'smtp_user', 'email@website.com'),
(NULL, 'smtp_pass', 'xxxxxxxxx'),
(NULL, 'smtp_port', '465'),
(NULL, 'smtp_crypto', 'ssl'),
(NULL, 'comments_approval', '1'),
(NULL, 'movie_per_page', '72'),
(NULL, 'purchase_code', 'item_purchase_code'),
(NULL, 'push_notification_enable', ''),
(NULL, 'onesignal_appid', 'one_signal_app_id_here'),
(NULL, 'onesignal_api_keys', 'one_signal_api_key_here'),
(NULL, 'mobile_apps_api_secret_key', 'api_key_for_android'),
(NULL, 'cron_key', 'cron_key_for_cron_job'),
(NULL, 'db_backup', '1'),
(NULL, 'backup_schedule', '30'),
(NULL, 'version', '1.1.4'),
(NULL, 'terms', 'html terms & condition goes here'),
(NULL, 'total_movie_in_slider', '5'),
(NULL, 'preroll_ads_enable', '0'),
(NULL, 'preroll_ads_video', ''),
(NULL, 'admob_ads_enable', '0'),
(NULL, 'admob_publisher_id', 'pub-xxxxxxxxxxxxx'),
(NULL, 'admob_app_id', 'ca-app-pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(NULL, 'admob_banner_ads_id', 'ca-app-pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(NULL, 'admob_interstitial_ads_id', 'ca-app-pub-xxxxxxxxxxxxxxxxxxx/xxxxxxxxxxxxxx'),
(NULL, 'app_menu', 'vertical'),
(NULL, 'app_program_guide_enable', 'true'),
(NULL, 'app_mandatory_login', 'false'),
(NULL, 'genre_visible', 'true'),
(NULL, 'country_visible', 'true'),
(NULL, 'mobile_ads_enable', '0'),
(NULL, 'mobile_ads_network', 'admob'),
(NULL, 'fan_native_ads_placement_id', 'xxxxxxxxxxxxxxx_xxxxxxxxxxxxxxx'),
(NULL, 'fan_banner_ads_placement_id', 'xxxxxxxxxxxxxxx_xxxxxxxxxxxxxxx'),
(NULL, 'fan_Interstitial_ads_placement_id', 'xxxxxxxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxx'),
(NULL, 'startapp_app_id', 'xxxxxxxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `publication` int(2) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `description`, `slug`, `publication`) VALUES
(1, 'International', '', 'international', 1),
(2, 'Asia', '', 'asia', 1),
(3, 'USA', '', 'usa', 1),
(4, 'China', '', 'china', 1),
(5, 'Japan', '', 'japan', 1),
(6, 'Korean', '', 'korean', 1),
(7, 'Nepal', '', 'nepal', 1),
(8, 'Thailand', '', 'thailand', 1),
(9, 'Tamil', '', 'tamil', 1),
(10, 'India', '', 'india', 1),
(11, 'France', '', 'france', 1),
(12, 'Italy', '', 'italy', 1),
(13, 'German', '', 'german', 1),
(14, 'London', '', 'london', 1),
(15, 'Canada', '', 'canada', 1),
(16, 'Denmark', '', 'denmark', 1),
(17, 'UK', '', 'uk', 1),
(18, 'Hong kong', '', 'hong-kong', 1),
(19, 'UAE', '', 'uae', 1),
(20, 'Australia', '', 'australia', 1),
(21, 'South Korea', '', 'south-korea', 1),
(22, 'Russia', '', 'russia', 1),
(23, ' Sweden', '', 'sweden', 1),
(24, 'Spain', '', 'spain', 1),
(25, 'Brazil', '', 'brazil', 1),
(26, 'Iran', '', 'iran', 1),
(27, 'Israel', '', 'israel', 1),
(28, 'Indonesia', '', 'indonesia', 1),
(29, 'Philippines', '', 'philippines', 1),
(30, ' Peru', ' Peru', 'peru', 1),
(31, ' Canada', ' Canada', 'canada', 1),
(32, ' Japan', ' Japan', 'japan', 1),
(33, ' USA', ' USA', 'usa', 1),
(34, ' Hong Kong', ' Hong Kong', 'hong-kong', 1),
(35, ' Mexico', ' Mexico', 'mexico', 1),
(36, ' New Zealand', ' New Zealand', 'new-zealand', 1),
(37, ' UK', ' UK', 'uk', 1),
(38, ' Denmark', ' Denmark', 'denmark', 1),
(39, ' Australia', ' Australia', 'australia', 1),
(40, ' Germany', ' Germany', 'germany', 1),
(41, ' Hungary', ' Hungary', 'hungary', 1),
(42, ' India', ' India', 'india', 1),
(43, 'Hungary', 'Hungary', 'hungary', 1),
(44, ' France', ' France', 'france', 1),
(45, ' China', ' China', 'china', 1),
(46, 'Chile', 'Chile', 'chile', 1),
(47, ' Argentina', ' Argentina', 'argentina', 1),
(48, 'Egypt', 'Egypt', 'egypt', 1),
(49, 'New Zealand', 'New Zealand', 'new-zealand', 1),
(50, 'Croatia', 'Croatia', 'croatia', 1),
(51, ' Switzerland', ' Switzerland', 'switzerland', 1),
(52, ' Tunisia', ' Tunisia', 'tunisia', 1),
(53, 'Belgium', 'Belgium', 'belgium', 1),
(68, 'United States of America', 'United States of America', 'united-states-of-america', 1),
(69, 'Bangladesh', 'Bangladesh', 'bangladesh', 1),
(70, 'United Kingdom', 'United Kingdom', 'united-kingdom', 1),
(71, 'Malaysia', 'Malaysia', 'malaysia', 1),
(72, 'South Africa', 'South Africa', 'south-africa', 1),
(73, 'Switzerland', 'Switzerland', 'switzerland', 1),
(74, 'Germany', 'Germany', 'germany', 1),
(75, 'Sweden', 'Sweden', 'sweden', 1),
(76, 'Bulgaria', 'Bulgaria', 'bulgaria', 1),
(77, 'Soviet Union', 'Soviet Union', 'soviet-union', 1),
(78, 'Netherlands', 'Netherlands', 'netherlands', 1),
(80, 'Malta', 'Malta', 'malta', 1),
(81, 'Taiwan', 'Taiwan', 'taiwan', 1),
(82, 'Argentina', 'Argentina', 'argentina', 1),
(83, 'Iceland', 'Iceland', 'iceland', 1),
(84, 'CA', 'CA', 'ca', 1),
(85, 'US', 'US', 'us', 1),
(86, 'GB', 'GB', 'gb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cron`
--

DROP TABLE IF EXISTS `cron`;
CREATE TABLE IF NOT EXISTS `cron` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `save_to` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videos_id` int(250) DEFAULT NULL,
  `admin_email_from` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_to` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_sub` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cron_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download_link`
--

DROP TABLE IF EXISTS `download_link`;
CREATE TABLE IF NOT EXISTS `download_link` (
  `download_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `videos_id` int(11) DEFAULT NULL,
  `link_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resolution` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '720p',
  `file_size` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00MB',
  `download_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`download_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
CREATE TABLE IF NOT EXISTS `episodes` (
  `episodes_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videos_id` int(11) DEFAULT NULL,
  `seasons_id` int(11) DEFAULT NULL,
  `episodes_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_source` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`episodes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `publication` int(1) NOT NULL,
  `featured` int(2) DEFAULT '0',
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `name`, `description`, `slug`, `publication`, `featured`) VALUES
(1, 'Action', 'Action Movie<br>', 'action', 1, 1),
(2, 'TV Show', 'Tv Show <br>', 'tv-show', 1, 0),
(3, 'Si-Fi', '', 'si-fi', 1, 1),
(4, 'Adventure', 'Adventure Movies<br>', 'adventure', 1, 0),
(5, 'Animation', 'Animation Movies<br>', 'animation', 1, 1),
(6, 'Biography', 'Biography Movies<br>', 'biography', 1, 0),
(7, 'Comedy', 'Comedy Movies<br>', 'comedy', 1, 1),
(8, 'Crime', 'Crime Movies<br>', 'crime', 1, 0),
(9, 'Documentary', 'Documentary Movies<br>', 'documentary', 1, 0),
(10, 'Drama', '', 'drama', 1, 1),
(11, 'Family', 'Family<br>', 'family', 1, 1),
(12, 'Fantasy', 'Fantasy Movies<br>', 'fantasy', 1, 0),
(13, 'History', '', 'history', 1, 0),
(14, 'Horror', 'Horror Movies<br>', 'horror', 1, 1),
(15, 'Music', '', 'music', 1, 0),
(16, 'Musical', '', 'musical', 1, 0),
(17, 'Mystery', '', 'mystery', 1, 0),
(18, 'Thriller', '', 'thriller', 1, 1),
(19, 'War', '', 'war', 1, 0),
(20, 'Western', '', 'western', 1, 0),
(21, 'TV Series', '', 'tv-series', 1, 0),
(22, ' Romance', ' Romance', 'romance', 1, 0),
(23, ' Adventure', ' Adventure', 'adventure', 1, 0),
(24, ' Thriller', ' Thriller', 'thriller', 1, 0),
(25, ' Drama', ' Drama', 'drama', 1, 0),
(26, ' Fantasy', ' Fantasy', 'fantasy', 1, 0),
(27, ' Sci-Fi', ' Sci-Fi', 'sci-fi', 1, 0),
(28, ' Comedy', ' Comedy', 'comedy', 1, 0),
(29, ' Family', ' Family', 'family', 1, 0),
(30, ' Action', ' Action', 'action', 1, 0),
(31, 'Short', 'Short', 'short', 1, 0),
(32, ' Music', ' Music', 'music', 1, 0),
(33, ' History', ' History', 'history', 1, 0),
(34, ' Crime', ' Crime', 'crime', 1, 0),
(35, ' Western', ' Western', 'western', 1, 0),
(36, ' Sport', ' Sport', 'sport', 1, 0),
(37, ' Short', ' Short', 'short', 1, 0),
(38, ' Mystery', ' Mystery', 'mystery', 1, 0),
(39, 'Romance', 'Romance', 'romance', 1, 0),
(40, 'Action & Adventure', 'Action & Adventure', 'action-adventure', 1, 0),
(41, 'Sci-Fi & Fantasy', 'Sci-Fi & Fantasy', 'sci-fi-fantasy', 1, 0),
(42, 'Science Fiction', 'Science Fiction', 'science-fiction', 1, 0),
(44, 'TV Movie', 'TV Movie', 'tv-movie', 1, 0),
(45, 'News', 'News', 'news', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages_iso`
--

DROP TABLE IF EXISTS `languages_iso`;
CREATE TABLE IF NOT EXISTS `languages_iso` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(49) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages_iso`
--

INSERT INTO `languages_iso` (`id`, `name`, `iso`) VALUES
(1, 'English', 'en'),
(2, 'Afar', 'aa'),
(3, 'Abkhazian', 'ab'),
(4, 'Afrikaans', 'af'),
(5, 'Amharic', 'am'),
(6, 'Arabic', 'ar'),
(7, 'Assamese', 'as'),
(8, 'Aymara', 'ay'),
(9, 'Azerbaijani', 'az'),
(10, 'Bashkir', 'ba'),
(11, 'Belarusian', 'be'),
(12, 'Bulgarian', 'bg'),
(13, 'Bihari', 'bh'),
(14, 'Bislama', 'bi'),
(15, 'Bangla', 'bn'),
(16, 'Tibetan', 'bo'),
(17, 'Breton', 'br'),
(18, 'Catalan', 'ca'),
(19, 'Corsican', 'co'),
(20, 'Czech', 'cs'),
(21, 'Welsh', 'cy'),
(22, 'Danish', 'da'),
(23, 'German', 'de'),
(24, 'Bhutani', 'dz'),
(25, 'Greek', 'el'),
(26, 'Esperanto', 'eo'),
(27, 'Spanish', 'es'),
(28, 'Estonian', 'et'),
(29, 'Basque', 'eu'),
(30, 'Persian', 'fa'),
(31, 'Finnish', 'fi'),
(32, 'Fiji', 'fj'),
(33, 'Faeroese', 'fo'),
(34, 'French', 'fr'),
(35, 'Frisian', 'fy'),
(36, 'Irish', 'ga'),
(37, 'Scots/Gaelic', 'gd'),
(38, 'Galician', 'gl'),
(39, 'Guarani', 'gn'),
(40, 'Gujarati', 'gu'),
(41, 'Hausa', 'ha'),
(42, 'Hindi', 'hi'),
(43, 'Croatian', 'hr'),
(44, 'Hungarian', 'hu'),
(45, 'Armenian', 'hy'),
(46, 'Interlingua', 'ia'),
(47, 'Interlingue', 'ie'),
(48, 'Inupiak', 'ik'),
(49, 'Indonesian', 'in'),
(50, 'Icelandic', 'is'),
(51, 'Italian', 'it'),
(52, 'Hebrew', 'iw'),
(53, 'Japanese', 'ja'),
(54, 'Yiddish', 'ji'),
(55, 'Javanese', 'jw'),
(56, 'Georgian', 'ka'),
(57, 'Kazakh', 'kk'),
(58, 'Greenlandic', 'kl'),
(59, 'Cambodian', 'km'),
(60, 'Kannada', 'kn'),
(61, 'Korean', 'ko'),
(62, 'Kashmiri', 'ks'),
(63, 'Kurdish', 'ku'),
(64, 'Kirghiz', 'ky'),
(65, 'Latin', 'la'),
(66, 'Lingala', 'ln'),
(67, 'Laothian', 'lo'),
(68, 'Lithuanian', 'lt'),
(69, 'Latvian/Lettish', 'lv'),
(70, 'Malagasy', 'mg'),
(71, 'Maori', 'mi'),
(72, 'Macedonian', 'mk'),
(73, 'Malayalam', 'ml'),
(74, 'Mongolian', 'mn'),
(75, 'Moldavian', 'mo'),
(76, 'Marathi', 'mr'),
(77, 'Malay', 'ms'),
(78, 'Maltese', 'mt'),
(79, 'Burmese', 'my'),
(80, 'Nauru', 'na'),
(81, 'Nepali', 'ne'),
(82, 'Dutch', 'nl'),
(83, 'Norwegian', 'no'),
(84, 'Occitan', 'oc'),
(85, '(Afan)/Oromoor/Oriya', 'om'),
(86, 'Punjabi', 'pa'),
(87, 'Polish', 'pl'),
(88, 'Pashto/Pushto', 'ps'),
(89, 'Portuguese', 'pt'),
(90, 'Quechua', 'qu'),
(91, 'Rhaeto-Romance', 'rm'),
(92, 'Kirundi', 'rn'),
(93, 'Romanian', 'ro'),
(94, 'Russian', 'ru'),
(95, 'Kinyarwanda', 'rw'),
(96, 'Sanskrit', 'sa'),
(97, 'Sindhi', 'sd'),
(98, 'Sangro', 'sg'),
(99, 'Serbo-Croatian', 'sh'),
(100, 'Singhalese', 'si'),
(101, 'Slovak', 'sk'),
(102, 'Slovenian', 'sl'),
(103, 'Samoan', 'sm'),
(104, 'Shona', 'sn'),
(105, 'Somali', 'so'),
(106, 'Albanian', 'sq'),
(107, 'Serbian', 'sr'),
(108, 'Siswati', 'ss'),
(109, 'Sesotho', 'st'),
(110, 'Sundanese', 'su'),
(111, 'Swedish', 'sv'),
(112, 'Swahili', 'sw'),
(113, 'Tamil', 'ta'),
(114, 'Telugu', 'te'),
(115, 'Tajik', 'tg'),
(116, 'Thai', 'th'),
(117, 'Tigrinya', 'ti'),
(118, 'Turkmen', 'tk'),
(119, 'Tagalog', 'tl'),
(120, 'Setswana', 'tn'),
(121, 'Tonga', 'to'),
(122, 'Turkish', 'tr'),
(123, 'Tsonga', 'ts'),
(124, 'Tatar', 'tt'),
(125, 'Twi', 'tw'),
(126, 'Ukrainian', 'uk'),
(127, 'Urdu', 'ur'),
(128, 'Uzbek', 'uz'),
(129, 'Vietnamese', 'vi'),
(130, 'Volapuk', 'vo'),
(131, 'Wolof', 'wo'),
(132, 'Xhosa', 'xh'),
(133, 'Yoruba', 'yo'),
(134, 'Chinese', 'zh'),
(135, 'Zulu', 'zu');

-- --------------------------------------------------------

--
-- Table structure for table `live_tv`
--

DROP TABLE IF EXISTS `live_tv`;
CREATE TABLE IF NOT EXISTS `live_tv` (
  `live_tv_id` int(11) NOT NULL AUTO_INCREMENT,
  `tv_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_tv_category_id` int(50) DEFAULT NULL,
  `slug` longtext COLLATE utf8_unicode_ci,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'en',
  `stream_from` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_label` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poster` longtext COLLATE utf8_unicode_ci,
  `thumbnail` longtext COLLATE utf8_unicode_ci,
  `focus_keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(2) DEFAULT '1',
  `tags` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `publish` int(10) UNSIGNED DEFAULT '0',
  PRIMARY KEY (`live_tv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_tv_category`
--

DROP TABLE IF EXISTS `live_tv_category`;
CREATE TABLE IF NOT EXISTS `live_tv_category` (
  `live_tv_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_tv_category` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_tv_category_desc` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`live_tv_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `live_tv_category`
--

INSERT INTO `live_tv_category` (`live_tv_category_id`, `live_tv_category`, `live_tv_category_desc`, `status`) VALUES
(1, 'Sports', 'Sport TV Channels', 1);

-- --------------------------------------------------------

--
-- Table structure for table `live_tv_program_guide`
--

DROP TABLE IF EXISTS `live_tv_program_guide`;
CREATE TABLE IF NOT EXISTS `live_tv_program_guide` (
  `live_tv_program_guide_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_tv_id` int(50) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `video_url` text COLLATE utf8_unicode_ci,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` enum('onaired','upcoming') COLLATE utf8_unicode_ci DEFAULT 'upcoming',
  `status` int(50) NOT NULL DEFAULT '1',
  PRIMARY KEY (`live_tv_program_guide_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_tv_url`
--

DROP TABLE IF EXISTS `live_tv_url`;
CREATE TABLE IF NOT EXISTS `live_tv_url` (
  `live_tv_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_tv_id` int(11) DEFAULT NULL,
  `url_for` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`live_tv_url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
CREATE TABLE IF NOT EXISTS `quality` (
  `quality_id` int(10) NOT NULL AUTO_INCREMENT,
  `quality` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(5) DEFAULT '1',
  PRIMARY KEY (`quality_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quality`
--

INSERT INTO `quality` (`quality_id`, `quality`, `description`, `status`) VALUES
(1, '4K', 'High Defination', 1),
(2, 'HD', 'Sandard Defination', 1),
(3, 'SD', 'Ultra High Defination', 1),
(4, 'CAM', 'Web Camera Video', 1),
(7, 'LQ', 'Low Quality', 1),
(8, 'DVD', 'Digital Video Device', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
CREATE TABLE IF NOT EXISTS `seasons` (
  `seasons_id` int(11) NOT NULL AUTO_INCREMENT,
  `videos_id` int(11) DEFAULT NULL,
  `seasons_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish` int(11) DEFAULT '1',
  PRIMARY KEY (`seasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `slider_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `video_link` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `publication` int(1) NOT NULL,
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
CREATE TABLE IF NOT EXISTS `star` (
  `star_id` int(10) NOT NULL AUTO_INCREMENT,
  `star_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `star_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `star_desc` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`star_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subtitle`
--

DROP TABLE IF EXISTS `subtitle`;
CREATE TABLE IF NOT EXISTS `subtitle` (
  `subtitle_id` int(11) NOT NULL AUTO_INCREMENT,
  `videos_id` int(50) NOT NULL,
  `video_file_id` int(50) DEFAULT NULL,
  `language` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `src` mediumtext COLLATE utf8_unicode_ci,
  `srclang` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `common` int(2) DEFAULT '0',
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`subtitle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tvseries_subtitle`
--

DROP TABLE IF EXISTS `tvseries_subtitle`;
CREATE TABLE IF NOT EXISTS `tvseries_subtitle` (
  `tvseries_subtitle_id` int(11) NOT NULL AUTO_INCREMENT,
  `videos_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `episodes_id` int(250) DEFAULT NULL,
  `language` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `src` mediumtext COLLATE utf8_unicode_ci,
  `srclang` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `common` int(2) DEFAULT '0',
  `status` int(2) DEFAULT '1',
  PRIMARY KEY (`tvseries_subtitle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(2) DEFAULT '1',
  `role` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8_unicode_ci,
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'default',
  `theme_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT '#16163F',
  `join_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `deactivate_reason` text COLLATE utf8_unicode_ci,
  `status` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `slug`, `username`, `email`, `password`, `gender`, `role`, `token`, `theme`, `theme_color`, `join_date`, `last_login`, `status`) VALUES
(1, 'admin_name', 'admin-name', 'admin_username', 'my_admin_email', 'admin_password', 0, 'admin', '', 'default', '#16163F', '2019-01-01 00:00:00', '2019-03-21 16:42:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `videos_id` int(11) NOT NULL AUTO_INCREMENT,
  `imdbid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `stars` varchar(250) COLLATE utf8_unicode_ci DEFAULT '',
  `director` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writer` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` varchar(5) COLLATE utf8_unicode_ci DEFAULT '0',
  `release` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runtime` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_quality` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'HD',
  `publication` int(5) DEFAULT NULL,
  `trailer` int(5) DEFAULT '0',
  `enable_download` int(5) DEFAULT '1',
  `focus_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `tags` text COLLATE utf8_unicode_ci,
  `imdb_rating` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_tvseries` int(11) NOT NULL DEFAULT '0',
  `total_rating` int(50) DEFAULT '1',
  `today_view` int(250) DEFAULT '0',
  `weekly_view` int(250) DEFAULT '0',
  `monthly_view` int(250) DEFAULT '0',
  `total_view` int(250) DEFAULT '1',
  PRIMARY KEY (`videos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_file`
--

DROP TABLE IF EXISTS `video_file`;
CREATE TABLE IF NOT EXISTS `video_file` (
  `video_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videos_id` int(11) DEFAULT NULL,
  `file_source` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`video_file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
CREATE TABLE IF NOT EXISTS `wish_list` (
  `wish_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `wish_list_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `videos_id` int(11) DEFAULT NULL,
  `episodes_id` int(200) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`wish_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
