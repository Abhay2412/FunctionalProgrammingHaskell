import Data.Binary (Binary(putList))
main :: IO ()
main = do --If needing the main to do multiple things
    print test -- Need to add any print statements into the main
    print logicalValues
    print stringType
quicksort [] = [] --Function's base case 
quicksort (x:xs) = quicksort ys ++ [x] ++ quicksort zs
                    where
                    ys = [a | a <- xs, a <= x]
                    zs = [b | b <- xs, b > x]
test = quicksort [5,9,1,3,2]
logicalValues = quicksort [False, True, True, True, False]
stringType = quicksort "Calgary"