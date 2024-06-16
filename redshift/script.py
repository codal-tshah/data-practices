import boto3
import psycopg2
import pandas as pd

import os
import dotenv

dotenv.load_dotenv()
import os

# from .env import *
AWS_ACCESS_KEY = os.environ.get("AWS_ACCESS_KEY", "")
AWS_SECRET_KEY = os.environ.get("AWS_SECRET_KEY", "")
AWS_REGION = os.environ.get("AWS_REGION", "")
REDSHIFT_CLUSTER_ID = os.environ.get("REDSHIFT_CLUSTER_ID", "")
REDSHIFT_DB = os.environ.get("REDSHIFT_DB", "")
REDSHIFT_USER = os.environ.get("REDSHIFT_USER", "")
REDSHIFT_PASSWORD = os.environ.get("REDSHIFT_PASSWORD", "")
REDSHIFT_PORT = 5439
S3_BUCKET = os.environ.get("S3_BUCKET", "")
S3_KEY = os.environ.get("S3_KEY", "")
ROLE_ARN = os.environ.get("ROLE_ARN", "")

# S3 and Redshift clients
s3_client = boto3.client(
    "s3",
    region_name=AWS_REGION,
    aws_access_key_id=AWS_ACCESS_KEY,
    aws_secret_access_key=AWS_SECRET_KEY,
)

redshift_conn = psycopg2.connect(
    dbname=REDSHIFT_DB,
    user=REDSHIFT_USER,
    password=REDSHIFT_PASSWORD,
    host=f"{REDSHIFT_CLUSTER_ID}",
    port=REDSHIFT_PORT,
)
redshift_cursor = redshift_conn.cursor()


# # Query the sys_load_error_detail table
# error_query = "SELECT * FROM sys_load_error_detail;"
# redshift_cursor.execute(error_query)
# error_details = redshift_cursor.fetchall()

# # Print the error details
# for detail in error_details:
#     print(detail)

# # Close the cursor and connection
# redshift_cursor.close()
# redshift_conn.close()


#################
# Create Redshift table
create_table_query = """
CREATE TABLE IF NOT EXISTS my_schema.products_null (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);
"""
redshift_cursor.execute(create_table_query)
redshift_conn.commit()

# Load data from S3 to Redshift
copy_query = f"""
COPY my_schema.products_null
FROM 's3://becketfortrial/demo_data/products.csv'
IAM_ROLE '{ROLE_ARN}'
FORMAT as CSV
IGNOREHEADER 1;
"""
redshift_cursor.execute(copy_query)
redshift_conn.commit()

# Perform queries
query = """
SELECT product_id, product_name, category, price
FROM my_schema.products
WHERE price > 50.00;
"""
# query = """
# SELECT *
# FROM my_schema.products_null;
# """
redshift_cursor.execute(query)
rows = redshift_cursor.fetchall()

for row in rows:
    print(row)

# Convert query result to pandas DataFrame for better display
df = pd.DataFrame(rows, columns=["product_id", "product_name", "category", "price"])
print(df)

# Close connections
redshift_cursor.close()
redshift_conn.close()
