 ;Return the level (depth) of a node in a tree of type (1). 
 ;The level of the root element is 0


 ;(atom int list list) (i,i,i,i)
 ;getDepth(node,depth,l1...ln,v1...vm)=false,if l empty
 ;                                    =depth,if l1=node
 ;                                    =getDepth(node,depth-1,l1!,l2...ln,v2...vm),if l1=0 and v1=1
 ;                                    =getDepth(node,depth,l2...ln,(v1-1) U v2...vm),if l1=0 and v1>1(v1 is number)
 ;                                    =getDepth(node,depth+1,l2...ln,l1 U v1....vm),if l1 is number==l1>0
 ;                                    =getDepth(node,depth,l2...ln,vector),else==if l1 is non-numeric atom
 ;in vector we have a stack(left-sided) of all uncompleted trees
 ;(getDepthWrapper 'C '(A 2 B 2 D 2 H 0 I 0 E 2 J 0 K 0 C 0) )
 

(DEFUN getDepth(node depth list vector)
    (COND
        ( (NULL list) NIL)
        ( (EQ (CAR list) node ) depth )
        ( (and (EQ (CAR list) 0 ) (eq (car vector) 1)) (getDepth node (- depth 1) list (cdr vector) ) )
        ( (and (EQ (CAR list) 0 )  (numberp (car vector) )) (getDepth node depth (CDR list) (cons (- (car vector) 1) (cdr vector)) ) )
        ( (NUMBERP (CAR list) ) (getDepth node (+ depth 1) (CDR list) (cons (car list) vector) ) )
        (t (getDepth node depth (CDR list) vector) )

    )

)
;(atom list) (i,i)
(defun getDepthWrapper(node list)
    (getDepth node 0 list '())
)