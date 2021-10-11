%mohmmed ahmed alshwish  id:09165031

%facts
female(camila).
female(fawzia).
female(najia).
female(layla).
female(hawa).
female(fatima).
female(mona).
female(nada).
female(mariam).

male(hassan).
male(yousuf).
male(mustafa).
male(ahmed).
male(ali).
male(mohmmed).
male(akram).
male(zakaria).
male(omar).

/*parent(parent,child)*/
parent(hassan,mustafa).
parent(hassan,fawzia).
parent(hassan,najia).
parent(camila,mustafa).
parent(camila,fawzia).
parent(camila,najia).

parent(layla,ahmed).
parent(layla,hawa).
parent(layla,ali).
parent(yousuf,ahmed).
parent(yousuf,hawa).
parent(yousuf,ali).

parent(najia,faitma).
parent(najia,mona).
parent(najia,mohmmed).
parent(najia,akram).
parent(najia,nada).

parent(ahmed,faitma).
parent(ahmed,mona).
parent(ahmed,mohmmed).
parent(ahmed,akram).
parent(ahmed,nada).

parent(nada,mariam).
parent(zakaria,mariam).
parent(nada,omar).
parent(zakaria,omar).




/*rules
if fact is ture and perent female*/
mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).


%if perent x of z and z perent of y and x is male
grand_father(X,Y) :- parent(X,Z), parent(Z,Y),male(X).
grand_mother(X,Y) :- parent(X,Z), parent(Z,Y),female(X).


% if x son z and y son z and x not y and x male
brother(X,Y) :- parent(Z,X), parent(Z,Y),(X\=Y) , male(X).
sister(X,Y) :- parent(Z,X), parent(Z,Y),(X\=Y) , female(X).

%if x is female and x sister of z and z mother of y
aunt_female(X,Y) :- female(X), sister(X,Z), mother(Z,Y).
aunt_male(X,Y) :- male(X), brother(X,Z), mother(Z,Y).

%if x is female and x sis of z and z father of y
uncle_female(X,Y) :- female(X), sister(X,Z), father(Z,Y).
uncle_male(X,Y) :- male(X), brother(X,Z), father(Z,Y).
