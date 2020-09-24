%% filtrage_mgl_n_variable
% Ivan LIEBGOTT @ décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tester la fonction filtre_mgl(Y,n) qui permet de
% filtrer un signal en utilisant le principe de la moyenne glissante
% Le test est réalisé sur le signal issu d'un codeur
% Le script trace le signal non filtré et les signaux obtenus après
% filtrage par moyenne glissante en utilisant différentes valeurs du nombre
% n d'échantillons retenus pour faire la moyenne
%%
% Effacement des variables du workspace
clear all;

% chargement des données correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_mgl.mat;

% spécification des valeurs mini et maxi de n

n_min = 10;
n_max = 110;
pas = round((n_max - n_min) / 5);

% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 33 23]);
set(fig,'Color','white');
hold all;

% tracé du signal du codeur non filtré
plot(t,position_codeur,'r','LineWidth',3);

%création d'une cellule pour stocker les lignes de la légende
Titre_Legende = cell(1,1);
Titre_Legende{1,1} = 'Signal brut';
ind_Legende = 2;

for n = n_min : pas : n_max;

% calcul du signal filtré à l'aide de la fonction filtre_mgl
pos_mgl = filtre_mgl(position_codeur,n);
Titre_Legende{1,ind_Legende} =  'n=' + string(n); % création de la ligne de la légende

% Tracé du signal filtré correspondant à la valeur de n dans la même fenêtre graphique
plot(t,pos_mgl);
ind_Legende = ind_Legende + 1;
end

grid on; grid minor;
% affichage de la légende
legend(Titre_Legende,'Location','northwest');

title('Filtrage d''un signal en utilisant un filtre à moyenne glissante avec n compris entre'...
    + string(n_min) + ' et ' + string(n_max));
