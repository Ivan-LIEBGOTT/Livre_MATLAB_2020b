%d�finition des variables et de la fonction symbolique
syms K;
syms T;
syms t;
syms f(t);
%% d�finition des d�riv�es successives de f(t)
D1f=diff(f,1);
D2f=diff(f,2);

%% d�fintiion de l'�quation diff�rentielle du premier ordre
equ1=T*D1f+f(t)==K;

%% R�solution
%r�solution de l'�quation sans sp�cification des conditions initiales
dsolve(equ1)

%r�solution de l'�quation avec sp�cification des conditions initiales
dsolve(equ1,f(0)==0)








