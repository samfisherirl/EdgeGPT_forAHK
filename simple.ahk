#Include variables.ahk
g := Gui()
ask_path := a "\bot\ask.txt"
if FileExist(ask_path) {
    FileMove(ask_path, trash, 1)
}
FileAppend("whats the weather in fiji?", ask_path)
Run(app,,,&PID)
Loop {
    if ProcessExist(PID) {
        break
    }
}

while ProcessExist(PID){
    sleep(5)
    if not ProcessExist(PID) {
        response := FileRead(response_path)
        break
    }
}
MsgBox(response)
