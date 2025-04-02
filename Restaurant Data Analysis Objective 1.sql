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