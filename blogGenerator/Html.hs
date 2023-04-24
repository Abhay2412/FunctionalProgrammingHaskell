module Html 
( Html 
, Title
, Structure
, html_
, p_
, h1_ 
, append_ 
, render 
)
where

-- Chapter 3 - Building an HTML Printer Library
newtype Html
  = Html String

newtype Structure
  = Structure String

type Title
  = String

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">" 

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el "html"
      ( el "head" (el "title" (escape title) )
        <> el "body" (getStructureString content)
      )
    )

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head" 

title_ :: String -> String
title_ = el "title"

p_ :: String -> Structure
p_ = Structure . el "p" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str

render :: Html -> String
render html =
  case html of
    Html str -> str

append_ :: Structure -> Structure -> Structure
append_ c1 c2 =
  Structure (getStructureString c1 <> getStructureString c2)

escape :: String -> String 
escape =
    let
        escapeChar c =
            case c of 
                '<' -> "&lt;"
                '>' -> "&gt;"
                '&' -> "&amp;"
                '"' -> "&quot;"
                '\''-> "&#39;"
                _   -> [c]
    in
        concat . map escapeChar