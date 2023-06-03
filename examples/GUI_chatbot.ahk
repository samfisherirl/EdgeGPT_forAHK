#Include %A_ScriptDir%\lib\EdgeGPT.ahk
botpath := A_ScriptDir "\bot\EdgeGPT_forAHK.exe"
g := Gui()
/*
=== I have created an EdgeGPT.ahk Include file which
=== bypasses the need for complexity.
=== see SimpleEXample.ahk
*/
g.OnEvent("close", gui_close)
g.OnEvent("escape", gui_close)
display := g.Add("Edit", "w500 h500 ReadOnly", "")
question_field := g.Add("Edit", "w500 h100", "Enter your question")
button := g.Add("Button", "Default", "Submit Question")
button.OnEvent("Click", Asker)
question_field.Focus()
g.Title := "BingGPT"
g.Show()

Asker(*) 
{
   global display, question_field
   E := EdgeGPT(botpath)
   E.asyncAsk(question_field.Value)
   Loop 
   {
      if E.answer != "" {
      display.Value := E.answer
      Sleep(100)
      if (E.finished)
      {
         break
      }
   }
   }
}
gui_close(*) 
{
   ExitApp
}