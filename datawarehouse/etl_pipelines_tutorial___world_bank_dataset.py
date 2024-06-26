# -*- coding: utf-8 -*-
"""ETL Pipelines Tutorial | World Bank Dataset.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1h0ykS5lGyzZr7AH8QK1PHm8znmO4Xg4u
"""

import pandas as pd
import numpy as np

df_projects = pd.read_csv(
    "/content/drive/MyDrive/data_practices/data warehouse/data/archive/projects_data.csv"
)

df_projects.dtypes

df_projects = pd.read_csv(
    "/content/drive/MyDrive/data_practices/data warehouse/data/archive/projects_data.csv",
    dtype="str",
)
df_projects.dtypes

df_projects.head()

df_projects.info()

df_projects.describe()

df_projects.isnull().sum()

df_projects.shape

"""population"""

df_population = pd.read_csv(
    "/content/drive/MyDrive/data_practices/data warehouse/data/archive/population_data.csv",
    skiprows=3,
)
df_population.dtypes

df_population.head()

df_population.isnull().sum()

df_population.shape

df_population.isnull().sum(axis=1)

print(df_population)

df_population = df_population.drop("Unnamed: 62", axis=1)

print(df_population)

df_population.isnull().sum(axis=1)

df_population[df_population.isnull().any(axis=1)]

"""# Extract from JSON and XML"""

df_population_json = pd.read_json(
    "/content/drive/MyDrive/data_practices/data warehouse/data/archive/population_data.json",
    orient="records",
)
df_population_json.head()

"""Extract XML"""

# !pip install bs4

from bs4 import BeautifulSoup

with open(
    "/content/drive/MyDrive/data_practices/data warehouse/data/archive/population_data.xml"
) as fp:
    soup = BeautifulSoup(fp, "lxml")

i = 0
# use the find_all method to get all record tags in the document
for record in soup.find_all("record"):
    # use the find_all method to get all fields in each record
    i += 1
    for record in record.find_all("field"):
        print(record["name"], ": ", record.text)
    print()
    if i == 5:
        break

"""# Extract Data from SQL Databases"""

import sqlite3

conn = sqlite3.connect(
    "/content/drive/MyDrive/data_practices/data warehouse/data/archive/population_data.db"
)


pd.read_sql("SELECT * FROM population_data", conn)

pd.read_sql('SELECT "Country_Name", "Country_Code", "1960" FROM population_data', conn)

from sqlalchemy import create_engine

import requests

url = "http://api.worldbank.org/v2/countries/br;cn;us;de/indicators/SP.POP.TOTL/?format=json&per_page=1000"

r = requests.get(url)
r.json()

pd.DataFrame(r.json()[1])

# TODO: get the url ready
url = "http://api.worldbank.org/v2/country/CH/indicator/SP.POP.TOTL/?format=json&date=1995:2001"

# TODO: send the request
r = requests.get(url)
r.json()
