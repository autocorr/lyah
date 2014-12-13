doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100 then x else 2*x
doubleSmallNumber' x = (if x > 100 then x else 2*x) + 1

boomBangs xs = [if x < 10 then "boom" else "bang" | x <- xs, odd x]
length' xs = sum [1 | _ <- xs]
