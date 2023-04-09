-- Exercise #1 Consider a function safetail that behaves the same way as tail
-- Using: a conditional expression, guarded equations, pattern matching 
safetailConditional xs = if null xs then [] else tail xs

safetailGuarded xs | null xs = []
                   | otherwise = tail xs
safetailPattern []  = []
safetailPattern (_:xs) = xs

-- Exercise #2 Give three possible definitions for the logical or operator 
False || b = b
True || _ = True