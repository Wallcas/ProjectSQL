CREATE OR REPLACE TABLE t_voloshyn_kostiantyn_primary_final AS
SELECT 
	t1.category_code AS category_code,
	cpc.name AS food_category,
	t1.food_year AS year,
	t1.avg_value_food AS avg_value_food,
	cpc.price_unit AS food_price_unit,
	t2.industry_brach_code AS code,
	cpib.name AS industry_name,
	t2.year_payroll_value AS payroll_value	
FROM( 
	SELECT 
      cp.category_code AS category_code,
      YEAR(cp.date_to) AS food_year,
      ROUND(AVG (cp.value)) AS avg_value_food
      FROM czechia_price cp 
      WHERE region_code IS NULL 
      GROUP BY food_year, category_code
    ) t1
JOIN czechia_price_category cpc 
	ON t1.category_code = cpc.code 
JOIN 
    (
        SELECT
		cp2.payroll_year,
		cp2.industry_branch_code AS industry_brach_code,
		ROUND (AVG (cp2.value))AS year_payroll_value
		FROM czechia_payroll cp2  
		WHERE industry_branch_code IS NOT NULL
		AND value_type_code = 5958
		AND calculation_code = 200 
		GROUP BY payroll_year, industry_branch_code
    ) t2
	ON t1.food_year = t2.payroll_year
JOIN czechia_payroll_industry_branch cpib 
	ON t2.industry_brach_code = cpib.code;