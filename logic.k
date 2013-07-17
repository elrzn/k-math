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

/ and:{s:+/x;(0=s)|s=#x}