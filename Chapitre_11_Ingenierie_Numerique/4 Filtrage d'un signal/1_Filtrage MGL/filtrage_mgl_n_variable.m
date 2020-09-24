%% filtrage_mgl_n_variable
% Ivan LIEBGOTT @ d�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tester la fonction filtre_mgl(Y,n) qui permet de
% filtrer un signal en utilisant le principe de la moyenne glissante
% Le test est r�alis� sur le signal issu d'un codeur
% Le script trace le signal non filtr� et les signaux obtenus apr�s
% filtrage par moyenne glissante en utilisant diff�rentes valeurs du nombre
% n d'�chantillons retenus pour faire la moyenne
%%
% Effacement des variables du workspace
clear all;

% chargement des donn�es correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_mgl.mat;

% sp�cification des valeurs mini et maxi de n

n_min = 10;
n_max = 110;
pas = round((n_max - n_min) / 5);

% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 33 23]);
set(fig,'Color','white');
hold all;

% trac� du signal du codeur non filtr�
plot(t,position_codeur,'r','LineWidth',3);

%cr�ation d'une cellule pour stocker les lignes de la l�gende
Titre_Legende = cell(1,1);
Titre_Legende{1,1} = 'Signal brut';
ind_Legende = 2;

for n = n_min : pas : n_max;

% calcul du signal filtr� � l'aide de la fonction filtre_mgl
pos_mgl = filtre_mgl(position_codeur,n);
Titre_Legende{1,ind_Legende} =  'n=' + string(n); % cr�ation de la ligne de la l�gende

% Trac� du signal filtr� correspondant � la valeur de n dans la m�me fen�tre graphique
plot(t,pos_mgl);
ind_Legende = ind_Legende + 1;
end

grid on; grid minor;
% affichage de la l�gende
legend(Titre_Legende,'Location','northwest');

title('Filtrage d''un signal en utilisant un filtre � moyenne glissante avec n compris entre'...
    + string(n_min) + ' et ' + string(n_max));
