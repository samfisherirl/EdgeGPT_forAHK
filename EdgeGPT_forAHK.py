from asyncio import run as asyncio_run
from asyncio import sleep as asyncio_sleep

from EdgeGPT import Chatbot, ConversationStyle
from pathlib import Path
cwd = Path(__file__).parent

async def asker(script):
    bot = await Chatbot.create() # Passing cookies is optional
    printed = ""
    whole_script = ""
    counter = 0
    async for final, response in bot.ask_stream(prompt=script, conversation_style=ConversationStyle.creative):
        if final:
            await asyncio_sleep(0.1)
            bot.close()
        else:
            with open(cwd / "output.txt", "w", encoding="utf-8", errors="replace") as f:
                f.write(response)
            print(response.replace(printed, ""), end="")
            await asyncio_sleep(0.01)
            printed = response
            whole_script = response
    await bot.close()
    return whole_script

def writer(string, file):
    with open(cwd / file, "w", encoding="utf-8", errors="replace") as f:
        f.write(string)

def main():
    with open(cwd / "ask.txt", "r") as f:
        question = f.read()
    tries = 0
    while tries < 3:
        try:
            response = asyncio_run(asker(question))
            break
        except:
            tries += 1
            continue
if __name__ == "__main__":
    main()
    # asyncio.run(main(str("please debug this script using autohotkeyv2 syntax, try to check for errors,  and convert it to autohotkeyv2:\n\n" + y)))