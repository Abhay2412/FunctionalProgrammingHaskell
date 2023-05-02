module Bob (responseFor) where
import Data.Char 
responseFor :: String -> String
responseFor input
  | isSilence input = "Fine. Be that way!"
  | isYellingQuestion input = "Calm down, I know what I'm doing!"
  | isYelling input = "Whoa, chill out!"
  | isQuestion input = "Sure."
  | otherwise = "Whatever."
  where
    isSilence = all isSpace
    isYellingQuestion input = isYelling input && isQuestion input
    isYelling input = (not . null) input && (all isUpper input || (any isUpper input && not (any isLower input)))
    isQuestion input = last (trimInput input) == '?'
    trimInput = reverse . dropWhile isSpace . reverse