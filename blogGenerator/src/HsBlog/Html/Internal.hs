-- Internal.hs
module HsBlog.Html.Internal where
import Prelude hiding (head)
import Numeric.Natural

-- Chapter 3 - Building an HTML Printer Library
newtype Html = Html String

newtype Structure = Structure String

newtype Content = Content String

newtype Head = Head String

type Title = String

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">" 

elAttr :: String -> String -> String -> String
elAttr tag attrs content =
  "<" <> tag <> " " <> attrs <> ">" <> content <> "</" <> tag <> ">"

html_ :: Head -> Structure -> Html
html_ (Head head) content =
  Html
    ( el "html"
      ( el "head" head
        <> el "body" (getStructureString content)
      )
    )

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head" 

stylesheet_ :: FilePath -> Head
stylesheet_ path = Head $ "<link rel=\"stylesheet\" type=\"text/css\" href=\"" <> escape path <> "\">"

meta_ :: String -> String -> Head
meta_ name content = Head $ "<meta name=\"" <> escape name <> "\" content=\"" <> escape content <> "\">"

title_ :: String -> Head
title_ = Head . el "title" . escape

p_ :: Content -> Structure
p_ = Structure . el "p" . getContentString

h_ :: Natural -> Content -> Structure
h_ n = Structure . el ("h" <> show n) . getContentString

ul_ :: [Structure] -> Structure
ul_ = Structure . el "ul" . concat . map (el "li" . getStructureString)

ol_ :: [Structure] -> Structure
ol_ = Structure . el "ol" . concat . map (el "li" . getStructureString)

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

-- * Content

txt_ :: String -> Content
txt_ = Content . escape

link_ :: FilePath -> Content -> Content
link_ path content =
  Content $
    elAttr
      "a"
      ("href=\"" <> escape path <> "\"")
      (getContentString content)

img_ :: FilePath -> Content
img_ path =
  Content $ "<img src=\"" <> escape path <> "\">"

b_ :: Content -> Content
b_ content =
  Content $ el "b" (getContentString content)

i_ :: Content -> Content
i_ content =
  Content $ el "i" (getContentString content)

instance Semigroup Content where
  (<>) c1 c2 =
    Content (getContentString c1 <> getContentString c2)

instance Monoid Content where
  mempty = Content ""


getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str
  
getContentString :: Content -> String
getContentString content =
  case content of
    Content str -> str

render :: Html -> String
render html =
  case html of
    Html str -> str

instance Semigroup Head where (<>) (Head h1) (Head h2) = Head (h1 <> h2)
instance Monoid Head where mempty = Head ""

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