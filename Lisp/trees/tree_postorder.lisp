
;Determine the list of nodes accesed in postorder in a tree represented as follows:
; (node (list-subtree-1) (list-subtree-2) ...) 
;E.g.: (postorder '(A (B) (C (D) (E)))  ) returns (B D E C A)

;postorder(tree)=nil,if tree null
;               =tree1,if cadr null
;               =postorder(tree2) U postorder(tree3)U tree1,else
(defun postorder(tree)
    (cond
        ((null tree) nil)
        ((null (cadr tree)) (list (car tree)))
        (t (append (mapcan #'postorder (cdr tree))  (list (car tree)))   )
    )
)
