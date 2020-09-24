%% Euler
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Résolution d'une équation différentielle du premier ordre en utilisant
% la méthode d'Euler
% 
% la fonction F(y,t) est stockée dans la fonction F_1.m
%% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 30;

%spécification du nombre de points
nb_points = 100;

%% Résolution d'une équation différentielle du premier ordre

% spécification de la condition initiale
y0 = 0;
% Résolution avec fEuler
[t,y] = fEuler(@F_1,a,b,y0,nb_points);

figure; hold all
plot(t,y,'LineWidth',2);
grid on; grid minor;
title({'Solution numérique d''une équation différentielle' ;  'du premier ordre (méthode d''Euler)'})
legend(string(nb_points) + ' points sont calculés ')
axis([0 30 0 12]);

