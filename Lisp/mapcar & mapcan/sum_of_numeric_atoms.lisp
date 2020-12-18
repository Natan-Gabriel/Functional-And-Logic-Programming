;Write a function that returns the sum of numeric atoms in a list, at any level

;sum(l)=l,if l number
;      =0,if l atom
;      =sum(l1)+...+sum(ln),else 

(defun sum(l)
    (cond
        ((and (atom l) (numberp l))  l  )
        ((atom l) 0)
        (t (apply #'+ (mapcar #'sum l) ))
    
    )

)