```export GOOGLE_API_KEY="your-google-api-key-here"```
server.py
```
from mcp.server.fastmcp import FastMCP
mcp=FastMCP("Math")
@mcp.tool()
def add(a: int, b: int) -> int:
    return a + b
@mcp.tool()
def multiply(a: int, b: int) -> int:
    return a * b
if __name__ =="__main__":
    mcp.run(transport="stdio")
```

client.py
```
from mcp import ClientSession, StdioServerParameters
from mcp.client.stdio import stdio_client
from langchain_mcp_adapters.tools import load_mcp_tools
from langgraph.prebuilt import create_react_agent
import asyncio

from langchain_google_genai import ChatGoogleGenerativeAI

model = ChatGoogleGenerativeAI(
    model="gemini-2.0-flash",
    # google_api_key="your-google-api-key-here"  # Uncomment if not using environment variable
)

server_params = StdioServerParameters(
    command="python",
    args=["math_server.py"]
)

async def run_agent():
    async with stdio_client(server_params) as (read, write):
        async with ClientSession(read, write) as session:
            await session.initialize()
            tools = await load_mcp_tools(session)
            agent = create_react_agent(model, tools)
            agent_response = await agent.ainvoke(
                {"messages": "what's (4+6)x14?"}
            )
            return agent_response["messages"][5].content
        
if __name__ == "__main__":
    result = asyncio.run(run_agent())
    print(result)
```
