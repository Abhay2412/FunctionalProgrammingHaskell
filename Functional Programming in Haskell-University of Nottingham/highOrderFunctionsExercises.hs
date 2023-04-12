-- Exercise 1
take :: Int -> ([a] -> [a]) 
-- Curried functions which are high order functions 

-- Exercise 2 [f x | x <- xs, p x] using map and filter
map f (filter p xs)
-- Range over all of the values in xs which satisfy the property p and then apply the function f