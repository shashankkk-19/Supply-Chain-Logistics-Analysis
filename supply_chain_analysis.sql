CREATE DATABASE supply_chain_db;
USE supply_chain_db;
CREATE TABLE supply_chain (
    Date DATE,
    Region VARCHAR(50),
    Category VARCHAR(50),
    Supplier VARCHAR(50),
    Warehouse VARCHAR(50),
    Order_Status VARCHAR(20),
    Units_Sold INT,
    Inventory_Level INT,
    Transportation_Cost DOUBLE,
    Order_Accuracy BOOLEAN,
    Lead_Time_Days INT,
    Backorder BOOLEAN,
    COGS DOUBLE,
    Average_Inventory INT,
    Warehouse_Capacity INT,
    inventory_status VARCHAR(20),
    inventory_turnover DOUBLE,
    lead_time_category VARCHAR(20),
    cost_per_unit DOUBLE,
    warehouse_utilization DOUBLE,
    warehouse_risk VARCHAR(20),
    backorder_flag INT
);
SELECT COUNT(*) FROM supply_chain;
SELECT * FROM supply_chain LIMIT 5;
SELECT
    COUNT(*) AS total_orders,
    SUM(`Units Sold`) AS total_units_sold
FROM supply_chain;
SELECT
    `Order Status`,
    COUNT(*) AS total_orders
FROM supply_chain
GROUP BY `Order Status`;
SELECT
    ROUND(
        SUM(CASE 
                WHEN `Order Status` = 'Fulfilled' THEN 1 
                ELSE 0 
            END
        ) / COUNT(*) * 100,
        2
    ) AS fulfillment_rate_percentage
FROM supply_chain;
SELECT
    backorder_flag,
    COUNT(*) AS total_orders
FROM supply_chain
GROUP BY backorder_flag;
SELECT
    ROUND(
        SUM(CASE 
                WHEN backorder_flag = 1 THEN 1 
                ELSE 0 
            END
        ) / COUNT(*) * 100,
        2
    ) AS backorder_rate_percentage
FROM supply_chain;
SELECT
    ROUND(AVG(`Inventory Level`), 2) AS avg_inventory_level
FROM supply_chain;
SELECT
    ROUND(
        SUM(`Units Sold`) / AVG(`Inventory Level`),
        2
    ) AS inventory_turnover
FROM supply_chain;
SELECT
    ROUND(
        AVG(`Average Inventory`) / AVG(`Warehouse Capacity`) * 100,
        2
    ) AS warehouse_utilization_percentage
FROM supply_chain;
SELECT
    ROUND(
        SUM(`Cost of Goods Sold (COGS)`) / SUM(`Units Sold`),
        2
    ) AS cost_per_unit
FROM supply_chain;
SELECT
    COUNT(*) AS total_orders,
    ROUND(
        SUM(CASE WHEN `Order Status` = 'Fulfilled' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS fulfillment_rate_pct,
    ROUND(
        SUM(CASE WHEN backorder_flag = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS backorder_rate_pct,
    ROUND(AVG(`Inventory Level`), 2) AS avg_inventory_level,
    ROUND(
        SUM(`Units Sold`) / AVG(`Inventory Level`),
        2
    ) AS inventory_turnover,
    ROUND(
        AVG(`Average Inventory`) / AVG(`Warehouse Capacity`) * 100,
        2
    ) AS warehouse_utilization_pct,
    ROUND(
        SUM(`Cost of Goods Sold (COGS)`) / SUM(`Units Sold`),
        2
    ) AS cost_per_unit
FROM supply_chain;





