#Include %A_ScriptDir%\lib\EdgeGPT.ahk
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
g.Show()

Asker(*) 
{
   global display, question
   E := EdgeGPT()
   E.asyncAsk(question)
   Loop 
   {
      display.Value := E.answer
      Sleep(100)
      if (E.finished)
      {
         break
      }
   }
}
gui_close(*) 
{
   ExitApp
}