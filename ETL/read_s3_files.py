import psycopg2
import pandas as pd
import boto3, sys
from awsglue.utils import getResolvedOptions

session = boto3.Session()

args = getResolvedOptions(sys.argv, ["table_name"])

table_name = args["table_name"]
date_filter = "2018-08-08"


def postgres_connect():
    conn = psycopg2.connect(
        host="database-2.ctausmmg292u.us-east-1.rds.amazonaws.com",
        user="postgres",
        password="0kF0|#wB5.mb0ZY.1mRS}pQp0<_t",
        db="database-2",
    )
    return conn


conn = postgres_connect()

query = """select 
                *
            from 
                {}
            where 
                date(order_purchase_timestamp)='{}' 
            limit 1000
            """.format(
    table_name, date_filter
)

df = pd.read_sql(query, conn)

df["order_approved_at"] = pd.to_datetime(df["order_approved_at"], errors="coerce")
df["order_delivered_carrier_date"] = pd.to_datetime(
    df["order_delivered_carrier_date"], errors="coerce"
)
df["order_delivered_customer_date"] = pd.to_datetime(
    df["order_delivered_customer_date"], errors="coerce"
)

df.to_csv(
    "s3:///udemy/awsglue/" + table_name + "/" + date_filter + "/data.csv",
    index=False,
    header=True,
)

# df.to_parquet("s3://nl-dwh-transactions/"+table_name+"/"+date_filter+"/data.parquet",engine='pyarrow')
# ******************************************************************************************************************


###########/////////////////////////////////////////////////////////////////////////////////

import psycopg2
import pandas as pd
import boto3
import sys
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.context import SparkContext

# Initialize Spark and Glue context
sc = SparkContext.getOrCreate()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)

# Parse arguments
args = getResolvedOptions(sys.argv, ["JOB_NAME", "table_name"])
job.init(args["JOB_NAME"], args)

table_name = args["table_name"]
date_filter = "2018-08-08"


# PostgreSQL connection function
def postgres_connect():
    conn = psycopg2.connect(
        host="database-2.ctausmmg292u.us-east-1.rds.amazonaws.com",
        user="postgres",
        password="0kF0|#wB5.mb0ZY.1mRS}pQp0<_t",
        db="database-2",
    )
    return conn


conn = postgres_connect()

# Query data from PostgreSQL
query = f"""
    SELECT *
    FROM {table_name}
    WHERE date(order_purchase_timestamp) = '{date_filter}'
    LIMIT 1000
"""

df = pd.read_sql(query, conn)
conn.close()

# Convert date columns to datetime
df["order_approved_at"] = pd.to_datetime(df["order_approved_at"], errors="coerce")
df["order_delivered_carrier_date"] = pd.to_datetime(
    df["order_delivered_carrier_date"], errors="coerce"
)
df["order_delivered_customer_date"] = pd.to_datetime(
    df["order_delivered_customer_date"], errors="coerce"
)

# Save DataFrame to CSV in S3
s3_path = f"s3://udemy/awsglue/{table_name}/{date_filter}/data.csv"
df.to_csv(s3_path, index=False, header=True)

# Complete the job
job.commit()
