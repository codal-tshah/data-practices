CREATE TABLE order_items (
  order_id VARCHAR(32) NOT NULL,
  order_item_id DECIMAL(10, 0) NOT NULL,
  product_id VARCHAR(32) NOT NULL,
  seller_id VARCHAR(32) NOT NULL,
  shipping_limit_date TIMESTAMP NULL DEFAULT NULL,
  price DECIMAL(10, 0) NOT NULL,
  freight_value DECIMAL(10, 0) NOT NULL,
  order_purchase_timestamp TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (order_id, order_item_id)
);


CREATE TABLE orders (
  order_id VARCHAR(32) NOT NULL,
  customer_id VARCHAR(32) NOT NULL,
  order_status VARCHAR(11) NOT NULL,
  order_purchase_timestamp TIMESTAMP NULL DEFAULT NULL,
  order_approved_at TIMESTAMP NULL DEFAULT NULL,
  order_delivered_carrier_date TIMESTAMP NULL DEFAULT NULL,
  order_delivered_customer_date TIMESTAMP NULL DEFAULT NULL,
  order_estimated_delivery_date TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (order_id)
);



CREATE table if not exists order_reviews (
  review_id varchar(32) NOT NULL,
  order_id varchar(32) NOT NULL,
  review_score decimal(10,0) NOT NULL,
  review_comment_title varchar(25) DEFAULT NULL,
  review_comment_message varchar(208) DEFAULT NULL,
  review_creation_date timestamp NULL DEFAULT NULL,
  review_answer_timestamp timestamp NULL DEFAULT NULL
); 

CREATE TABLE if not exists products (
  product_id varchar(32) NOT NULL,
  product_category_name varchar(46) DEFAULT NULL,
  product_name_lenght decimal(10,0) DEFAULT NULL,
  product_description_lenght decimal(10,0) DEFAULT NULL,
  product_photos_qty decimal(10,0) DEFAULT NULL,
  product_weight_g decimal(10,0) DEFAULT NULL,
  product_length_cm decimal(10,0) DEFAULT NULL,
  product_height_cm decimal(10,0) DEFAULT NULL,
  product_width_cm decimal(10,0) DEFAULT NULL
);


select * from products;




LOAD DATA LOCAL INFILE "C:\Users\tshah\Desktop\data-practices\ETL\data\mysql-csv-files\mysql-csv-files\order_items.csv" INTO TABLE udemy_mysql.order_items FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "orders.csv" INTO TABLE ecommerce_db.orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "order_reviews.csv" INTO TABLE ecommerce_db.order_reviews FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE "products.csv" INTO TABLE ecommerce_db.products FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

show table status;
