%% filtrage_pb_ordre_1_tau_variable
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tester la fonction filtre_pb_ordre_1.m qui permet de
% filtrer un signal en utilisant un filtre passe-bas du premier ordre
% Le test est r�alis� sur le signal issu d'un codeur
% Le script trace le signal non filtr� et les signaux obtenus apr�s
% filtrage  en utilisant diff�rentes valeurs pour la constante de temps tau
% du filtre d'�chantillons retenus pour faire la moyenne
%%
% Effacement des variables du workspace
clear all;

% chargement des donn�es correspondant au signal du codeur et au temps dans
% le workspace
load filtrage_pb_ordre_1.mat;

% sp�cification des valeurs mini et maxi de n
tau_min = 0.1;
tau_max = 2;
pas =((tau_max - tau_min) / 5);

% cr�ation d'une nouvelle fen�tre graphique
fig = figure('Units','centimeters','Position',[2 5 33 23]);
set(fig,'Color','white');
hold all;

% trac� du signal du codeur non filtr�
plot(t,position_codeur,'r','LineWidth',2);

%cr�ation d'une cellule pour stocker les lignes de la l�gende
Titre_Legende = cell(1,1);
Titre_Legende{1,1} = 'Signal brut';
ind_Legende = 2;

for tau = tau_min : pas : tau_max;
% calcul du signal filtr� � l'aide de la fonction filtre_mgl
pos_ordre_1 = filtre_pb_ordre_1(t,position_codeur,tau);
Titre_Legende{1,ind_Legende} =  'tau=' + string(tau); % cr�ation de la ligne de la l�gende

% Trac� du signal filtr� correspondant � la valeur de n dans la m�me fen�tre graphique
plot(t,pos_ordre_1);
ind_Legende = ind_Legende + 1;
end

grid on; grid minor;
% affichage de la l�gende
legend(Titre_Legende,'Location','northwest');

title('Filtrage d''un signal en utilisant un filtre du premier ordre avec tau comprise entre '...
    + string(tau_min) + ' et ' + string(tau_max));
