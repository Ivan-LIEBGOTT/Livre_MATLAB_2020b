%% dichotomie.m
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Recherche par dichotomie de la solution de l'�quation f(x)=0 dans
% l'intervalle [a;b] avec une pr�cision espilon
% La courbe y = f(x) est trac�e
% L'utilisateur peut alors sp�cifier l'intervalle [a;b] de recherche de la
% solution et la pr�cision epsilon souhiat�e
% la fonction f(x) est stock�e dans la fonction f2.m
%% Trac� de la fonction dont on cherche les racines par dichotomie
figure;
ezplot(@f2);
grid on; grid minor;

% affichage des axes sur le graphique
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%% Sp�cification de l'intervalle [a;b] de recherche de la solution f(x)=0 et de la pr�cision souhait�e espilon

disp('La solution de l''�quation f(x)=0 est recherch�e par dichotomie dans l''intervalle [a;b]');
a = input('Saisir la valeur de a: ');
b = input('Saisir la valeur de b: ');
disp('La recherche de la solution se fera avec une pr�cision epsilon: ');
eps = input('Sp�cifier la valeur de epsilon: ');

%% Appel de la fonction fdichotomie et affichage du r�sultat

% d�marrage du compteur pour �valuer le temps d'ex�cution de la fonction
tic;

% appel de la fonction fdichotomie
sol = fdichotomie(@f2,a,b,eps);

% cr�ation de la variable t_dicho contenant le temps d'ex�cution de la
% fonction
t_dicho = toc;

% affichage de la solution et du temps n�cessaire � l'ex�cution de la
% fonction
reponse = ['La solution de l''�quation f(x)=0 dans l''intervalle [',num2str(a),...
    ';',num2str(b),'] est: ', num2str(sol)];
disp(reponse);
temps = ['Le temps n�cessaire au calcul est de ',num2str(t_dicho),' secondes'];
disp(temps);






