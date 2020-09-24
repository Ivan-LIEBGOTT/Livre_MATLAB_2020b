%d�finition des variables et de la fonction symboliques
syms K;
syms T;
syms t;
syms f(t);
%% d�finition des d�riv�es successive de f(t)
D1f=diff(f,1);
D2f=diff(f,2);

%% d�fintiion de l'�quation diff�rentielle du premier ordre
equ1=T*D1f+f(t)==K;

%% R�solution
%r�solution de l'�quation sans sp�cification des conditions initiales
dsolve(equ1)

%r�solution de l'�quation avec sp�cification des conditions initiales
dsolve(equ1,f(0)==0)

%% Equation diff�rentielle du second ordre

%R�solution d'une �quation du second ordre:exemple 1
equ2=5*D2f+3*D1f+f==2
dsolve(equ2)
sol2=dsolve(equ2,f(0)==0,D1f(0)==0)

%repr�sentation graphique de la solution
figure;
ezplot(sol2,[0,40,0,3])
grid on

%R�solution d'une �quation du second ordre:exemple 2
equ4=5*D2f+1*D1f+f==2
sol4=dsolve(equ4,f(0)==0,D1f(0)==0)

%repr�sentation graphique de la solution
figure;
ezplot(sol4,[0,70,0,4])
grid on;






