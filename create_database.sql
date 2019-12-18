CREATE TABLE `accounts` (
  `accountname` varchar(45) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountname`),
  UNIQUE KEY `accountname_UNIQUE` (`accountname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comments` (
  `id` varchar(10) NOT NULL,
  `author` varchar(45) NOT NULL,
  `subredditid` varchar(10) NOT NULL,
  `body` mediumblob NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(45) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_UNIQUE` (`domain`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `links` (
  `id` varchar(10) NOT NULL,
  `title` varchar(256) NOT NULL,
  `url` varchar(256) DEFAULT NULL,
  `selftext` mediumblob,
  `account` varchar(45) NOT NULL,
  `subreddit` varchar(45) NOT NULL,
  `domain` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `subreddit_idx` (`subreddit`),
  KEY `author_idx` (`account`),
  CONSTRAINT `account` FOREIGN KEY (`account`) REFERENCES `accounts` (`accountname`),
  CONSTRAINT `subreddit` FOREIGN KEY (`subreddit`) REFERENCES `subreddits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mq` (
  `order` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(45) NOT NULL,
  `args` tinyblob,
  PRIMARY KEY (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subreddits` (
  `id` varchar(10) NOT NULL,
  `subredditname` varchar(45) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(45) DEFAULT NULL,
  `banned` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `srname_UNIQUE` (`subredditname`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
