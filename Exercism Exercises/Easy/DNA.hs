module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right ""

toRNA (x:xs) = parse x >>= (\y -> (y:) <$> toRNA xs)

parse :: Char -> Either Char Char
parse 'A' = Right 'U'
parse 'C' = Right 'G'
parse 'G' = Right 'C'
parse 'T' = Right 'A'
parse x   = Left x