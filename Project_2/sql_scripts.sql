/*1. How many people left (Yes) vs how many people stayed (No)?
This query tells us that 1,233 (about 84%) of people stayed and 237 (about 16%) of people left */ 
select attrition , count(*) as employee_count, (count(*) / SUM(count(*)) OVER() * 100) as percentage
from hr_employee_data hed 
group by attrition;

/*2. Which department are workers leaving from? 
 	 This query is showing us the amount of people who left and the amount of current employees in each department
 	 In this query, many people are leaving the Research and Development department*/
SELECT 
    Department, 
    COUNT(*) AS department_count,
    -- Column 1: Count departures by nesting the CASE inside the COUNT
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS departures,
    -- Column 2: Count active employees by nesting the CASE inside the COUNT
    COUNT(CASE WHEN attrition = 'No' THEN 1 END) AS current_employees
FROM hr_employee_data hed
GROUP BY Department
order by current_employees desc;

/*3. Why are workers leaving?
 	 We can look at hourlyrate and JobSatsfaction to see where each department lines up against each other
 	 This query clearly shows that people who leave the company have significantly lower monthly pay, and the job satistfaction and enviornment satisfaction is very low. 
 */
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income,
    ROUND(AVG(JobSatisfaction), 2) AS avg_satisfaction,
    ROUND(AVG(EnvironmentSatisfaction), 2) AS avg_env_satisfaction,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM hr_employee_data
GROUP BY Attrition;

SELECT 
    EmployeeNumber,
    Department,
    JobRole,
    Attrition,
    MonthlyIncome,
    JobSatisfaction,
    EnvironmentSatisfaction,
    YearsAtCompany
FROM hr_employee_data;