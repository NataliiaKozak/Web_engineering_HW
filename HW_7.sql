/*   Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта таблица order_details.
Решить задачу с помощью cte и подзапроса*/

-- Решение с помощью cte
WITH order_summary AS (                 
    SELECT                             
        product_id,                  
        SUM(quantity) AS total_quantity  
    FROM order_details                 
    GROUP BY product_id                
)
SELECT                                
    p.product_name,                    
    os.total_quantity AS total_purchased 
FROM products AS p                     
LEFT JOIN order_summary AS os         
    ON p.id = os.product_id;           
    

-- Решение с помощью подзапроса
SELECT 
    products.product_name, sub.total_quantity AS total_purchased
FROM
    products
        LEFT JOIN
    (SELECT 
        product_id, SUM(quantity) AS total_quantity
    FROM
        order_details
    GROUP BY product_id) AS sub ON products.id = sub.product_id;    
    
  
/*2  Найти все заказы таблица orders, сделанные после даты 
самого первого заказа клиента Lee таблица customers.*/

SELECT 
    *
FROM
    orders
WHERE
    order_date > (SELECT 
            MIN(o.order_date)
        FROM
            orders o
                JOIN
            customers c ON o.customer_id = c.id
        WHERE
            c.last_name = 'Lee');


/*3 Найти все продукты таблицы  products c максимальным target_level*/
SELECT 
    *
FROM
    products
WHERE
    target_level = (SELECT 
            MAX(target_level)
        FROM
            products);
