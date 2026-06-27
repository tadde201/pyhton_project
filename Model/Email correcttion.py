



from openai import OpenAI

client = OpenAI(api_key="[REDACTED_OPENAI_KEY]")

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

api_key = os.getenv("[REDACTED_OPENAI_KEY]")
if not api_key:
    raise ValueError("OPENAI_API_KEY environment variable is not set.")

client = OpenAI(api_key=api_key)

email = """
hi manager,
i want take vacation next week because i have family emergency.
thanks
"""

response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {
            "role": "user",
            "content": f"Correct the grammar and rewrite this as a professional email:\n\n{email}"
        }
    ]
)

print(response.choices[0].message.content)