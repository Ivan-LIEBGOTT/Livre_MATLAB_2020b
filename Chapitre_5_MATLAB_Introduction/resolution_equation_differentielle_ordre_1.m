%définition des variables et de la fonction symbolique
syms K;
syms T;
syms t;
syms f(t);
%% définition des dérivées successives de f(t)
D1f=diff(f,1);
D2f=diff(f,2);

%% défintiion de l'équation différentielle du premier ordre
equ1=T*D1f+f(t)==K;

%% Résolution
%résolution de l'équation sans spécification des conditions initiales
dsolve(equ1)

%résolution de l'équation avec spécification des conditions initiales
dsolve(equ1,f(0)==0)








