
-- set @file_path = "C:\Users\jcast\lab-sql-6\files_for_lab\films_2020.csv";
-- set @file_path = replace(@file_path, '\\', '\\\\');
-- select @file_path;

load data local infile "C:\\Users\\jcast\\lab-sql-6\\files_for_lab\\films_2020.csv"
into table film
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(film_id,title,`description`,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating);

