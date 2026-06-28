import sys
from pathlib import Path

sys.path.append(str(Path.cwd()))
from job_fit_analysis import analyze_job_fit


my_skills = """
QL, Power BI, Python, ETL, Azure Data Factory, SSIS,
Data Warehouse, Databricks, Snowflake, Pandas, Excel,
Data Modeling, Reporting, Dashboard Development
"""

job_desc = """
We are seeking a Data Analyst with strong SQL skills,
Power BI experience, and Python knowledge. Candidate should
understand ETL pipelines and data modeling. Azure experience
is a plus..
"""

analysis = analyze_job_fit(my_skills, job_desc)
print(analysis)
