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
or:{{:[x;x;y]}/x}
or2:{:[(+/x)=0;0;1]}

/ Implication of P and Q, where P is the antecedent and Q is the
/ consequent, should be false only if the antecedent is true and the
/ consequent is false, which results in the weird following truth
/ table:
/   P  Q | P => Q
/   1  1 |    1
/   1  0 |    0
/   0  1 |    1
/   0  0 |    0
/ Example:
/   imp 1 0
/ 0
/   imp 1 1 0
/ 0
/   imp 1 1 1
/ 1
imp:{{:[~x;1;y]}/x}

/ Equivalence of P and Q is basically the conjunction of the
/ implication of P and Q and the implication of Q and P. The outcome
/ should be true if and only if both elements have the same truth
/ value.
/ The reason why we can't use an auxiliary binary function is that
/ applying and/0 0 0 would reduce to and[0;1] and therefore fail.
/ Example:
/   iff 0 1 0
/ 0
/   iff 0 0 0
/ 1
/   iff 1 1 1
/ 1
and:{r:+/{~x=0}/x;:[r=#x;1;~r]}
iff:and
