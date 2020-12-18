;Write a function that substitutes an element eo with the element en in a list at all its levels.

;replace_elem(l,eo,en)=en,if l=e0
;            =l,if l atom
;            =replace_elem(l1,eo,en)U...U replace_elem(ln,eo,en),else

(defun replace_element(l eo en)
    (cond
        ( (eq l eo) en )
        ( (atom l)   l )
        (t  (mapcar #'(lambda (a) (replace_elem a eo en)) l) )
    )
)
