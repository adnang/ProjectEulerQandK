/
###Project Euler###

Multiples of 3 and 5
Problem 1
----------------------------------------------------------------------------
If we list all the natural numbers below 10 that are multiples of 3 
or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
----------------------------------------------------------------------------
\

/## Solution in K3 and K4 ##
k) +/?,/{x*!(-_-1000%x)}'3 5


/## Solution in Q ##
sum distinct raze {x*til(ceiling 1000%x)} each 3 5


/
## Explanation ##

{x*!(-_-1000%x)}  === multiply x by the enumeration from 0 to ceiling of 1000%x. 

{x*!(-_-1000%x)}'3 5 === Apply to 3 and 5 to return their respective multiples less than 1000 
over two vectors. 

Use of ceiling is because using floor for x =3, i.e. 3*!(_1000%3), has a max of 996, but we need 
999, and adding 1 before the floor will result in x=5 maxing out at 1000, when we need 995. Then,

,/ === raze the two resulting vectors into one long vector. 

+/? === sum the distinct values in the result, removing second occurrences of 3 and 5 intersections
\




