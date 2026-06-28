# Python Projects Collection

A collection of Python projects featuring utility applications and data analysis tools.

## Projects Overview

### 1. Professional Calculator (`apps/calculator/`)
A feature-rich GUI calculator application built with tkinter.

**Features:**
- Basic arithmetic operations (+, -, ×, ÷)
- Advanced functions (trigonometric, logarithmic, power)
- Memory operations (MC, MR, M+, M-)
- Calculation history
- Dark theme UI

**Usage:**
```bash
python apps/calculator/main.py
```

### 2. Job Fit Analysis (`tools/job_fit_analyzer/`)
Analyzes candidate skills against job descriptions to determine job fit.

**Features:**
- Skill extraction and matching
- Fit score calculation (0-100%)
- Decision classification (FIT, BORDERLINE, NOT FIT)
- Optional OpenAI-powered analysis
- Skill gap identification

**Usage:**
```bash
python tools/job_fit_analyzer/analyzer.py
# or
python examples/job_fit_demo.py
```

## Project Structure

```
.
├── README.md                          # This file
├── apps/                              # Standalone applications
│   └── calculator/                    # Professional calculator app
│       ├── main.py                    # Application entry point
│       └── __init__.py
├── tools/                             # Reusable utility modules
│   └── job_fit_analyzer/              # Job fit analysis engine
│       ├── analyzer.py                # Core analysis logic
│       └── __init__.py
├── examples/                          # Example scripts and demos
│   ├── job_fit_demo.py                # Job fit analyzer demo
│   └── __init__.py
└── notebooks/                         # Jupyter notebooks for exploration
    ├── data_exploration.ipynb         # Data analysis exploration
    ├── numpy_tutorial.ipynb           # NumPy learning notebook
    └── job_fit_check.ipynb            # Job fit analysis notebook
```

## Installation

```bash
# Clone the repository
git clone https://github.com/tadde201/pyhton_project.git
cd pyhton_project

# No external dependencies required for calculator
# For job fit analyzer with OpenAI support:
pip install openai
```

## Requirements

- Python 3.7+
- tkinter (usually included with Python)
- openai (optional, for enhanced job fit analysis)

## Usage Examples

### Running the Calculator
```bash
python apps/calculator/main.py
```

### Analyzing Job Fit
```bash
python examples/job_fit_demo.py
```

Or use it in your own script:
```python
from tools.job_fit_analyzer.analyzer import analyze_job_fit

my_skills = "Python, SQL, Power BI, ETL, Azure"
job_desc = "Data Analyst with SQL and Python experience"

result = analyze_job_fit(my_skills, job_desc)
print(result)
```

## License

MIT License

## Author

tadde201
