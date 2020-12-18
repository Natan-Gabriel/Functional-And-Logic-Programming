;sort_function sorts a given list
;E.g.: (sort_function '(9 8 7 6 5 4 3 2 1 0)) returns (0 1 2 3 4 5 6 7 8 9)


(defun get_min(list min)
    (cond
        ((and (null list) (not (numberp min))) nil)
        ((null list) min)
        ((not (numberp min)) (get_min (cdr list) (car list) )  )
        ((> (car list) min ) (get_min (cdr list) (car list) ) )
        (t (get_min (cdr list) min )) 
    )
)

(defun remove_min(l min)
    (cond
        ( (null l) l)
        ((eq min (car l) ) (remove_min (cdr l) min) )
        (t (append (list (car l)) (remove_min (cdr l) min) ))

    )

)

(defun sort_function(l)
    (cond
        ( (null l) l)
        (t (append (sort_function (remove_min l (get_min l nil))) (list (get_min l nil) )) )
    
    )

)