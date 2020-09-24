%définition des variables et de la fonction symbolique
syms t;
syms f(t);

%% définition des dérivées successive de f(t)
D1f=diff(f,1);
D2f=diff(f,2);

%% Résolution d'une équation du second ordre:exemple 1
equ1=5*D2f+3*D1f+f==2
sol1=dsolve(equ1,f(0)==0,D1f(0)==0)

%représentation graphique de la solution
figure;
ezplot(sol1,[0,40,0,3])
legend('solution de l''equation 1')
grid on

%Résolution d'une équation du second ordre:exemple 2
equ2=5*D2f+1*D1f+f==2
sol2=dsolve(equ2,f(0)==0,D1f(0)==0)

%représentation graphique de la solution
figure;
ezplot(sol2,[0,70,0,4])
legend('solution de l''equation 2')

grid on;






