
--create schema my_schema;

--create table my_schema.sales(
--sale_id INT, 
--sale_date DATE,
--customer_id INT,
--product_id INT, 
--quantity INT,
--total_amount DECIMAL(10,2)
--);
--
--CREATE TABLE my_schema.customers (
--    customer_id INT,
--    first_name VARCHAR(50),
--    last_name VARCHAR(50),
--    email VARCHAR(100),
--    phone VARCHAR(20),
--    address VARCHAR(200)
--);
--
CREATE TABLE my_schema.products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);


CREATE TABLE IF NOT exists my_schema.products_null (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

select * from my_schema.products_null;



--load sales data from s3
--copy my_schema.customers
--from 's3://becketfortrial/demo_data/customers.csv'
--IAM_ROLE default
--FORMAT as csv
--IGNOREHEADER 1;
--
--copy my_schema.sales
--from 's3://becketfortrial/demo_data/sales.csv'
--IAM_ROLE default
--FORMAT as csv
--IGNOREHEADER 1;



--successfully 
--copy my_schema.products
--from 's3://becketfortrial/demo_data/products.csv'
--IAM_ROLE default
--FORMAT as csv
--IGNOREHEADER 1;

--select * from my_schema.customers;




-- ALTER TABLE my_schema.products
-- ADD COLUMN price_new DECIMAL(10,2);


-- select * from my_schema.products;

--alter table my_schema.customers
--add fields varchar(25);
--
--alter table my_schema.customers
--add area varchar(25);


select * from my_schema.customers;

select * from my_schema.products;

select * from my_schema.sales;

select * from my_schema.sales_dict;

-- distribution key and sort keys(read) --redshift 
-- columnar storage 



--alter TABLE my_schema.sales
--ADD column total DECIMAL(10,2);
--
--
--alter table my_schema.sales
--drop COLUMN total_amount;




select 
s.sale_id,
s.sale_date,
c.first_name, 
c.last_name,
p.product_name,
s.quantity,
s.total
FROM my_schema.sales s  
JOIN my_schema.products p on s.product_id = p.product_id
join my_schema.customers c on c.customer_id = c.customer_id;


select 
p.category ,
SUM(s.total) as total_sales
from my_schema.sales s  
join my_schema.products p on s.product_id=p.product_id
GROUP by p.category;


SELECT 
    c.first_name, 
    c.last_name, 
    p.product_name
FROM 
    my_schema.sales s
JOIN 
    my_schema.customers c ON s.customer_id = c.customer_id
JOIN 
    my_schema.products p ON s.product_id = p.product_id
WHERE 
    p.product_name = 'Specific Product Name';



CREATE TABLE my_schema.sales_dict(
    sale_id INT,
    sale_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2)
)
DISTSTYLE KEY
DISTKEY(customer_id);

copy my_schema.sales_dict
from 's3://becketfortrial/demo_data/sales.csv'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


select * from my_schema.sales_dict;




CREATE TABLE my_schema.sales_sort (
    sale_id INT,
    sale_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2)
)
SORTKEY (sale_date, quantity);


copy my_schema.sales_sort
from 's3://becketfortrial/demo_data/sales.csv'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


select * from my_schema.sales_sort;


CREATE TABLE my_schema.customers_dist (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
)
SORTKEY (first_name);




copy my_schema.customers_dist
from 's3://becketfortrial/demo_data/customers.csv'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


select * from my_schema.products;


CREATE TABLE my_schema.products_dist (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
)
DISTSTYLE KEY
DISTKEY(category);



copy my_schema.products_dist
from 's3://becketfortrial/demo_data/products.csv'
IAM_ROLE default
FORMAT as csv
IGNOREHEADER 1;


select * from my_schema.products_dist;




---------------------------   trial ---------------------------

 CREATE TABLE IF NOT exists my_schema.order_items (
   order_id varchar(32) NOT NULL,
   order_item_id decimal(10,0) NOT NULL,
   product_id varchar(32) NOT NULL,
   seller_id varchar(32) NOT NULL,
   shipping_limit_date timestamp NULL DEFAULT NULL,
   price decimal(10,0) NOT NULL,
   freight_value decimal(10,0) NOT NULL,
   order_purchase_timestamp timestamp NULL DEFAULT NULL
 );


copy my_schema.order_items 
from 's3://becketfortrial/udemy/order_items'
IAM_ROLE default   --'arn:aws:iam::905418442130:user/tshah' 
FORMAT as csv
IGNOREHEADER 1;

select * from my_schema.order_items;



 CREATE TABLE IF NOT exists public.order_items (
   order_id varchar(32) NOT NULL,
   order_item_id decimal(10,0) NOT NULL,
   product_id varchar(32) NOT NULL,
   seller_id varchar(32) NOT NULL,
   shipping_limit_date timestamp NULL DEFAULT NULL,
   price decimal(10,0) NOT NULL,
   freight_value decimal(10,0) NOT NULL,
   order_purchase_timestamp timestamp NULL DEFAULT NULL
 );


copy public.order_items 
from 's3://becketfortrial/udemy/order_items'
IAM_ROLE default   --'arn:aws:iam::905418442130:user/tshah' 
FORMAT as csv
IGNOREHEADER 1;

select * from my_schema.order_items;


