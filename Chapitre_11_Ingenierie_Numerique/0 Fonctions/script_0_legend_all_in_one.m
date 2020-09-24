%% script_0_legend_all_in_one.m
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tracer une série de courbes en faisant varier un paramètre
% L'équation de la courbe est stockée dans la fonction définie en fin de
% fichier

% création d'une nouvelle fenêtre graphique
figure;
hold on;

% création du vecteur des temps
t = [0:0.001:60];

%création d'une cellule pour stocker les lignes de la légende
Titre_Legende = cell(1,1);
ind_Legende = 1;

% boucle permettant le tracé avec la variation du paramètre
for k = 5:5:40
plot(t,f(t,k),'LineWidth',2);
Titre_Legende{1,ind_Legende} =  'a=' + string(k); % création de la ligne de la légende
ind_Legende = ind_Legende + 1;
end

% affichage de la légende
legend(Titre_Legende);

% affichage de la grille
grid on;
grid minor;

% titre et étiquettes des axes
titre = texlabel('sin(t).e^((-t/a)) en fonction de t');
title(titre,'Color','red');
xlabel('Temps t en (s)','Color','blue');
ylabel('Valeur du sinus amorti','Color','blue');

% définition de la fonction
function y=f(x,a)
y = sin(x).*exp(-x/a);
end



