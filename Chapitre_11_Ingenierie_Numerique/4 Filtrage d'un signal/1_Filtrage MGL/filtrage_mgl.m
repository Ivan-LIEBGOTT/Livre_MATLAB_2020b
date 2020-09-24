% filtrage_mgl
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tester la fonction filtre_mgl(Y,n) qui permet de
% filtrer un signal en utilisant le principe de la moyenne glissante
% Le test est r�alis� sur le signal issu d'un codeur
%%
% Effacement des variables du workspace
clear all;

% chargement des donn�es correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_mgl.mat;

% sp�cification du nombre de points � prendre en compte pour le calcul de
% la moyenne
n = 50;
% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
hold all;

% calcul du signal filtr� � l'aide de la fonction filtre_mgl
pos_mgl = filtre_mgl(position_codeur,n);

% Trac� des signaux filtr�s et non filtr� dans la m�me fen�tre graphique
plot(t,pos_mgl);
plot(t,position_codeur);
grid on; grid minor;
legend('signal brut','signal filtr�','Location','northwest');
title('Filtrage d''un signal en utilisant un filtre � moyenne glissante avec n=' + string(n));
