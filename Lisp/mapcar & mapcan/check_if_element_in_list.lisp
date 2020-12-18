;Write a function to check if an atom is member of a list (the list is non-liniar)

;check(l,elem)=(t),if l atom and l=elem
;          =(),l atom
;          =check(l1,elem) U...U check(ln,elem),else


(defun check(l elem)
    (cond
        ( (and (atom l) (eq l elem)) (list t))
        ( (atom l) '())
        (t  (mapcan #'(lambda (a) (check a elem) ) l)   )
    )
)