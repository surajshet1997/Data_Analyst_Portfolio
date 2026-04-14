import pandas as pd

def ab_test_summary(df):
    summary = (
        df.groupby("experiment_group")["conversion"]
        .mean()
        .round(3)
    )

    control_rate = summary.get("control", 0)
    variant_rate = summary.get("variant", 0)

    lift = round((variant_rate - control_rate) / control_rate, 2) if control_rate > 0 else 0

    return summary, lift