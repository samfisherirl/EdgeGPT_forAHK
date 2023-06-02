#Include variables.ahk
g := Gui()

/*
=== I have created an EdgeGPT.ahk Include file which 
=== bypasses the need for complexity. 
=== see SimpleEXample.ahk
*/
g.OnEvent("close", gui_close)
g.OnEvent("escape", gui_close)
display := g.Add("Edit", "w500 h500 ReadOnly", "")
question := g.Add("Edit", "w500 h100", "Enter your question")
button := g.Add("Button", "Default", "Submit Question")
button.OnEvent("Click", Asker)
question.Focus() 
g.Title := "BingGPT"
clean()
g.Show()

Asker(*) {
   global display, question, history, storage
   clean()
   cleaner := FileOpen(response_path, "w")
   cleaner.Write("")
   display.Value := "Asking...it can take up to 30 seconds to see a response."
   question_text := question.Value
   FileAppend(question_text, ask_path)
   Run(app, , , &PID)
   found := 0
   match := 0
   Loop
   {
      Sleep(2)
      if ProcessExist(PID) {
         found := 1
         try {
            files := FileOpen(response_path, "r")
            storage := files.Read()
            files.Close()
            if (history != storage){
               if (storage != display.Value) {
                  display.Value := storage
                  history := storage
               }
            }
            else {
               continue
            }
            Sleep(5)
         } catch {
            sleep(5)
         }
      }
      else if (found = 0) {
         Sleep(2)
      }
      else {
         break
      }
   }
}

clean(){
   global files_to_clean, trash
   for file in files_to_clean {
      if FileExist(file) {
         try {
            FileMove(ask_path, trash, 1)
         } 
         catch {
            Sleep(1)
         }
      }
   }
}

gui_close(*) {
   ExitApp
}