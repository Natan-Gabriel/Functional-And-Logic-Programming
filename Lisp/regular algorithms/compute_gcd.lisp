;returns the gcd of a linear list
;E.g.: (compute_gcd '(14 12 100 98)) returns 2

(defun compute_gcd(l)
    (cond
        ((null l) 1)
        ((null (cdr l)) (car l))
        (t (gcdFor2 (car l) (compute_gcd (cdr l)) ))
    )
)

(defun gcdFor2(a b)
    (cond
        ((eq b 0) a)
        (t (gcdFor2 b (mod a b) ))
    )
)