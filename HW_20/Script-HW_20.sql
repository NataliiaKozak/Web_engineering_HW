-- 1. Подключитесь к базе данных hr (которая находится на удаленном сервере)
use hr;

-- 2. Выведите количество сотрудников в базе
SELECT
	COUNT(*) AS count_of_employees
FROM
	employees e;

-- 3. Выведите количество департаментов (отделов) в базе
SELECT COUNT(*) AS count_of_departments
FROM departments;

/*Несмотря на ошибку, результат отображался. Если отформатировать код, 
 * результат не отображается, появляется оповещение об ошибке. Поэтому дальше не форматирую*/

-- 4. Подключитесь к базе данных World (которая находится на удаленном сервере)
use world;

-- 5. Выведите среднее население в городах Индии (таблица City, код Индии - IND)
SELECT AVG(Population) AS avg_population_in_ind
FROM city 
WHERE CountryCode = 'IND';


-- 6. Выведите минимальное население в индийском городе и максимальное.
SELECT MIN(Population) AS min_population_in_ind_cities, 
	MAX(Population) AS max_population_in_ind_cities
FROM city 
WHERE CountryCode = 'IND';



-- 7. Выведите самую большую площадь территории. 
SELECT MAX(SurfaceArea) AS max_area_from_country
FROM country;


-- 8. Выведите среднюю продолжительность жизни по странам. 
SELECT AVG(LifeExpectancy) AS avg_expectancy_of_life
FROM country
WHERE LifeExpectancy IS NOT NULL;


-- 9. Найдите самый населенный город (подсказка: использовать подзапросы)
SELECT Name, Population
FROM city
WHERE Population = (
    SELECT MAX(Population)
    FROM city);
