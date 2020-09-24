%% script_0_legend_all_in_one.m
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Ce script permet de tracer une s�rie de courbes en faisant varier un param�tre
% L'�quation de la courbe est stock�e dans la fonction d�finie en fin de
% fichier

% cr�ation d'une nouvelle fen�tre graphique
figure;
hold on;

% cr�ation du vecteur des temps
t = [0:0.001:60];

%cr�ation d'une cellule pour stocker les lignes de la l�gende
Titre_Legende = cell(1,1);
ind_Legende = 1;

% boucle permettant le trac� avec la variation du param�tre
for k = 5:5:40
plot(t,f(t,k),'LineWidth',2);
Titre_Legende{1,ind_Legende} =  'a=' + string(k); % cr�ation de la ligne de la l�gende
ind_Legende = ind_Legende + 1;
end

% affichage de la l�gende
legend(Titre_Legende);

% affichage de la grille
grid on;
grid minor;

% titre et �tiquettes des axes
titre = texlabel('sin(t).e^((-t/a)) en fonction de t');
title(titre,'Color','red');
xlabel('Temps t en (s)','Color','blue');
ylabel('Valeur du sinus amorti','Color','blue');

% d�finition de la fonction
function y=f(x,a)
y = sin(x).*exp(-x/a);
end



