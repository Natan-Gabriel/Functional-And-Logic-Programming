%Two integers, n and m are given. Write a predicate to determine all possible
%sequences of numbers
% from 1 to n, such that between any two numbers from consecutive
% positions, the absolute difference to be >= m.






%element(i,n)=i
%            =element(i+1,n),if i<n
%
% generate(l1...ln,n,m,id)=l1...ln,if n==l1,id<=9(stop here)
%                         =generate(e Ul1...ln,n,m,id+1),e=element(2,n)
%                                ,id<=9,absol(l1,e,M)==true,else.
%absol(a,b,c)=true,if a-b>=c or b-a>=c
%            %
%main(N,M)=reverse(generate([1],N,M,1),[])
%reverse(l1...ln,p1...pm)=p1...pm,n=0
%                        =reverse(l2...ln,l1 U p1..pm),else


%(i,i,o)
%(int,int,int)
element(I,_,I).
element(I,N,K):-I<N,J is I+1,element(J,N,K).


%!!consider sequences of at most 9 elems-else stack overflow
%(i,i,i,i,o)
%(List,int,int,List,int)
generate([H|T],N,_,Id,[H|T]):-N=:=H,!,Id=<9.
generate([H|T],N,M,Id,Res):-Id=<9,Id1 is Id+1,element(2,N,E),absol(E,H,M),
                            generate([E,H|T],N,M,Id1,Res).

%(i,i,i)
%(int,int,int)
absol(E,H,M):-E-H>=M,!,true.
absol(E,H,M):-H-E>=M,!,true.

%(i,i,o)
%(int,int,list)
main(N,M,Res1):-generate([1],N,M,1,Res),reverse(Res,Res1,[]).

wrapper(N,M,Res1):-findall(R,main(N,M,R),Res1).
%(i,o,i)
%(List,List,List)
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).



















