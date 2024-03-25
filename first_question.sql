/*main task*/
SELECT
    industry_name,
    avg(CASE WHEN year = 2000 THEN payroll_value END) AS avg_payroll_2000,
    avg(CASE WHEN year = 2023 THEN payroll_value END) AS avg_payroll_2023,
    round(((avg(CASE WHEN year = 2023 THEN payroll_value END) - avg(CASE WHEN year = 2000 THEN payroll_value END)) / avg(CASE WHEN year = 2000 THEN payroll_value END)) * 100, 2) AS percentage_change,
    CASE
        WHEN avg(payroll_value) > avg(CASE WHEN year = 2000 THEN payroll_value END) THEN 'growth'
        WHEN avg(payroll_value) < avg(CASE WHEN year = 2000 THEN payroll_value END) THEN 'decline'
        ELSE 'Stability'
    END AS trend
FROM
     t_voloshyn_kostiantyn_primary_final
WHERE
    year BETWEEN 2000 AND 2023
GROUP BY 
    industry_name ;

 /*deep analyse*/

WITH go_on AS (
    SELECT
        industry_name,
        year,
        round(avg(payroll_value), 0) AS avg_payroll,    
        round(avg(payroll_value) / lag(round(avg(payroll_value), 0)) OVER (partition BY industry_name ORDER BY industry_name, year) * 100 - 100, 2) AS salary_difference
    FROM
        t_voloshyn_kostiantyn_primary_final
    WHERE
        year BETWEEN 2000 AND 2023
    GROUP BY 
        industry_name, year
)
SELECT
    industry_name,
    year,
    avg_payroll,
    salary_difference
FROM
    go_on
WHERE
    salary_difference IS NOT NULL
ORDER BY
 salary_difference, year;   
