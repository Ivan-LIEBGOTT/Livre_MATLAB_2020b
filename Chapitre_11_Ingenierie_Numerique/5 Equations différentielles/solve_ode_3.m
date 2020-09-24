%% solve_ode_3
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% comparaison de my_ode et ode_23 pour la résolution d'une équation
% différentielle du troisième ordre
% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 40;

% spécification du nombre de points et du pas h
nb_points = 4000;
h= (b-a) / nb_points;

%% Résolution d'une équation différentielle du second ordre en utilisant 
% des solveurs numériques

% spécification des conditions initiales CI = [y0 ; dydt0 ; d2y/dt2] (matrice 3-by-1)
CI = [1;0;3];

% Résolution avec my_ode
[t_my_ode_3,sol_my_ode_3] = my_ode(@F_3,a,b,CI,nb_points);

% Résolution avec ode23
% pour utiliser ode23 on rentre directement en argument le vecteur temporel
% nécéssaire au calcul (tspan). Dans my_ode, il fallait rentrer [a;b] et le nombre
% de points ce qui revient exactement au même
tspan = [a:h:b];
[t_ode23_3,sol_ode23_3] = ode23(@F_3,tspan,CI);


%représentation graphique de la solution
figure;
hold all;
% Tracé de la première colonne de la matrice sol qui correspond à la
% fonction y, solution de l'équation différentielle
plot(t_my_ode_3,sol_my_ode_3(:,1),'c','LineWidth',2);
plot(t_ode23_3,sol_ode23_3(:,1),'k--','LineWidth',2);

grid on; grid minor;
title({'Comparaison des solveurs pour la résolution',...
    'd''une équation différentielle du troisième ordre',string(nb_points) + ' points sont calculés '});

legend('Solution calculée avec my ode','Solution calculée avec ode23');
