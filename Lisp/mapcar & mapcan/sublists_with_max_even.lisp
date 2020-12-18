;Input: list l
;Output: number of sublists having the maximum number an even number


;fct(l)=0,if l is null
;       =0,if l is atom
;       =1+fct(l1)+..+fct(ln),if l is list and check(l)
;       =fct(l1)+..+fct(ln),if l list

(defun fct(l)
    (cond
        ((null l) 0)
        ((atom l) 0)
        ((and (list l)   (check (flatten l 0) (car (flatten l 0))) ) (+ 1 (apply #'+ (mapcar #'fct l))) )
        (t (apply #'+ (mapcar #'fct l)) )
    )
)
;flatten(l,level)=(),if l is null
;                 =(l),if l number and level%2==1
;                 =(),if l atom
;                 =flatten(l1,level+1)U...Uflatten(ln,level+1),else

;(l-list,level-int)
(defun flatten(l level)
    (cond
        ((null l) nil)
        ((and (numberp l)  (eq 1 (mod level 2))  ) (list l))
        ((atom l)  nil)
        (t (mapcan #'(lambda(a) (flatten a (+ 1 level)) ) l))
    )
)
;check(l max)=false,if l null and max null
;             =max%2==0,if l empty
;             =check(l2..ln,max),if l1<max
;             =check(l2...ln,l1),else

;(l-list,max-int)
(defun check(l max)
    (cond
        ((and (null l) (null max) ) nil )
        ((null l) (eq 0 (mod max 2)))
        ( (< (car l) max ) (check (cdr l) max )  )
        (t (check (cdr l) (car l) ) )
    )
)
;main(l)=fct(l)-1,if check(flatten(l,0),l1),where flatten(l,0)=(l1,..,ln)
;       =fct(l),else
;(l-given list)
(defun main(l)
    (cond
        ( (check (flatten l 0) (car (flatten l 0))) (- (fct l) 1) )
        (t (fct l))
    )

)

;(a (b 2) (1 c 4) ( 1 (6 f)) (((g) 4) 6) )