/ {1,0} is the set of truth values and corresponds to {t,f}
t:1;f:0

/ The negation of P, not P. It is true just in case P is false.
/ Example:
/   not 1 1 0 1
/ 0 0 1 0
/   not not t,t,f,t
/ 1 1 0 1
not:{~x}

/ Conjunction of x: True if all elements are true.
/ In K, every number that does not equal zero returns a truthy value,
/ meaning that while 2=2 returns 1, conj 2 2 2 should have the same
/ treatment as conj 1 1 1.
/ Example:
/   conj 1 1 0
/ 0
/   conj 1 2 3
/ 1
conj:{*/{~x=0}/x}

/ Disjunction of x: True as long as there is a true element.
/   P Q | P v Q
/   t t |   t
/   t f |   t
/   f t |   t
/   f f |   f
/ The disjunction is basically the good old 'or' in most programming
/ languages.
/ Example:
/   or 1 1 1
/ 1
/   or 1 0 1
/ 1
/   or 0 0 0
/ 0
or:{:[(+/x)=0;0;1]}
