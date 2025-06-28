USE 131224_Kozak;

-- 1/ Создать кастомные функции для расчета площади круга
DELIMITER //

CREATE FUNCTION function_circle_area(radius DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE area DOUBLE;
    SET area = PI() * POW(radius, 2);
    RETURN area;
END //

DELIMITER ;

SELECT function_circle_area(5) AS circle_area;


-- 2/ Функция для расчета гипотенузы треугольника
DELIMITER //
CREATE FUNCTION function_hypotenuse(a DOUBLE, b DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE hypotenuse DOUBLE;
    SET hypotenuse = SQRT(POW(a, 2) + POW(b, 2));
    RETURN hypotenuse;
END //
DELIMITER ;

SELECT function_hypotenuse(7, 6) AS hypotenuse;