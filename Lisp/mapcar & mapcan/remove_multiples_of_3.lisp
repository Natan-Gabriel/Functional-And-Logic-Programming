;this function removes multiples of 3 from the list l

;fct(l)=(()),if l empty
;             =(),if l atom and l%3==0
;             =( l ),if l atom
;             =( fct(l1) U...U fct(ln) ),if l list
;(l-given list)

(defun fct(l)
    (cond
        ((null l)  (list nil))
        ((and (numberp l)  (eq 0 (mod l 3) ) )  nil )
        ((atom l )  (list l) )
        (t (list (mapcan #'fct l))   )
    )

)