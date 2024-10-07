SELECT * FROM alcohol_sale.`alcohol sales`;
-- Cleaning 
Select Month, supplier,item_description,item_type,retail_sales,retail_transfers,warehouse_sales
FROM alcohol_sale.`alcohol sales`;

-- which item type had the highest and month
-- The highest month that alcohol was sold was on the first month followed by 7th then 3 and 10th was the last
SELECT distinct month, count(item_type) as count_alcohol
FROM alcohol_sale.`alcohol sales`
group by month
Order by month;
-- In all then 4 months wine had the highest sales,followed by liquor, beer,keg,non-alcohol then this but they differ str_supplies,dunnage and ref respectively
SELECT distinct month,item_type, count(item_type) as count_alcohol
FROM alcohol_sale.`alcohol sales`
group by month,item_type
Order by month, item_type;

-- Which type of store sold a lot
-- When  it comes warehouse sales what is selling there wine and beer respectively
-- When it comes to retail sales what is doing better is liquor and non-alcohol respictively
SELECT  month, item_type, sum(retail_sales),sum(warehouse_sales)
FROM alcohol_sale.`alcohol sales`
group by month, item_type
order by month,item_type

-- Which kind of wine to stock up
-- When it comes to warehouse sale stock up SUTTER HOME CHARD - 187ML 
-- When it comes to retail sales stock up BLACK BOX MONTEREY CHARD BIB - 3L
SELECT item_type, item_description, sum(retail_sales),sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'wine'
and warehouse_sales >= 20
group by item_type, item_description
order by  total_warehouse_sales desc

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'wine'
and warehouse_sales >= 20
group by item_type, item_description
order by  total_retail_sales desc

-- Which kind of beer to stock up
-- When it comes to warehouse sale stock up CORONA EXTRA LOOSE NR - 12OZ
-- When it comes to retail sales stock up CORONA EXTRA LOOSE NR - 12OZ

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'beer'
and warehouse_sales >= 20
group by item_type, item_description
order by  total_retail_sales desc

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'beer'
and warehouse_sales >= 20
group by item_type, item_description
order by  total_warehouse_sales desc

-- Which kind of liquor to stock up
-- When it comes to warehouse sale stock up MONTEZUMA TEQUILA - GOLD - 1L
-- When it comes to retail sales stock up TITO'S HANDMADE VODKA - 1.75L

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'liquor'
and warehouse_sales >= 20
group by item_type, item_description
order by  total_warehouse_sales desc

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'liquor'
and warehouse_sales >= 20
group by item_type, item_description
order by  total_retail_sales desc

-- Which kind of non-alcohol to stock up
-- When it comes to warehouse sale stock up BECKS N/A-NR  - 12OZ
-- When it comes to retail sales stock up GOSLINGS GINGER BEER-NA-4/6 CAN - 12OZ (SODA)

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'non-alcohol'
and warehouse_sales >= 5
group by item_type, item_description
order by  total_warehouse_sales desc

SELECT item_type, item_description, sum(retail_sales) as total_retail_sales,sum(warehouse_sales) as total_warehouse_sales
FROM alcohol_sale.`alcohol sales`
where item_type = 'non-alcohol'
and warehouse_sales >= 5
group by item_type, item_description
order by  total_retail_sales desc