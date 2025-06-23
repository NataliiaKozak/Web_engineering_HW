/*1 Выведите одним запросом с использованием UNION столбцы id, employee_id 
из таблицы orders и соответствующие им столбцы из таблицы purchase_orders. 
В таблице purchase_orders  created_by соответствует employee_id*/
SELECT 
    id, employee_id 
FROM
    orders 
UNION 
SELECT 
    id, created_by
FROM
    purchase_orders;


/*2 Из предыдущего запроса удалите записи там где employee_id не имеет значения. 
Добавьте дополнительный столбец со сведениями из какой таблицы была взята запись*/
SELECT 
    id, employee_id AS staff_id, 'orders' AS source_table
FROM
    orders
WHERE
    employee_id IS NOT NULL 
UNION ALL SELECT 
    id,
    created_by AS staff_id,
    'purchase_orders' AS source_table
FROM
    purchase_orders
WHERE
    created_by IS NOT NULL
ORDER BY source_table , id;


/*3 Выведите все столбцы таблицы order_details, 
а также дополнительный столбец payment_method из таблицы purchase_orders. 
Оставьте только заказы для которых известен payment_method */
SELECT 
    od.*, po.payment_method
FROM
    order_details od
        JOIN
    purchase_orders po ON po.id = od.order_id
WHERE
    po.payment_method IS NOT NULL;

/*4 Выведите заказы orders и фамилии клиентов customers для тех заказов,
по которым были инвойсы таблица invoices*/
SELECT DISTINCT
    o.id, c.last_name
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.id
        JOIN
    invoices i ON o.id = i.order_id;

/*5 Подсчитайте количество инвойсов для каждого клиента из предыдущего запроса*/
SELECT 
    c.id AS customer_id,
    c.last_name,
    COUNT(i.id) AS invoice_count
FROM 
    customers c
JOIN 
    orders o ON c.id = o.customer_id
JOIN 
    invoices i ON o.id = i.order_id
GROUP BY 
    c.id, c.last_name;