-- 1. Get all customers and their addresses.
SELECT "customers"."first_name", "customers"."last_name", "addresses"."address_type", "addresses"."street", "addresses"."city", "addresses"."state", "addresses"."zip"
FROM "customers"
JOIN "addresses"
ON "customers"."id"= "addresses"."customer_id";

-- 2. Get all orders and their line items. AKA Get order id, name of product, and quantity
SELECT "line_items"."order_id", "products"."description", "line_items"."quantity"
FROM "line_items"
JOIN "products"
ON "products"."id" = "line_items"."product_id";


-- 3. Which warehouses have cheetos? I also included how many they have on hand
SELECT "warehouse"."id", "warehouse"."warehouse", "warehouse_product"."on_hand"
FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" ILIKE 'cheetos';


-- 4. Which warehouses have diet pepsi? I also inclueded how many they have on hand
SELECT "warehouse"."id", "warehouse"."warehouse", "warehouse_product"."on_hand"
FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" ILIKE 'diet pepsi';


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."last_name",
COUNT("orders"."address_id")
FROM "orders"
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers"."last_name";

SELECT "customers",
COUNT("orders"."address_id")
FROM "orders"
JOIN "addresses" ON "addresses"."id" = "orders"."address_id"
JOIN "customers" ON "customers"."id" = "addresses"."customer_id"
GROUP BY "customers";


-- 6. How many customers do we have?
SELECT COUNT (*)
FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT (*)
FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM ("warehouse_product"."on_hand")
FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" ILIKE 'diet pepsi';


-- 9. (Stretch) How much was the total cost for each order?


-- 10. (Stretch) How much has each customer spent in total?


-- 11. (Stretch) How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).