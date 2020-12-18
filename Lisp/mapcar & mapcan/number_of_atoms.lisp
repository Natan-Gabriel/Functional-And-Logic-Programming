;Write a function that returns the number of atoms in a list, at any level.

;no_of_atoms(l)=1,if l atom
;        =no_of_atoms(l1)+...+no_of_atoms(ln),else
(defun no_of_atoms (l)
    (cond
        ( (atom l) 1)
        (t (apply #'+ (mapcar #'no_of_atoms l) ))
    
    )
)
