;Write a function that returns the number of atoms in a list, at any level.

(defun reverse_list(l)
    (cond
        ( (null l) nil)
        ((atom l) l ) 
        ( (listp (car l)) ( append (reverse_list (cdr l)) (list (reverse_list  (mapcar #'reverse_list  (car l))  ) ) ))   
        (t ( append (reverse_list (cdr l)) (list (car l)) ) )
    )
)