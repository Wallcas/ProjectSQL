CREATE OR REPLACE TABLE t_voloshyn_kostiantyn_secondary_final AS
	SELECT 
		c.country,
		e.`year`, 
		e.GDP,
		e.gini,
		e.population
	FROM countries c 
	JOIN economies e 
		ON c.country = e.country 
	WHERE continent = 'Europe' AND
	`year` BETWEEN 2006 AND 2018;
