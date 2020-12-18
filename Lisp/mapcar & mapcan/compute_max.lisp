;Write a function that returns the maximum of numeric atoms in a list, at any level.

;compute_max(l)=l,if l number
;          =max(compute_max(l1),...,compute_max(ln))
;list must have only numeric atoms
(defun compute_max(l)
    (cond
        ( (atom l) l)
        (t (apply #'max (mapcar #'compute_max l)) )
    )

)