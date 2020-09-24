%% Newton.m
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Recherche par la m�thode de Newton de la solution de l'�quation f(x)=0 
% autour de la valeur x0 avec une pr�cision espilon
% La courbe y = f(x) est trac�e
% L'utilisateur peut alors sp�cifier la valeur de x0 permettant de d�marrer
% le processus de recherche de solution ainsi que la pr�cision epsilon
% souhait�e
%% Trac� de la fonction dont on cherche les racines par la m�thode de Newton
figure;
ezplot(@f2);
grid on; grid minor;

% affichage des axes sur le graphique
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%% Sp�cification de la valeur de x0 permettant de d�marrer le processus de 
% recherche de la solution f(x)=0 et de la pr�cision souhait�e espilon

disp('La solution de l''�quation f(x)=0 est recherch�e par la m�thode de Newton autour de la valeur x0');
x0 = input('Saisir la valeur de x0: ');
disp('La recherche de la solution se fera avec une pr�cision epsilon: ');
eps = input('Sp�cifier la valeur de epsilon: ');

%% Appel de la fonction fNewton et affichage du r�sultat
tic;
sol = fNewton(@f2,x0,eps);
t_dicho = toc;
reponse = ['La solution de l''�quation f(x)=0  autour de x=',num2str(x0),' est: ', num2str(sol)];
disp(reponse);
temps = ['Le temps n�cessaire au calcul est de ',num2str(t_dicho),' secondes'];
disp(temps);






