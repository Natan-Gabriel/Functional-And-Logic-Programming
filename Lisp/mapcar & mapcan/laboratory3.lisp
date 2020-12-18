;5. Write a function that computes the sum of even numbers and then
;decrease the sum of odd numbers,at any level of a list.

;(i) (list)
;main(l)=l,if l is number and l%2==0
;       =-l,if l is number and l%2==1
;       =0,if l is atom
;       =main(l1)+main(l2)+...+main(ln),else
(defun main(lst)
  (cond
    ( (and (numberp lst) ( eq (mod lst 2) 0)) lst)
    ( (and (numberp lst) (eq (mod lst 2) 1) ) (- 0 lst))
    ( (atom lst) 0)
    (T (apply #'+  (mapcar #'main lst)))
  )
)

;We have also a 2nd version: compute sum of even numbers and then sum of the odd numbers,and finally substract them

(defun sum_of_evens(lst)
  (cond
    ( (and (numberp lst) ( eq (mod lst 2) 0)) lst)
    ( (atom lst) 0)
    (T (apply #'+  (mapcar #'sum_of_evens lst)))
  )
)

(defun sum_of_odds(lst)
  (cond
    ( (and (numberp lst) ( eq (mod lst 2) 1)) lst)
    ( (atom lst) 0)
    (T (apply #'+  (mapcar #'sum_of_odds lst)))
  )
)
(defun evens_minus_odds(lst) 
  (- (sum_of_evens lst) (sum_of_odds lst))
)