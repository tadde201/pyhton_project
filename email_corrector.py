"""Email corrector CLI

Usage:
1. Install the SDK: pip install --upgrade openai
2. Set your API key in the environment: setx OPENAI_API_KEY "sk-..." (Windows) or
   export OPENAI_API_KEY="sk-..." (macOS/Linux)
3. Run and paste your email, then send EOF (Ctrl-Z Enter on Windows, Ctrl-D on macOS/Linux):
   python notebooks/email_corrector.py

This script does not store keys or outputs in files.
"""
from __future__ import annotations
import os
import sys

try:
    from openai import OpenAI
except Exception as e:
    raise SystemExit("Please install the OpenAI SDK: pip install --upgrade openai") from e


def rewrite_email(client: OpenAI, email_text: str) -> str:
    prompt = (
        "Rewrite the following email in a professional, polite, and concise tone.\n"
        "Correct grammar and improve clarity without changing the meaning.\n\n"
        f"Email:\n{email_text}\n"
    )

    try:
        resp = client.responses.create(model="gpt-5.5", input=prompt)
        if hasattr(resp, "output_text") and resp.output_text:
            return resp.output_text
        try:
            return resp.output[0].content[0].text
        except Exception:
            return str(resp)
    except Exception as exc:
        return f"Error calling OpenAI API: {exc}"


def read_email_from_stdin() -> str:
    if not sys.stdin.isatty():
        return sys.stdin.read()

    print("Paste the email text, then finish with EOF (Ctrl-Z Enter on Windows, Ctrl-D on macOS/Linux):")
    lines = []
    try:
        while True:
            line = input()
            lines.append(line)
    except EOFError:
        pass
    return "\n".join(lines)


def main():
    api_key = os.environ.get("OPENAI_API_KEY")
    if not api_key:
        print("ERROR: OPENAI_API_KEY not set in your environment. Set it before running.")
        print("See https://platform.openai.com/account/api-keys to create/rotate keys.")
        sys.exit(1)

    client = OpenAI()

    email_text = read_email_from_stdin().strip()
    if not email_text:
        print("No email text provided. Exiting.")
        sys.exit(1)

    corrected = rewrite_email(client, email_text)
    print("\n--- Corrected Email ---\n")
    print(corrected)


if __name__ == "__main__":
    main()
