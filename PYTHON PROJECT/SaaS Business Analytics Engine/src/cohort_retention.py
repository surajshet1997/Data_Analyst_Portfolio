import pandas as pd


def cohort_retention(df):
    df = df.copy()

    df["signup_month"] = df["signup_date"].dt.to_period("M")
    df["active_month"] = df["last_active_date"].dt.to_period("M")

    cohort = (
        df.groupby(["signup_month", "active_month"])["user_id"]
        .nunique()
        .reset_index()
    )

    cohort_pivot = cohort.pivot_table(
        index="signup_month",
        columns="active_month",
        values="user_id"
    )

    return cohort_pivot