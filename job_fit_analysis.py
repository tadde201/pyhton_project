import os
import re
from typing import Dict, List, Tuple

try:
    from openai import OpenAI
except Exception:  # pragma: no cover - optional dependency
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


def _normalize(text: str) -> str:
    return re.sub(r"[^a-z0-9]+", " ", text.lower()).strip()


def _extract_skills(text: str) -> List[str]:
    normalized = _normalize(text)
    tokens = set(normalized.split())
    skills = []
    for skill in DEFAULT_SKILL_TERMS:
        if skill in normalized:
            skills.append(skill)
    # add single-word matches from the text as fallback
    for token in sorted(tokens):
        if len(token) > 2 and token not in {"with", "and", "for", "the", "we", "are", "looking"}:
            skills.append(token)
    return sorted(set(skills))


def _score_fit(candidate_skills: List[str], required_skills: List[str]) -> Tuple[int, List[str], List[str]]:
    candidate_set = {skill.lower() for skill in candidate_skills}
    required_set = {skill.lower() for skill in required_skills}

    matches = sorted(candidate_set & required_set)
    missing = sorted(required_set - candidate_set)
    score = 0 if not required_set else int(round((len(matches) / len(required_set)) * 100))
    return score, matches, missing


def analyze_job_fit(skills: str, job_description: str, use_openai: bool = False) -> str:
    candidate_skills = _extract_skills(skills)
    required_skills = _extract_skills(job_description)

    score, matches, missing = _score_fit(candidate_skills, required_skills)

    if score >= 80:
        decision = "FIT"
    elif score >= 60:
        decision = "BORDERLINE"
    else:
        decision = "NOT FIT"

    if use_openai and OpenAI is not None:
        api_key = os.getenv("OPENAI_API_KEY")
        if api_key:
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
            try:
                response = client.responses.create(model="gpt-4o-mini", input=prompt)
                return response.output_text
            except Exception:
                pass

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
    sample_skills = """
    SQL Server, Power BI, Python, SSIS, Azure Data Factory, Excel, Data Analysis
    """
    sample_job = """
    We are looking for a Data Engineer with experience in SQL, Azure Data Factory, Databricks, PySpark, and data pipelines.
    """
    print(analyze_job_fit(sample_skills, sample_job))
