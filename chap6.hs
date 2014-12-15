-- Higher order functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

compWithHundred :: (Num a, Ord a) => a -> Ordering
compWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])
