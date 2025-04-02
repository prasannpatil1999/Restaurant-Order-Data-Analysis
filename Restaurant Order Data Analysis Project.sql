-- Use menu_items table
use restaurant_db;

-- TASK1: Is to expore menu_items table?
select *
from menu_items

-- TASK2: Is to count items in menu_items table?
select count(*)
from menu_items

-- TASK3: Is to find least and most expensive items in menu_items table?

-- Most expensive
select item_name
from menu_items
where price = (select max(price)
from menu_items)
-- OR this way
select *
from menu_items
order by price desc

-- Least expensive
select item_name
from menu_items
where price = (select min(price)
from menu_items)

-- OR this way
select *
from menu_items
order by price

-- TASK4: How many Italian disjhes are on menu_items table?
select count(*)
from menu_items
where category = "Italian"

-- TASK5: Is to find least and most expensive Itlain item in menu_items table?

-- Most expensive
select item_name
from menu_items
where price = (select max(price)
from menu_items
where category ="Italian")  and  category ="Italian"

-- OR this way
select *
from menu_items
where category ="Italian"
order by price desc

-- Least expensive
select item_name
from menu_items
where price = (select min(price)
from menu_items
where category ="Italian") and  category ="Italian"

-- OR this way
select *
from menu_items
where category ="Italian"
order by price

-- TASK6: How many dishes in each category?
select category,count(*)
from menu_items
group by category

-- TASK7: What is the average dish price  within each category?
select category,count(*),avg(price)
from menu_items
group by category


-- Use menu_items table
use restaurant_db;

-- TASK8: Is to expore order_details table?
select *
from order_details

-- TASK9: What is the date range of  order_details table?
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

-- TASK10: How many orders were made within date range in table?

select  count(distinct(order_id))
from order_details

-- TASK11: How many items were ordered within date range in table?
select  count(item_id)
from order_details

-- TASK12: Which order had the most no of items?
select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
order by no_of_items desc

-- TASK13: How many Orders have more than 12 items?
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

-- TASK14: What is the average dish price  within each category
select category,count(*),avg(price)
from menu_items
group by category

-- Use menu_items table
use restaurant_db;

-- TASK15: Combine menu_items and order_details tables into one single table?
select *
 from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id

-- TASK16: What were the least and most ordered items. What categories were  they in?
select item_name,category ,count(item_id) as count_of_items
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count_of_items desc

-- TASK17: What were the top 5 orders that spent most money?

select order_id,sum(price) as total_price
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_price desc
limit 5

-- TASK18: View the details of the highest spend order. What insights you can gather from?
select *
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440

-- Checking for insights
select category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category

-- TASK19: View the details of the Top 5 hignest spend order. What insights you can gather from?

select * 
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)

-- Checking for insights
select category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by category

select order_id,category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by order_id, category



