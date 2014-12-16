-- Higher order functions

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

compWithHundred :: (Num a, Ord a) => a -> Ordering
compWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- note type declaration, first part of the chain is a function that takes type
-- `a` and returns type `a`
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
-- (applyTwice divideByTen) 1000 -> 10
-- applyTwice (+3) 10
-- applyTwice (++"foo") "bar"
-- applyTwice ("foo"++) "bar"
-- applyTwice (multThree 2 2) 9
-- applyTwice (3:) [1]

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- two param map
-- zipWith' (+) [1..4] [1..4]
-- zipWith' (max) [1..4] [2..5]
-- zipWith' (++) ["foo", "bar", "baz"] ["fighters", "hoppers", "aldrin"]
-- zipWith' (*) (replicate 5 2) [1..]

flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y

-- maps and filters
--
-- maps:
-- maps are a useful alternative to list comprehensions where you're
-- apply a function to a list of elements, or nested comprehensions,
-- where the number of brackets and indentation can be tricky.
-- cf.
-- map (+3) [1..5]
-- [x+3 | x <- [1..5]]

-- find the largest number under 100,000 that's divisible 3829
largDiv :: (Integral a) => a
largDiv = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n : chain (div n 2)
    | odd n  = n : chain (3*n + 1)

nchains :: Int
nchains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

-- lambdas
-- anonymous functions
-- lambdas are expressions and can be passed
nchains' :: Int
nchains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- don't go overboard with lambdas, check if currying or partial application
-- makes it necessary
-- cf.
-- map (+3) [1..5]
-- map (\x -> x + 3) [1..5]

-- can also pattern match in lambdas, but will throw a runtime error if
-- doesn't match.
-- map (\(a,b) -> a + b) (zip [1..5] [1..5])

-- alternative to multi-parameter syntax
addThree :: (Num a) => a -> a -> a -> a
addThree = \x -> \y -> \z -> x + y + z

-- lambda makes it obvious that something returns a function
flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f = \x y -> f y x

-- folds
sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
--sum' xs = foldl (\acc x -> acc + x) 0 xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- foldl, accumulator on the left, eats up from the left
-- foldr, accumulator on the right, eats up from the right
-- note that the accumulator arguement to foldl/foldr is still on the left
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

-- folds can be used to implement any function where you traverse a list once,
-- element by element, and then return something based on that. whenever you
-- want to traverse a list to return something, chances are you want a fold.
maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- whereas folds return the finished product, scan returns the intermediate
-- product at each step.
-- scanl (+) 0 [1..3]  ->  [0,1,3,6]
-- foldl (+) 0 [1..3]  ->  6

-- how many elements does it take for the sum of the roots of all natural
-- numbers to exceed 1000?
sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt[1..]))) + 1
-- -> 131

-- function application with $
-- using spaces is left associative
-- using $ is right associative
-- sum (map sqrt [1..130])
-- sum $ map sqrt [1..130]
-- sum (filter  (> 10) (map (*2) [1..10]))
-- sum $ filter (> 10) $ map (*2) [2..10]

(|>) :: a -> (a -> b) -> b
x |> f = f x

-- function composition
-- f . g = f (g x)
-- can be useful to remove nestings of functions
-- cf.
-- map (\x -> negate (abs x)) [-1,2,-3]
-- map (negate . abs) [-1,2,-3]
-- or
-- map (negate . sum . tail) [[1..5], [3..6], [1..7]]

-- point free style
-- using currying to omit unnec. temp variables
-- cf.
-- sum' xs = foldl (+) 0 xs
-- sum' = foldl (+) 0
--     ^ point free
-- or
-- fn x = ceiling (negate (tan (cos (max 50 x))))
-- fn = ceiling . negate . tan . cos . max 50

-- function composition and readability
-- point free:
oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]
-- more readable with let bindings:
oddSquareSum' :: Integer
oddSquareSum' =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<10000) oddSquares
    in  sum belowLimit

