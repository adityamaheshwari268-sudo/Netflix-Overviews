create database netflix_project
use netflix_project
--------------------------Data Verify--------------------------
select top 10 * from Netflix_data
----------------------Total Records------------------------------
select count(*) as total_content from Netflix_data
---------------------Movies v/s Tv Shows----------------------
select type,count(*) as total_number from Netflix_data group by type
-----------------------Top 10 Countries---------------------
select top 10 country,count(*) as totoal_content from Netflix_data group by country order by totoal_content desc
---------------------------Genre Analysis--------------------------
select top 10 listed_in,count(*) as totoal_content from Netflix_data group by listed_in order by totoal_content desc
------------------------content addedd per year--------------------
select release_year,count(*) as total_content from Netflix_data group by release_year order by release_year
------------------------------Top 10 Rating--------------------------------
select rating,count(*) as total_content from Netflix_data group by rating order by total_content desc
---------------------------------------Top 10 Directors--------------------------------
select top 10 director,count(*) as total_content from Netflix_data where director is not null group by director 
order by total_content desc
-------------------------------------------Oldest Content------------------------------------------
select top 10 title,release_year from Netflix_data order by release_year
-----------------------------------------Latest Content-------------------------------------
select top 10 title,release_year from Netflix_data order by release_year desc
----------------------------------Country-wise content------------------------------------------------
select country,count(*) as total_content from Netflix_data
where country is not null group by country order by total_content desc
---------------------------------------------------Movies longer than 120 minutes-----------------------------
select title,duration from Netflix_data where type='Movie' and try_cast(replace(duration,'min','') as int)>120
-------------------------------------------TV shows with most season--------------------------------------------
select top 10 title,duration from Netflix_data where type='TV Show'
order by try_cast(replace(duration,'Seasons','') as int) desc
------------------------------Year-wise growth--------------------------------------------
select release_year,count(*) as total_content from Netflix_data group by release_year
order by release_year
---------------------------------------------Rating-wise distribution---------------------------------
select rating,count(*) as total_content from Netflix_data group by rating order by total_content desc
----------------------------------------------------India vs USA content-----------------------------------
select country,count(*) as total_content from Netflix_data where country like
'%India%' or country like '%United States%' group by country order by total_content desc
---------------------------------------------Movies released after 2020-----------------------------------
select * from Netflix_data where type='Movie' and release_year > 2020
--------------------------------------------TV Shows released after 2020-----------------------------------
select * from Netflix_data where type='TV Show' and release_year > 2020
----------------------------------------------------Number of Unique Director--------------------------------------
select COUNT(distinct director) as unique_directors from Netflix_data
------------------------------------------------------------Number of Unique Countries--------------------------------------
select COUNT(distinct country) as unique_countries from Netflix_data
----------------------------------Most Common Movie Rating-------------------------------------
Select top 1 rating,COUNT(*) as total from Netflix_data group by rating order by total desc
--------------------------------------Content released in 2021--------------------------------
select count(*) as total_content from Netflix_data where release_year=2021
------------------------Longest Movie------------------------------
select top 1 title,duration from Netflix_data where type='Movie' 
order by try_cast(replace(duration,'min','')as int)desc
------------------------------Content Without Director--------------------------------
select count(*) as missing_director from Netflix_data where director is null
------------------------------Content Without Country--------------------------------
select count(*) as missing_country from Netflix_data where country is null
------------------------------Movies vs TV shows percentage-------------------------------------
select type,count(*)*100.0/sum(count(*)) over() as percentage from Netflix_data group by type
------------------------------------Top 5 release year----------------------------------------
select top 5 release_year,count(*) as total_content from Netflix_data group by release_year order by total_content desc
---------------------------------------Average content per year--------------------------------------
Select AVG(content_count) as avg_content_per_year from
(select release_year,count(*) as content_count from Netflix_data group by release_year) A
------------------------Top 10 Cast Members-------------------------------------
select top 10 cast, count(*) as total_content from Netflix_data where cast is not null group by cast 
order by total_content desc
--------------------------------------------------Movies Added On Netflix-----------------------------
Select COUNT(*) as movies from Netflix_data where type='Movie'
----------------------------------------------------------------TV Shows Added On Netflix-----------------------------------------
Select COUNT(*) as Tv_Shows from Netflix_data where type='TV Show'







