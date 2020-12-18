;returns the path_version_2 to a leaf in a tree
;E.g.:  (path '(1 (2) (3 (4) (5))) 5 ) returns (1 3 5)


(defun path (tree leaf)
  (cond 
    ((null tree) nil)
    ((eq (car tree) leaf) (list leaf))
    (t (mapcan #'(lambda (subtree)
                     
                       (when (path subtree leaf) (cons (car tree) (path subtree leaf))))
                   (cdr tree)))
  )
)



;now an alternative version



;path_version_2(tree leaf)=nil,if tree null
;               =leaf,if l1=leaf
;               =l1 U path_version_2(subtreeP,leaf),when path_version_2(subtreeP,leaf) doesn't yield false 

(defun path_version_2 (tree leaf)
  (cond 
    ((null tree) nil)
    ((eq (car tree) leaf) (list leaf))
    (t (mapcan #'(lambda (subtree)
                     
                       (if (> (contains subtree leaf) 0) (cons (car tree) (path_version_2 subtree leaf))))
                   (cdr tree)))
  )
)

;contains(l,e)=0,if l null
;              =1,if l atom and l==e
;              =0,if l atom
;              =contains(l1,e)+...contains(ln,e) 
(defun contains(l e)
    (cond
        ((null l) 0)
        ((and (atom l) (eq l e)) 1)
        ((atom l) 0)
        (t (apply #'+ (mapcar #'(lambda(a) (contains a e))  l )))
    )
)

