%défintion de x comme une variable symbolique
syms x
%% %résoltion d'une equation

%définition de l'équation à résoudre
equation= x^2+2*x-3==0
%Résolution de l'équation
solution=solve(equation,x);

disp('La première racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))
%% %résolution d'une equation algébrique (racines complexes)

%définition de l'équation à résoudre
equation= x^2+2*x+5==0;
%Résolution de l'équation
solution=solve(equation,x);

disp('La première racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))
%% développer une expression
expr1=(x-8)*(x+2)^2
expand(expr1)

%% factoriser une expression
expr2=x^3 - 4*x^2 - 28*x - 32
factor(expr2,x)

%% dériver une fonction 
%définition de t comme une varaible symbolique
syms t
%définition de la fonction à dériver
f=sin(t)+3*t^3;

%calcul de la dérivée première
df=diff(f,t)

%calcul de la dérivée cinquième
d5f=diff(f,t,5)

%% Intégration d'une fonction

%calcul de la primitive
int(f,t)

%calcul d'une intégrale définie
int(f,t,-pi/3,pi)

%% Transformée de Laplace d'une expression
syms w;
syms a;
laplace(sin(w*t))
laplace(cos(w*t))
laplace(exp(-a*t)*cos(w*t))
laplace(exp(-a*t)*sin(w*t))

%% Transformée inverse de Laplace d'une expression
syms s
ilaplace(s/(s^2 + w^2))
ilaplace(3/(2+s)-5/(3+s)^2)

%% Décomposition en éléments simples
%définition de la fraction rationnelle a/b
%numérateur
a=[4 5];
%dénominateur%
b=[1 6 8];

%décomposition en éléments simples
[r p k]=residue(a,b)

%% 















