USE 131224_Kozak; 
-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника

SELECT 
    department_id
FROM
    employees
WHERE
    id = 2;

-- через хранимую процедуру
DELIMITER $$
CREATE PROCEDURE get_department_id(IN emp_id INT)
BEGIN
    SELECT department_id FROM employees WHERE id = emp_id;
END $$
DELIMITER ;

CALL get_department_id(2);


-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.

DELIMITER $$
CREATE PROCEDURE get_employee_age(
    IN emp_id INT,
    OUT emp_age INT
)
BEGIN
    SELECT age INTO emp_age FROM employees WHERE id = emp_id;
END $$
DELIMITER ;

CALL get_employee_age(5, @age);
SELECT @age AS employee_age;


-- 3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.

DELIMITER $$
CREATE PROCEDURE increase_salary(INOUT salary DECIMAL(10,2))
BEGIN
    SET salary = salary * 0.9; 
END $$
DELIMITER ;

-- тестирование процедуры
SET @test_salary = 1000.00;
CALL increase_salary(@test_salary); 
SELECT @test_salary AS new_salary;

-- изменения в employees у сотрудника с id = 1
SET @sal = (SELECT salary FROM employees WHERE id = 1);
CALL increase_salary(@sal);
UPDATE employees SET salary = @sal WHERE id = 1;
SELECT * FROM employees;
