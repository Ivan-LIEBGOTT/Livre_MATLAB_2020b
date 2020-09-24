%% deriv_num_pas_variable_comparaison
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Représentation de 4 courbes correspondant à 4 dérivations numériques du
% signal en considérant différents pas de dérivation choisis équitablement
% répartis entre nb_points_min et nb_points_max
%% Effacement des variables du workspace
clear all;

% chargement dans le workspacedes données correspondant au signal du codeur et au temps 
load num_deriv_data.mat;

% tracé du signal du codeur
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
sgtitle({'Position donnée par le codeur en fonction du temps';...
    ''});
plot(t,position_codeur);
grid on; grid minor;

% spécification des nombres de points mini et maxi
nb_points_min = 50;
nb_points_max = 450;
pas = round((nb_points_max - nb_points_min) / 3);
%% 
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
sgtitle({'Analyse de l''influence du pas de dérivation';...
    ' sur la forme du signal à dériver'});

% initialisation du compteur de boucle
k = 1;

for step_size = nb_points_min : pas : nb_points_max;
    
subplot(2,2,k); hold on; grid on; grid minor;

% calcul et tracé de la dérivée exacte en calcul symbolique
[t_step,dY_step] = fderiv_num_pas_variable(t,position_codeur,step_size);
plot(t_step,dY_step,'blue','LineWidth',2);

title('La longueur du pas couvre ' + string(step_size) + ' points')
k = k + 1;
end

% spécification de la légende générale du graphique
leg = legend('signal dérivé');

% Positionnement de la légende au centre du graphique
newPosition = [0.45 0.47 0.1 0.07];
newUnits = 'normalized';
set(leg,'Position', newPosition,'Units', newUnits);
