/*Схема базы данных состоит из четырех таблиц: 1. Product (производитель, модель, тип) 2.PC (код, модель, скорость, ОЗУ, жесткий диск, CD, цена). 3. Laptop (код, модель, скорость, ОЗУ, жесткий диск, экран, цена). 4. Printer (код, модель, цвет, тип, цена). Таблица Product содержит данные о производителе, номере модели и типе продукта ('PC', 'Laptop' или 'Printer'). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. Каждый персональный компьютер в таблице PC однозначно идентифицируется уникальным кодом и дополнительно характеризуется своей моделью (внешний ключ, ссылающийся на таблицу Product), скоростью процессора (в МГц) — поле speed, объемом оперативной памяти (в Мб) — поле ram, объемом жесткого диска (в Гб) — поле hd, скоростью CD-ROM (например, '4x') — поле cd и его ценой. Таблица Laptop аналогична таблице PC, за исключением того, что вместо скорости CD-ROM она содержит размер экрана (в дюймах) — поле screen. Для каждого принтера в таблице Printer указывается его тип вывода ('y' для цветного и 'n' для монохромного) — поле color, технология печати ('Laser', 'Jet' или 'Matrix') — поле type, а также цена.
*/

-- 1 Найдите все записи таблицы Printer для цветных принтеров.
SELECT 
    *
FROM
    Printer
WHERE
    color = 'y';


-- 2 Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT 
    p.model, pc.price
FROM
    product p
        JOIN
    pc ON p.model = pc.model
WHERE
    p.maker = 'B' 
UNION SELECT 
    p.model, l.price
FROM
    product p
        JOIN
    laptop l ON p.model = l.model
WHERE
    p.maker = 'B' 
UNION SELECT 
    p.model, pr.price
FROM
    product p
        JOIN
    printer pr ON p.model = pr.model
WHERE
    p.maker = 'B';
    
    

-- 3 Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT DISTINCT
    maker
FROM
    product
WHERE
    type = 'PC'
        AND maker NOT IN (SELECT 
            maker
        FROM
            product
        WHERE
            type = 'Laptop');



-- 4 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT
    p.maker
FROM
    product p
        JOIN
    pc ON p.model = pc.model
WHERE
    pc.speed >= 450;



-- 5 Найдите среднюю скорость ПК.
SELECT 
    AVG(speed) AS avg_speed_of_pc
FROM
    pc;


/*6 Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.*/
SELECT 
    p.maker, AVG(l.screen) AS avg_laptop_of_screen
FROM
    product p
        JOIN
    laptop l ON p.model = l.model
GROUP BY p.maker;
