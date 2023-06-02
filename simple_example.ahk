#Include EdgeGPT.ahk
E := EdgeGPT()
E.asyncAsk("whats the weather in fiji?")


Loop {
    Sleep(1000)
    Msgbox(E.answer)
    if (E.finished){
        break
    }
}

E := EdgeGPT()
E.asyncAsk("How can I travel there?")


Loop {
    Sleep(100)
    if (E.finished){
        Msgbox(E.answer)
        break
    }
}
