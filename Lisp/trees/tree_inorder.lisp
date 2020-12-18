;Determine the list of nodes accesed inorder in a tree represented as follows:
; (node no-subtrees list-subtree-1 list-subtree-2 ...)
;E.g.:  (inorder '(A 2 B 0 C 2 D 0 E 0) ) returns (B A D C E)

(defun getLeft(l)
    (COND
        ((null (car l))  '() )
        (t (append (list (caddr l)) (list (cadddr l)) (get1 (cddddr l) (cadddr l))  ) )
    )

)

(defun getRight(l)
    (getRight1 l (append (list 1) (list 2) (getLeft l)))
)

(defun inorder(l)
    (COND
        ((eq (cadr l) 0) (list (car l)))
        ( (eq (cadr l) 1) (append (inorder (getLeft l)) (list (car l))) )
        (t (append (inorder (getLeft l)) (list (car l)) (inorder (getRight l)) ))
    )
)