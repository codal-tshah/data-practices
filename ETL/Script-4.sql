-- CREATE TABLE order_items (
--   order_id varchar(32) NOT NULL,
--   order_item_id decimal(10,0) NOT NULL,
--   product_id varchar(32) NOT NULL,
--   seller_id varchar(32) NOT NULL,
--   shipping_limit_date timestamp NULL DEFAULT NULL,
--   price decimal(10,0) NOT NULL,
--   freight_value decimal(10,0) NOT NULL,
--   order_purchase_timestamp timestamp NULL DEFAULT NULL
-- );

-- create TABLE orders (
--   order_id varchar(32) NOT NULL,
--   customer_id varchar(32) NOT NULL,
--   order_status varchar(11) NOT NULL,
--   order_purchase_timestamp timestamp NULL DEFAULT NULL,
--   order_approved_at timestamp NULL DEFAULT NULL,
--   order_delivered_carrier_date timestamp NULL DEFAULT NULL,
--   order_delivered_customer_date timestamp NULL DEFAULT NULL,
--   order_estimated_delivery_date timestamp NULL DEFAULT NULL
-- );	

-- CREATE table if not exists order_reviews (
--   review_id varchar(32) NOT NULL,
--   order_id varchar(32) NOT NULL,
--   review_score decimal(10,0) NOT NULL,
--   review_comment_title varchar(25) DEFAULT NULL,
--   review_comment_message varchar(208) DEFAULT NULL,
--   review_creation_date timestamp NULL DEFAULT NULL,
--   review_answer_timestamp timestamp NULL DEFAULT NULL
-- ); 

-- CREATE TABLE if not exists products (
--   product_id varchar(32) NOT NULL,
--   product_category_name varchar(46) DEFAULT NULL,
--   product_name_lenght decimal(10,0) DEFAULT NULL,
--   product_description_lenght decimal(10,0) DEFAULT NULL,
--   product_photos_qty decimal(10,0) DEFAULT NULL,
--   product_weight_g decimal(10,0) DEFAULT NULL,
--   product_length_cm decimal(10,0) DEFAULT NULL,
--   product_height_cm decimal(10,0) DEFAULT NULL,
--   product_width_cm decimal(10,0) DEFAULT NULL
-- );


----------------------- Copy commands to load the data from csv files to tables -----------------


\copy order_items(order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value,order_purchase_timestamp) from 'C:\Users\tshah\Desktop\data-practices\ETL\data\mysql-csv-files\mysql-csv-files\order_items.csv' DELIMITER ',' CSV HEADER;	


--select  *from order_items;


\copy order_items(order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value,order_purchase_timestamp)
from 'C:/Users/tshah/Desktop/data-practices/ETL/data/mysql-csv-files/mysql-csv-files/order_items.csv' 
DELIMITER ',' 
CSV HEADER;


\\copy orders_items from 's3://becketfortrial/udemy/order_items' DELIMITER ',' CSV HEADER;


copy orders_items
from 's3://becketfortrial/udemy/order_items'
DELIMITER ',' 
CSV HEADER;



copy order_items FROM 'C:/Users/tshah/Desktop/data-practices/ETL/data/mysql-csv-files/mysql-csv-files/order_items.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');



copy order_items 
from 's3://becketfortrial/udemy/order_items'
IAM_ROLE default   --'arn:aws:iam::905418442130:user/tshah' 
FORMAT as csv
IGNOREHEADER 1;




SELECT COUNT(*) FROM order_items;


\copy order_reviews(review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp) from 'C:\Users\tshah\Desktop\data-practices\ETL\data\mysql-csv-files\mysql-csv-files\order_reviews.csv' WITH DELIMITER ',' CSV;
\copy orders(order_id,customer_id,order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date) from 'C:\Users\tshah\Desktop\data-practices\ETL\data\mysql-csv-files\mysql-csv-files\orders.csv' WITH DELIMITER ',' CSV;
\copy order_items(order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value,order_purchase_timestamp) from 'C:\Users\tshah\Desktop\data-practices\ETL\data\mysql-csv-files\mysql-csv-files\order_items.csv' WITH DELIMITER ',' CSV;
\copy products(product_id,product_category_name,product_name_lenght,product_description_lenght,product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm) from 'C:\Users\tshah\Desktop\data-practices\ETL\data\mysql-csv-files\mysql-csv-files\products.csv' WITH DELIMITER ',' CSV;




ALTER TABLE orders
ALTER COLUMN order_status TYPE VARCHAR(15);


select * from order_items;
select * from order_reviews;
select * from orders;
select * from products;


