import requests

def query_llama(prompt):
    response = requests.post("http://localhost:11434/api/generate", json={
        "model": "llama3.2",
        "prompt": prompt,
        "stream": False
    })

    try:
        response_json = response.json()
        if 'response' in response_json:
            return response_json['response']
        else:
            raise KeyError("The key 'response' is missing in the API response.")
    except (ValueError, KeyError) as e:
        # Log the error and return a meaningful message
        return f"Error: {str(e)}"

# def main():
#     with open("printer_summary.txt") as f:
#         context = f.read()

#     prompt = f"""
# You are a maintenance advisor for a printer fleet.

# Below is the list of all printers in the organization:

# {context}

# Question:
# Which printers are likely to need maintenance soon and why?
# List the printer IDs and explain your reasoning.
# """

#     answer = query_llama(prompt)
#     print("\n📢 Recommendation:\n")
#     print(answer)

# if __name__ == "__main__":
#     main()
