-- Exercise 1
html_ content = "<html>" <> content <> "</html>" 
body_ content = "<body>" <> content <> "</body>"
-- Exercise 2
-- Exercise 3
head_ content = "<head>" <> content <> "</head>" 
title_ content = "<title>" <> content <> "</title>"
-- Exercise 4
makeHtml titleString bodyContent = html_ (head_ (title_ titleString) <> body_ bodyContent)
myHtml = makeHtml "My page title" "My page content"
main = putStrLn myHtml