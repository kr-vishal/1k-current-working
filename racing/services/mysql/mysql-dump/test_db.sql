CREATE DATABASE racing;

use racing;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payload` json DEFAULT NULL,
  `user_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- racing.races definition

CREATE TABLE `races` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` tinyint DEFAULT '1',
  `race_date` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- racing.analytics definition

CREATE TABLE `analytics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data` json DEFAULT NULL,
  `user_ip` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- racing.racers definition

CREATE TABLE `racers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `rank` smallint unsigned DEFAULT '0',
  `points` smallint unsigned DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data in the tables
INSERT INTO races (name, status, race_date, created_at) VALUES('Race 1', 1, '2023-05-01', '2023-04-29 00:00:00');
INSERT INTO races (name, status, race_date, created_at) VALUES('Race 2', 1, '2023-05-01', '2023-04-29 00:00:00');
INSERT INTO races (name, status, race_date, created_at) VALUES('Race 3', 1, '2023-05-01', '2023-04-29 00:00:00');
INSERT INTO races (name, status, race_date, created_at) VALUES('Race 4', 1, '2023-05-01', '2023-04-29 00:00:00');
INSERT INTO races (name, status, race_date, created_at) VALUES('Race 5', 1, '2023-05-01', '2023-04-29 00:00:00');
INSERT INTO races (name, status, race_date, created_at) VALUES('Race 6', 1, '2023-05-01', '2023-04-29 00:00:00');

INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('First', 'Racer', 1, 100, '2023-04-01 00:00:00');
INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('Second', 'Racer', 2, 90, '2023-04-01 00:00:00');
INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('Third', 'Racer', 3, 80, '2023-04-01 00:00:00');
INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('Fifth', 'Racer', 4, 70, '2023-04-01 00:00:00');
INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('Sixth', 'Racer', 5, 60, '2023-04-01 00:00:00');
INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('Seventh', 'Racer', 6, 55, '2023-04-01 00:00:00');
INSERT INTO racers (first_name, last_name, `rank`, points, created_at) VALUES('Eight', 'Racer', 7, 50, '2023-04-01 00:00:00');

