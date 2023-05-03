module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concat [[i * f | i <- [1..(limit `div` f)], i * f < limit] | f <- factors, f > 0]