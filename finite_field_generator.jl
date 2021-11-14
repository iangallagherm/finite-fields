using AbstractAlgebra
using Random

function edivision(a, b)
    q = 0
    r = a
    d = degree(b)
    c = leading_coefficient(b)

    while degree(r) >= d
        s = (leading_coefficient(r)÷ c) * polynomial(F, [0, 1])^(degree(r) - d)
        q = q + s
        r = r - s * b
    end 
    return (q, r)
end

function gcd(a,b)
    x = a
    y = b

    while y != 0
        q, r = edivision(x, y)
        x = y
        y = r
    end

    return x
end

# Prime p and degree n to find generator for F_q where q = p^n
p = 3
n = 10 

F = GF(p)

foundGenerator = false
while !foundGenerator
    # Generate random test candidate
    global candidate = polynomial(F, [rand(0:(p-1),n)..., 1])
    global candidate_der = derivative(candidate)
    isGenerator = true

    # Determine if candidate is square free
    if degree(gcd(candidate, candidate_der)) != 0
        continue
    end
    
    # Distinct degree factorization to check if irreducible
    i = 1
    while degree(candidate) >= 2 * i
        x = polynomial(F, [0, 1])
        if degree(gcd(candidate, x^(p^i) - x)) != 0
            isGenerator = false
            break
        end
        i += 1
    end

    if isGenerator
        global foundGenerator = true
    end
end

println("Generator of F_q where q=p^n=",p,"^",n,": ", candidate)
