/*1. Подключитесь к своей базе данных созданной на уроке*/
USE 131224_Kozak;

/*2. Создайте таблицу, которая отражает погоду в Вашем городе за последние 5 дней и включает следующее столбцы.
Id - первичный ключ, заполняется автоматически.
Дата - не может быть пропуском.
Дневная температура - целое число, принимает значения от -30 до 30.
Ночная температура - целое число, принимает значения от -30 до 30.
Скорость ветра - подумайте какой тип данных и ограничения необходимы для этого столбца*/

CREATE TABLE weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_weather DATE NOT NULL,
    daytime_temperature INT CHECK (daytime_temperature >= - 30
        AND daytime_temperature <= 30),
    night_temperature INT CHECK (night_temperature >= - 30
        AND night_temperature <= 30),
    wind_speed DECIMAL(5 , 1 ) CHECK (wind_speed >= 0)
);

-- Вариант:
CREATE TABLE weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_weather DATE NOT NULL,
    daytime_temperature INT CHECK (daytime_temperature BETWEEN - 30 AND 30),
    night_temperature INT CHECK (night_temperature BETWEEN - 30 AND 30),
    wind_speed DECIMAL(5 , 1 ) CHECK (wind_speed >= 0)
);
/*Скорость ветра измеряется в м/с и в км/ч. Если в м/с, то используется число с точкой (DECIMAL), если км/ч, то целое число (INT). Взяла DECIMAL.
Если скорость ветра от 0 до определенных раннее измеряемых данных, то вероятно в ограничении стоит указать от 0 включительно */ 

/*3. Заполните таблицу 5 строками - за последние 5 дней */
INSERT INTO weather (date_weather, daytime_temperature, night_temperature, wind_speed)
VALUES
    (CURDATE() - INTERVAL 4 DAY, 13, 5, 3.2),
    (CURDATE() - INTERVAL 3 DAY, 15, 7, 2.8),
    (CURDATE() - INTERVAL 2 DAY, 15, 7, 5.1),
    (CURDATE() - INTERVAL 1 DAY, 13, 5, 1.5),
    (CURDATE(), 17, 8, 0.8);  

/*4. Увеличьте значения ночной температуры на градус, если скорость ветра не превышала 3 м/с*/
UPDATE weather 
SET 
    night_temperature = night_temperature + 1
WHERE
    wind_speed <= 3;

/*5. На основе полученной таблицы создайте представление в своей базе данных - включите все строки Вашей таблицы и дополнительно рассчитанные столбцы.
Средняя суточная температура - среднее арифметическое между ночной и дневной температурами.
Столбец на основе скорости ветра - если скорость ветра не превышала 2 м/с то значение ‘штиль’, от 2 включительно до 5 - ‘умеренный ветер’, в остальных случаях - ‘сильный ветер’*/

CREATE VIEW weather_view AS 
SELECT 
	*, 
	(daytime_temperature + night_temperature) / 2 AS average_between_night_and_daytime_temperature,
	CASE
		WHEN wind_speed < 2 THEN 'штиль'
		WHEN wind_speed BETWEEN 2 AND 5 THEN 'умеренный ветер'
		ELSE 'сильный ветер'
	END AS about_wind_speed
FROM 
    weather;





