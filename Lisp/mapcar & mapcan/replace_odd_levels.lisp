;Input: l-list,e-atom
;Output: a list in which each element from odd levels in l is replaced by e

;replace_fct(l,e,level)=e,if l atom and level%2==1
;                =l,if l atom
;                =replace_fct(l1,e,level+1) U...U replace_fct(ln,e,level+1),if l list

;(l-given list,e-new element,level-level of current node)
(defun replace_fct(l e level)
    (cond
        ((null l) nil)
        ((and (atom l) (eq 1 (mod level 2))  )  e  )
        ((atom l) l)
        (t (mapcar #'(lambda(a)  (replace_fct a e (+ level 1) )  )    l)   )
    
    )

)

;main(l e)=replace_fct(l e -1),because first level is 0 ,we init the level with -1
;(l-given element,e-new element)
(defun main(l e)
    (replace_fct l e -1)
)