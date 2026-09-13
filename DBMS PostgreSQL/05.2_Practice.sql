--- 1. List each customer's name with their order's amount. Customers who have never ordered will be shown in the list.
SELECT c.name, o.amount
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id;

--- 2. List all customers and their city who have at least one order.
SELECT DISTINCT c.name, c.city
FROM customers c
INNER JOIN orders o
  ON c.customer_id = o.customer_id;

--- 3. List all the customers who order is canceled.
SELECT DISTINCT c.customer_id, c.name, c.email, c.city
FROM customers c
INNER JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.status = 'Cancelled';

--- 4. List all customers who has at least one delivered shipments.
SELECT DISTINCT c.customer_id, c.name, c.email, c.city
FROM customers c
INNER JOIN orders o
  ON c.customer_id = o.customer_id
INNER JOIN shipments s
  ON o.order_id = s.order_id
WHERE s.status = 'Delivered';

--- 5. Find all the orders that have not been shipped.
SELECT o.order_id, o.customer_id, o.order_date, o.amount, o.status
FROM orders o
LEFT JOIN shipments s
  ON o.order_id = s.order_id
WHERE s.shipment_id IS NULL;