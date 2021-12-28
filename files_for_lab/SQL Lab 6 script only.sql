drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;





-- set @file_path = "C:\Users\jcast\lab-sql-6\files_for_lab\films_2020.csv";
-- set @file_path = replace(@file_path, 'a', 'A');
-- select @file_path;

show variables like 'local_infile';
set global local_infile = 1;

show variables
where variable_name = 'secure_file_priv';


load data infile '/ProgramData/MySQL/MySQL Server 8.0/Uploads/films_2020.csv' into table films_2020
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;


update films_2020
set rental_duration = (3), rental_rate = (2.99), replacement_cost = (8.99);



