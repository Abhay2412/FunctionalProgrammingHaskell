double x = x + x
quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns

-- Exercise #2 
-- Original Program
-- N = a 'div' length xs 
--     where
--         a = 10
--        xs = [1,2,3,4,5]
-- Fixed Program after Syntax mistakes
n = a `div` length xs
    where
    a = 10
    xs = [1,2,3,4,5]

-- Exercise #3 
-- last [1, 2, 3, 4] -> should return 4

-- Method 1: Use the length of the list 
last1 xs = xs !! (length xs - 1)

-- Exercise #4 
-- Method 2: Reverse the list and head from list
last2 xs = head(reverse xs)

-- Exercise #5
-- init [1, 2, 3, 4] -> should remove the last element from a list 
init1 xs = take (length xs - 1) xs

init2 xs = reverse(tail(reverse xs))