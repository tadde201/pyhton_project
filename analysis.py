import pandas as pd
import numpy as np

# Load data
df = pd.read_csv(r'C:\Users\tadde\Desktop\BI\Python_project\pyhton_project\Loan_Data.csv')
df_clean = df.drop_duplicates()

# Find gender column
gender_col = 'Gender'

# Define qualification function
def get_qualification_status(row):
    score = 0
    if row['Credit_Score'] >= 700:
        score += 1
    if row['income'] >= 50000:
        score += 1
    if row['dtir1'] <= 0.43:
        score += 1
    if row['LTV'] <= 0.80:
        score += 1
    
    if score >= 3:
        status = 'Strong Qualification'
    elif score >= 2:
        status = 'Moderate Qualification'
    else:
        status = 'Weak Qualification'
    
    return status, score

# Apply qualification
df_clean['Qualification_Score'] = df_clean.apply(lambda row: get_qualification_status(row)[1], axis=1)
df_clean['Qualification_Status'] = df_clean.apply(lambda row: get_qualification_status(row)[0], axis=1)

# Comparison metrics
print('=== LOAN QUALIFICATION METRICS: MALE VS FEMALE ===\n')

comparison_metrics = []
for gender in ['Male', 'Female']:
    gender_data = df_clean[df_clean[gender_col] == gender]
    
    metrics = {
        'Gender': gender,
        'Count': len(gender_data),
        'Avg Loan Amount': f"\",
        'Avg Credit Score': f"{gender_data['Credit_Score'].mean():.0f}",
        'Avg Interest Rate': f"{gender_data['rate_of_interest'].mean():.4f}",
        'Avg Age': f"{gender_data['age'].mean():.1f}",
        'Avg Income': f"\",
        'Avg LTV': f"{gender_data['LTV'].mean():.4f}",
        'Avg DTIR': f"{gender_data['dtir1'].mean():.4f}"
    }
    comparison_metrics.append(metrics)

metrics_df = pd.DataFrame(comparison_metrics)
print(metrics_df.to_string(index=False))

# Qualification status by gender
print('\n=== QUALIFICATION STATUS BY GENDER ===\n')

for gender in ['Male', 'Female']:
    gender_data = df_clean[df_clean[gender_col] == gender]
    total = len(gender_data)
    
    print(f'{gender} Borrowers (Total: {total}):')
    for status in ['Strong Qualification', 'Moderate Qualification', 'Weak Qualification']:
        count = (gender_data['Qualification_Status'] == status).sum()
        percentage = (count / total * 100) if total > 0 else 0
        print(f'  {status}: {count:,} ({percentage:.2f}%)')
    print()

# Final summary
print('=== FINAL QUALIFICATION COMPARISON TABLE ===\n')

summary_data = []
for gender in ['Male', 'Female']:
    gender_data = df_clean[df_clean[gender_col] == gender]
    
    strong_qual = (gender_data['Qualification_Status'] == 'Strong Qualification').sum()
    strong_qual_pct = (strong_qual / len(gender_data) * 100) if len(gender_data) > 0 else 0
    
    summary_data.append({
        'Gender': gender,
        'Total Borrowers': f"{len(gender_data):,}",
        'Avg Credit Score': f"{gender_data['Credit_Score'].mean():.0f}",
        'Strong Qualification %': f"{strong_qual_pct:.2f}%",
        'Avg Income': f"\",
        'Avg DTIR': f"{gender_data['dtir1'].mean():.4f}",
        'Approval Count (Status=1)': str((gender_data['Status'] == 1).sum())
    })

summary_table = pd.DataFrame(summary_data)
print(summary_table.to_string(index=False))

print('\n=== KEY FINDINGS ===')
male_strong = (df_clean[df_clean[gender_col] == 'Male']['Qualification_Status'] == 'Strong Qualification').sum()
female_strong = (df_clean[df_clean[gender_col] == 'Female']['Qualification_Status'] == 'Strong Qualification').sum()
male_total = len(df_clean[df_clean[gender_col] == 'Male'])
female_total = len(df_clean[df_clean[gender_col] == 'Female'])

male_strong_pct = (male_strong / male_total * 100) if male_total > 0 else 0
female_strong_pct = (female_strong / female_total * 100) if female_total > 0 else 0

print(f'Male borrowers with Strong Qualification: {male_strong_pct:.2f}%')
print(f'Female borrowers with Strong Qualification: {female_strong_pct:.2f}%')
print(f'Difference: {abs(male_strong_pct - female_strong_pct):.2f} percentage points')
