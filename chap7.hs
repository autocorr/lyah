import qualified Data.Map as M

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs) =
    if key == k
    then Just v
    else findKey key xs

findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey' key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing

-- this is equivalent to `M.lookup`
findKey'' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey'' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty
