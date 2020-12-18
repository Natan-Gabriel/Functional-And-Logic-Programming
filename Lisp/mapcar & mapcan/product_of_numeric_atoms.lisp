;Write a function that returns the product of numeric atoms in a list, at any level.

;product(l)=l,if l number
;          =1,if l atom
;          =product(l1)*...product(ln),else
(defun product(l)
    (cond
        ( (numberp l) l )
        ( (atom l) 1)
        (t (apply #'* (mapcar #'(lambda(a) (product a)) l) ) )
    )
)