# **Project SQL Engeto Academy**
## Zadání projektu
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

## **Výzkumné otázky:**
### _1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?_ 
### _2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?_ 
### _3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?_
### _4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?_
### 5. _Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?_

## Finální tabulky
   Vytvořil jsem **primární tabulku t_voloshyn_kostiantyn_primary_final**. Která zpracovává data mezd a cen potravin za 
Českou republiku sjednocených na totožné porovnatelné období -společné roky. 
Tato tabulka obsahuje sloupce:
  + **category_code**
  + **food_category**
  + **year**
  + **avg_value_food**
  + **food_price**
  + **code**
  + **industry_name**
  + **payroll_value**

 Dále jsem vytvořil **sekundární tabulku t_voloshyn_kostiantyn_project_SQL_secondary_table**.
 Tato tabulka obsahuje sloupce:
   + **country**
   + **year**
   + **GDP**
   + **gini**
   + **population**

## **Odpoved:** 
### _1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?_
Dlouhodový trend je takový, že všechna sledovaná odvětví zaznamenala nárust mezd. Přičemž největšího procentuálního nárustu mezd dosáhlo odvětví zdravotnictví a sociální péče 77,83%. Nejmenší procentuální růst mezd mezi těmito sledovanými obdobími byl v odvětví peněžnictví a pojišťovnictví.

Při podrobnějším rozpadu tohoto trendu je patrné, že v roce 2013 došlo u 11 odvětví k meziročnímu poklesu mezd. Mzdy tedy nerostly u všech odvětví po celou dobu sledování.

### _2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?_

V roce 2008 bylo možné za průměrnou mzdu koupit 1353 litrů mléka a 1059 kg chleba. V roce 2018 bylo možné za průměrnou mzdu koupit 1655 litrů mléka a 1379 kg chleba. Tyto údaje poukazují na jistý trend zvedající se kupní síly obyvatelstva, který by bylo zajímavé prozkoumat i u dalších položek denní spotřeby.

### _3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?_
   
Nejnižší procentuální meziroční nárust cen byl zaznamenán v roce 2007 a druhý nejnižší v roce 2011 u kategorie potravin: Rajská jablka červená kulatá ( -31,3 % a -28,57%)

Dlouhodobý trend při porovnání mezi lety 2006 a 2018 dokazuje klesající ceny u kategorie: cukr krystalový, kdy v tomto období došlo ke snížení cen o 27,27%. U ** Rajských jablek červených kulatých ** došlo také ke snížení cen o 24,14%**. Pro jakostní víno bílé chybí data za rok 2006.

### _4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?_
   
Meziroční procentuální nárůst cen potravin nebyl v žádném ze sledovaných let vyšší o více než 10%, nejvyšších hodnot a to 6,51% dosahoval v roce 2013.

### _5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?_
   
Vliv výše HDP na změny ve mzdách a cenách potravin není prokazatelně zjevný.
