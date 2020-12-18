;Input: a list l
;Output: number of sublists having an odd number of atoms on even levels



;fct is the main function 
;fct(l)=0,if l null
;       =0,if l atom
;       =1+fct(l1)+..+fct(ln),if check6(l)
;       =fct(l1)+..+fct(ln),else

(defun fct(l)
    (cond
        ((null l) 0)
        ((atom l) 0)
        ((eq 1 (mod (flatten l 0) 2)) (+ 1 (apply #'+ (mapcar #'fct l))))
        (t (apply #'+ (mapcar #'fct l)))
    )
)


;flatten(l level)=0,if l null
;                 =0,if if l number
;                 =1,if l atom and level%2==0
;                 =0,if l atom
;                 =flatten(l1 level+1)+..+flatten(ln level+1),else

(defun flatten(l level)
    (cond
        ((null l) 0)
        ((numberp l) 0)
        ((and (atom l) (eq (mod level 2) 0)  ) 1  )
        ((atom l) 0)
        (t (apply #'+ (mapcar #'(lambda(a) (flatten a (+ 1 level))  ) l )))
    )
)