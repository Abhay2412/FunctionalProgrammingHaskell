-- Chapter 3 - Building an HTML Printer Library
el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">" 

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head" 

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

makeHtml :: String -> String -> String
makeHtml titleString bodyContent = html_ (head_ (title_ titleString) <> body_ bodyContent)

myHtml :: String
myHtml = makeHtml "My page title" (h1_ "Hello World!" <> p_ "This is testing the new two functions!")

main :: IO()
main = putStrLn myHtml