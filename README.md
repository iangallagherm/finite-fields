# Finite Field Generator
You can find a generating polynomial for a finite field F_q where q=p^n by
- Selecting a random polynomial of degree n in F_p
- Checking that it is square free
- If it is, then check that it's Distince Degree Factorization is trivial
- If not, go back to step 1

This process is relatively quick due to the relative density of irreducible polynomials of degree n over F_p.

Implemented in Julia. Currently just a poorly optimized script and not guaranteed that it works. 
This is not new, and there are existing Julia libraries that do this to implement Finite Fields of degree larger than 1.

Worked on this because I was interesting how computational mathematics programs support arithmetic in arbitrary finite fields, and also to learn a little bit about Julia.

# References
[1] https://en.wikipedia.org/wiki/Factorization_of_polynomials_over_finite_fields

[2] https://www.maa.org/sites/default/files/Chebolu11739.pdf
