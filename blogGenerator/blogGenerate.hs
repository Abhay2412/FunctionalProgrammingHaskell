import Html

myHtml :: Html
myHtml =
  html_
    "My title"
      (h_ 1 "Heading"
        <> p_ "Paragraph #1"
        <> p_ "Paragraph #2"
      )

main :: IO()
main = putStrLn (render myHtml)