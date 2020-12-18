;main function returns 'T' if the tree is balanced or 'NIL',else
;E.g.:  (main '(A (B) (C (D) (E)))  ) returns 'NIL'

;fct(l)=0,l null
;       =1,if l2 null
;       =fct(l2),fct(l3),if get_depth(l2)=get_depth(l3)
;       =nil,else

(defun fct(l)
    (cond
        ((null l) 0)
        ((null (cadr l)) 1)
        ((eq (get_depth (cadr l)) (get_depth (caddr l)) )  (mapcar #'fct (cdr l) )  )
        (t nil)
    )
)

;get_depth(l)=0,if l null
;            =1,if l2 null
;            =max(get_depth(l1),..,get_depth(ln))
(defun get_depth(l)
    (cond
        ((null l) 0)
        ((null (cadr l)) 1)
        (t (+ 1 (apply #'max (mapcar #'get_depth (cdr l)))))
    )
)
;main(l)=false,if fct(l)==false
;        =true,else
(defun main(l)
    (cond
        ((null (fct l)) nil)
        (t t)
    )
)