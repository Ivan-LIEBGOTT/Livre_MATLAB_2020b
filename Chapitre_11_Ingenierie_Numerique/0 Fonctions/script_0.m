%% script_0
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tracer une série de courbes en faisant varier un paramètre
% L'équation de la courbe est stockée dans la fonction my_2_function.m

% création d'une nouvelle fenêtre graphique
figure;
hold on;

% création du vecteur des temps
t = [0:0.001:60];

% boucle permettant le tracé avec la variation du paramètre
for k = 5:5:40
plot(t,my_2_function(t,k),'LineWidth',2); % appel de la fonction
end

% affichage de la grille
grid on;
grid minor;

% titre et étiquettes des axes
title('sin(t)*exp(-t/a)','Color','red');
xlabel('Temps','Color','blue');
ylabel('Valeur du sinus','Color','blue');
