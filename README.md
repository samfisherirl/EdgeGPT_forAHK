# EdgeGPT_forAHK
EdgeGPT_forAHK

You'll need to download this release to get this running: https://github.com/samfisherirl/EdgeGPT_forAHK/releases/download/v1/EdgeGPT_forAHK.zip
```autohotkey
#Include EdgeGPT.ahk
E := EdgeGPT()
E.asyncAsk("whats the weather in fiji?")


Loop {
    Sleep(1000)
    if (E.finished) {
        Msgbox(E.answer)
        break
    }
}
```


Credit to the EdgeGPT creator
https://github.com/acheong08/EdgeGPT
![image](https://github.com/samfisherirl/EdgeGPT_forAHK/assets/98753696/76573722-367a-4212-b457-10735e9628f0)
![VIRUSTOTAL](https://github.com/samfisherirl/EdgeGPT_forAHK/assets/98753696/6d45429b-4c72-4d19-b3cb-afb61680fdf7)
