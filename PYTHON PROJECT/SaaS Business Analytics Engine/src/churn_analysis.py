import pandas as pd
from datetime import timedelta

def churn_metrics(df, reference_date=None, churn_days=60):
    if reference_date is None:
        reference_date = df["last_active_date"].max()

    churn_cutoff = reference_date - timedelta(days=churn_days)

    df["is_churned"] = df["last_active_date"] < churn_cutoff

    churn_rate = round(df["is_churned"].mean(), 2)

    revenue_at_risk = df.loc[df["is_churned"], "monthly_revenue"].sum()

    return churn_rate, revenue_at_risk