DROP TABLE orders;

CREATE TABLE orders (
    orderid VARCHAR(20) PRIMARY KEY,
    date DATE,
    product VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    totalsales DECIMAL(12,2),
    customername VARCHAR(100),
    customerlocation VARCHAR(100),
    paymentmethod VARCHAR(50),
    status VARCHAR(20)
);

select* from orders;

1.verify data

select count(*) as total_rows,
min(date) as start_date,max(date)
as end_date
from orders;


2.monthly sales trend

select date_trunc('month',date)
as month, sum(totalsales) as
monthly_sales
from orders
group by month
order by month;


3.best selling products

select product, sum(quantity) as
total_quantity, sum(totalsales)as
total_sales
from orders
group by product
order by total_sales desc
limit 10;


4.category performance

select category, sum(totalsales)
as category_sales, count(*) as
total_orders
from orders
group by category
order by category_sales desc;


5.top customers

select customername,
sum(totalsales) as spent
from orders
group by customername
order by spent desc
limit 5;


6.payment method distribution

select paymentmethod , count(*) as
order_count,sum(totalsales) as
sales
from orders
group by paymentmethod
order by sales desc;


7.order status report

select status, count(*) as
total_orders,sum(totalsales) as
revenue
from orders
group by status;
