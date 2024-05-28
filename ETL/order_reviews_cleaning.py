# -*- coding: utf-8 -*-
"""order_reviews_cleaning.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1DUR4B3Vqs5kYorxdEQReEAvc1RyduBnS
"""

import pandas as pd

df = pd.read_csv(
    "/content/drive/MyDrive/data_practices/order_reviews.csv", on_bad_lines="skip"
)

df.head()

df.count()

print("shape", df.shape)

print("info", df.info())

score = df["review_score"].dropna()
print(score)
print(score.shape)