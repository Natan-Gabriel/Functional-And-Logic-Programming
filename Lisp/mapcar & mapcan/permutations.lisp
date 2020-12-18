;Generates all the permutations of the given list
;E.g.: (permutations '(1 2 3 4)) returns:
;; ((1 2 3 4) (1 2 4 3) (1 3 2 4) (1 3 4 2) (1 4 2 3) (1 4 3 2) (2 1 3 4) (2 1 4 3) (2 3 1 4) (2 3 4 1) (2 4 1 3)
;;  (2 4 3 1) (3 1 2 4) (3 1 4 2) (3 2 1 4) (3 2 4 1) (3 4 1 2) (3 4 2 1) (4 1 2 3) (4 1 3 2) (4 2 1 3) (4 2 3 1)
;;  (4 3 1 2) (4 3 2 1))

(defun permutations(L)
    (cond
        ((null (cdr L)) (list L))
        (t (mapcan #'(lambda (e)
                        (mapcar #'(lambda (p)
                            (cons e p))
    (permutations (remove e L))  )
    ) L ) )
    
    )
) 