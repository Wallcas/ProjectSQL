SELECT
    YEAR,
    food_category,
    avg(avg_value_food) AS food_price,
    avg(payroll_value) AS salary,
    round(avg(payroll_value) / avg(avg_value_food)) AS quantity
FROM t_voloshyn_kostiantyn_primary_final
WHERE 
    year IN (2008, 2018)
    AND food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY YEAR, food_category;