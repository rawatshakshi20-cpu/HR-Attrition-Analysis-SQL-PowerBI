
----------------------------- BUSINESS ANALYSIS ------------------------------


-- Q1: What is the overall attrition rate in the organization?--

select round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees;



-- Q2: Which employee age groups or demographic segments show higher attrition risk?--

select gender, count(employeenumber) as employees,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees group by gender;

select case
when age<=30 then "young (18-30) "
when age<=45 then  "adults (31-45)"
else "seniors (45+)" 
end as age_groups, 
count(employeenumber) as employees,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees group by age_groups;



-- Q3: Which departments and job roles experience the highest attrition?--

select department,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees group by department;

SELECT 
    Department,
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Exits,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS Attrition_Rate
FROM employees
GROUP BY Department, Gender
ORDER BY Department, Attrition_Rate DESC;

select jobrole,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees 
group by jobrole
order by attrition_rate desc;



-- Q4: How does salary (Monthly Income) influence employee attrition?--

select case
when MonthlyIncome<=5000 then "Low"
when MonthlyIncome<=12000 then "Medium"
else "High"
end as income_level, count(EmployeeNumber) as total_employees,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees group by income_level
order by attrition_rate desc;
 


-- Q5: Does overtime contribute to higher employee attrition? --

SELECT OverTime, count(EmployeeNumber) as total_employees,
      sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY OverTime;

-- extended Q2: attrition by jobrole + overtime vs attrition rate (deeper insight)

select jobrole, overtime,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(employeenumber),2) as attrition_rate from employees 
group by jobrole, overtime
order by attrition_rate desc;



-- Q6: How does the promotion gap impact attrition?

select
CASE
    WHEN YearsSinceLastPromotion <= 2 THEN '0-2 Years'
    WHEN YearsSinceLastPromotion BETWEEN 3 AND 5 THEN '3-5 Years'
    ELSE '6+ Years'
END AS promotion_gap_group,
avg(monthlyincome) as avg_salary,
sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY promotion_gap_group
order by attrition_rate desc;


-- Career Progression Check--

select
CASE 
    WHEN YearsAtCompany <= 2 THEN '0-2 Years'
    WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
    WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
    ELSE '10+ Years'
    end as tenure_group,
    sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY tenure_group
order by attrition_rate desc;



-- Q7: How do employee experience factors (job satisfaction, work-life balance, environment) influence attrition?

SELECT jobsatisfaction,
       sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY jobsatisfaction
order by attrition_rate desc;


SELECT WorkLifeBalance,
       sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY WorkLifeBalance
order by attrition_rate desc;


SELECT EnvironmentSatisfaction,
       sum(case when attrition="yes" then 1 else 0 end) as attrition_count,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY EnvironmentSatisfaction
order by attrition_rate desc;



-- Q8: Which employee segments are at the highest risk of attrition based on combined factors? (by overtime, compensation and promotion gap years) --

SELECT 
CASE 
    WHEN MonthlyIncome < 4000 AND OverTime = 'Yes' AND YearsSinceLastPromotion >= 6
        THEN 'High Risk'
    WHEN MonthlyIncome < 4000 AND OverTime = 'Yes' 
        THEN 'Moderate Risk'
    WHEN MonthlyIncome >= 4000 AND OverTime = 'No'
        THEN 'Low Risk'
    ELSE 'Medium Risk'
END AS risk_segment,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employees
GROUP BY risk_segment
ORDER BY attrition_rate DESC;













































