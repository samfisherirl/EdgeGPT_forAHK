# EdgeGPT_forAHK

Forked from: https://github.com/acheong08/EdgeGPT

- ChatGPT 4 from Bing Chat

- Internet Access

- Proxy and custom conversation style

- Cycles cookies

- no key required. 

You'll need to download this release to get this running: [https://github.com/samfisherirl/EdgeGPT_forAHK/releases/download/v1/EdgeGPT_forAHK.zip](https://github.com/samfisherirl/EdgeGPT_forAHK/releases/download/v1.01/EdgtGPT_forAHK.zip)
```autohotkey
#Include %A_ScriptDir%\lib\EdgeGPT.ahk
botpath := A_ScriptDir "\bot\EdgeGPT_forAHK.exe"
E := EdgeGPT(botpath)
answer := E.Ask("whats the weather in fiji?")
MsgBox(answer)

E.asyncAsk("How can I travel there?")
loop {
    ans := E.answer ; streams to string the answer in pieces
    if E.finished {
        MsgBox(ans)
    }
}
```


Credit to the EdgeGPT creator
https://github.com/acheong08/EdgeGPT
![image](https://github.com/samfisherirl/EdgeGPT_forAHK/assets/98753696/76573722-367a-4212-b457-10735e9628f0)
![VIRUSTOTAL](https://github.com/samfisherirl/EdgeGPT_forAHK/assets/98753696/6d45429b-4c72-4d19-b3cb-afb61680fdf7)
