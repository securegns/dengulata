# langchain
Setup
```
python3 -m venv venv
source ./venv/bin/activate
pip install langchain openai streamlit langchain-community langchain-openai

cat > .env
OPENAI_API_KEY=your_api_key_here
```

### Program 1 using OpenAI andLangchain
```
from dotenv import load_dotenv
from langchain_openai import OpenAI

load_dotenv()

llm = OpenAI(temperature=0.7)
prompt = "List one cool dog name, with no additional text."
response = llm.invoke(prompt)  # Updated from llm(prompt) to llm.invoke(prompt)
print(response)
```

### Program 2 using Pluralsight AI sandboxes

