;Input: list l
;Output: number of sublists having an even minimum for its odd levels




;fct(l)=0,if l null
;       =0,if l atom
;       =1+fct(l1)+..+fct(ln),if check(l)
;       =fct(l1)+..+fct(ln)
;(l-given list)
(defun fct(l)
    (cond
        ((null l) 0)
        ((atom l) 0)
        ((and (numberp (compute_min (check l 0) nil)) (eq 0 (mod (compute_min (check l 0) nil) 2))) (+ 1 (apply #'+ (mapcar #'fct l ))))
        (t (apply #'+ (mapcar #'fct l )) )
    )
)
;(l-given list,level-curr level:int)
;check(l level)=nil,if l null
;               =l,if level%2==1 and  l number
;               =nil,l atom
;               =check(l1 level+1)U..U check(ln level+1),else

(defun check(l level)
    (cond
        ((null l) nil)
        ((and (numberp l) (eq 1 (mod level 2))) (list l))
        ((atom l) nil)
        (t  (mapcan #'(lambda(a) (check a (+ 1 level))) l ) )
    )
)



;(l-given list:linear list,m-curr minim:int)
;compute_min(l1..ln,m)=nil,if l null and m null
;        =m,if l null
;        =min(l2...ln,l1),if min null
;        =compute_min(l2.ln,l1),if l1<m
;        =compute_min(l2..ln,m),else

(defun compute_min(l m)
    (cond
        ((and (null l) (null m)) nil)
        ((null l) m)
        ((null m)  (compute_min (cdr l) (car l)))
        ((< (car l) m)  (compute_min (cdr l) (car l)))
        (t (compute_min (cdr l) m))
    )
)


(defun main(l)
    (cond
        ((and (numberp (compute_min (check l 0) nil)) (eq 0 (mod (compute_min (check l 0) nil) 2))) (- (fct l) 1) )
        (t (fct l))
    )
)
