-- problem 1
-- find the last element of a list
last' :: [a] -> a
last' = head . reverse

-- problem 2
-- find the penultimate element of a list
penult :: [a] -> a
penult = last . init

-- problem 3
-- find the k'th element of a list, 1-based indexing.
elemAt :: [a] -> Int -> a
elemAt x k = x !! (k - 1)

-- problem 4
-- find the number of elements in a list
length' :: (Integral b) => [a] -> b
length' = foldl (\n _ -> n + 1) 0

-- problem 5
-- reverse a list
reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

-- problem 6
-- find out whether a list is a palindrome.
ispal :: [a] -> [a]
ispal x = x == reverse(x)

-- problem 7
-- flatten a nested structure
data NestedList a = Elem a | List [NestedList a]

