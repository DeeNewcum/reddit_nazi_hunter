CREATE TABLE `accounts` (
  `accountname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`accountname`),
  UNIQUE KEY `accountname_UNIQUE` (`accountname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `comments` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subreddit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumblob NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_comments_1` (`subreddit`),
  KEY `fk_comments_2` (`author`),
  CONSTRAINT `fk_comments_1` FOREIGN KEY (`subreddit`) REFERENCES `subreddits` (`subredditname`),
  CONSTRAINT `fk_comments_2` FOREIGN KEY (`author`) REFERENCES `accounts` (`accountname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `domain_UNIQUE` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `links` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selftext` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subreddit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `subreddit_idx` (`subreddit`),
  KEY `author_idx` (`account`),
  KEY `fk_links_2_idx` (`domain`),
  CONSTRAINT `fk_links_1` FOREIGN KEY (`subreddit`) REFERENCES `subreddits` (`subredditname`),
  CONSTRAINT `fk_links_2` FOREIGN KEY (`domain`) REFERENCES `domains` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mq` (
  `order` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(45) NOT NULL,
  `args` mediumblob,
  PRIMARY KEY (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subreddits` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subredditname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned` int(11) DEFAULT '0',
  PRIMARY KEY (`subredditname`),
  UNIQUE KEY `srname_UNIQUE` (`subredditname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
