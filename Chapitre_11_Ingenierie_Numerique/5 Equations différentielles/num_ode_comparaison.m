%% num_ode_comparaison
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% comparaison de my_ode et ode_23 pour la résolution d'une équation
% différentielle du deuxième ordre
% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 40;

% spécification du nombre de points et du pas h
nb_points = 10000;
h= (b-a) / nb_points;

%% Résolution d'une équation différentielle du second ordre en utilisant 
% des solveurs numériques

% spécification des conditions initiales CI = [y0 ; dydt0] (matrice 2-by-1)
CI = [0;0];

% Résolution avec my_ode
[t_my_ode_2,sol_my_ode_2] = my_ode(@F_2,a,b,CI,nb_points);

% Résolution avec ode23
% pour utiliser ode23 on rentre directement en argument le vecteur temporel
% nécéssaire au calcul (tspan). Dans my_ode, il fallait rentrer [a;b] et le nombre
% de points ce qui revient exactement au même
tspan = [a:h:b];
[t_ode23_2,sol_ode23_2] = ode23(@F_2,tspan,CI);

%% Résolution analytique en calcul symbolique
%définition des variables et de la fonction symbolique
syms t;
syms y(t);

% définition des dérivées symboliques successives de f(t)
D1y=diff(y,1);
D2y=diff(y,2);

% Construction de l'équation à résoudre et résolution à l'aide de la 
% fonction dsolve et spécification des conditions initiales
equ=5*D2y+D1y+y==2;
sol_symbolique(t)=dsolve(equ,y(0)==CI(1),D1y(0)==CI(2));

% calcul des valeurs du vecteur sol_ana qui contient les valeurs de la
% solution calculée analytiquement

t_ana = [a:h:b];
sol_ana = sol_symbolique(t_ana);

% conversion de la fonction symbolique en double précision
sol_ana = double(sol_ana);

%représentation graphique de la solution
figure;
hold all;
% Tracé de la première colonne de la matrice sol qui correcspond à la
% fonction y, solution de l'équation différentielle
plot(t_my_ode_2,sol_my_ode_2(:,1),'b','LineWidth',2);
plot(t_ode23_2,sol_ode23_2(:,1),'k--','LineWidth',2);
plot(t_ana,sol_ana,'r');
grid on; grid minor;
title({'Comparaison des solveurs pour la résolution',...
    'd''une équation différentielle du second ordre',string(nb_points) + ' points sont calculés '});

legend('Solution calculée avec my ode','Solution calculée avec ode23',...
    'Solution calculée analytiquement');
