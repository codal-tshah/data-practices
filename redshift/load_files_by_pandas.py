import boto3
import pandas as pd
import sqlalchemy as sa
from sqlalchemy.engine.url import URL
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()

# Retrieve environment variables
AWS_ACCESS_KEY = os.getenv("AWS_ACCESS_KEY")
AWS_SECRET_KEY = os.getenv("AWS_SECRET_KEY")
AWS_REGION = os.getenv("AWS_REGION")
REDSHIFT_ENDPOINT = os.getenv("REDSHIFT_CLUSTER_ID")
REDSHIFT_DB = os.getenv("REDSHIFT_DB")
REDSHIFT_USER = os.getenv("REDSHIFT_USER")
REDSHIFT_PASSWORD = os.getenv("REDSHIFT_PASSWORD")
S3_BUCKET = os.getenv("S3_BUCKET")
S3_KEY = os.getenv("S3_KEY")

print(f"Connecting to Redshift at {REDSHIFT_ENDPOINT}...")

# S3 client
s3_client = boto3.client(
    "s3",
    region_name=AWS_REGION,
    aws_access_key_id=AWS_ACCESS_KEY,
    aws_secret_access_key=AWS_SECRET_KEY,
)

# Read CSV file from S3
obj = s3_client.get_object(Bucket=S3_BUCKET, Key=S3_KEY)
df = pd.read_csv(obj["Body"])
print("CSV file read successfully from S3")

# Build the SQLAlchemy URL
url = URL.create(
    drivername="redshift+redshift_connector",
    host=REDSHIFT_ENDPOINT,
    port=5439,
    database=REDSHIFT_DB,
    username=REDSHIFT_USER,
    password=REDSHIFT_PASSWORD,
)

engine = sa.create_engine(url)

# Create the table if it doesn't exist
create_table_query = """
CREATE TABLE IF NOT EXISTS my_schema.products_null (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);
"""

with engine.connect() as connection:
    connection.execute(create_table_query)
    print("Table created successfully")

# Load DataFrame into Redshift
df.to_sql("products_null", engine, schema="my_schema", index=False, if_exists="append")
print("Data loaded successfully into Redshift")

# Perform queries
query = """
SELECT product_id, product_name, category, price
FROM my_schema.products_null
WHERE price > 50.00;
"""

with engine.connect() as connection:
    result = connection.execute(query)
    rows = result.fetchall()

for row in rows:
    print(row)

# Convert query result to pandas DataFrame for better display
df_result = pd.DataFrame(
    rows, columns=["product_id", "product_name", "category", "price"]
)
print(df_result)


# except Exception as e:
#     print(f"An error occurred: {e}")

# finally:
#     print("Script execution completed.")
