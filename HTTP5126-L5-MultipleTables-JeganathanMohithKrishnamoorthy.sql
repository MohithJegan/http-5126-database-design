--  LAB 5 MULTIPLE TABLES
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sales WHERE item=1014;
-- B 
SELECT sales.date, stock_items.item FROM sales INNER JOIN stock_items ON sales.item=stock_items.id WHERE sales.item=1014;

--  2
-- A 
SELECT * FROM sales INNER JOIN employees ON sales.employee=employees.id WHERE sales.employee=111;
-- B
SELECT sales.date, CONCAT(employees.first_name," ",employees.last_name) AS Name, sales.item
FROM sales
INNER JOIN employees
ON sales.employee=employees.id
WHERE sales.employee=111;

--  3
-- A
SELECT sales.date, sales.item, employees.first_name
FROM sales
INNER JOIN employees
ON sales.employee=employees.id
WHERE sales.date BETWEEN '2024-09-12' AND '2024-09-18';
-- B
SELECT COUNT(sales.item) AS Item, CONCAT(employees.first_name," ",employees.last_name) AS Name
FROM sales
INNER JOIN employees
ON sales.employee=employees.id
GROUP BY Name 
ORDER BY Item DESC;

--  4
-- A
SELECT s.item, e.first_name, s.date, si.item, si.price, si.category FROM sales s
LEFT JOIN employees e
ON s.employee=e.id
LEFT JOIN stock_items si
ON s.item=si.id
WHERE e.first_name="Farud";
-- B
SELECT COUNT(sales.id) AS "Times Sold",stock_items.id, stock_items.item, stock_items.price, stock_items.category
FROM stock_items
LEFT JOIN sales
ON stock_items.id=sales.item
GROUP BY  stock_items.id, stock_items.item, stock_items.price, stock_items.category
ORDER BY stock_items.id;

--  5
-- A How many items present in the sales has been sold by each employee and group them by employee. The results should show most sales to least sales.
-- B
SELECT 
    CONCAT(employees.first_name," ",employees.last_name) AS Name, 
    COUNT(sales.id) AS "Items sold"
FROM sales
INNER JOIN employees 
ON sales.employee = employees.id
GROUP BY employees.first_name, employees.last_name
ORDER BY "Items sold" DESC;
