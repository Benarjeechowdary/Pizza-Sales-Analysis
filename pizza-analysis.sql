use Portfolio

select top 10 * from pizza_sales


--Total Revenue
select sum(total_price) as total_revenue
from 
pizza_sales


--Average Order Value
select sum(total_price)/count(distinct order_id) as avg_pizza_revenue
from
pizza_sales


--Time-Based Analysis
SELECT datepart(hour,order_time) AS order_hour, 
	COUNT(distinct order_id) AS total_orders_hourly,
	dense_rank() over(order by count(distinct order_id ) desc) as rnk
FROM pizza_sales 
GROUP BY datepart(hour,order_time)
ORDER BY total_orders_hourly DESC;


--order count on the basis of size of pizza
select pizza_size,
	count(pizza_size) as total_order_size_wise,
	rank() over(order by count(pizza_size) desc) as rank_wise
from pizza_sales
group by pizza_size
order by total_order_size_wise desc


--order count based on pizza name
select pizza_name,
	count(pizza_name) as total_count,
	dense_rank() over(order by count(pizza_name) desc) as rank_of_pizza
from pizza_sales
group by pizza_name
order by count(pizza_name) desc


--total pizzas sold
select sum(quantity) as total_pizzas_sold
from 
pizza_sales


--total orders
select count(distinct order_id) as total_orders
from
pizza_sales


--average pizzas per order
select sum(quantity)/count(distinct order_id) as average_pizzas_per_order from
pizza_sales


--order vs year
select datename(month,order_date) as month_name,sum(quantity) as total_pizzas
from
pizza_sales
group by datename(month,order_date)
order by sum(quantity) desc


--order vs day of week
select datename(weekday,order_date) as month_name,count(distinct order_id) as total_orders
from
pizza_sales
group by datename(weekday,order_date)
order by count(distinct order_id) desc


--top 5 best selling pizzas 
select top 5 pizza_name,sum(quantity) as total_number_of_pizzas
from pizza_sales
group by pizza_name
order by sum(quantity) desc


--top 5 worst selling pizzas
select top 5 pizza_name,sum(quantity) as total_pizzas
from pizza_sales
group by pizza_name
order by sum(quantity)

--daily trends of pizza category
select pizza_category,count(pizza_category) as count_category from
pizza_sales
group by pizza_category