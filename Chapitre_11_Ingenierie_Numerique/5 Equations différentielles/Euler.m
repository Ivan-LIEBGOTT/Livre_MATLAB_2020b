%% Euler
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% R�solution d'une �quation diff�rentielle du premier ordre en utilisant
% la m�thode d'Euler
% 
% la fonction F(y,t) est stock�e dans la fonction F_1.m
%% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 30;

%sp�cification du nombre de points
nb_points = 100;

%% R�solution d'une �quation diff�rentielle du premier ordre

% sp�cification de la condition initiale
y0 = 0;
% R�solution avec fEuler
[t,y] = fEuler(@F_1,a,b,y0,nb_points);

figure; hold all
plot(t,y,'LineWidth',2);
grid on; grid minor;
title({'Solution num�rique d''une �quation diff�rentielle' ;  'du premier ordre (m�thode d''Euler)'})
legend(string(nb_points) + ' points sont calcul�s ')
axis([0 30 0 12]);

