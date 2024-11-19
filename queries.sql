-- 1. All products available in the store
SELECT p.product_id, p.name, p.price, c.name AS category
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
ORDER BY p.name;

-- 2. Total sales amount for each product (quantity * price)
SELECT oi.product_id, p.name AS product_name, SUM(oi.quantity * oi.price) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY oi.product_id, p.name
ORDER BY total_sales DESC;

-- 3. Total sales amount for each category (grouping products by category)
SELECT c.name AS category_name, SUM(oi.quantity * oi.price) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.name
ORDER BY total_sales DESC;

-- 4. Orders with their total amount, customer information and order status
SELECT o.order_id, o.order_date, o.total_amount, o.status,
       c.first_name || ' ' || c.last_name AS customer_name, 
       c.email, c.shipping_address
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- 5. Number of orders placed by each customer
SELECT c.first_name || ' ' || c.last_name AS customer_name, 
       COUNT(o.order_id) AS order_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY order_count DESC;

-- 6. Total sales amount by customer (total money spent per customer)
SELECT c.first_name || ' ' || c.last_name AS customer_name,
       SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- 7. Orders shipped and their shipment status
SELECT o.order_id, o.order_date, o.total_amount, s.shipment_date, s.status AS shipment_status
FROM Orders o
JOIN Shipments s ON o.order_id = s.order_id
WHERE s.status = 'SHIPPED'
ORDER BY o.order_date DESC;

-- 8. List of customers who have not placed any orders (inactive customers)
SELECT c.first_name || ' ' || c.last_name AS customer_name, c.email
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.last_name;

-- 9. Most recent orders placed by customers (last 5 orders)
SELECT o.order_id, o.order_date, o.total_amount, o.status,
       c.first_name || ' ' || c.last_name AS customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC
FETCH FIRST 5 ROWS ONLY;

-- 10. Products that have low stock (less than 50 items left)
SELECT product_id, name, stock_quantity
FROM Products
WHERE stock_quantity < 50
ORDER BY stock_quantity;

-- 11. Average order value per customer
SELECT c.first_name || ' ' || c.last_name AS customer_name, 
       AVG(o.total_amount) AS average_order_value
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY average_order_value DESC;

-- 12. Total sales and number of orders by product category
SELECT c.name AS category_name,
       COUNT(o.order_id) AS number_of_orders,
       SUM(oi.quantity * oi.price) AS total_sales
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY c.name
ORDER BY total_sales DESC;

-- 13. List of orders with total amount greater than $100
SELECT o.order_id, o.order_date, o.total_amount, c.first_name || ' ' || c.last_name AS customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 100
ORDER BY o.order_date DESC;

-- 14. Total payments received by payment method
SELECT p.payment_method, SUM(p.amount) AS total_payments
FROM Payments p
GROUP BY p.payment_method
ORDER BY total_payments DESC;

-- 15. Find products that were never ordered
SELECT p.product_id, p.name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL
ORDER BY p.name;

-- 16. Customers who ordered a specific product (e.g., "Fishing Rod")
SELECT DISTINCT c.first_name || ' ' || c.last_name AS customer_name, c.email
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.name LIKE '%Fishing Rod%'
ORDER BY c.last_name;

-- 17. Total quantity sold for each product
SELECT p.name AS product_name, SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC;

-- 18. Products that were ordered in the highest quantity
SELECT p.name AS product_name, SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC
FETCH FIRST 5 ROWS ONLY;