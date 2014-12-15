-- Recursion
-- maximum
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

-- replicate
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x : replicate' (n-1) x
-- pattern matching for different forms of input, and guards for
-- boolean tests

-- take
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs
-- take' 3 [1..10] <=> 1:2:3:[] <=> [1,2,3]

-- reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
-- take the head and recursively concat it onto the end until an empty list
