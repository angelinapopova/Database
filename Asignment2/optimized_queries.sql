USE Asignment2;
SELECT 
    o.order_id,
    u.name AS user_name,
    u.email,
    p.name AS product_name,
    p.price,
    o.quantity,
    o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN products p ON o.product_id = p.product_id
LIMIT 50;

CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_product_id ON orders(product_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_products_price ON products(price);

EXPLAIN ANALYZE #23,19
SELECT 
    o.order_id,
    u.name AS customer,
    o.order_date,
    SUM(o.quantity * p.price) AS total_price
FROM orders o
JOIN users u USING (user_id)
JOIN products p USING (product_id)
GROUP BY o.order_id
ORDER BY total_price DESC
LIMIT 20;

EXPLAIN ANALYZE #15,23
WITH user_orders AS (
    SELECT 
        user_id,
        COUNT(order_id) AS orders_count
    FROM orders
    GROUP BY user_id
)
SELECT 
    u.user_id,
    u.name,
    COALESCE(uo.orders_count, 0) AS orders_count
FROM users u
LEFT JOIN user_orders uo ON u.user_id = uo.user_id
ORDER BY uo.orders_count DESC
LIMIT 20;


EXPLAIN ANALYZE #26,9 sec
SELECT /*+
    HASH_JOIN(o p)
    JOIN_ORDER(p o)
    NO_BNL(o p)
*/
    p.product_id,
    p.name AS product_name,
    COUNT(o.order_id) AS times_ordered,
    SUM(o.quantity) AS total_quantity_sold
FROM products p
JOIN orders o USE INDEX (idx_orders_product_id)
    ON p.product_id = o.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC
LIMIT 20;


