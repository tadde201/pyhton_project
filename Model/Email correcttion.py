
import os
from openai import OpenAI

api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    raise ValueError("OPENAI_API_KEY environment variable is not set.")

client = OpenAI(api_key=api_key)

email = """
hi manager,
i want take vacation next week because i have family emergency.
thanks
"""

response = client.responses.create(
    model="gpt-5.5",
    input=f"Correct the grammar and rewrite this as a professional email:\n\n{email}"
)

print(response.output_text)