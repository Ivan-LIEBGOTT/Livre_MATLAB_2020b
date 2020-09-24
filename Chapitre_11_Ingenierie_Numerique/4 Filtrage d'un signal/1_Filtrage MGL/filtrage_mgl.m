% filtrage_mgl
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tester la fonction filtre_mgl(Y,n) qui permet de
% filtrer un signal en utilisant le principe de la moyenne glissante
% Le test est réalisé sur le signal issu d'un codeur
%%
% Effacement des variables du workspace
clear all;

% chargement des données correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_mgl.mat;

% spécification du nombre de points à prendre en compte pour le calcul de
% la moyenne
n = 50;
% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
hold all;

% calcul du signal filtré à l'aide de la fonction filtre_mgl
pos_mgl = filtre_mgl(position_codeur,n);

% Tracé des signaux filtrés et non filtré dans la même fenêtre graphique
plot(t,pos_mgl);
plot(t,position_codeur);
grid on; grid minor;
legend('signal brut','signal filtré','Location','northwest');
title('Filtrage d''un signal en utilisant un filtre à moyenne glissante avec n=' + string(n));
