%% filtrage_pb_ordre_1_tau_variable
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tester la fonction filtre_pb_ordre_1.m qui permet de
% filtrer un signal en utilisant un filtre passe-bas du premier ordre
% Le test est réalisé sur le signal issu d'un codeur
% Le script trace le signal non filtré et les signaux obtenus après
% filtrage  en utilisant différentes valeurs pour la constante de temps tau
% du filtre d'échantillons retenus pour faire la moyenne
%%
% Effacement des variables du workspace
clear all;

% chargement des données correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_pb_ordre_1.mat;

% spécification des valeurs mini et maxi de n
tau_min = 0.1;
tau_max = 2;
pas =((tau_max - tau_min) / 5);

% création d'une nouvelle fenêtre graphique
fig = figure('Units','centimeters','Position',[2 5 33 23]);
set(fig,'Color','white');
hold all;

% tracé du signal du codeur non filtré
plot(t,position_codeur,'r','LineWidth',2);

%création d'une cellule pour stocker les lignes de la légende
Titre_Legende = cell(1,1);
Titre_Legende{1,1} = 'Signal brut';
ind_Legende = 2;

for tau = tau_min : pas : tau_max;
% calcul du signal filtré à l'aide de la fonction filtre_mgl
pos_ordre_1 = filtre_pb_ordre_1(t,position_codeur,tau);
Titre_Legende{1,ind_Legende} =  'tau=' + string(tau); % création de la ligne de la légende

% Tracé du signal filtré correspondant à la valeur de n dans la même fenêtre graphique
plot(t,pos_ordre_1);
ind_Legende = ind_Legende + 1;
end

grid on; grid minor;
% affichage de la légende
legend(Titre_Legende,'Location','northwest');

title('Filtrage d''un signal en utilisant un filtre du premier ordre avec tau comprise entre '...
    + string(tau_min) + ' et ' + string(tau_max));
