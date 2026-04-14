import pandas as pd
from revenue_metrics import revenue_summary
from revenue_concentration import revenue_concentration
from churn_analysis import churn_metrics
from cohort_retention import cohort_retention
from ab_testing import ab_test_summary
# Load data
DATA_PATH = "C:/analytics portfolio/python-analytics/data/raw/saas_users.csv"

def load_data(path=DATA_PATH):
    df = pd.read_csv(path)
    df['signup_date'] = pd.to_datetime(df['signup_date'])
    df['last_active_date'] = pd.to_datetime(df['last_active_date'])
    return df


if __name__ == "__main__":
    df = load_data()

    '''summary, revenue_by_plan = revenue_summary(df)

    print("TOTAL REVENUE:", summary["total_revenue"])
    print("ARPU:", summary["average_revenue_per_user"])
    print("\nRevenue by Plan:")
    print(revenue_by_plan)'''

    '''top_n, concentration = revenue_concentration(df)

    print(f"\nTop {top_n} users contribute {concentration * 100}% of total revenue")'''

    '''churn_rate, revenue_at_risk = churn_metrics(df)

    print(f"\nChurn Rate: {churn_rate * 100}%")
    print(f"Monthly Revenue at Risk due to Churn: {revenue_at_risk}")'''

    '''cohort_table = cohort_retention(df)

    print("\nCohort Retention Table:")
    print(cohort_table)'''

    ab_summary, lift = ab_test_summary(df)

    print("\nA/B Test Conversion Rates:")
    print(ab_summary)
    print(f"Conversion Lift (Variant vs Control): {lift * 100}%")