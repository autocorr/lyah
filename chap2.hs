-- This is a comment
--rm_up :: [Char] -> [Char]
rmUp :: String -> String
rmUp st = [ c | c <- st, elem c ['A'..'Z'] ]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

