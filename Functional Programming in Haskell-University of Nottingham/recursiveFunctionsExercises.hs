-- Exercise 1
andLogical :: [Bool] -> Bool
andLogical [] = True
andLogical (x:xs) = x (&&) andLogical xs

concat :: [[a]] -> [a]
concat [] = []
concat (xs:xss) = xs (++) concat xss

replicate :: Int -> a -> [a]
replicate 0 x = []
replicate n x = x : replicate(n - 1) x

(!!) :: [a] -> Int -> a
(x : xs) !! 0 = x
(x : xs) !! n = xs !! (n - 1)

-- Exercise 2
merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x <= y then x : merge xs (y:ys) else y:merge(x:xs) ys

