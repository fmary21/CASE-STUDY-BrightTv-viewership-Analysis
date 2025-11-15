--------Tables---------

select* from  bright_tv_user_profiles
select* from bright_tv_viewership

----------------------------------------------------------------------------------------------
----General checks---
select  count(*) from bright_tv_user_profiles
select count(*) from bright_tv_viewership

select MIN(Age) ,
       MAX(Age)
 from bright_tv_user_profiles

 select MIN(Duration2) ,
       MAX(Duration2)
 from bright_tv_viewership

 select count(UserID)
from bright_tv_viewership

select count(UserID)
from brihght_tv_userprofiles

select count(DISTINCT UserID)
from bright_tv_viewership

select count(DISTINCT UserID)
from bright_tv_userprofiles
------------------------------------------------------------------

---- Checking Nulls----
select  count(*) from bright_tv_user_profiles
where UserID is null OR Name is null OR Surname is null OR Age is null OR Gender is null OR
Race is null OR Province is null OR Email is null 

select  count(*) from bright_tv_user_profiles
where 'Social Media Handle' is null


select count(*) from bright_tv_viewership
 where Duration2 is null OR UserID is null OR Channel2 is null OR RecordDate2 is null

 -----------------------------------------------------------------

---CHECKING DUPLICATES---

select 
       count(*)
from bright_tv_user_profiles
group by ALL
having count(*) > 1;

select count(*)
from bright_tv_viewership
group by ALL
 having count(*) > 1;

 -----------------------------------------------------------------

-----converting time to date format---

SELECT
  YEAR(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')) AS year,
  MONTH(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')) AS month,
  DATE_FORMAT(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm'), 'HH:mm') AS sale_time
FROM bright_tv_viewership
WHERE TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm') IS NOT NULL;

SELECT
  date_part('second', to_timestamp(DURATION2, 'HH:mm:ss')) +
  date_part('minute', to_timestamp(DURATION2, 'HH:mm:ss')) * 60 +
  date_part('hour', to_timestamp(DURATION2, 'HH:mm:ss')) * 3600
    AS duration_seconds
FROM bright_tv_viewership;

SELECT
  RECORDDATE2,
  date_format(to_timestamp(RECORDDATE2, 'yyyy/MM/dd HH:mm'), 'EEEE') AS day_of_week_name
FROM bright_tv_viewership
WHERE to_timestamp(RECORDDATE2, 'yyyy/MM/dd HH:mm') IS NOT NULL;


select
round(sum (to_timestamp(DURATION2))/60,2) as total_minutes
from bright_tv_viewership

select  Avg(to_timestamp(DURATION2))/60 as Avg_duration_minutes
from bright_tv_viewership


---------------------------------------------------------------------------------------------------
---------------number of users per channel--------

SELECT CHANNEL2, COUNT(DISTINCT USERID) AS users_per_channel
FROM bright_tv_viewership 
GROUP BY CHANNEL2
ORDER BY users_per_channel DESC;
--------------------------------------------------------------------------------------------------------------

SELECT  v.userId,
 count(*)user_count,
    CASE 
        WHEN u.Age BETWEEN 1 AND 15 THEN 'CHILDREN'
        WHEN u.Age BETWEEN 16 AND 25 THEN 'YOUNG ADULTS'
        WHEN u.Age BETWEEN 26 AND 44 THEN 'ADULTS'
        WHEN u.Age BETWEEN 45 AND 64 THEN 'MIDDLE AGED'
        WHEN u.Age BETWEEN 65 AND 80 THEN 'SENIORS'
        ELSE 'NOT SPECIFIED'
    END AS Age_Group,

  count(*)AS total_sessions,
    v.Channel2,
    v.RecordDate2,
    v.Duration2,
    u.Name,
    u.Surname,
    u.Email,
    u.Gender,
    u.Race,
    u.Province,
  -----watch duration grouping------------
    CASE
        WHEN v.Duration2 BETWEEN '00:00:00' AND '02:59:59' THEN '0-3 HRS'
        WHEN v.Duration2 BETWEEN '03:00:00' AND '05:59:59' THEN '4-6 HRS'
        WHEN v.Duration2 BETWEEN '06:00:00' AND '08:59:59' THEN '6-9 HRS'
        ELSE '9-12 HRS'
    END AS Watch_Duration,
    YEAR(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')) AS year,
  MONTH(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')) AS month,
  DATE_FORMAT(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm'), 'HH:mm') AS sale_time
FROM bright_tv_viewership v
JOIN bright_tv_user_profiles u
    ON v.UserID = u.UserID
WHERE TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm') IS NOT NULL;

--------------------------------------------------------------------------------------------------------------------------------------------

SELECT  
    v.userId,
    COUNT(*) AS user_count,
  CASE 
        WHEN u.Age BETWEEN 1 AND 15 THEN 'CHILDREN'
        WHEN u.Age BETWEEN 16 AND 25 THEN 'YOUNG ADULTS'
        WHEN u.Age BETWEEN 26 AND 44 THEN 'ADULTS'
        WHEN u.Age BETWEEN 45 AND 64 THEN 'MIDDLE AGED'
        WHEN u.Age BETWEEN 65 AND 80 THEN 'SENIORS'
        ELSE 'NOT SPECIFIED'
    END AS Age_Group,

    COUNT(*) AS total_sessions,
    v.Channel2,
    v.RecordDate2,
    v.Duration2,
    u.Name,
    u.Surname,
    u.Email,
    u.Gender,
    u.Race,
    u.Province,

    CASE
        WHEN v.Duration2 BETWEEN '00:00:00' AND '02:59:59' THEN '0-3 HRS'
        WHEN v.Duration2 BETWEEN '03:00:00' AND '05:59:59' THEN '4-6 HRS'
        WHEN v.Duration2 BETWEEN '06:00:00' AND '08:59:59' THEN '6-9 HRS'
        ELSE '9-12 HRS'
    END AS Watch_Duration,
     Avg(to_timestamp(DURATION2))/60 as Avg_duration_minutes,
      date_part('second', to_timestamp(DURATION2, 'HH:mm:ss')) +
  date_part('minute', to_timestamp(DURATION2, 'HH:mm:ss')) * 60 +
  date_part('hour', to_timestamp(DURATION2, 'HH:mm:ss')) * 3600
    AS duration_seconds,
    YEAR(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')) AS View_year,
    MONTH(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')) AS view_month,
   DATE_FORMAT(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm'), 'HH:mm') AS View_time,
   date_format(to_timestamp(RECORDDATE2, 'yyyy/MM/dd HH:mm'), 'EEEE') AS day_of_week_name,
 date_format(to_timestamp(RECORDDATE2, 'yyyy/MM/dd HH:mm'), 'MMMM') AS month_name

FROM bright_tv_viewership v
JOIN bright_tv_user_profiles u
    ON v.UserID = u.UserID
WHERE TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm') IS NOT NULL

GROUP BY
    v.userId,
    CASE 
        WHEN u.Age BETWEEN 1 AND 15 THEN 'CHILDREN'
        WHEN u.Age BETWEEN 16 AND 25 THEN 'YOUNG ADULTS'
        WHEN u.Age BETWEEN 26 AND 44 THEN 'ADULTS'
        WHEN u.Age BETWEEN 45 AND 64 THEN 'MIDDLE AGED'
        WHEN u.Age BETWEEN 65 AND 80 THEN 'SENIORS'
        ELSE 'NOT SPECIFIED'
    END,
    v.Channel2,
    v.RecordDate2,
    v.Duration2,
    u.Name,
    u.Surname,
    u.Email,
    u.Gender,
    u.Race,
    u.Province,
    CASE
        WHEN v.Duration2 BETWEEN '00:00:00' AND '02:59:59' THEN '0-3 HRS'
        WHEN v.Duration2 BETWEEN '03:00:00' AND '05:59:59' THEN '4-6 HRS'
        WHEN v.Duration2 BETWEEN '06:00:00' AND '08:59:59' THEN '6-9 HRS'
        ELSE '9-12 HRS'
    END,
    YEAR(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')),
    MONTH(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm')),
    DATE_FORMAT(TO_TIMESTAMP(RecordDate2, 'yyyy/MM/dd HH:mm'), 'HH:mm');

-------------------------------------------------------------------------------------------------------------
