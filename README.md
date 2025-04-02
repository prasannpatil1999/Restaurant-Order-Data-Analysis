# Restaurant Order Data Analysis


## Tables of Contents: 
- [Project Overview](#project-overview)  
- [Tools Used](#tools-used)  
- [Data Sources](#data-sources)  
- [Data Cleaning/Preparation](#data-cleaningpreparation)  
- [Key Business Questions Answered](#key-business-questions-answered)  
- [Project Files](#project-files)  
- [How to Use](#how-to-use)  
- [Insights & Findings](#insights--findings)  
- [Recommendations](#recommendations)  
- [Conclusion](#conclusion)
  
### Project Overview
The "Restaurant Order Data Analysis" project focuses on analyzing customer orders, sales trends, and menu performance to gain insights into customer preferences and operational efficiency. It aims to optimize restaurant operations by identifying popular dishes, peak order times, and sales patterns.

### Tools Used
- MySQL

### Data Sources
The data source for the "Restaurant Order Data Analysis" project includes two files:

menu_items.csv: Contains details of menu items, including item names, categories, prices, and ingredients.

order_details.csv: Includes order transactions with order IDs, item quantities, timestamps, and customer details, helping to track sales and dining trends.

### Data Cleaning/Preparation
- In the initial data preparation phase, we performed the following tasks:

1. Imported data into the MySQL database and conducted an inspection.
2. Removed duplicates
3. Corrected spelling errors, typos, and inconsistencies.

### Key Business Questions Answered
- TASK 1: Is to expore menu_items table?
- TASK 2: Is to count items in menu_items table?
- TASK 3: Is to find least and most expensive items in menu_items table?
-  TASK 4: How many Italian disjhes are on menu_items table?
- TASK 5: Is to find least and most expensive Itlain item in menu_items table?
- TASK 6: How many dishes in each category?
- TASK 7: What is the average dish price  within each category?

- TASK 8: Is to expore order_details table?
- TASK 9: What is the date range of  order_details table?
- TASK 10: How many orders were made within date range in table?
- TASK 11 How many items were ordered within date range in table?
- TASK 12: Which order had the most no of items?
- TASK 13: How many Orders have more than 12 items?
- TASK 14: What is the average dish price  within each category


- TASK15: Combine menu_items and oredr_details tables into one single table?
- TASK16: What were the least and most ordered items. What categories were  they in?
- TASK17: What were the top 5 orders that spent most money?
- TASK18: View the details of the highest spend order. What insights you can gather from?
- TASK19: View the details of the Top 5 hignest spend order. What insights you can gather from?
 

### Project Files
- 📊 "restaurant_db" (Database File) - Contains all data.
- 📝 Problem Statement (Word File) - Outlines the business questions and objectives.

 ### How to Use
1. Review the Problem Statement PDF to understand the key objectives.
2. Use the Readme file to get answers

### Insights & Findings

-- TASK 1: Is to explore menu_items table?
````sql
select *
 from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
````
**Results:**

- We get entire table in result
  
-- TASK 2: Is to count items in menu_items table?

````sql
select item_name,category ,count(item_id) as count_of_items
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count_of_items desc

````
**Results:**
Total Items in Menu|
---------------------|
 32       |

  
-- TASK 3: Is to find least and most expensive items in menu_items table?
````sql
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
````
**Results:**
Most expensive item|
---------------------|
 Shrimp Scampi       |

 Least expensive items|
---------------------|
 Edamame      |
 
-- TASK 4: How many Italian dishes are on menu_items table?
````sql
select count(*)
from menu_items
where category = "Italian"
````
**Results:**
Total 9  Italian dishes|
---------------------|
 9      |
 
-- TASK 5: Is to find least and most expensive Itlain item in menu_items table?
````sql
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
````
**Results:**
Most expensive italian dish|
---------------------|
 Shrimp Scampi       |

 Least expensive italian dish|
---------------------|
 Spaghetti      |
  
-- TASK 6: How many dishes in each category?
````sql
select category,count(*)
from menu_items
group by category
````
**Results:**
 Cuisine   | Items Sold | 
-----------|------------|
 American  | 6          | 
 Asian     | 8          | 
 Mexican   | 9          | 
 Italian   | 9          | 

 
- American 6, Asian 8 , Italian 9 and mexican 9
  
-- TASK 7: What is the average dish price  within each category?
````sql
sselect category,count(*),avg(price)
from menu_items
group by category
````
**Results:**
  
 Cuisine   | Items Sold | Average Price (USD) |
-----------|------------|---------------------|
 American  | 6          | 10.07               |
 Asian     | 8          | 13.48               |
 Mexican   | 9          | 11.80               |
 Italian   | 9          | 16.75               |

-- TASK 8: Is to expore order_details table?
````sql
select *
from order_details
````
**Results:**

- Selects entire order_details table in result

  
-- TASK 9: What is the date range of  order_details table?
````sql
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
````
**Results:**
Max order date|
---------------------|
 2023-03-31      |
 
Min order date|
---------------------|
2023-01-01      |
  
-- TASK 10: How many orders were made within date range in table?
````sql
select  count(distinct(order_id))
from order_details
````
**Results:**
orders were made within date range|
---------------------|
5370    |

-- TASK 11 How many items were ordered within date range in table?
````sql
select  count(item_id)
from order_details
````
**Results:**
items  ordered within date range|
---------------------|
12097  |
  
-- TASK 12: Which order had the most no of items?
````sql
select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
order by no_of_items desc
````
**Results:**
Order ID   | No of items |
-----------|------------|
 4305  | 14          | 
  
-- TASK 13: How many Orders have more than 12 items?
````sql
select count(*)
from  (select  order_id, count(item_id) as no_of_items
from order_details
group by order_id
having no_of_items > 12
order by no_of_items desc) as no_of_items_ordered_above_12
````
**Results:**
Count|
---------------------|
20  |
  
-- TASK 14: What is the average dish price  within each category?
````sql
select category,count(*),avg(price)
from menu_items
group by category
````
**Results:**
 Cuisine   | Items Sold | Average Price (USD) |
-----------|------------|---------------------|
 American  | 6          | 10.07               |
 Asian     | 8          | 13.48               |
 Mexican   | 9          | 11.80               |
 Italian   | 9          | 16.75               |


-- TASK15: Combine menu_items and oredr_details tables into one single table?
````sql
select *
 from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
````
**Results:**

- We got single table which is result of mix of menu_items and oredr_details tables 
  
-- TASK16: What were the least and most ordered items. What categories were  they in?
````sql
select item_name,category ,count(item_id) as count_of_items
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count_of_items desc
````
**Results:**

Item name   | Category | count of items |
-----------|------------|---------------------|
 Hamburger  | American          | 622               |
 Chicken Tacos   | Mexican       | 123            |
 
-- TASK17: What were the top 5 orders that spent most money?
````sql
select order_id,sum(price) as total_price
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_price desc
limit 5
````
**Results:**
 order_id | total_price (USD) |
----------|------------------|
 440      | 192.15           |
 2075     | 191.05           |
 1957     | 190.10           |
 330      | 189.70           |
 2675     | 185.10           |
  
-- TASK18: View the details of the highest spend order. What insights you can gather from?
````sql
-- Checking for insights
select category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category
````
**Results:**

- He has spent most of his money on Italian dishes
  
-- TASK19: View the details of the Top 5 hignest spend order. What insights you can gather from?
````sql
-- Checking for insights
select category,count(order_id)
from order_details od
join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by category
````
**Results:**

- Top 5 hignest spendrs have spent most of their money on Italian dishes


### Recommendations
- Expand the Italian Menu: Since the highest-spending orders are dominated by Italian dishes, consider adding new Italian dishes or premium options.
- Promote High-Selling Items: The Hamburger (American) and Chicken Tacos (Mexican) are the most ordered items—promoting them with combo deals or upsell strategies can increase revenue.
- Analyze Low-Selling Items: Identify and improve or remove menu items with low sales to optimize the menu.
- Optimize Pricing Strategy: With Italian dishes having the highest average price, introducing mid-range Italian options may attract more customers.
- Enhance Order Size Growth: Since some orders contain over 12 items, encourage group or family meal deals to increase the average order size.
- Target High-Spending Customers: Create loyalty programs or discounts for repeat high-value customers, especially those ordering Italian cuisine frequently.

### Conclusion
The Restaurant Order Data Analysis provides valuable insights into customer preferences, sales trends, and menu performance. Italian dishes emerge as the most popular and highest-grossing category, indicating a strong demand. Optimizing the menu by expanding high-selling items, adjusting pricing strategies, and promoting group deals can enhance revenue. Implementing targeted marketing and loyalty programs for frequent high-spending customers can further boost profitability.

### Author
- Prasannagoud Patil

### Email
- Prasannpatil31@gmail.com
