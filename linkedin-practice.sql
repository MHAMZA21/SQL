#Assume you are given the table below on user transactions.
#Write a query to obtain the list of customers whose first transaction was valued at $50 or more. Output the number of users.Clarification:
#1. Use the transaction_date field to determine which transaction should be labeled as the first for each user.
#2. Use a specific function (we can't give too much away!) to account for scenarios where a user had multiple transactions on the same day, and one of those was the first.


#select count(distinct user_id) from user_transaction
#where (user_id,transaction_date)
#in
#(select user_id,min(transaction_date)from user_transaction group by 1)
#and spend >=50;


CREATE TABLE customer_orders (
 `order_id` INTEGER,
 `customer_id` INTEGER,
 `pizza_id` INTEGER,
 `exclusions` VARCHAR(4),
 `extras` VARCHAR(4),
 `order_time` TIMESTAMP
);

INSERT INTO customer_orders
 (`order_id`, `customer_id`, `pizza_id`, `exclusions`, `extras`, `order_time`)
VALUES
 (1, 101, 1, '', '', '2020-01-01 18:05:02'),
 (2, 101, 1, '', '', '2020-01-01 19:00:52'),
 (3, 102, 1, '', '', '2020-01-02 23:51:23'),
 (3, 102, 2, '', '', '2020-01-02 23:51:23'),
 (4, 103, 1, '4', '', '2020-01-04 13:23:46'),
 (4, 103, 1, '4', '', '2020-01-04 13:23:46'),
 (4, 103, 2, '4', '', '2020-01-04 13:23:46'),
 (5, 104, 1, '', '1', '2020-01-08 21:00:29'),
 (6, 101, 2, '', '', '2020-01-08 21:03:13'),
 (7, 105, 2, '', '1', '2020-01-08 21:20:29'),
 (8, 102, 1, '', '', '2020-01-09 23:54:33'),
 (9, 103, 1, '4', '1, 5', '2020-01-10 11:22:59'),
 (10, 104, 1, '', '', '2020-01-11 18:34:49'),
 (10, 104, 1, '2,6', '1 ,4', '2020-01-11 18:34:49');
 
 CREATE TABLE pizza_names (
`pizza_id` INTEGER,
 `pizza_name` TEXT
);
INSERT INTO pizza_names
 (`pizza_id`, `pizza_name`)
VALUES
 (1, 'Meatlovers'),
 (2, 'Vegetarian');
 
select * from customer_orders;
select * from pizza_names;
# What is maximum number of pizza delivered in a single order?
#result
# Maximum 3 pizzas are delivered in a single order

select order_id,customer_id,count(pizza_id) as total_count_of_pizza
from customer_orders
group by order_id
order by total_count_of_pizza desc
limit 3;


select * from customer_orders;
select * from pizza_names;
# how many vegetarian and meatlovers were ordered by each customers?

# customers ids with pizza names
select c.customer_id as customer_ids,p.pizza_name as pizza_names, count(p.pizza_name) as count_no_of_pizza from customer_orders c join pizza_names p
on c.pizza_id = p.pizza_id
group by c.customer_id,p.pizza_name
order by c.customer_id;

SELECT c.customer_id, p.pizza_name, COUNT(p.pizza_name)AS Pizza_Count
FROM customer_orders c JOIN pizza_names p 
ON c.pizza_id = p.pizza_id
GROUP BY c.customer_id, p.pizza_name
ORDER BY c.customer_id;
##
#When I started solving SQL Intermediate Questions, 
#I thought using Multiple Sub-queries was more convenient than CTEs 
#but now I realized CTEs make the query easy to read and understandable.
#And I have solved the below question using CTE
#i.e., Amazon Medium-Level Question--
#---------------------------------------------------------------------------
#Assume you are given the table below-containing information on Amazon customers and their spend on products belonging to various categories.
#Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

#SELECT category , product ,sum(spend )as "total spend" FROM product_spend
#group by category ,product ,extract( year from transaction_date)
#having extract( year from transaction_date) = 2022
#order by category asc , sum(spend ) desc
#limit 4
