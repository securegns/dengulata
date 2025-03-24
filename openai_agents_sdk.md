# OpenAI agents with python

PIP install command ```pip install langchain openai google-generativeai langchain-community langchain-openai aiohttp```


### OpenAI Agents SDK with Ollama (Not tested due to tensorflow module import error)
```
from agents import Agent, Runner, AsyncOpenAI, ModelSettings, OpenAIChatCompletionsModel

# external_client = AsyncOpenAI(base_url='<base_url>', api_key')
external_client = AsyncOpenAI(base_url='http://localhost:11434/v1')

agent = Agent(
    name='My agent',
    instructions='Reply in one sentence',
    model=OpenAIChatCompletionsModel(
        model='llama3.2',
        openai_client=external_client,
    ),
    model_settings=ModelSettings(temperature=0.5),
)

res = Runner.run_sync(
    starting_agent=agent,
    input='What is the capital of Vietnam?',
)

print(res.final_output)
```

### OpenAI Agents SDK with GPT-4o-Mini (Not tested due to tensorflow module import error)
```
from agents import Agent, Runner, AsyncOpenAI, OpenAIChatCompletionsModel
import asyncio

spanish_agent = Agent(
    name="Spanish agent",
    instructions="You only speak Spanish.",
    model="gpt-4o-mini", 
)

english_agent = Agent(
    name="English agent",
    instructions="You only speak English",
    model=OpenAIChatCompletionsModel( 
        model="gpt-4o-mini",
        openai_client=AsyncOpenAI()
    ),
)

triage_agent = Agent(
    name="Triage agent",
    instructions="Handoff to the appropriate agent based on the language of the request.",
    handoffs=[spanish_agent, english_agent],
    model="gpt-4o-mini",
)

async def main():
    result = await Runner.run(triage_agent, input="Hola, ¿cómo estás?")
    print(result.final_output)
```
