;Input: list l
;Output: number of sublists for which the last element is a non-numeric atom


;fct(l)=0,if l is null
;       =0,if l atom
;       =1+fct(l1)+..+fct(ln),if l list and check(l)==true
;       =fct(l1)+..+fct(ln),if l list
(defun fct(l)
    (cond
        ((null l) 0)
        ((atom l) 0)
        ((and (list l) (check l) )  (+ 1 (apply #'+  (mapcar #'fct l )) ) )
        (t (apply #'+  (mapcar #'fct l )) )
    )
)


;check(l)=checkLast(l1),where l1=flatten(l) 
;(l-list)
(defun check(l)
    (checkLast (flatten l) )
)

;flatten function liniarize a list. Eg.: (((A B) C) (D E)) --> (A B C D E)

;flatten(l)=(),if l=()
;           =(a),if a atom 
;           =flatten(l1)U..U flatten(ln),else
;(l-given list)
(defun flatten(l)
    (cond
    ( (null l)  nil)
    ((atom l ) (list l) )
    (t (mapcan #'flatten l))
    )
)

; checkLast  returns true if last element of the list is not a number and nil,else

;checkLast(l)=nil,if l is null
;            =nil,if cdr l=null and l1 is number
;            =t,if cdr l=null
;            =checkLast(l2...ln),else
;(l-given list)
(defun checkLast(l)
    (cond
        ((null l) nil)
        (( and (null (cdr l)) (numberp (car l)) ) nil)
        ((null (cdr l))  t)
        (t (checkLast (cdr l)))
    )
)

;main(l)=fct(l)-1
;(l-given list)
(defun main(l)
    (cond
        ((check l)  (- (fct l) 1) )
        (t (fct l))
    )
)