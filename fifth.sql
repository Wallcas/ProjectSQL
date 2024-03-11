SELECT 
    e.YEAR,
    ROUND(e.gdp / LAG(e.gdp) OVER (ORDER BY e.YEAR) * 100 - 100, 2) AS gdp_difference,
    pp.payroll_difference,
    pp.price_food_difference
FROM (
    SELECT 
        YEAR,
        country,
        gdp
    FROM t_voloshyn_kostiantyn_secondary_final
    WHERE country = 'Czech Republic'
    GROUP BY YEAR, country, gdp
	) AS e
JOIN (
    SELECT 
        YEAR, 
        ROUND(avg_payroll / LAG(avg_payroll) OVER (ORDER BY YEAR) * 100 - 100, 2) AS payroll_difference,
        ROUND(avg_value_food / LAG(avg_value_food) OVER (ORDER BY YEAR) * 100 - 100, 2) AS price_food_difference
    FROM (
        SELECT 
            YEAR,
            AVG(avg_value_food) AS avg_value_food,
            AVG(payroll_value) AS avg_payroll
        FROM t_voloshyn_kostiantyn_primary_final AS pp
        GROUP BY YEAR
    ) AS a
) AS pp ON e.YEAR = pp.YEAR
WHERE
    e.YEAR BETWEEN 2006 AND 2018
    AND e.country = 'Czech Republic'
ORDER BY e.YEAR;