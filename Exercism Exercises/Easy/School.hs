module School (School, add, empty, grade, sorted) where
import Data.Maybe
import Data.List
data School = School [(Int, [String])]
add :: Int -> String -> School -> School
add gradeNum student (School school) = 
  let thisGrade = lookup gradeNum school
      thisGrade' = fromMaybe (gradeNum, [student]) $ (gradeNum,) . (++ [student]) <$> thisGrade
      schoolWithoutThisGrade = filter ((/= gradeNum) . fst) school
  in School (thisGrade' : schoolWithoutThisGrade)
empty :: School
empty = School []
grade :: Int -> School -> [String]
grade gradeNum (School school) = fromMaybe [] (lookup gradeNum school)
sorted :: School -> [(Int, [String])]
sorted (School school) = map (\(grd, names) -> (grd, sort names)) $ sortOn fst school