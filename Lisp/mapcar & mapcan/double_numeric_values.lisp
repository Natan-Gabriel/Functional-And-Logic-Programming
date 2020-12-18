;For each numeric value in the given list double that value

;double(l)=2*l,if l is number
;         =l,if l atom
;         =double(l1)U...Udouble(ln)

(defun double(l)
    (cond
        ( (numberp l) (* l 2) )
        ((atom l) l)
        ( t (mapcar #'double l) )

    )
)