%% ode_solve_mass_spring_damper.m
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Permet la r�solution de l'�quation diff�rentielle de l'oscillateur
% m�canique en utilisant my_ode et ode23
% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 5;

% sp�cification du nombre de points
nb_points = 5000;

h= (b-a) / nb_points;

%% R�solution d'une �quation diff�rentielle du second ordre en utilisant 
% des solveurs num�riques

% sp�cification des conditions initiales CI = [y0 ; dydt0] (matrice 2-by-1)
CI = [0.1;0];

% R�solution avec my_ode
[t_my_ode,sol_my_ode] = my_ode(@F_mass_spring_damper,a,b,CI,nb_points);

% R�solution avec ode23
% pour utiliser ode23 on rentre directement en argument le vecteur temporel
% n�c�ssaire au calcul (tspan). Dans my_ode, il fallait rentrer [a;b] et le nombre
% de points ce qui revient exactement au m�me
tspan = [a:h:b];
[t_ode23_2,sol_ode23_2] = ode23(@F_mass_spring_damper,tspan,CI);

%% R�solution analytique en calcul symbolique
%d�finition des variables et de la fonction symbolique
syms t;
syms y(t);

% d�finition des grandeurs physique qui interviennent dans l'�quation
m = 1;     % mass : kg
k = 100;   % spring rate : N/m 
b = 2;     % damping coefficient : N/(m/s)
g = 9.81;  % gravity acceleration : N/kg

% d�finition des d�riv�es symboliques successives de f(t)
D1y=diff(y,1);
D2y=diff(y,2);

% Construction de l'�quation � r�soudre et r�solution � l'aide de la 
% fonction dsolve et sp�cification des conditions initiales
equ= m*D2y + b*D1y + k*y ==m*g;
sol_symbolique(t)=dsolve(equ,y(0)==CI(1),D1y(0)==CI(2));

% calcul des valeurs du vecteur sol_ana qui contient les valeurs de la
% solution calcul�e analytiquement

t_ana = [a:h:b];
sol_ana = sol_symbolique(t_ana);

% conversion de la fonction symbolique en double pr�cision
sol_ana = double(sol_ana);

%repr�sentation graphique de la solution
figure;
hold all;
% Trac� de la premi�re colonne de la matrice sol qui correcspond � la
% fonction y, solution de l'�quation diff�rentielle
plot(t_my_ode,sol_my_ode(:,1),'b','LineWidth',2);
plot(t_ode23_2,sol_ode23_2(:,1),'k--','LineWidth',2);
plot(t_ana,sol_ana,'r');
grid on; grid minor;
title({'R�solution de l''�quation diff�rentielle de l''oscillateur m�canique',...
    'en utilisant 3 m�thodes diff�rentes',string(nb_points) + ' points sont calcul�s '});

legend('Solution calcul�e avec my ode','Solution calcul�e avec ode23',...
    'Solution calcul�e en symbolique');