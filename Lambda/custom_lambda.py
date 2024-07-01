import json
import boto3
import io
from io import StringIO
import pandas as pd

s3_client = boto3.client("s3")


def lambda_handler(event, context):
    for record in event["Records"]:

        source_bucket = record["s3"]["bucket"]["name"]
        source_key = record["s3"]["object"]["key"]

        target_bucket = "becketfortrial"  # Your bucket name without the prefix path
        target_key = f"nifty_cleaned_data/{source_key.split('/')[-1]}"

        try:
            # Download the file from S3
            response = s3_client.get_object(Bucket=source_bucket, Key=source_key)
            status = response.get("ResponseMetadata", {}).get("HTTPStatusCode")
            if status == 200:
                print(f"Successfully downloaded {source_key} from {source_bucket}")
                file_content = response["Body"].read().decode("utf-8")

                # Check if the file is empty
                if not file_content.strip():
                    print(f"File {source_key} is empty.")
                    continue

                # Load the CSV file into a pandas DataFrame
                try:
                    df = pd.read_csv(StringIO(file_content))
                except pd.errors.EmptyDataError:
                    print(f"No columns to parse from file: {source_key}")
                    continue

                # Perform ETL operations using pandas

                # Changing Column Name
                df.rename(columns={"Turnover (₹ Cr)": "Turnover_in_cr"}, inplace=True)

                # making column names proper and accurate
                df.rename(
                    columns={
                        "Date ": "Dates",
                        "Open ": "Open_price",
                        "High ": "High_price",
                        "Low ": "Low_price",
                        "Close ": "Close_price",
                        "Shares Traded ": "Shares_traded",
                    },
                    inplace=True,
                )

                # **Changing column data types**
                df["Date"] = df["Dates"].apply(pd.to_datetime)

                # Changing order of columns
                df = df[
                    [
                        "Symbol",
                        "Dates",
                        "Open_price",
                        "High_price",
                        "Low_price",
                        "Close_price",
                        "Shares_traded",
                        "Turnover_in_cr",
                    ]
                ]

                # changing date format
                df["Dates"] = pd.to_datetime(
                    df["Dates"], format="%d-%b-%Y"
                ).dt.strftime("%Y-%m-%d")

                df_cleaned = df.dropna()
                print(df_cleaned)

                # Convert DataFrame back to CSV
                csv_buffer = StringIO()
                df_cleaned.to_csv(csv_buffer, index=False)

                # Upload the processed file to the target S3 bucket
                s3_client.put_object(
                    Bucket=target_bucket, Key=target_key, Body=csv_buffer.getvalue()
                )
                print(
                    f"Successfully uploaded processed file to {target_key} in {target_bucket}"
                )

            else:
                print(
                    f"Failed to download {source_key} from {source_bucket}, status: {status}"
                )

        except Exception as e:
            print(f"An error occurred: {str(e)}")

    return {"statusCode": 200, "body": "Processed files uploaded successfully."}
