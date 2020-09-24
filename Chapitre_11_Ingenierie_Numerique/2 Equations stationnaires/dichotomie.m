%% dichotomie.m
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Recherche par dichotomie de la solution de l'équation f(x)=0 dans
% l'intervalle [a;b] avec une précision espilon
% La courbe y = f(x) est tracée
% L'utilisateur peut alors spécifier l'intervalle [a;b] de recherche de la
% solution et la précision epsilon souhiatée
% la fonction f(x) est stockée dans la fonction f2.m
%% Tracé de la fonction dont on cherche les racines par dichotomie
figure;
ezplot(@f2);
grid on; grid minor;

% affichage des axes sur le graphique
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%% Spécification de l'intervalle [a;b] de recherche de la solution f(x)=0 et de la précision souhaitée espilon

disp('La solution de l''équation f(x)=0 est recherchée par dichotomie dans l''intervalle [a;b]');
a = input('Saisir la valeur de a: ');
b = input('Saisir la valeur de b: ');
disp('La recherche de la solution se fera avec une précision epsilon: ');
eps = input('Spécifier la valeur de epsilon: ');

%% Appel de la fonction fdichotomie et affichage du résultat

% démarrage du compteur pour évaluer le temps d'exécution de la fonction
tic;

% appel de la fonction fdichotomie
sol = fdichotomie(@f2,a,b,eps);

% création de la variable t_dicho contenant le temps d'exécution de la
% fonction
t_dicho = toc;

% affichage de la solution et du temps nécessaire à l'exécution de la
% fonction
reponse = ['La solution de l''équation f(x)=0 dans l''intervalle [',num2str(a),...
    ';',num2str(b),'] est: ', num2str(sol)];
disp(reponse);
temps = ['Le temps nécessaire au calcul est de ',num2str(t_dicho),' secondes'];
disp(temps);






