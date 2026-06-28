"""
Job Fit Analyzer Demo

Demonstrates the job fit analysis tool with a real-world example.
Shows how to use the analyzer module to evaluate candidate fit.
"""

import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from tools.job_fit_analyzer.analyzer import analyze_job_fit


def main():
    """Run the job fit analysis demo."""
    # Example candidate skills
    candidate_skills = """
    SQL, Power BI, Python, ETL, Azure Data Factory, SSIS,
    Data Warehouse, Databricks, Snowflake, Pandas, Excel,
    Data Modeling, Reporting, Dashboard Development
    """
    
    # Example job description
    job_description = """
    We are seeking a Data Analyst with strong SQL skills,
    Power BI experience, and Python knowledge. Candidate should
    understand ETL pipelines and data modeling. Azure experience
    is a plus.
    """
    
    # Perform analysis
    print("\n" + "="*60)
    print("JOB FIT ANALYSIS REPORT")
    print("="*60 + "\n")
    
    analysis = analyze_job_fit(candidate_skills, job_description)
    print(analysis)
    
    print("\n" + "="*60 + "\n")


if __name__ == "__main__":
    main()
