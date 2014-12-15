-- Recursion

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x : replicate' (n-1) x
-- pattern matching for different forms of input, and guards for
-- boolean tests

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs
-- take' 3 [1..10] <=> 1:2:3:[] <=> [1,2,3]

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
-- take the head and recursively concat it onto the end until an empty list

repeat' :: a -> [a]
repeat' x = x : repeat' x
-- repeat' 3 => 3:(repeat' 3) => 3:3:(repeat' 3) ...
-- infinite recursion, use with something like `take`

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys
-- pop off the head in a tuple then recurse until one is empty

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = elem' a xs
-- run thru items and return true if found

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let ss = quicksort [a | a <- xs, a <= x]
        bs = quicksort [a | a <- xs, a > x]
    in ss ++ [x] ++ bs
-- use first element as pivot, filter into two lists bigger and smaller
-- then call quicksort on the sublists, where the head of the sublist
-- is used as the pivot, recurse until empty lists where the pattern
-- matching returns an empty list.

-- general pattern of recursion:
-- * define edge case
-- * define behaviour between one element and the rest
-- common edge cases: zero, empty list, childless node
