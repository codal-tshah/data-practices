import pandas as pd

df = pd.read_csv(
    "C:/Users/tshah/Desktop/data-practices/BI_tools/data/nifty_sectoral_indices/NIFTY 50-07-06-2023-to-07-06-2024.csv"
)


symbol = "NIFTY_50"
df["Symbol"] = symbol
print(df)

df.to_csv(
    "C:/Users/tshah/Desktop/data-practices/BI_tools/data/nifty_sectoral_indices/NIFTY 50-07-06-2023-to-07-06-2024.csv",
    index=False,
    encoding="utf-8",
)
