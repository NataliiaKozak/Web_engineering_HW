SELECT * FROM suppliers;


/*2. Выберите только те строки из таблицы suppliers где company имеет значение Supplier A */
SELECT 
    company
FROM
    suppliers
WHERE
    company LIKE 'Supplier A';


/*3. Выберите все строки из таблицы purchase_orders*/
SELECT * FROM purchase_orders;


/*4. Выберите только те строки из таблицы purchase_orders  где supplier_id = 2*/
SELECT 
    supplier_id
FROM
    purchase_orders
WHERE
    supplier_id = 2;
    
    
/*после лекции 2 я бы добавила больше информации в SELECT, для большей информативности. Вопрос: почему во временной таблице также указано NULL?*/
SELECT 
    id, supplier_id
FROM
    purchase_orders
WHERE
    supplier_id = 2;
    
    
   
/*5. Выберите supplier_id и shipping_fee из purchase_orders там где created_by равно 1 и supplier_id равен 5 Объясните полученный результат*/
SELECT 
    supplier_id, shipping_fee
FROM
    purchase_orders
WHERE
    created_by = 1 AND supplier_id = 5;

/*Co столбцом id для большей информативности*/
SELECT 
    id, supplier_id, shipping_fee
FROM
    purchase_orders
WHERE
    created_by = 1 AND supplier_id = 5;

/*В базе данных нет ни одной строки, соответствующей обоим этим условиям одновременно. Вероятно, сначала идет поиск по первому условию, а потом по второму - в предыдущем результате выборки*/


/*6. Выберите last_name и first_name из таблицы employees
там где адрес address имеет значение 123 2nd Avenue или 123 8th Avenue
Напишите запрос двумя способами - с применением оператора OR и оператора IN
*/

SELECT 
    last_name, first_name, address
FROM
    employees
WHERE
    address = '123 2nd Avenue'
        OR address = '123 8th Avenue';

SELECT 
    last_name, first_name, address
FROM
    employees
WHERE
    address IN ('123 2nd Avenue' , '123 8th Avenue');


/*
7. Выведите все имена сотрудников, которые содержат английскую букву p в середине фамилии
*/

SELECT 
    first_name
FROM
    employees
WHERE
    last_name LIKE '%p%';

/*для большей информативности*/
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%p%';

/*8. Выберите все строки из таблицы orders там где нет информации о  shipper_id*/
SELECT 
    id, shipper_id
FROM
    orders
WHERE
    shipper_id IS NULL;
    
/* https://dev.mysql.com/doc/refman/8.4/en/comparison-operators.html#operator_is-null 
https://dev.mysql.com/doc/refman/8.4/en/problems-with-null.html
*/