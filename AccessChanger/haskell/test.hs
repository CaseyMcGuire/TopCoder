import AccessChanger


main :: IO()
main = do
  let
    inputsAndAnswers = zip tests solutions
  putStrLn $ runTests inputsAndAnswers
  

runTests [] = "Pass"
runTests ((x,y):xs) = do
  if passed then
    runTests xs
    else "Fail"
    where passed = passTest (x,y)


passTest :: ([String], [String])-> Bool
passTest (inputs, answers) = (convert inputs) == answers

 

tests = [["Test* t = new Test();", "t->a = 1;", "t->b = 2;", "t->go(); // a=1, b=2 --> a=2, b=3"],
         ["---> // the arrow --->", "---", "> // the parted arrow"],
         ["->-> // two successive arrows ->->"],
         [">/>//------/>>///-//-/>--//-///-/-/>-///>-->>//->>", "/>/>-->>-/--/-/-/-///>->-//>/>/>//>//->//>-///->/-", "//-/----/---/-//-->-->->--/-//->>-->---///>>--/->>", "-//-->/>>>-/>>---->->>->>>->---->-/-/>->->>-//>//>", "/-/>>>-->>-//>//-//--/->/-///->/-/-/>>-/->->/-/-//", ">--/->>>/-->///-/>///->-/->-/->>>//->>/->-->//->/>", "/>/-/////-/>---/->-->>/>-//--//-->>/-////>-/>->/>>", "--/-/->>---////>/-->>>/--->/>>->>-///->/--//>-/-->", "/>-////-/-/->--/>>>>/>>>-/>/-//-->>>>/>//-----///-", "/->>--/>>/->/-/>>//-->---//--/>-///>->>//->/-/>>/-", "//>-->-///--//>/--/>->/>>>--//-->/-///-//>---/--/>", ">>/>/--->-->-/-///>-///-/-/>>-/>->/>>///>-//->>//-", "//>--->>//->--->---->//->---->->///-/-//->-/->>/-/", "-->-->>>>/-/////->->>>>/->/->--/>->-//>---->/>/--/", ">>>/>/>//>->>-/-//>>>////-/>-///>>->-/--//---->->-", ">//>/->//->>>/-->>>>-->/-////>-->>->--/-/>-/-////-", "/>->->-->>>>>>>/>>->>///-/>/---/>-//>>-/-//>//-/->", "/->-/-->/>->/>>//>>>/-//-->--/-/->-/--/>>/-/-/-/>-", "->>////-/-//---/-->/-/-/>--/>--/>>>/>-/-/-//>>->/>", "//>/-->->//->->>-->/--/>//->//>-/////>//>>->>>>-->", ">>//-///-/->/-->>//>->-/-////--/>>>>-//>-->---///>", ">>>>//-/->/--/--/>--//>/->>/->//>/>-//>>->>-/>->>/", "/-->>-///>/>----/---/>>>---/>-->>>>////>/-/>>//-->", ">--//->>//>/-/>>-/>>/-->>>>>->//>>->>--/->>/->/>>/", ">->--/>/>///-/>//>/>/>>>>-/>/>--/-->/->>-->>/->/-/", ">>-//>-/>///->>---->/->//>->->--/->//-/->>>->-/>-/", ">->/>->///-/>-///>---->--//>>>///->>>>/->>///-//>/", ">--//>>>/->>>->-///>>///---/>>///->/>>/>->-///->/-", "-///>/>>/-/-//->-////>>/>>///>-->/->/--->--/-->//-", "->/--/>--/--->>//-//->>>-//>->>>->//->->>-/>/>//>-", "/-//--//-//->//>-/>//->/->>>>>->-->->-/->-/>/>-/>-", "/-/->//--->>>/>/-->-//>-/-/-/>/>/>->>>>>>->-->>///", "-->->/-/>--->-/>->>->/>//->>/-/---/>/-/>>>//->//>/", ">//->>>//-/-/>-->/-//>>->///--->/-//---/>>->-/>-//", "---//->>/->-///---->/>---/->--->/-/----//-->-->>//", ">/>>/>>>>-->///>/>//-->>>>-///->-//>>->-/-/>///-->", "-->->>//>----/->--/---/--/>-->->//>/-->>>>///->-//", ">/-/-/>-/>-->-/>-->>--///->--/>//------/->>>--///>", "/>---/->-/>>/>-/>>>>>//>-->/////////>>/>/>/>//-->-", ">>//-->>/->-->>>->--//->>//--/>-/-/->/////>/>->>>-", "//>/->//>-/>/>//>->/>>>/->->/>-////----//>>>/--->>", "->/----//->>--->--//>/->>>>//>>/-->>>->>-///-->>-/", "/->--/>-///-->-//->>/>//>>-/-/-/>>>--/>//-->-->>--", ">->>/>/>>//>>->->/>--/>>->///-->>/>/>->>->>-//-//>", "/>>-/--/--->->>-/->/-/>>//>---//>-/>>/-//-////>-/-", "/--/>>/->//////>-//>-/>>>--/-/>--/->///->>-->->-//", "-/->>>>>>///>>//>>/>>/-/>>//-/>-/>-/>-/---->/>//>/", "/>/->>//-/>>>>-->/->>/>>>->>-//>/>-----/>>/>/-->>-", ">-/>>>--/-->-//>>//->-/>/--->/-->///-->>->>//->///", "///->--//>//-----/>-//>/-/->-->/>--//->/-->>//--//"],
         ["->>>>/>>>-->/---////-/>>>>/>/>>-->>//->>/->-/>-/-/", ">->>>>->----/>-----//>>/->/>>--->-///>>-/-/-/>>/--", "//-/>---/>-->-///->/-/->/--->-/->>//->//>>>/>->//-", ">-//>/-/>->///-->//->/--////>---/--/>>/->->>-->-/-", "--/-///-/--/->->>->-/->/->//>>/-/->--->///--/>>///", ">/->//--->//--/---//>>-/>/-->--/>>--/->/////>-----", "/-->>/-//->->/>-//>/>/->->>>/>>----->>>/>///>//-//", ">/---/--//->--//>-/->>--/--///>--/>/-/>>--/>->->->", ">>//--/-//-->->>->-->-//>>-/>///-//>/>/--->>>//>>>", "-->->>/>>>>--->->->///-/>>>/>-/---/->>>///--->/---", "-->>>/->-->-/-/-//>>->>/-/-->>->>//>->>>/>>--/>-->", ">>->>>-/->//-/>//->/>>->>>---/>--->>-////>>--/->>-", "-->/>/->-//--/>->->>>->->->/>/>/->-->-->>->>//->>>", "-/->>>-->->->>-/--//-/>/>-->--/>/>/->>-////->-//>/", "->/>/>-/>->->-->///>-//-//->/---/>---->--/->/>>-/>", "/-///--->>--/>>>>/>>--/->//>>-->/>>/-//>--///>/>>/", "---/-//>>/-->-//--/->>>/>-/>>>-//>>///-/>//--/->/>", ">>/->/-->->->/>->>--->/>>>-->>-/->-/->->/----/>-->", "-/-/>>>/->/>-->>->>>>-/-///>->->-->>/->>>/>>///>/-", "-//->////>>>-//>-/>>>>/>>>->>--->>-----/>>/>/-/>/-", "///>>->>-///-->>/>>->->/>>/--////>/-/->->->/-//-->", "/->--->/->>//>///////>>--///>//-/>-//>---->/--->>>", "--//>-->->>>>-/-/-/>/////>->>->//>-->/->/->//--/-/", "//////>>>>/>//---/->/>-/-//-//////-->--->--->-/-//", ">-->--->//->/>>--/-/>/>-///--/--/->///-////>->/->>", "/>/>-//>>>>>-->>/>>>/--//-->>//>->-/->/////>>-/>/>", "--->>/->-/--/>/-/-///-->/>-////>>//-->/->>->----/>", "--/>>-/>-//-//>>////-/////>/>/>/>///>>---->->>/-/-", "///>//>-->/>--/----//>/->>/>>>-/--->/->-/>->--->//", "/>-/--/>/-/>>/->-->->/->-/--->/>/-///->>///>/>>>--", ">//-/---/-->/--//>/>->/>-/--->//->/>---/->-/-//>-/", ">>>//>>---/-/>-/>>->/->>----///>/-/>->->/->-/>/>//", ">->>->/>--->>>//->--->-/--/--/--/->//>->>/->>>>/->", "/->->/-->->---/-/>//-->>/--/->>/>////--//--//////-", "-/--/>/>/---/>---/->/--/>///--/>/>->->>/-->>>///->", "->---//>//>---//->-/>>-->-/>->>--->/--///>>/-//--/", "->/-/--->>---/->->>/--///>>/>-/-/>>>->--/->>->-/-/", "//->/>/>/>-/>---/->/->-/-///>-/-/>>>/->/--//->--/>", ">//->->>-/>>>>-->>-->/-/->//>///>/>--//>-/>>->//>>", "/--->>-/>/-////->>/->/->>/->>-----/>>/-/>>>>>->>/-", ">/>>---/>-/>//>>/---/-//-->-/-->>/-->////-//>---->", "-/>-/>--->>--/>>/-->>>-/>-/>->-//>/---//->/-->//>/", "--->--->/--->>->-/>>>///>>/>/>>---//-/>/->->/>-->>", ">/>->---//->->//-/->--/-/--/>-->>->/>-->->//->-/>-", "--/>-->>/>>-/-->/-/-/-/-----/>-->/-->>>>//->/--/-/", "--/-/->/>/->/>-//>-///>>/>>>//--/>->>>//>---/-//>>", ">/-/>>->/>---/---///--/->//>->//>->////>>-/-///->-", ">>//>/->--->//-/>--/-/->/--/>->/>//>/>-/>///---/>>", "/-/>/>//-->>/-/>-->/-//->-///-/-----/->->/>//->//-", ">->>>/>/--/-->/>/-->/->-//>>/>>/-->->-/-->->>>->//"],
         [">>->->>->->/>-->>>-/>-///-//>->->-//--//--/-->>>>>", "-//////-----/->>/>>>->--/>>->//>/-/>///-/>-/---//>", ">//>/--/-/>-/>>---/->/>->--->/---/->///->--->->/->", "/>/>/>>/>>-->/>//--/>>/>>->>----//>--/->>//--->/>-", "->/>->>-->/-/--//->-/>-/-/////>--->///-///>-/-/-->", "///-->-/-->/>/>-->->->>>/>--/--->>-/>//->/->>>----", "////>->>>->-//>->---/->>-/--/>--->>>-/>--/>/>/-//-", ">/-/-/>-->--/-->/>>--//>>///>->-/-///--/>///>>-/>>", "/->/>-/>>>--->>>>>---->--//--///>-/>--/>/>-/->>>/>", ">->>//-//--/-/--/->>>>-->>>>>>>>>>//-/--/---/-/-->", ">-->--/->/-/-//>-->/>>>->/>//-/////>>-/-/>/-/-/>->", "/>-/-/->>->->>-/>/>/-//->/-/->>/>--->>-/>/->//>>>-", "-/->--->///>/>-->-->>/-/>-->->/>/--/>/>>>->//>>-/-", "->->-//-///--//>>>>>->>>--->/-//>>>/->--//-///--/-", "->//->/>-->/->//->>>->>/>->>>/>>>/-/-/--/>--//->>/", ">>>-/-->////>//--/>/>>-->>>/-/>>//>->---/>>/>-/->>", "/-/--->>>--/>>-/>->->---->-//>/>>//>->///->-//>--/", ">/>//>/->>->---/>--/--/-/>-//>-->>->///-/>->-/>>>-", "-/>>->>->>-//>-->//->>->->->//-/>/-///>>->---/>->/", "->>--/>>>/>>>-/>>>///-///>//->//>>>>--/--->/--/>/-", ">////>->->/>>/>/->-/->-///-->-/>>/>//>>///>///>->/", ">-/--->>>-->>>>>//>--///--/>>>>>-->>-->/////-->-->", "-/-//////>---//>>/--/-/-/--/>->/>>->>->//-->/>/>//", "/>////>///>-/>-/>///>--/---//>->>-/>>->-->>>>-/->/", "/>>>-/>--->-/-/-///-/->---//>/--/-///>-->>>-/>>>->", "/>->>-/////-/>/-/>->>>/-/>>->/>/-/->-/>-/->--/>>>>", ">/-/>/--//>-->/>>-/->>>/-/>///--/>///-->>/>/>->>--", ">>->/>>/---/>>--/>>//>--/>/-/>--->/>>-/>>>>-//>>->", "-/>-/-/->>->>-/>/-/>/-//--/->->>-/>>/>>-/>---/->//", "-/>->-/-/-/>-->>/////--///>/>///>/->-////>>/->->>/", "/>>>>>-->/>---///-/--//-/>>->>/-/->>>->/->->>>--/>", "->//->>/-/>>///>>>>--/--/--//-////->-/---->/->>>//", "-->>->/>/-//->//>>/-/-->->>->->/-//-->/>//->/>>--/", "//->>->/>>>//--//>>/>//->>/>/-->--->///-/>>>-->->>", ">>/->>>-->>//>>>>-//>>>-->--/>>-//-->-//->>--/->>>", ">/-/--/>//>->-->>//--////--->>>>>>/----->>/-->>///", ">-///>>>--//>--//->>>////-/-/->---->-/-->-/>/>/->/", "/>/--/>-/---/>/-///->>->//>-//////--->>/>/-/>>/>>/", "-/>->-/>/->->/-/>///->-->->>---//-->>->/>/-->//>>-", "--//>--/>/>/>-///>//->-//>-/-/>>/>/->/>/----/->/-/", ">>->>/-/>-/>>---/>>/-->//--//->>>/>>--->>/-///-/>-", "->>>/->-/>/->/>//->/->--/>>>/--/>/>->>>//>//----//", "///-/>>->/-///>--/>-->>>//--//>>->-//>-//>-/--->/>", "---/>>///->>/>/>----//>/-/-/->/>/->/-///>/->-///--", "/-///>-->/-/-->>>/>-/>/>-/-/>>>-->->/>>>>-/////>>-", ">>>>-////>>>->//->-/-/-/>-->-->>->/>/>//>/>>->->//", "///>>//-/>>>->>>-//-/->-/>>>///>///>--->>>>>->>/--", "////>->-/>/->->->//>/>/-->->///->->>>/->/--->->>->", "/-/-->//>/>>//>--//--/->-///->/>/---//>>///>>>->>-", "->>////--/->/-/>>/>-//>////->->--/----->-//-/>>->-"],
         ["/>>//////>>/>>>/////-/>>---/-/>>/>-/->/->->/-//->>", ">/-///->>>--/>-//////>>-//---/-/>//>//-->>>>->-->/", ">>-/>->->-/>>-///>/-/->//>>/-/->->>/////->//>//-/-", "->>-/>>->/->->-->-->->//>>>/>>>--->-/>/>/>-/->/>--", "->/>>-/>->/--/-/>-/->>///>-->>/-/-/-/-/>/>---///-/", "/--//>/->-/--/>>/-///-/>-/>//->--->--//>->/->>-/>>", "//->-/>//>->--/>/>---/->/->>--//>--/>>///-///-///-", "/->->>->/-/>--//>//--/-//>>/->>//>/->//-//>>-/-/>>", "-/-->-/->/////-/>>/-/>->->/>>---->-/--//>->>>>>>>>", "->>->>>>->///>>/>/>/>>/>/>//>>/>>/-//-/->//-->->/-", ">>-->///-/>>>/>--//>-/-->>//-/>-->/>>---->/>/>>>/-", "-/>/->>>>//>>->--->-//-//>/->/>>-->>/-/>/----->/>-", "----/--/>/>-->-/-----/->->->->>>>>-/>/-//-/>->/>->", "//>////-/>>-/>/>-//>-/>>>/>->/-->///->->/-/->/->-/", "-->->--/>-/>-//-///--/-///-/>>/>>/>--/-->>///-->>-", "//>-->-/>/-/->/--------->-///-/--->/--/>-/>---/>>-", "---/->/>--///>>>>>->/>>---->>///>>-->>-/--///>>-/>", "/>-/>>>-->->/>>-//-----///-//>>>>>//>>-->->//>>---", "/--/>>>-/>->>-/-/>>/>/>->>/>>>/-/>-->>/>///--//->>", ">->->>--//-/-//>-/>>>->>/>--/>->->>->->>->--///>--", ">>-//--/-/-/>->>//->-/-//////>-/-/-/-/->///->-->--", "-/>>->/>/---/->///>-->/>>>>/->>/->/>-/-/>/-->-->->", "///->/>>>-///->-///>>//-/->-//>>/>>->-//-->-/--/--", "//-//>>>->>->>/-->-////>-//->>//->->>/>-/>/-/>>/>/", ">>>/-//-//-->>/-/-/-/>>/>>--/>-/>//>>>>>/>>>/>->/>", ">--/>>>/>/--/->-///--->/////->/-->>>/-/-/--/-/>->>", "/->/-//>-/>-->->//>>---//>-//>/-///---->-//>//->--", ">//-///->/->>//>>-->//>>->>>/>->/-///>-///-//-/--/", "//-/>>//---/>->////-/-/--/->>>>-/>->/>-->>>/->>>--", "-/->->---->/---/>//-/>>/>//>>>->>--//>>/->/>/--//>", "/-//>/->/-->/->>>>//>->//--/>-/->/--///-//>->//---", "-/>-//-//-/>/>/->->>>-/->///-/>///>->//->////-/->>", "->>>>----///>>>/>--->/>---/>->>//-/>-/---/-->>/>->", "/>/>---->>/>>---->/->--//////>->>/>/-/>>>/->/-/>/>", ">/->->>/>>/>-----//-//>-->/-->//->-->/-//>///>->--", "/>-/-//-/>/-/>/-----//->>->>-/>---->----/////>-/>>", ">--/->-/>>>/->//-//>/>>/-//>-///>/->>--/>-/-->>>>-", ">/----->/>>/->>>///>>->-/>---/>>>->>>/>->>/>///->>", "--//>->-->/->->>>->-/-->-/////>/>/>///->>-->---->>", "----//--/>>>/>//>-/-/>>->-/>//>--//--/-/>>>>/>>//>", "-///-//->/>////->/>/->->///->->--->>->>>//>//>/>>>", "--/>-->>---/>-->--/>>-//>>>-/>-->>-/>/-/-//-///>>/", "---///>/----//>-/>---->>>>>/>--//>>/>/>->>--/->---", "-///>/>--//////-->/>/-/-/>->>>//-/--->-->>>->/>-/-", "/-///>/>>>>-->/////->-->//--///>>/-//->//--//--///", ">->>>-->//->>//->//--/>-//>>->/-/->>-//-//>>-///>>", ">->-///--/-/>/-/>/>/>>>/>>>>>->-/----/>->>/-/>///-", "/-/->->--/>/->->>/---//////>/->//-//>->/-/----/---", "->/>--/>--//-->/->/>>/-///>>>->-/>--//>-/>//>-/>>/", "-/-/->/>/>->>-->>//--/>-->//>//---->---//->-/-/---"]]

solutions = [["Test* t = new Test();", "t.a = 1;", "t.b = 2;", "t.go(); // a=1, b=2 --> a=2, b=3"],
             ["--. // the arrow --->", "---", "> // the parted arrow"],
             [".. // two successive arrows ->->"],
             [">/>//------/>>///-//-/>--//-///-/-/>-///>-->>//->>", "/>/>-.>-/--/-/-/-///>->-//>/>/>//>//->//>-///->/-", "//-/----/---/-//-->-->->--/-//->>-->---///>>--/->>", "-//-->/>>>-/>>---->->>->>>->---->-/-/>->->>-//>//>", "/-/>>>-.>-//>//-//--/->/-///->/-/-/>>-/->->/-/-//", ">--/.>>/-.///-/>///->-/->-/->>>//->>/->-->//->/>", "/>/-/////-/>---/->-->>/>-//--//-->>/-////>-/>->/>>", "--/-/.>---////>/-->>>/--->/>>->>-///->/--//>-/-->", "/>-////-/-/->--/>>>>/>>>-/>/-//-->>>>/>//-----///-", "/.>--/>>/./-/>>//-->---//--/>-///>->>//->/-/>>/-", "//>-->-///--//>/--/>->/>>>--//-->/-///-//>---/--/>", ">>/>/--.-.-/-///>-///-/-/>>-/>->/>>///>-//->>//-", "//>--->>//->--->---->//->---->->///-/-//->-/->>/-/", "-.-.>>>/-/////->->>>>/->/->--/>->-//>---->/>/--/", ">>>/>/>//>->>-/-//>>>////-/>-///>>->-/--//---->->-", ">//>/->//->>>/-->>>>-->/-////>-->>->--/-/>-/-////-", "/>..-.>>>>>>/>>.>///-/>/---/>-//>>-/-//>//-/->", "/.-/-./>./>>//>>>/-//-->--/-/->-/--/>>/-/-/-/>-", ".>////-/-//---/-->/-/-/>--/>--/>>>/>-/-/-//>>->/>", "//>/-->->//->->>-->/--/>//->//>-/////>//>>->>>>-->", ">>//-///-/->/-->>//>->-/-////--/>>>>-//>-->---///>", ">>>>//-/->/--/--/>--//>/->>/->//>/>-//>>->>-/>->>/", "/-.>-///>/>----/---/>>>---/>-->>>>////>/-/>>//-->", ">--//->>//>/-/>>-/>>/-->>>>>->//>>->>--/->>/->/>>/", ">.--/>/>///-/>//>/>/>>>>-/>/>--/-->/->>-->>/->/-/", ">>-//>-/>///->>---->/->//>->->--/->//-/->>>->-/>-/", ">./>.///-/>-///>---->--//>>>///->>>>/->>///-//>/", ">--//>>>/->>>->-///>>///---/>>///->/>>/>->-///->/-", "-///>/>>/-/-//->-////>>/>>///>-->/->/--->--/-->//-", "./--/>--/--.>//-//->>>-//>->>>->//->->>-/>/>//>-", "/-//--//-//->//>-/>//->/->>>>>->-->->-/->-/>/>-/>-", "/-/.//--->>>/>/-->-//>-/-/-/>/>/>->>>>>>->-->>///", "-../-/>--.-/>.>./>//->>/-/---/>/-/>>>//->//>/", ">//->>>//-/-/>-->/-//>>->///--->/-//---/>>->-/>-//", "---//->>/->-///---->/>---/->--->/-/----//-->-->>//", ">/>>/>>>>-.///>/>//-->>>>-///->-//>>->-/-/>///-->", "-..>//>----/->--/---/--/>-->->//>/-->>>>///->-//", ">/-/-/>-/>-.-/>-.>--///->--/>//------/->>>--///>", "/>---/.-/>>/>-/>>>>>//>-->/////////>>/>/>/>//-->-", ">>//-->>/->-->>>->--//->>//--/>-/-/->/////>/>->>>-", "//>/->//>-/>/>//>->/>>>/->->/>-////----//>>>/--->>", "./----//->>--->--//>/->>>>//>>/-->>>->>-///-->>-/", "/.--/>-///-->-//->>/>//>>-/-/-/>>>--/>//-->-->>--", ">.>/>/>>//>>->->/>--/>>->///-->>/>/>->>->>-//-//>", "/>>-/--/--..>-/./-/>>//>---//>-/>>/-//-////>-/-", "/--/>>/.//////>-//>-/>>>--/-/>--/->///->>-->->-//", "-/.>>>>>///>>//>>/>>/-/>>//-/>-/>-/>-/---->/>//>/", "/>/.>//-/>>>>-->/->>/>>>->>-//>/>-----/>>/>/-->>-", ">-/>>>--/-.-//>>//->-/>/--->/-->///-->>->>//->///", "///->--//>//-----/>-//>/-/->-->/>--//->/-->>//--//"],
             [".>>>/>>>-./---////-/>>>>/>/>>-->>//->>/->-/>-/-/", ">.>>>.----/>-----//>>/->/>>--->-///>>-/-/-/>>/--", "//-/>---/>-->-///->/-/->/--->-/->>//->//>>>/>->//-", ">-//>/-/>->///-->//->/--////>---/--/>>/->->>-->-/-", "--/-///-/--/->->>->-/->/->//>>/-/->--->///--/>>///", ">/.//--->//--/---//>>-/>/-->--/>>--/->/////>-----", "/-.>/-//->->/>-//>/>/->->>>/>>----->>>/>///>//-//", ">/---/--//->--//>-/->>--/--///>--/>/-/>>--/>->->->", ">>//--/-//-->->>->-->-//>>-/>///-//>/>/--->>>//>>>", "-..>/>>>>--...///-/>>>/>-/---/->>>///--->/---", "-.>>/.-.-/-/-//>>->>/-/-->>->>//>->>>/>>--/>-->", ">>.>>-/.//-/>//->/>>->>>---/>--->>-////>>--/->>-", "-./>/.-//--/>->->>>->->->/>/>/->-->-->>->>//->>>", "-/.>>-...>-/--//-/>/>-->--/>/>/->>-////->-//>/", "./>/>-/>..-.///>-//-//->/---/>---->--/->/>>-/>", "/-///--->>--/>>>>/>>--/->//>>-->/>>/-//>--///>/>>/", "---/-//>>/-->-//--/->>>/>-/>>>-//>>///-/>//--/->/>", ">>/./-.../>.>--./>>>-.>-/.-/../----/>-.", "-/-/>>>/./>-.>.>>>-/-///>->->-->>/->>>/>>///>/-", "-//->////>>>-//>-/>>>>/>>>->>--->>-----/>>/>/-/>/-", "///>>->>-///-->>/>>->->/>>/--////>/-/->->->/-//-->", "/.--./.>//>///////>>--///>//-/>-//>---->/--->>>", "--//>-->->>>>-/-/-/>/////>->>->//>-->/->/->//--/-/", "//////>>>>/>//---/->/>-/-//-//////-->--->--->-/-//", ">-.--.//->/>>--/-/>/>-///--/--/->///-////>->/->>", "/>/>-//>>>>>-->>/>>>/--//-->>//>->-/->/////>>-/>/>", "--.>/.-/--/>/-/-///-->/>-////>>//-->/->>->----/>", "--/>>-/>-//-//>>////-/////>/>/>/>///>>---->->>/-/-", "///>//>-->/>--/----//>/->>/>>>-/--->/->-/>->--->//", "/>-/--/>/-/>>/.-../.-/--./>/-///->>///>/>>>--", ">//-/---/-->/--//>/>->/>-/--->//->/>---/->-/-//>-/", ">>>//>>---/-/>-/>>->/->>----///>/-/>->->/->-/>/>//", ">.>./>--.>>//->--->-/--/--/--/->//>->>/->>>>/->", "/../-..---/-/>//-->>/--/->>/>////--//--//////-", "-/--/>/>/---/>---/./--/>///--/>/>->->>/-->>>///->", ".---//>//>---//->-/>>-->-/>->>--->/--///>>/-//--/", "./-/--.>---/..>/--///>>/>-/-/>>>->--/->>->-/-/", "//->/>/>/>-/>---/->/->-/-///>-/-/>>>/->/--//->--/>", ">//->->>-/>>>>-->>-->/-/->//>///>/>--//>-/>>->//>>", "/--.>-/>/-////->>/->/->>/->>-----/>>/-/>>>>>->>/-", ">/>>---/>-/>//>>/---/-//-->-/-->>/-->////-//>---->", "-/>-/>--.>--/>>/-.>>-/>-/>.-//>/---//->/-->//>/", "--.--./--.>.-/>>>///>>/>/>>---//-/>/->->/>-->>", ">/>.---//->->//-/->--/-/--/>-->>->/>-->->//->-/>-", "--/>-.>/>>-/-./-/-/-/-----/>-./-.>>>//->/--/-/", "--/-/./>/./>-//>-///>>/>>>//--/>->>>//>---/-//>>", ">/-/>>./>---/---///--/->//>->//>->////>>-/-///->-", ">>//>/->--->//-/>--/-/->/--/>->/>//>/>-/>///---/>>", "/-/>/>//-->>/-/>-->/-//->-///-/-----/->->/>//->//-", ">.>>/>/--/-./>/-./.-//>>/>>/-->->-/-->->>>->//"],
             [">>..>../>-.>>-/>-///-//>->->-//--//--/-->>>>>", "-//////-----/->>/>>>->--/>>->//>/-/>///-/>-/---//>", ">//>/--/-/>-/>>---/->/>->--->/---/->///->--->->/->", "/>/>/>>/>>-./>//--/>>/>>->>----//>--/->>//--->/>-", "./>.>-./-/--//->-/>-/-/////>--->///-///>-/-/-->", "///-->-/-->/>/>-->->->>>/>--/--->>-/>//->/->>>----", "////>->>>->-//>->---/->>-/--/>--->>>-/>--/>/>/-//-", ">/-/-/>-.--/-./>>--//>>///>->-/-///--/>///>>-/>>", "/./>-/>>>--.>>>>---.--//--///>-/>--/>/>-/->>>/>", ">.>//-//--/-/--/->>>>-->>>>>>>>>>//-/--/---/-/-->", ">-.--/./-/-//>-->/>>>->/>//-/////>>-/-/>/-/-/>->", "/>-/-/.>..>-/>/>/-//->/-/->>/>--->>-/>/->//>>>-", "-/.--.///>/>-->-->>/-/>-->->/>/--/>/>>>->//>>-/-", "..-//-///--//>>>>>->>>--->/-//>>>/->--//-///--/-", ".//->/>-->/->//->>>->>/>->>>/>>>/-/-/--/>--//->>/", ">>>-/-.////>//--/>/>>-->>>/-/>>//>->---/>>/>-/->>", "/-/--.>>--/>>-/>..---.-//>/>>//>->///->-//>--/", ">/>//>/->>->---/>--/--/-/>-//>-->>->///-/>->-/>>>-", "-/>>.>.>-//>-->//->>->->->//-/>/-///>>->---/>->/", ".>--/>>>/>>>-/>>>///-///>//->//>>>>--/--->/--/>/-", ">////>->->/>>/>/->-/->-///-->-/>>/>//>>///>///>->/", ">-/--.>>-.>>>>//>--///--/>>>>>-->>-->/////-->-->", "-/-//////>---//>>/--/-/-/--/>->/>>->>->//-->/>/>//", "/>////>///>-/>-/>///>--/---//>->>-/>>->-->>>>-/->/", "/>>>-/>--.-/-/-///-/->---//>/--/-///>-->>>-/>>>->", "/>.>-/////-/>/-/>->>>/-/>>->/>/-/->-/>-/->--/>>>>", ">/-/>/--//>-->/>>-/->>>/-/>///--/>///-->>/>/>->>--", ">>./>>/---/>>--/>>//>--/>/-/>--->/>>-/>>>>-//>>->", "-/>-/-/.>.>-/>/-/>/-//--/->->>-/>>/>>-/>---/->//", "-/>.-/-/-/>-.>/////--///>/>///>/->-////>>/->->>/", "/>>>>>-./>---///-/--//-/>>->>/-/->>>->/->->>>--/>", ".//->>/-/>>///>>>>--/--/--//-////->-/---->/->>>//", "-.>./>/-//->//>>/-/-->->>->->/-//-->/>//->/>>--/", "//->>->/>>>//--//>>/>//->>/>/-->--->///-/>>>-->->>", ">>/.>>-.>//>>>>-//>>>-->--/>>-//-->-//->>--/->>>", ">/-/--/>//>->-->>//--////--->>>>>>/----->>/-->>///", ">-///>>>--//>--//->>>////-/-/->---->-/-->-/>/>/->/", "/>/--/>-/---/>/-///->>->//>-//////--->>/>/-/>>/>>/", "-/>.-/>/../-/>///->-->->>---//-->>->/>/-->//>>-", "--//>--/>/>/>-///>//->-//>-/-/>>/>/->/>/----/->/-/", ">>.>/-/>-/>>---/>>/-.//--//->>>/>>--->>/-///-/>-", ".>>/.-/>/./>//->/->--/>>>/--/>/>->>>//>//----//", "///-/>>->/-///>--/>-->>>//--//>>->-//>-//>-/--->/>", "---/>>///->>/>/>----//>/-/-/->/>/->/-///>/->-///--", "/-///>-->/-/-->>>/>-/>/>-/-/>>>-->->/>>>>-/////>>-", ">>>>-////>>>->//->-/-/-/>-->-->>->/>/>//>/>>->->//", "///>>//-/>>>->>>-//-/->-/>>>///>///>--->>>>>->>/--", "////>->-/>/->->->//>/>/-->->///->->>>/->/--->->>->", "/-/-.//>/>>//>--//--/->-///->/>/---//>>///>>>->>-", ".>////--/->/-/>>/>-//>////->->--/----->-//-/>>->-"],
             ["/>>//////>>/>>>/////-/>>---/-/>>/>-/->/->->/-//->>", ">/-///->>>--/>-//////>>-//---/-/>//>//-->>>>->-->/", ">>-/>..-/>>-///>/-/->//>>/-/->->>/////->//>//-/-", ".>-/>>./..-.-..//>>>/>>>--->-/>/>/>-/->/>--", "./>>-/>./--/-/>-/.>///>-->>/-/-/-/-/>/>---///-/", "/--//>/->-/--/>>/-///-/>-/>//->--->--//>->/->>-/>>", "//->-/>//>->--/>/>---/->/->>--//>--/>>///-///-///-", "/..>./-/>--//>//--/-//>>/->>//>/->//-//>>-/-/>>", "-/-.-/./////-/>>/-/>->->/>>---->-/--//>->>>>>>>>", ".>.>>>.///>>/>/>/>>/>/>//>>/>>/-//-/->//-->->/-", ">>-.///-/>>>/>--//>-/-->>//-/>-->/>>---->/>/>>>/-", "-/>/.>>>//>>->--->-//-//>/->/>>-->>/-/>/----->/>-", "----/--/>/>-.-/-----/....>>>>-/>/-//-/>->/>->", "//>////-/>>-/>/>-//>-/>>>/>->/-->///->->/-/->/->-/", "-..--/>-/>-//-///--/-///-/>>/>>/>--/-->>///-->>-", "//>-->-/>/-/->/--------->-///-/--->/--/>-/>---/>>-", "---/./>--///>>>>>->/>>---->>///>>-->>-/--///>>-/>", "/>-/>>>-../>>-//-----///-//>>>>>//>>-->->//>>---", "/--/>>>-/>.>-/-/>>/>/>.>/>>>/-/>-.>/>///--//->>", ">..>--//-/-//>-/>>>->>/>--/>->->>->->>->--///>--", ">>-//--/-/-/>->>//->-/-//////>-/-/-/-/->///->-->--", "-/>>./>/---/.///>-->/>>>>/->>/->/>-/-/>/-->-->->", "///->/>>>-///->-///>>//-/->-//>>/>>->-//-->-/--/--", "//-//>>>->>->>/-->-////>-//->>//->->>/>-/>/-/>>/>/", ">>>/-//-//-->>/-/-/-/>>/>>--/>-/>//>>>>>/>>>/>->/>", ">--/>>>/>/--/.-///--->/////->/-->>>/-/-/--/-/>->>", "/./-//>-/>-->->//>>---//>-//>/-///---->-//>//->--", ">//-///->/->>//>>-->//>>->>>/>->/-///>-///-//-/--/", "//-/>>//---/>->////-/-/--/->>>>-/>->/>-->>>/->>>--", "-/..---./---/>//-/>>/>//>>>->>--//>>/->/>/--//>", "/-//>/->/-->/->>>>//>->//--/>-/->/--///-//>->//---", "-/>-//-//-/>/>/->->>>-/->///-/>///>->//->////-/->>", ".>>>----///>>>/>--->/>---/>->>//-/>-/---/-->>/>->", "/>/>---.>/>>---./.--//////>->>/>/-/>>>/->/-/>/>", ">/..>/>>/>-----//-//>-->/-->//->-->/-//>///>->--", "/>-/-//-/>/-/>/-----//->>->>-/>---->----/////>-/>>", ">--/.-/>>>/.//-//>/>>/-//>-///>/->>--/>-/-->>>>-", ">/----./>>/.>>///>>->-/>---/>>>->>>/>->>/>///->>", "--//>->-->/->->>>->-/-->-/////>/>/>///->>-->---->>", "----//--/>>>/>//>-/-/>>->-/>//>--//--/-/>>>>/>>//>", "-///-//->/>////->/>/->->///->->--->>->>>//>//>/>>>", "--/>-.>---/>-.--/>>-//>>>-/>-->>-/>/-/-//-///>>/", "---///>/----//>-/>---->>>>>/>--//>>/>/>->>--/->---", "-///>/>--//////-->/>/-/-/>->>>//-/--->-->>>->/>-/-", "/-///>/>>>>-->/////->-->//--///>>/-//->//--//--///", ">.>>-.//->>//->//--/>-//>>->/-/->>-//-//>>-///>>", ">.-///--/-/>/-/>/>/>>>/>>>>>->-/----/>->>/-/>///-", "/-/..--/>/..>/---//////>/->//-//>->/-/----/---", "./>--/>--//-->/->/>>/-///>>>->-/>--//>-/>//>-/>>/", "-/-/./>/>.>-.>//--/>-->//>//---->---//->-/-/---"]]
