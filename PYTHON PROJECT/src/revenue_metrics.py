import pandas as pd

def revenue_summary(df):
    summary = {}

    summary["total_revenue"] = df["monthly_revenue"].sum()
    summary["average_revenue_per_user"] = round(
        df["monthly_revenue"].mean(), 2
    )

    revenue_by_plan = (
        df.groupby("plan_type")["monthly_revenue"]
        .sum()
        .sort_values(ascending=False)
    )

    return summary, revenue_by_plan