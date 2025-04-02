-- Use menu_items table
use restaurant_db;

-- TASK1: Is to expore order_details table?
select *
from order_details

-- TASK2: What is the date range of  order_details table?
-- max date
select  max(order_date)
from order_details
-- OR this way
select  *
from order_details
order by order_date desc

-- min date
select  min(order_date)
from order_details
-- OR this way
select  *
from order_details
order by order_date

-- TASK3: How many orders were made within date range in table?

select  count(distinct(order_id))
from order_details

-- TASK4: How many items were ordered within date range in table?
select  count(item_id)
from order_details

-- TASK5: Which order had the most no of items?
select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
order by no_of_items desc

-- TASK6: How many Orders have more than 12 items?
select count(*)
from  (select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
having no_of_items > 12
order by no_of_items desc) as no_of_items_ordered_above_12

-- Sub Query
select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
having no_of_items > 12
order by no_of_items desc

-- TASK7: What is the average dish price  within each category
select category,count(*),avg(price)
from menu_items
group by category