-- Basic SELECT
SELECT *
FROM Customers;

SELECT *
FROM Products;


-- WHERE + ORDER BY
SELECT p_id, p_name, p_price
FROM Products
WHERE p_price > 10
ORDER BY p_price DESC;


-- INNER JOIN: orders with customer details
SELECT
    o.o_id,
    o.o_ref,
    o.o_date,
    o.o_stat,
    c.c_name
FROM Orders o
INNER JOIN Customers c
    ON o.c_id = c.c_id;


-- JOIN: order details with product information
SELECT
    od.o_id,
    p.p_name,
    od.order_qty,
    p.p_price,
    (od.order_qty * p.p_price) AS total_amount
FROM Order_Details od
INNER JOIN Products p
    ON od.p_id = p.p_id;


-- MULTIPLE JOINS: full order summary
SELECT
    o.o_id,
    c.c_name,
    p.p_name,
    od.order_qty,
    p.p_price,
    (od.order_qty * p.p_price) AS total_amount
FROM Orders o
INNER JOIN Customers c
    ON o.c_id = c.c_id
INNER JOIN Order_Details od
    ON o.o_id = od.o_id
INNER JOIN Products p
    ON od.p_id = p.p_id
ORDER BY o.o_id;


-- GROUP BY + SUM
SELECT
    o.o_id,
    SUM(od.order_qty * p.p_price) AS order_total
FROM Orders o
INNER JOIN Order_Details od
    ON o.o_id = od.o_id
INNER JOIN Products p
    ON od.p_id = p.p_id
GROUP BY o.o_id;


-- GROUP BY + HAVING
SELECT
    c.c_id,
    c.c_name,
    COUNT(o.o_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
    ON c.c_id = o.c_id
GROUP BY c.c_id, c.c_name
HAVING COUNT(o.o_id) >= 1;


-- AGGREGATE FUNCTIONS
SELECT
    COUNT(*) AS total_products,
    AVG(p_price) AS average_price,
    MAX(p_price) AS highest_price,
    MIN(p_price) AS lowest_price
FROM Products;


-- INVENTORY WITH VENDOR DETAILS
SELECT
    i.in_id,
    i.in_stockqty,
    i.in_price,
    i.in_date,
    v.v_name
FROM Inventory i
INNER JOIN Vendors v
    ON i.v_id = v.v_id;


-- PRODUCT INVENTORY
SELECT
    p.p_name,
    i.in_stockqty,
    v.v_name
FROM Inventory_Details id
INNER JOIN Products p
    ON id.p_id = p.p_id
INNER JOIN Inventory i
    ON id.in_id = i.in_id
INNER JOIN Vendors v
    ON i.v_id = v.v_id;


-- DELIVERY INFORMATION
SELECT
    d.d_id,
    o.o_id,
    c.c_name,
    s.s_name AS staff_name,
    d.d_date,
    d.d_cost,
    d.d_method
FROM Delivery d
INNER JOIN Orders o
    ON d.o_id = o.o_id
INNER JOIN Customers c
    ON o.c_id = c.c_id
INNER JOIN Staff s
    ON d.s_id = s.s_id;


-- SUBQUERY: products above average price
SELECT
    p_id,
    p_name,
    p_price
FROM Products
WHERE p_price > (
    SELECT AVG(p_price)
    FROM Products
);


-- SUBQUERY: customers with at least one order
SELECT
    c_id,
    c_name
FROM Customers
WHERE c_id IN (
    SELECT c_id
    FROM Orders
);


-- Find products with low stock
SELECT
    p.p_id,
    p.p_name,
    i.in_stockqty
FROM Products p
INNER JOIN Inventory_Details id
    ON p.p_id = id.p_id
INNER JOIN Inventory i
    ON id.in_id = i.in_id
WHERE i.in_stockqty < 120
ORDER BY i.in_stockqty ASC;
