#Include variables.ahk
/*
G := EdgeGPT()
G.asyncAsk("question is what day is italic?")
*/

class EdgeGPT
{
    __New(bot)
    {
        this.question := ""
        this.answer := ""
        this.history := ""
        this.storage := ""
        this.finished := false
        this.bot := bot
        this.PID := ""
        this.timer := ObjBindMethod(this, "streamAsk")
        this.async := False
    }
    asyncAsk(question){
        this.async := True
        this.AskQ(question)
        SetTimer(this.timer, 10)
    }
    ask(question) {
        this.async := False
        this.AskQ(question)
        loop 
        {
            sleep(100)
            this.streamAsk()
            if (this.finished = True) {
                return this.answer
            }
        }

    }
    AskQ(question) {
        global ask_path, response_path, PID
        this.finished := False
        cleaner := FileOpen(response_path, "w")
        cleaner.Write("")
        cleaner.Close()
        found := 0
        match := 0
        this.clean()
        writer := FileOpen(ask_path, "w")
        writer.Write(question)
        writer.Close()
        Run(this.bot, , , &PID)
        this.PID := PID
        loop 5 
        {
            if ProcessExist(PID) 
            {
                break
            }
            else 
            {
                Sleep(20)
            }
        }
    }
    streamAsk() {
        global response_path, history_storage
        if ProcessExist(this.PID) {
            try {
                files := FileOpen(response_path, "r")
                storage := files.Read()
                files.Close()
                if (history_storage != storage) {
                    history_storage := storage
                    this.answer := storage
                }
                Sleep(5)
            } catch {
                sleep(5)
            }
        }
        else {
            this.finished := True
            if (this.async = True) {
                SetTimer(this.timer, 0)
            }
        }
    }

    clean() {
        global files_to_clean
        for file in files_to_clean {
            if FileExist(file) {
                loop 3 {
                    try {
                        FileMove(ask_path, trash, 1)
                    }
                    catch {
                        Sleep(1)
                    }
                }
            }
        }
    }

}