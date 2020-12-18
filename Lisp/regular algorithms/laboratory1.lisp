;a) Write a function to test whether a list is linear.
;b) Write a function to replace the first occurence of an element E in a given list with an other element
;O.
;c) Write a function to replace each sublist of a list with its last element.
 ;A sublist is an element from the first level, which is a list.
 ;Example: (a (b c) (d (e (f)))) ==> (a c (e (f))) ==> (a c (f)) ==> (a c f)
; (a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f)
;d) Write a function to merge two sorted lists without keeping double values.

;test(l1...ln)=true,if l=[]
;             =false,if l1 is a list
;             =test(l2...ln),else
;repl(l1...ln,e,o)=[],if l=[]
;                 =o U l2...ln,if l1=e
;                 =l1 U repl(l2...ln,e,o),else

;(i) (list)
(defun test(list)
    (cond
        ((null list) t)
        ( (listp (car list)) nil )
        (t (test (cdr list) ) )

    )
)

;(i) (list int int)
(defun repl (list e o)
    (cond
        ( (null list ) '() )
        ( (equal (car list) e ) ( cons o (cdr list) ) )
        (t (cons (car list) (repl (cdr list) e o )))
    
    )


)
;getLast(l1...ln)=getLast(l2....ln),if [l2....] not empty
;                =ln,else
;lastElem(l1....ln)=lastElem(ln),if l1...ln is list
;                  =l1,else(which is equal to ln)
;rep2(l1...ln)=[],if l=[]
;            =lastElem(l1) U rep(l2...ln),if l1 is list
;            =l1 Urep(l2...ln),else
;all have (i) and (list-is a List) flow model 

(defun getLast1(list)
    (cond
        ( (cdr list)  (getLast1 (cdr list)) )
        (t (car list))

    )
)

(defun lastElem1(list)
    (cond
        ( (listp list)  (lastElem1 (getLast1 list)) )
        (t list)

    )
)

(defun rep3(list)
    (cond
        ((null list) '())
        ( (listp (car list) )  ( cons (lastElem1 (car list))  (rep3 (cdr list) ) )  )
        (t (    cons (car list)  (rep3 (cdr list) )    ) )

    )
)

;merge1(l1....ln,p1...pm)=l1...ln,p=[]
;                        =p1...pm,l=[]
;                        =l1 U merge1(l2....ln,p1...pm),l1<p1
;                        =p1 U merge1(l1...ln,p2...pm),l1>p1
;                        =l1 U merge1(l2...ln,p2...pm),l1=p1

;(i,i) (List,List)

(defun merge1(list1 list2)
    (cond
        ( (null list1) list2)
        ( (null list2) list1)
        ( (< (car list1) (car list2) )  (cons  (car list1)  (merge1 (cdr list1) list2 ) )  )
        ( (> (car list1) (car list2) ) (cons (car list2) (merge1  list1 (cdr list2)  ) )   )
        ( t (cons (car list1) (merge1 (cdr list1) (cdr list2) ) ) )

    )

)
