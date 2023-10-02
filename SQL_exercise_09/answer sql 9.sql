
Use Exercise9db;



alter table `company_cran_logs_2015-01-01` rename to company_logs;

select * from company_logs;

-- 9.1 give the total number of recordings in this table.

Select Count(*) From Company_Logs;

-- 9.2 the number of packages listed in this table?

Select Count(distinct Package) From Company_Logs; 

-- 9.3 How many times the package "Rcpp" was downloaded?

Select Count(*) From Company_Logs Where Package ='RCPP';

-- 9.4 How many recordings are from China ("CN")?

Select Count(*) From Company_Logs Where Country = 'CN';

-- 9.5 Give the package name and how many times they're 
-- downloaded. Order by the 2nd column descently.

Select Package, Count(*) From Company_Logs Group By Package Order By 2 Desc; 

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM

Select Package, Count(*) From Company_Logs Group By Package Order By 9AM to 11AM; 

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?

Select Count(*) From Company_Logs Where Country = 'CN' or 'Japan' or 'Singapore';

Select Count(*) From Company_Logs Where Country = 'CN' or Country ='Japan' or Country='Singapore';

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")

Select Countries.Name From Company_Logs Group By Package Order By 'CN';

Select Temp.Country From (Select Country, Count(*) As Dwonloads From Company_Logs 
Group By country) As Temp Where Temp.Downloads > (Select Count(*) From Company_Logs Where Country = 'CN');

SELECT TEMP.country FROM (SELECT country, COUNT(*) AS downloads FROM Company_Logs
GROUP BY country) AS TEMP WHERE TEMP.downloads > (SELECT COUNT(*) FROM Company_Logs
WHERE country = 'CN');
        
-- 9.9 Print the average length of the package name of all the UNIQUE packages

Select Avg(Length(Package)) From Company_Logs;

-- 9.10 Get the package whose downloading count ranks 2nd 
-- (print package name and it's download count).

Select Package, count(*) From Company_Logs;

-- 9.11 Print the name of the package whose download count is bigger than 1000.

Select package From Company_Logs Where package>1000;  
Select Package From Company_Logs Group By Package having Count(*)>1000;

-- 9.12 The field "r_os" is the operating system of the users.
-- Here we would like to know what main system we have (ignore version number), 
-- the relevant counts, and the proportion (in percentage).

