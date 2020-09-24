%d�fintion de x comme une variable symbolique
syms x
%% %r�soltion d'une equation

%d�finition de l'�quation � r�soudre
equation= x^2+2*x-3==0
%R�solution de l'�quation
solution=solve(equation,x);

disp('La premi�re racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))
%% %r�solution d'une equation alg�brique (racines complexes)

%d�finition de l'�quation � r�soudre
equation= x^2+2*x+5==0;
%R�solution de l'�quation
solution=solve(equation,x);

disp('La premi�re racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))
%% d�velopper une expression
expr1=(x-8)*(x+2)^2
expand(expr1)

%% factoriser une expression
expr2=x^3 - 4*x^2 - 28*x - 32
factor(expr2,x)

%% d�river une fonction 
%d�finition de t comme une varaible symbolique
syms t
%d�finition de la fonction � d�river
f=sin(t)+3*t^3;

%calcul de la d�riv�e premi�re
df=diff(f,t)

%calcul de la d�riv�e cinqui�me
d5f=diff(f,t,5)

%% Int�gration d'une fonction

%calcul de la primitive
int(f,t)

%calcul d'une int�grale d�finie
int(f,t,-pi/3,pi)

%% Transform�e de Laplace d'une expression
syms w;
syms a;
laplace(sin(w*t))
laplace(cos(w*t))
laplace(exp(-a*t)*cos(w*t))
laplace(exp(-a*t)*sin(w*t))

%% Transform�e inverse de Laplace d'une expression
syms s
ilaplace(s/(s^2 + w^2))
ilaplace(3/(2+s)-5/(3+s)^2)

%% D�composition en �l�ments simples
%d�finition de la fraction rationnelle a/b
%num�rateur
a=[4 5];
%d�nominateur%
b=[1 6 8];

%d�composition en �l�ments simples
[r p k]=residue(a,b)

%% 















