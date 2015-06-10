module AccessChanger
       ( convert
       , convertLine
       ) where

convert :: [String] -> [String]
convert program = map (convertLine) program

convertLine :: String -> String
convertLine [] = []
convertLine [x] = [x]
convertLine (x:y:xs)
  | x == '-' && y == '>' = '.':(convertLine xs)
  | x == '/' && y == '/' = (x:y:xs)
  | otherwise = x:(convertLine (y:xs))
