#Include variables.ahk
g := Gui()
ask_path := a "\bot\ask.txt"
g.OnEvent("close", gui_close)
g.OnEvent("escape", gui_close)
display := g.Add("Edit", "w500 h500 ReadOnly", "")
question := g.Add("Edit", "w500 h100", "Enter your question")
button := g.Add("Button", "Default", "Submit Question")
button.OnEvent("Click", Asker)
question.Focus() 
g.Title := "BingGPT"
g.Show()

Asker(*) {
   global display, question, history, storage
   clean()
   display.Value := "Asking...it can take up to 30 seconds to see a response."
   question_text := question.Value
   FileAppend(question_text, ask_path)
   Run(app, , , &PID)
   found := 0
   match := 0
   Loop
   {
      Sleep(5)
      if ProcessExist(PID) {
         found := 1
         try {
            FileCopy(response_path, temp, 1)
            storage := FileRead(temp)
            if (storage != display.Value) {
               display.Value := storage
            }
            Sleep(10)
         } catch {
            sleep(5)
         }
      }
      else if (found = 0) {
         Sleep(10)
      }
      else {
         break
      }
   }
}

clean(){
   if FileExist(ask_path)
      {
         FileMove(ask_path, trash, 1)
      }
      if FileExist(response_path)
      {
         FileMove(response_path, trash, 1)
      }
      if FileExist(temp)
      {
         FileMove(temp, trash, 1)
      }
}

gui_close(*) {
   ExitApp
}
