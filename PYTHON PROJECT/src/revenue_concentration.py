import pandas as pd

def revenue_concentration(df, top_percent=0.1):
    df_sorted = df.sort_values("monthly_revenue", ascending=False)

    top_n = int(len(df_sorted) * top_percent)
    top_users = df_sorted.head(top_n)

    concentration = round(
        top_users["monthly_revenue"].sum() / df_sorted["monthly_revenue"].sum(),
        2
    )

    return top_n, concentration