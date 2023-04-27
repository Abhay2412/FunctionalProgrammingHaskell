module Html.Internal where
import Numeric.Natural

-- Chapter 3 - Building an HTML Printer Library
newtype Html = Html String

newtype Structure = Structure String

type Title = String

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

h_ :: Natural -> String -> Structure
h_ n = Structure . el ("h" <> show n) . escape

ul_ :: [Structure] -> Structure
ul_ = Structure . el "ul" . concat . map (el "li" . getStructureString)

ol_ :: [Structure] -> Structure
ol_ = Structure . el "ol" . concat . map (el "li" . getStructureString)

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str

render :: Html -> String
render html =
  case html of
    Html str -> str

instance Semigroup Structure where (<>) c1 c2 = Structure(getStructureString c1 <> getStructureString c2)
instance Monoid Structure where mempty = Structure ""

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