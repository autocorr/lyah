lucky :: (Integral a) => a -> String
lucky 7 = "lucky number seven"
lucky x = "sorry"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Patten match with x:xs
-- [a+b+c | a:b:c:xs <- [[1..5], [1..6], [1..7]]]

head' :: [a] -> a
head' [] = error "List empty"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "Empty list"
tell (x:[]) = "One elem: " ++ show x
tell (x:y:[]) = "Two elem: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "Long list. First two: " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- as pattern
capital :: String -> String
capital "" = "Empty"
capital all@(x:xs) = "Head of " ++ all ++ " is " ++ [x]

-- guards
bmiTell :: (RealFloat a) => a -> String
bmiTell b  -- note no `=` here
    | b <= 18.5 = "underweight"
    | b <= 25.0 = "normal"
    | b <= 30.0 = "fat"
    | otherwise = "whale"  -- otherwise equivalent to true

bmi :: (RealFloat a) => a -> a -> a
bmi w h = w / h^2

max' :: (Ord a) => a -> a -> a
-- can be written inline
-- max' a b | a > b = a | otherwise = b
max' a b
    | a > b     = a
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

-- can also bind function to a name in the guard with `where`
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
    | bmi <= skinny = "underweight"
    | bmi <= normal = "normal"
    | bmi <= fat    = "fat"
    | otherwise     = "whale"
    where bmi = weight / height^2  -- weight, height types already defined
          (skinny, normal, fat) = (18.5, 25.0, 30.0)  -- type inferred

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height^2

-- can use let to bind names to values
-- useful for definining repeated intermediate values
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r^2
    in  sideArea + 2 * topArea

-- with let instead
calcBmis' :: (RealFloat a) => [(a, a)] -> [a]
-- can also add predicate to the end to filter
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h^2, bmi >= 25.0]

-- case
descList :: [a] -> String
descList xs = "List is" ++ case xs of [] -> "empty"
                                      [x] -> "singleton"
                                      xs -> "longer"
-- which is equivalent to
descList' :: [a] -> String
descList' xs = "List is " ++ what xs
    where what [] = "empty"
          what [x] = "singleton"
          what xs = "longer"
