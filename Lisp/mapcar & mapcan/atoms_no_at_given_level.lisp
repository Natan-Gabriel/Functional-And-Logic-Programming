;main returns the number of atoms at the given level
; (main '(A (B) (C (D) (E))) 2 ) returns 2

;fct(l k depth)=0,if l null
;              =1,if l atom and depth==k
;              =0,if l atom
;              =fct(l1,k,depth+1)+..+fct(ln,k,depth+1) 
(defun fct(l k depth)
    (cond
        ((null l) 0)
        ((and (atom l) (eq depth k))   1 )
        ((atom l) 0)
        (t (apply #'+ (mapcar #'(lambda(a) (fct a k (+ 1 depth)) ) l )))
    )
)
;main(l,k)=fct(l,k,-1)
(defun main(l k)
    (fct l k -1)
)