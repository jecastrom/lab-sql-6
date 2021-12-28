/*
 Creating the new table:
 */
DROP TABLE IF EXISTS films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) UNSIGNED NOT NULL,
  `original_language_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4, 2),
  `length` smallint(5) UNSIGNED DEFAULT NULL,
  `replacement_cost` decimal(5, 2) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 DEFAULT CHARSET = utf8;
SHOW VARIABLES LIKE 'local_infile';
/*
 Setting the bulk import option to ON:
 */
SET
  GLOBAL local_infile = 1;
/*
 Finding the MySQL secure upload folder:
 */
SHOW VARIABLES
WHERE
  variable_name = 'secure_file_priv';
/*
 Loading the data:
 */
LOAD data INFILE '/ProgramData/MySQL/MySQL Server 8.0/Uploads/films_2020.csv' INTO TABLE films_2020 FIELDS TERMINATED by ',' LINES TERMINATED by '\n' IGNORE 1 LINES;
/*
 Update information on `rental_duration`, `rental_rate`, and `replacement_cost`
 */
UPDATE
  films_2020
SET
  rental_duration = (3),
  rental_rate = (2.99),
  replacement_cost = (8.99);