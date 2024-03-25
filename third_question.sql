SELECT DISTINCT 
	f.food_category,
	f.YEAR,
	f2.year + 1 as year_prev,
	round( ( f.avg_value_food - f2.avg_value_food ) / f2.avg_value_food * 100, 2 ) as avg_value_food_growth
	FROM t_voloshyn_kostiantyn_primary_final AS f
JOIN t_voloshyn_kostiantyn_primary_final AS f2
    ON f.food_category = f2.food_category
    AND f.year = f2.year + 1
    AND f.year < 2019
ORDER BY avg_value_food_growth ASC; 


SELECT
    food_category,
    avg(CASE WHEN year = 2008 THEN avg_value_food END) AS food_price_2008,
    avg(CASE WHEN year = 2018 THEN avg_value_food END) AS food_price_2018,
    ROUND(((avg(CASE WHEN year = 2018 THEN avg_value_food END) - avg(CASE WHEN year = 2008 THEN avg_value_food END)) / avg(CASE WHEN year = 2008 THEN avg_value_food END)) * 100, 2) AS percentage_change,
    CASE
        WHEN avg(avg_value_food) > avg(CASE WHEN year = 2008 THEN avg_value_food END) THEN 'Growth'
        WHEN avg(avg_value_food) < avg(CASE WHEN year = 2008 THEN avg_value_food END) THEN 'Fall'
        ELSE 'Same'
    END AS trend
FROM
     t_voloshyn_kostiantyn_primary_final
WHERE
    year BETWEEN 2008 AND 2018
GROUP BY 
    food_category ;
