;Input: l-list,k-level
;Output: a list in which each element from level k in l is replaced by 0


;fct(l,k,level)=0,if l atom and level==k
;               =l,if l atom
;               =fct(l1,k,level+1)U...Ufct(ln,k,level+1)  ,if l list
;(l-given list,k-given level:integer,level-curr level:int)
(defun fct(l k level)
    (cond
        ((null l) nil)
        ((and (atom l) (eq level k))  0 )
        ((atom l) l )
        (t (mapcar #'(lambda(a)  (fct a k (+ level 1)) )  l ) )
    )
)


;main(l,k)=fct(l,k,0),because the level of root is 1 ,we init curr level with 0
;(l-given list,k-given level:int)
(defun main(l k)
    (fct l k 0)
)