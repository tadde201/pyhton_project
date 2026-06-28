"""
Job Fit Analysis Tool

Analyzes candidate skills against job descriptions to determine job fit.
Provides skill matching, gap analysis, and fit scoring.

Author: tadde201
Version: 1.0
"""

import os
import re
from typing import Dict, List, Tuple

try:
    from openai import OpenAI
except ImportError:  # pragma: no cover - optional dependency
    OpenAI = None


DEFAULT_SKILL_TERMS = [
    "sql",
    "power bi",
    "python",
    "etl",
    "azure",
    "data factory",
    "ssis",
    "databricks",
    "snowflake",
    "pandas",
    "excel",
    "data modeling",
    "reporting",
    "dashboard",
    "data analysis",
    "data engineer",
    "data analyst",
    "data pipelines",
    "pyspark",
]


def normalize_text(text: str) -> str:
    """Normalize text to lowercase with spaces between terms.
    
    Args:
        text: Raw text to normalize
        
    Returns:
        Normalized text with only alphanumeric characters and spaces
    """
    return re.sub(r"[^a-z0-9]+", " ", text.lower()).strip()


def extract_skills(text: str) -> List[str]:
    """Extract skills from text using predefined skill terms and keyword matching.
    
    Args:
        text: Text containing skills (job description or candidate skills)
        
    Returns:
        Sorted list of unique skills found in the text
    """
    normalized = normalize_text(text)
    tokens = set(normalized.split())
    skills = []
    
    # Match against predefined skill terms
    for skill in DEFAULT_SKILL_TERMS:
        if skill in normalized:
            skills.append(skill)
    
    # Add single-word matches from the text as fallback
    # (for skills not in the predefined list)
    for token in sorted(tokens):
        if len(token) > 2 and token not in {"with", "and", "for", "the", "we", "are", "looking"}:
            skills.append(token)
    
    return sorted(set(skills))


def score_fit(candidate_skills: List[str], required_skills: List[str]) -> Tuple[int, List[str], List[str]]:
    """Calculate job fit score based on skill matching.
    
    Args:
        candidate_skills: List of candidate's skills
        required_skills: List of job requirements
        
    Returns:
        Tuple of (fit_score, matching_skills, missing_skills)
    """
    candidate_set = {skill.lower() for skill in candidate_skills}
    required_set = {skill.lower() for skill in required_skills}

    matches = sorted(candidate_set & required_set)
    missing = sorted(required_set - candidate_set)
    score = 0 if not required_set else int(round((len(matches) / len(required_set)) * 100))
    
    return score, matches, missing


def analyze_job_fit(skills: str, job_description: str, use_openai: bool = False) -> str:
    """Analyze how well candidate skills match a job description.
    
    Args:
        skills: Candidate's skills as a string
        job_description: Job description text
        use_openai: Whether to use OpenAI for enhanced analysis (optional)
        
    Returns:
        Analysis report with fit score, decision, and skill gap advice
    """
    # Extract skills from both inputs
    candidate_skills = extract_skills(skills)
    required_skills = extract_skills(job_description)

    # Calculate fit score
    score, matches, missing = score_fit(candidate_skills, required_skills)

    # Determine fit classification
    if score >= 80:
        decision = "FIT"
    elif score >= 60:
        decision = "BORDERLINE"
    else:
        decision = "NOT FIT"

    # Try OpenAI analysis if requested and available
    if use_openai and OpenAI is not None:
        api_key = os.getenv("OPENAI_API_KEY")
        if api_key:
            try:
                client = OpenAI(api_key=api_key)
                prompt = f"""
You are a senior HR recruiter and technical interviewer.
Compare the candidate skills with the job description.
Return a concise analysis with:
1. Fit Score (0-100%)
2. Decision: FIT / NOT FIT / BORDERLINE
3. Matching Skills
4. Missing Skills
5. Skill Gap Advice

CANDIDATE SKILLS:
{skills}

JOB DESCRIPTION:
{job_description}
"""
                response = client.completions.create(
                    model="gpt-4o-mini",
                    prompt=prompt,
                    max_tokens=500
                )
                return response.choices[0].text
            except Exception:
                pass  # Fall back to standard analysis

    # Generate standard analysis report
    advice = []
    if missing:
        advice.append(f"Focus on improving the following gaps: {', '.join(missing[:5])}.")
    else:
        advice.append("You already cover the core topics in the role.")

    return (
        f"Fit Score: {score}%\n"
        f"Decision: {decision}\n"
        f"Matching Skills: {', '.join(matches) if matches else 'None'}\n"
        f"Missing Skills: {', '.join(missing) if missing else 'None'}\n"
        f"Skill Gap Advice: {advice[0]}"
    )


if __name__ == "__main__":
    # Example usage
    sample_skills = """
    SQL Server, Power BI, Python, SSIS, Azure Data Factory, Excel, Data Analysis
    """
    sample_job = """
    We are looking for a Data Engineer with experience in SQL, Azure Data Factory,
    Databricks, PySpark, and data pipelines.
    """
    print(analyze_job_fit(sample_skills, sample_job))
