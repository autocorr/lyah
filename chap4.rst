Pattern Matching
----------------
Functions can match the arguements to implementation of a function.  It can
also be similar to argument unpacking in python where arguments can be matched
from tuples or lists.

An *as pattern* can bind a variable name to a collection of other variables,
such as ``all@(x:xs)``, ``all`` becomes a variable for the entire list, and
``x`` for the head, and ``xs`` for the tail.

*Guards* test the truth value of a series of expressions. They can be helpful
for case-statements or as a input validation.

`where` is a syntactic structure but `let...in` is an expression, and can be
used anywhere an expresion can.

Case statements can be handled with pattern matching or with the `case...of`
syntax. Nice alternative because you don't have to repeat the function name.
