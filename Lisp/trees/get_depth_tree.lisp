;compute the depth of a tree
;E.g: (get_depth '(a (b) (c (d) (e)) )) returns 3

;compute_max(l max)=max,if l null
;           =compute_max(l2..ln,l1),if l1 numberp and max null
;           =compute_max(l2..ln,l1),if l1 numberp and l1>max
;           =compute_max(l2..ln,max),else
;depth(l)=0,if l null
;        =1,if l2 null
;        =1+max(depth(l2),..,depth(ln)),else

(defun get_depth(l)
    (cond
        ((null l) 0)
        ((null (cadr l)) 1)
        (t (+ 1 (compute_max (mapcar #'get_depth (cdr l)) nil)  ))
    )
)

(defun compute_max(l max)
    (cond
        ((null l) max)
        ((and (numberp (car l)) (null max) ) (compute_max (cdr l) (car l)) )
        ((and (numberp (car l)) (> (car l) max)) (compute_max (cdr l) (car l) ) )
        (t (compute_max (cdr l) max))
    )
)
