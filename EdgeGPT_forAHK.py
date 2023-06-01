import asyncio
from EdgeGPT import Chatbot, ConversationStyle
from pathlib import Path
from subprocess import call
cwd = Path(__file__).parent
from time import sleep
from shutil import copy 

async def asker(script):
    bot = await Chatbot.create() # Passing cookies is optional
    printed = ""
    whole_script = ""
    counter = 0
    async for final, response in bot.ask_stream(prompt=script, conversation_style=ConversationStyle.creative):
        if final:
            await asyncio.sleep(0.1)
            copy(cwd / "temp.txt", cwd / "output.txt")
            bot.close()
        else:
            counter += 1
            if counter == 20:
                counter = 0
                copy(cwd / "temp.txt", cwd / "output.txt")
            with open(cwd / "temp.txt", "w", encoding="utf-8", errors="replace") as f:
                f.write(response)
            print(response.replace(printed, ""), end="")
            await asyncio.sleep(0.01)
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
    response = asyncio.run(asker(question))
    copy(cwd / "temp.txt", cwd / "output.txt")
if __name__ == "__main__":
    main()
    # asyncio.run(main(str("please debug this script using autohotkeyv2 syntax, try to check for errors,  and convert it to autohotkeyv2:\n\n" + y)))