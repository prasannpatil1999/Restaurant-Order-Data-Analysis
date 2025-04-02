-- Use menu_items table
use restaurant_db;

-- TASK1: Combine menu_items and oredr_details tables into one single table?
select *
 from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id

-- TASK2: What were the least and most ordered items. What categories were  they in?
select item_name,category ,count(item_id) as count_of_items
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count_of_items desc

-- TASK3: What were the top 5 orders that spent most money?

select order_id,sum(price) as total_price
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_price desc
limit 5

-- TASK4: View the details of the highest spend order. What insights you can gather from?
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

-- TASK5: View the details of the Top 5 hignest spend order. What insights you can gather from?

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



