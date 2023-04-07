-- Exercise #1 - What are the types of the following values?

-- ['a', 'b', 'c'] :: [Char]
-- ('a', 'b', 'c') :: (Char, Char, Char)
-- [(False, '0'), (True, '1')] :: [(Bool, Char)]
-- ([False, True], ['0', '1']) :: ([Bool], [Char])
-- [tail, init, reverse] :: [[a] -> [a]],  all take a list and return a list

-- Exercise #2 - What are the types of the following functions?

--  second xs = head (tail xs) :: [a] -> a
--  swap (x, y) = (y, x) :: (a, b) -> (b, a)
--  pair x y = (x, y) :: a -> b -> (a, b)
--  double x = x*2 :: a -> a
--  palindrome xs = reverse xs == xs :: [a] -> Bool
--  twice f x = f (f x) :: (a, (a -> b)) -> b