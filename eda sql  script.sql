
--------------------------------- EDA (EXPLORATORY DATA ANALYSIS) -------------------------------------------

-- ====================================================
--              DATA AUDITING
-- ==================================================== 


-- checking the dataset--

select * from employees;

-- checking count of rows--
select count(*) from employees;

-- checking total columns-- 

SELECT COUNT(*) AS ColumnCount
FROM INFORMATION_SCHEMA.columns
WHERE TABLE_NAME = 'employees'
  AND TABLE_SCHEMA = 'shakshidb';

-- checking data types of columns --

desc employees;

-- checking for duplicates-- 

select EmployeeNumber, count(*) as total from employees
group by employeenumber 
having count(*)>1;

-- checking for nulls--
SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(Age) AS Age_Check,
    COUNT(Attrition) AS Attrition_Check,
    COUNT(MonthlyIncome) AS Income_Check,
    COUNT(Department) AS Dept_Check,
    COUNT(JobRole) AS Role_Check,
    COUNT(OverTime) AS OT_Check,
    COUNT(PerformanceRating) AS Perf_Check,
    COUNT(JobSatisfaction) AS Satisf_Check,
    COUNT(Gender) AS Gender_Check,
    COUNT(YearsAtCompany) AS Tenure_Check,
    COUNT(YearsSinceLastPromotion) AS Promo_Check
FROM employees;

-- checking categorical values--

select distinct(attrition) from employees;
select distinct(gender) from employees;
select distinct(department) as department, jobrole from employees
order by department;
select distinct(overtime) from employees;
select distinct(joblevel) from employees;
select distinct(jobsatisfaction) from employees;
select distinct(PerformanceRating) from employees;


-- =================================================================
--                            UNIVARIATE ANALYSIS 
-- ================================================================


-- gender distribution--

select round(count(employeenumber)*100/(select count(employeenumber) from employees),2) as percent from employees 
group by gender;

-- age distribution--

select min(age) as min_age,
max(age) as max_age,
avg(age) as avg_age 
from employees;


-- age group--

select case
when age<=30 then "young (18-30) "
when age<=45 then  "adults (31-45)"
else "seniors (45+)" 
end as age_groups,
count(EmployeeNumber) as employees 
from employees
group by age_groups;


-- salary distribution --

select min(MonthlyIncome) as min_sal,
max(MonthlyIncome) as max_sal,
avg(monthlyincome) as avg_sal
from employees;

select case when monthlyincome <=5000 then "low"
when MonthlyIncome<=12000 then "medium"
else "high"
end as income_level,
count(EmployeeNumber) as employees from employees 
group by income_level;


-- tenure distribution--

select min(YearsAtCompany) as min_tenure,
max(YearsAtCompany) as max_tenure, 
avg(yearsatcompany) as avg_tenure from employees;

select CASE 
    WHEN YearsAtCompany <= 2 THEN '0-2 Years'
    WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
    WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
    ELSE '10+ Years'
    end as tenure_group, count(employeenumber) from employees
    group by tenure_group;

-- employees by organisational drivers-- 

select Department, count(EmployeeNumber) as employees 
from employees 
group by department;

-- employees by jobrole-- 

select JobRole, count(EmployeeNumber) as employees 
from employees 
group by jobrole;

-- employees by joblevel --

select joblevel, count(employeenumber) from employees 
group by joblevel
order by joblevel;




-- ============================================================
--                         ATTRITION ANALYSIS
-- ============================================================


-- attrition count--

select attrition, count(EmployeeNumber) as employees 
from employees
group by attrition;


-- attrition rate --

select attrition,
round(count(employeenumber)*100/(select count(emp_id) from hr_attrition),2) as attrition_rate
from employees
group by attrition;


-- avg age, avg salary, avg tenure by attrition status --

select attrition, avg(age), avg(MonthlyIncome), avg(YearsAtCompany) from employees
group by attrition;

## Monthly Income: Employees who left seem to have lower income distributions compared to those who stayed.
## Total Working Years: Employees with fewer working years seem more likely to leave.
## Age: Younger employees have higher attrition, while older employees tend to stay.



-- attrition by gender--

select gender, attrition, count(EmployeeNumber) from employees 
group by gender, attrition;

-- attrition by department -- 

select department, attrition, count(EmployeeNumber) as employees from employees 
group by department, attrition
order by department;

-- attrition by jobrole-- 

select jobrole, count(employeenumber) as employees, sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
avg(monthlyincome) as avg_salary from employees
group by jobrole
order by attrition_count desc;


-- attrition by salary --

select case when monthlyincome <=5000 then "low"
when MonthlyIncome<=12000 then "medium"
else "high"
end as income_level,
count(EmployeeNumber) as employees, sum(case when attrition="yes" then 1 else 0 end) as attrition_count from employees 
group by income_level
order by attrition_count;

-- attrition byb joblevel-- 

select joblevel, count(EmployeeNumber) as employees, sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
avg(monthlyincome) as avg_sal from employees
group by joblevel
order by attrition_count desc;

-- attrition by overtime --

select overtime, attrition, count(employeenumber) from employees
group by overtime, attrition
order by overtime;

-- attrition by worklife balance --

SELECT WorkLifeBalance,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY WorkLifeBalance
order by attrition_rate desc;


-- attrition by environment satisfaction --

SELECT EnvironmentSatisfaction,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY EnvironmentSatisfaction
order by attrition_rate desc;

-- attrition by job satisfaction --

SELECT jobsatisfaction,
       sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY jobsatisfaction
order by attrition_rate desc;

