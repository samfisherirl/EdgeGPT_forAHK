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