;main returns the depth of a node in a tree
;E.g.: (main '(A (B) (C (D) (E)))  'D ) returns 2


;get_depth(tree node)=nil,if l null
;                    =0,if tree1==node
;                    =1 U get_depth(treeP node),when get_depth(treeP node) doesn't yield false

(defun get_depth (tree leaf)
  (cond 
    ((null tree) nil)
    ((eq (car tree) leaf) (list 0))
    (t  (mapcan (lambda (subtree)
                     
                       (when (get_depth subtree leaf) (append (list 1) (get_depth subtree leaf))))
                   (cdr tree)))
  )
)


(defun main(tree leaf)
    (cond
        ( (eq nil (get_depth tree leaf)) nil  )
        (t (apply #'+ (get_depth tree leaf) )  )
    )
)