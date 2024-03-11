/*main task*/
SELECT
    industry_name,
    AVG(CASE WHEN year = 2000 THEN payroll_value END) AS avg_payroll_2000,
    AVG(CASE WHEN year = 2023 THEN payroll_value END) AS avg_payroll_2023,
    ROUND(((AVG(CASE WHEN year = 2023 THEN payroll_value END) - AVG(CASE WHEN year = 2000 THEN payroll_value END)) / AVG(CASE WHEN year = 2000 THEN payroll_value END)) * 100, 2) AS percentage_change,
    CASE
        WHEN AVG(payroll_value) > AVG(CASE WHEN year = 2000 THEN payroll_value END) THEN 'growth'
        WHEN AVG(payroll_value) < AVG(CASE WHEN year = 2000 THEN payroll_value END) THEN 'decline'
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
        ROUND(AVG(payroll_value), 0) AS avg_payroll,    
        ROUND(AVG(payroll_value) / LAG(ROUND(AVG(payroll_value), 0)) OVER (PARTITION BY industry_name ORDER BY industry_name, year) * 100 - 100, 2) AS salary_difference
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