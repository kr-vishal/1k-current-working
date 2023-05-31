-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2021 at 11:29 PM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `my_team_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_table`
--

CREATE TABLE `action_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answers_table`
--

CREATE TABLE `answers_table` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_table`
--

CREATE TABLE `article_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `views` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_table`
--

CREATE TABLE `club_table` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_table`
--

CREATE TABLE `comment_table` (
  `id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competition_table`
--

CREATE TABLE `competition_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `season` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_table`
--

CREATE TABLE `country_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_table`
--

CREATE TABLE `device_table` (
  `id` int(11) NOT NULL,
  `token` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_table`
--

CREATE TABLE `event_table` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fos_user_table`
--

CREATE TABLE `fos_user_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `born` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trusted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `credentials_expired` tinyint(1) NOT NULL,
  `token` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user_table`
--

INSERT INTO `fos_user_table` (`id`, `media_id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `name`, `theme`, `type`, `emailu`, `born`, `gender`, `trusted`, `locked`, `expired`, `credentials_expired`, `token`) VALUES
(1, 4, 'ADMIN', 'admin', 'ADMIN', 'admin', 1, 'djtfgbufxr4gwk4k0gss4sgs4k48wc4', '$2y$13$djtfgbufxr4gwk4k0gss4ekodAwfJ3IP01OyKvMD.stoxgr6MMa2S', '2021-04-26 20:53:12', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 'Football Club Athletic', NULL, 'email', NULL, NULL, NULL, 1, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_table`
--

CREATE TABLE `gallery_table` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `infos_table`
--

CREATE TABLE `infos_table` (
  `id` int(11) NOT NULL,
  `club_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `away` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `home` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `line_table`
--

CREATE TABLE `line_table` (
  `id` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `row1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `match_table`
--

CREATE TABLE `match_table` (
  `id` int(11) NOT NULL,
  `home_club_id` int(11) NOT NULL,
  `away_club_id` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `awayresult` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homeresult` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `awaysubresult` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homesubresult` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stadium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `highlights` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medias_gallerys_table`
--

CREATE TABLE `medias_gallerys_table` (
  `gallery_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_table`
--

CREATE TABLE `media_table` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `media_table`
--

INSERT INTO `media_table` (`id`, `titre`, `url`, `type`, `extension`, `date`, `enabled`) VALUES
(1, 'Sans titre-3.png', '1d38322d285b1767c5bde6a020aac05f.png', 'image/png', 'png', '2019-11-19 22:21:00', 1),
(2, 'football-club.png', '857a261a5cb63189a8991b535ef229e1.png', 'image/png', 'png', '2021-01-12 20:19:35', 1),
(3, 'Sans titre-122.png', '05d82ebd1be751589b74fb95fdc9c3f9.png', 'image/png', 'png', '2021-01-12 20:20:27', 1),
(4, 'logo_admin.png', 'c28c19165e78f7dd8da0d10ea5577931.png', 'image/png', 'png', '2021-04-21 00:17:38', 1),
(9, 'twitter-logo-on-black-background.png', '24f859c36dfca1dcb36d5902a3b360a3.png', 'image/png', 'png', '2021-04-21 01:53:42', 1),
(10, 'youtube (1).png', 'b61fe6699fc1b264c0c4268ca5d5a18e.png', 'image/png', 'png', '2021-04-21 01:55:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_table`
--

CREATE TABLE `player_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `born` date NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `height` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position_table`
--

CREATE TABLE `position_table` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_table`
--

CREATE TABLE `post_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `localvideo_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `views` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `comment` tinyint(1) NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shares` int(11) NOT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_table`
--

CREATE TABLE `question_table` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `open` tinyint(1) NOT NULL,
  `multi` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_table`
--

CREATE TABLE `settings_table` (
  `id` int(11) NOT NULL,
  `logo_id` int(11) DEFAULT NULL,
  `star_id` int(11) DEFAULT NULL,
  `sponsors_id` int(11) DEFAULT NULL,
  `appname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appsubname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firebasekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewnotification` tinyint(1) NOT NULL,
  `commentnotification` tinyint(1) NOT NULL,
  `appdescription` longtext COLLATE utf8_unicode_ci,
  `googleplay` longtext COLLATE utf8_unicode_ci,
  `appstore` longtext COLLATE utf8_unicode_ci,
  `privacypolicy` longtext COLLATE utf8_unicode_ci,
  `rewardedadmobid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banneradmobid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannerfacebookid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannertype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativeadmobid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativefacebookid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativeitem` int(11) DEFAULT NULL,
  `nativetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialadmobid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialfacebookid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialclick` int(11) DEFAULT NULL,
  `rewardedadmobidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banneradmobidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannerfacebookidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannertypeios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativeadmobidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativefacebookidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativeitemios` int(11) DEFAULT NULL,
  `nativetypeios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialadmobidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialfacebookidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialtypeios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interstitialclickios` int(11) DEFAULT NULL,
  `publisherid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisheridios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appidios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings_table`
--

INSERT INTO `settings_table` (`id`, `logo_id`, `star_id`, `sponsors_id`, `appname`, `appsubname`, `firebasekey`, `reviewnotification`, `commentnotification`, `appdescription`, `googleplay`, `appstore`, `privacypolicy`, `rewardedadmobid`, `banneradmobid`, `bannerfacebookid`, `bannertype`, `nativeadmobid`, `nativefacebookid`, `nativeitem`, `nativetype`, `interstitialadmobid`, `interstitialfacebookid`, `interstitialtype`, `interstitialclick`, `rewardedadmobidios`, `banneradmobidios`, `bannerfacebookidios`, `bannertypeios`, `nativeadmobidios`, `nativefacebookidios`, `nativeitemios`, `nativetypeios`, `interstitialadmobidios`, `interstitialfacebookidios`, `interstitialtypeios`, `interstitialclickios`, `publisherid`, `publisheridios`, `appid`, `appidios`) VALUES
(2, 2, 1, 3, 'Football Club Athletic', '#More Than App#', 'AAAAfBJ56Hw:APA91bHRusbNJcauEYlcCMvAOMWTiltNxjwgQ6TGfKkF6M9K_uDfzVS4EpjHg-ms_MIu7T0B2ZOk2x0rWYxkBYyEgw6U_r99J_PmS4dBtcaJJ5gkkGKK5lli-_oDNTTZuaHe2WxukAuC', 1, 1, 'Football Club Athletic - Demo app .', 'https://play.google.com/store/apps/details?id=com.virmana.my_team', 'https://play.google.com/store/apps/details?id=com.virmana.my_team', '<h4>Priacy Policy</h4>', 'ca-app-pub-xxxxxxxxxxxxxxx/xxxxxxxxxxxxxxx', 'ca-app-pub-3940256099942544/6300978111', 'IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047', 'BOTH', 'ca-app-pub-3940256099942544/8135179316', 'IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512', 4, 'BOTH', 'ca-app-pub-3940256099942544/1033173712', 'IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617', 'BOTH', 2, NULL, 'ca-app-pub-3940256099942544/2934735716', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', 'BOTH', 'ca-app-pub-3940256099942544/3986624511', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', 2, 'BOTH', 'ca-app-pub-3940256099942544/4411468910', 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID', 'BOTH', 3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `socials_table`
--

CREATE TABLE `socials_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `social` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `socials_table`
--

INSERT INTO `socials_table` (`id`, `media_id`, `player_id`, `social`, `position`, `value`, `username`, `color`) VALUES
(3, 9, NULL, 'Twitter', 1, 'https://twitter.com/Twitter', '@Twitter', '00ACEE'),
(4, 10, NULL, 'Youtube', 2, 'https://www.youtube.com/user/Google', '@youtube', 'FF0000');

-- --------------------------------------------------------

--
-- Table structure for table `staff_table`
--

CREATE TABLE `staff_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `bio` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statistics_table`
--

CREATE TABLE `statistics_table` (
  `id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `statistic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_table`
--

CREATE TABLE `status_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `quote` longtext COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `likes` int(11) NOT NULL,
  `shares` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `review` tinyint(1) NOT NULL,
  `comment` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_table`
--

CREATE TABLE `support_table` (
  `id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_table`
--

CREATE TABLE `table_table` (
  `id` int(11) NOT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `columns` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_table`
--

CREATE TABLE `team_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `icon_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trophy_table`
--

CREATE TABLE `trophy_table` (
  `id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `icon_id` int(11) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `number` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `version_table`
--

CREATE TABLE `version_table` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `features` longtext COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_table`
--
ALTER TABLE `action_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_11E743FAEA9FDD75` (`media_id`);

--
-- Indexes for table `answers_table`
--
ALTER TABLE `answers_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_86F50A951E27F6BF` (`question_id`);

--
-- Indexes for table `article_table`
--
ALTER TABLE `article_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_819EFD57EA9FDD75` (`media_id`),
  ADD KEY `IDX_819EFD57296CD8AE` (`team_id`);

--
-- Indexes for table `club_table`
--
ALTER TABLE `club_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5647A5F4F92F3E70` (`country_id`),
  ADD KEY `IDX_5647A5F4EA9FDD75` (`media_id`);

--
-- Indexes for table `comment_table`
--
ALTER TABLE `comment_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5FB317B76BF700BD` (`status_id`),
  ADD KEY `IDX_5FB317B74B89032C` (`post_id`),
  ADD KEY `IDX_5FB317B7A76ED395` (`user_id`);

--
-- Indexes for table `competition_table`
--
ALTER TABLE `competition_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_59EBD90EA9FDD75` (`media_id`);

--
-- Indexes for table `country_table`
--
ALTER TABLE `country_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_51C99AACEA9FDD75` (`media_id`);

--
-- Indexes for table `device_table`
--
ALTER TABLE `device_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_table`
--
ALTER TABLE `event_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B7323E6A2ABEACD6` (`match_id`),
  ADD KEY `IDX_B7323E6A9D32F035` (`action_id`);

--
-- Indexes for table `fos_user_table`
--
ALTER TABLE `fos_user_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C3D4D4BD92FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_C3D4D4BDA0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_C3D4D4BDC05FB297` (`confirmation_token`),
  ADD KEY `IDX_C3D4D4BDEA9FDD75` (`media_id`);

--
-- Indexes for table `gallery_table`
--
ALTER TABLE `gallery_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infos_table`
--
ALTER TABLE `infos_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9D16F6461190A32` (`club_id`);

--
-- Indexes for table `line_table`
--
ALTER TABLE `line_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9ADA8C5ECFF285C` (`table_id`),
  ADD KEY `IDX_9ADA8C561190A32` (`club_id`);

--
-- Indexes for table `match_table`
--
ALTER TABLE `match_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4843F0E7D439C16A` (`home_club_id`),
  ADD KEY `IDX_4843F0E7D6D8F9E` (`away_club_id`),
  ADD KEY `IDX_4843F0E77B39D312` (`competition_id`);

--
-- Indexes for table `medias_gallerys_table`
--
ALTER TABLE `medias_gallerys_table`
  ADD PRIMARY KEY (`gallery_id`,`media_id`),
  ADD KEY `IDX_CC965DCE4E7AF8F` (`gallery_id`),
  ADD KEY `IDX_CC965DCEEA9FDD75` (`media_id`);

--
-- Indexes for table `media_table`
--
ALTER TABLE `media_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_table`
--
ALTER TABLE `player_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_495BF400EA9FDD75` (`media_id`),
  ADD KEY `IDX_495BF400DD842E46` (`position_id`),
  ADD KEY `IDX_495BF400F92F3E70` (`country_id`);

--
-- Indexes for table `position_table`
--
ALTER TABLE `position_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7AE96B9B296CD8AE` (`team_id`);

--
-- Indexes for table `post_table`
--
ALTER TABLE `post_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_613203A9EA9FDD75` (`media_id`),
  ADD KEY `IDX_613203A9C05CE4BE` (`localvideo_id`);

--
-- Indexes for table `question_table`
--
ALTER TABLE `question_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_table`
--
ALTER TABLE `settings_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4EF0C90FF98F144A` (`logo_id`),
  ADD KEY `IDX_4EF0C90F2C3B70D7` (`star_id`),
  ADD KEY `IDX_4EF0C90FFB0F2BBC` (`sponsors_id`);

--
-- Indexes for table `socials_table`
--
ALTER TABLE `socials_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6A4752EEEA9FDD75` (`media_id`),
  ADD KEY `IDX_6A4752EE99E6F5DF` (`player_id`);

--
-- Indexes for table `staff_table`
--
ALTER TABLE `staff_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8BCC2781EA9FDD75` (`media_id`),
  ADD KEY `IDX_8BCC2781296CD8AE` (`team_id`);

--
-- Indexes for table `statistics_table`
--
ALTER TABLE `statistics_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EC454DD99E6F5DF` (`player_id`);

--
-- Indexes for table `status_table`
--
ALTER TABLE `status_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_173DEB6EA9FDD75` (`media_id`),
  ADD KEY `IDX_173DEB6A76ED395` (`user_id`),
  ADD KEY `IDX_173DEB629C1004E` (`video_id`);

--
-- Indexes for table `support_table`
--
ALTER TABLE `support_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_493999E6BF700BD` (`status_id`);

--
-- Indexes for table `table_table`
--
ALTER TABLE `table_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FAD5423E7B39D312` (`competition_id`);

--
-- Indexes for table `team_table`
--
ALTER TABLE `team_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_312FC606EA9FDD75` (`media_id`),
  ADD KEY `IDX_312FC60654B9D732` (`icon_id`);

--
-- Indexes for table `trophy_table`
--
ALTER TABLE `trophy_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9DB5E771EA9FDD75` (`media_id`),
  ADD KEY `IDX_9DB5E77154B9D732` (`icon_id`),
  ADD KEY `IDX_9DB5E771296CD8AE` (`team_id`);

--
-- Indexes for table `version_table`
--
ALTER TABLE `version_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action_table`
--
ALTER TABLE `action_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answers_table`
--
ALTER TABLE `answers_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_table`
--
ALTER TABLE `article_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_table`
--
ALTER TABLE `club_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment_table`
--
ALTER TABLE `comment_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competition_table`
--
ALTER TABLE `competition_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_table`
--
ALTER TABLE `country_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_table`
--
ALTER TABLE `device_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_table`
--
ALTER TABLE `event_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fos_user_table`
--
ALTER TABLE `fos_user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery_table`
--
ALTER TABLE `gallery_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `infos_table`
--
ALTER TABLE `infos_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_table`
--
ALTER TABLE `line_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `match_table`
--
ALTER TABLE `match_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_table`
--
ALTER TABLE `media_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `player_table`
--
ALTER TABLE `player_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position_table`
--
ALTER TABLE `position_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_table`
--
ALTER TABLE `post_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_table`
--
ALTER TABLE `question_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings_table`
--
ALTER TABLE `settings_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `socials_table`
--
ALTER TABLE `socials_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_table`
--
ALTER TABLE `staff_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statistics_table`
--
ALTER TABLE `statistics_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_table`
--
ALTER TABLE `status_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_table`
--
ALTER TABLE `support_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_table`
--
ALTER TABLE `table_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_table`
--
ALTER TABLE `team_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trophy_table`
--
ALTER TABLE `trophy_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `version_table`
--
ALTER TABLE `version_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `action_table`
--
ALTER TABLE `action_table`
  ADD CONSTRAINT `FK_11E743FAEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `answers_table`
--
ALTER TABLE `answers_table`
  ADD CONSTRAINT `FK_86F50A951E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question_table` (`id`);

--
-- Constraints for table `article_table`
--
ALTER TABLE `article_table`
  ADD CONSTRAINT `FK_819EFD57296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team_table` (`id`),
  ADD CONSTRAINT `FK_819EFD57EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `club_table`
--
ALTER TABLE `club_table`
  ADD CONSTRAINT `FK_5647A5F4EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_5647A5F4F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country_table` (`id`);

--
-- Constraints for table `comment_table`
--
ALTER TABLE `comment_table`
  ADD CONSTRAINT `FK_5FB317B74B89032C` FOREIGN KEY (`post_id`) REFERENCES `post_table` (`id`),
  ADD CONSTRAINT `FK_5FB317B76BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status_table` (`id`),
  ADD CONSTRAINT `FK_5FB317B7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_table` (`id`);

--
-- Constraints for table `competition_table`
--
ALTER TABLE `competition_table`
  ADD CONSTRAINT `FK_59EBD90EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `country_table`
--
ALTER TABLE `country_table`
  ADD CONSTRAINT `FK_51C99AACEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `event_table`
--
ALTER TABLE `event_table`
  ADD CONSTRAINT `FK_B7323E6A2ABEACD6` FOREIGN KEY (`match_id`) REFERENCES `match_table` (`id`),
  ADD CONSTRAINT `FK_B7323E6A9D32F035` FOREIGN KEY (`action_id`) REFERENCES `action_table` (`id`);

--
-- Constraints for table `fos_user_table`
--
ALTER TABLE `fos_user_table`
  ADD CONSTRAINT `FK_C3D4D4BDEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `infos_table`
--
ALTER TABLE `infos_table`
  ADD CONSTRAINT `FK_B9D16F6461190A32` FOREIGN KEY (`club_id`) REFERENCES `match_table` (`id`);

--
-- Constraints for table `line_table`
--
ALTER TABLE `line_table`
  ADD CONSTRAINT `FK_9ADA8C561190A32` FOREIGN KEY (`club_id`) REFERENCES `club_table` (`id`),
  ADD CONSTRAINT `FK_9ADA8C5ECFF285C` FOREIGN KEY (`table_id`) REFERENCES `table_table` (`id`);

--
-- Constraints for table `match_table`
--
ALTER TABLE `match_table`
  ADD CONSTRAINT `FK_4843F0E77B39D312` FOREIGN KEY (`competition_id`) REFERENCES `competition_table` (`id`),
  ADD CONSTRAINT `FK_4843F0E7D439C16A` FOREIGN KEY (`home_club_id`) REFERENCES `club_table` (`id`),
  ADD CONSTRAINT `FK_4843F0E7D6D8F9E` FOREIGN KEY (`away_club_id`) REFERENCES `club_table` (`id`);

--
-- Constraints for table `medias_gallerys_table`
--
ALTER TABLE `medias_gallerys_table`
  ADD CONSTRAINT `FK_CC965DCE4E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `gallery_table` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CC965DCEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_table`
--
ALTER TABLE `player_table`
  ADD CONSTRAINT `FK_495BF400DD842E46` FOREIGN KEY (`position_id`) REFERENCES `position_table` (`id`),
  ADD CONSTRAINT `FK_495BF400EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_495BF400F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country_table` (`id`);

--
-- Constraints for table `position_table`
--
ALTER TABLE `position_table`
  ADD CONSTRAINT `FK_7AE96B9B296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team_table` (`id`);

--
-- Constraints for table `post_table`
--
ALTER TABLE `post_table`
  ADD CONSTRAINT `FK_613203A9C05CE4BE` FOREIGN KEY (`localvideo_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_613203A9EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `settings_table`
--
ALTER TABLE `settings_table`
  ADD CONSTRAINT `FK_4EF0C90F2C3B70D7` FOREIGN KEY (`star_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_4EF0C90FF98F144A` FOREIGN KEY (`logo_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_4EF0C90FFB0F2BBC` FOREIGN KEY (`sponsors_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `socials_table`
--
ALTER TABLE `socials_table`
  ADD CONSTRAINT `FK_6A4752EE99E6F5DF` FOREIGN KEY (`player_id`) REFERENCES `player_table` (`id`),
  ADD CONSTRAINT `FK_6A4752EEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `staff_table`
--
ALTER TABLE `staff_table`
  ADD CONSTRAINT `FK_8BCC2781296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team_table` (`id`),
  ADD CONSTRAINT `FK_8BCC2781EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `statistics_table`
--
ALTER TABLE `statistics_table`
  ADD CONSTRAINT `FK_6EC454DD99E6F5DF` FOREIGN KEY (`player_id`) REFERENCES `player_table` (`id`);

--
-- Constraints for table `status_table`
--
ALTER TABLE `status_table`
  ADD CONSTRAINT `FK_173DEB629C1004E` FOREIGN KEY (`video_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_173DEB6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_table` (`id`),
  ADD CONSTRAINT `FK_173DEB6EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `support_table`
--
ALTER TABLE `support_table`
  ADD CONSTRAINT `FK_493999E6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status_table` (`id`);

--
-- Constraints for table `table_table`
--
ALTER TABLE `table_table`
  ADD CONSTRAINT `FK_FAD5423E7B39D312` FOREIGN KEY (`competition_id`) REFERENCES `competition_table` (`id`);

--
-- Constraints for table `team_table`
--
ALTER TABLE `team_table`
  ADD CONSTRAINT `FK_312FC60654B9D732` FOREIGN KEY (`icon_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_312FC606EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);

--
-- Constraints for table `trophy_table`
--
ALTER TABLE `trophy_table`
  ADD CONSTRAINT `FK_9DB5E771296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team_table` (`id`),
  ADD CONSTRAINT `FK_9DB5E77154B9D732` FOREIGN KEY (`icon_id`) REFERENCES `media_table` (`id`),
  ADD CONSTRAINT `FK_9DB5E771EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media_table` (`id`);
