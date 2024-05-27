
-- 1. Retrieve all customer orders along with their total price and number of items.
SELECT co.id AS order_id,
       c.first_name,
       c.last_name,
       SUM(a.price) AS total_price,
       COUNT(ci.id) AS number_of_items,
       co.order_date
FROM customer_order co
         JOIN customer c ON co.customer_id = c.id
         JOIN cart_item ci ON co.cart_id = ci.cart_id
         JOIN article a ON ci.article_id = a.id
GROUP BY co.id, c.first_name, c.last_name, co.order_date
ORDER BY co.order_date DESC;

-- 2. Find the top 5 customers with the highest total order value.
SELECT c.id,
       c.first_name,
       c.last_name,
       SUM(a.price) AS total_spent
FROM customer c
         JOIN customer_order co ON c.id = co.customer_id
         JOIN cart_item ci ON co.cart_id = ci.cart_id
         JOIN article a ON ci.article_id = a.id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;


-- 3. List all products along with their traits.

SELECT p.id AS product_id,
       p.name AS product_name,
       pt.weight_kg,
       pt.dimensions_mm,
       pt.consumer_product,
       pt.fragile
FROM product p
         JOIN product_to_product_trait ptpt ON p.id = ptpt.product_id
         JOIN product_trait pt ON ptpt.product_trait_id = pt.id
ORDER BY p.name;


-- 4. Find all products that are fragile and their corresponding warehouse locations.

SELECT p.id AS product_id,
       p.name AS product_name,
       w.name AS warehouse_name,
       w.address AS warehouse_address
FROM product p
         JOIN product_to_product_trait ptpt ON p.id = ptpt.product_id
         JOIN product_trait pt ON ptpt.product_trait_id = pt.id
         JOIN article a ON p.id = a.product_id
         JOIN warehouse_inventory wi ON a.id = wi.article_id
         JOIN warehouse w ON wi.warehouse_id = w.id
WHERE pt.fragile = 1
ORDER BY p.name;


-- 5. Count the number of articles stored in each warehouse.

SELECT w.id AS warehouse_id,
       w.name AS warehouse_name,
       COUNT(wi.article_id) AS number_of_articles
FROM warehouse w
         JOIN warehouse_inventory wi ON w.id = wi.warehouse_id
GROUP BY w.id, w.name
ORDER BY number_of_articles DESC;


-- 6. Retrieve the order history of a specific customer along with shipping address details.
SELECT co.id AS order_id,
       co.order_date,
       co.status,
       sa.address,
       sa.city,
       sa.state,
       sa.zip,
       sa.country
FROM customer_order co
         JOIN customer c ON co.customer_id = c.id
         JOIN shipping_address sa ON co.shipping_address_id = sa.id
WHERE c.id = 2 -- Replace with the specific customer ID
ORDER BY co.order_date DESC;


-- 7. Find all articles with no associated product in the inventory.

SELECT a.id AS article_id,
       a.name AS article_name,
       a.code,
       a.variant,
       a.description
FROM article a
         LEFT JOIN product p ON a.product_id = p.id
WHERE a.product_id IS NULL;


-- 8. List all customers who have never placed an order.

SELECT c.id,
       c.first_name,
       c.last_name,
       c.email,
       c.phone
FROM customer c
         LEFT JOIN customer_order co ON c.id = co.customer_id
WHERE co.id IS NULL;


-- 9. Get the details of warehouses that have reached or exceeded their total capacity.

SELECT w.id AS warehouse_id,
       w.name AS warehouse_name,
       w.totalCapacity,
       COUNT(wi.article_id) AS current_inventory_count
FROM warehouse w
         JOIN warehouse_inventory wi ON w.id = wi.warehouse_id
GROUP BY w.id, w.name, w.totalCapacity
HAVING current_inventory_count >= w.totalCapacity;


-- 10. Get the details of warehouses that have reached or exceeded the capacity of 50.

SELECT w.id AS warehouse_id,
       w.name AS warehouse_name,
       w.totalCapacity,
       COUNT(wi.article_id) AS current_inventory_count
FROM warehouse w
         JOIN warehouse_inventory wi ON w.id = wi.warehouse_id
GROUP BY w.id, w.name, w.totalCapacity
HAVING current_inventory_count >= 50;


-- 11. Find all customers who have placed orders with a total value greater than 500.

SELECT c.id,
       c.first_name,
       c.last_name,
       SUM(a.price) AS total_spent
FROM customer c
         JOIN customer_order co ON c.id = co.customer_id
         JOIN cart_item ci ON co.cart_id = ci.cart_id
         JOIN article a ON ci.article_id = a.id
GROUP BY c.id, c.first_name, c.last_name
HAVING total_spent > 500;


    -- 12. Retrieve the details of all customers who have placed orders with a status of 'SHIPPED'.

    SELECT c.id,
           c.first_name,
           c.last_name,
           co.id AS order_id,
           co.order_date,
           co.status
    FROM customer c
             JOIN customer_order co ON c.id = co.customer_id
    WHERE co.status = 'SHIPPED';


-- 13. List the names of all categories and the count of products in each category.

SELECT cat.name AS category_name,
       COUNT(p.id) AS product_count
FROM category cat
         LEFT JOIN product p ON cat.id = p.category_id
GROUP BY cat.id, cat.name
ORDER BY product_count DESC;


SELECT p.id AS product_id, p.name AS product_name, COUNT(ci.id) AS total_quantity_sold
FROM `product` p
         JOIN `article` a ON p.id = a.product_id
         JOIN `cart_item` ci ON a.id = ci.article_id
         JOIN `cart` ca ON ci.cart_id = ca.id
         JOIN `customer_order` o ON ca.id = o.cart_id
GROUP BY p.id, p.name
ORDER BY total_quantity_sold DESC;




-- 16. Find the top 3 warehouses with the highest total value of inventory:

SELECT w.id AS warehouse_id, w.name AS warehouse_name, SUM(a.price) AS total_inventory_value
FROM `warehouse` w
         JOIN `article` a ON w.id = a.warehouse_id
GROUP BY w.id, w.name
ORDER BY total_inventory_value DESC
LIMIT 3;


-- 17. Find the products that have been ordered the most, along with their total quantity sold

SELECT p.id AS product_id, p.name AS product_name, COUNT(ci.id) AS total_quantity_sold
FROM `product` p
         JOIN `article` a ON p.id = a.product_id
         JOIN `cart_item` ci ON a.id = ci.article_id
         JOIN `cart` ca ON ci.cart_id = ca.id
         JOIN `customer_order` o ON ca.id = o.cart_id
GROUP BY p.id, p.name
ORDER BY total_quantity_sold DESC;
