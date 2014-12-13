Commands
--------
head - first element
tail - everything except first element
last - last element
init - everything except last element
length -
null - is null?
reverse -
take - take number of elements
drop - drop how many elements
maximum -
minimum -
sum -
product -
elem - "foo is in list" -> "elem foo list" <-> "foo `elem` list"

ranges - [1..20], for steps [first,second..max] <-> [1,3..10] -> [1,3,5,7,9]
cycle - lazy eval repeat
replicate - ~repeat

List Comps
----------
list comprehensions : [expr(var) | var <- items, condition(var)]
can also have more than one condition, seperated by commas
can also use more than one set of items, with more arrows
_ can be used as a dummy var
can nest comprehensions : [[comp1] | etc]

Tuples
------
fst - return first
snd - return second
zip - zip two lists into tuple, works for lazy eval too
