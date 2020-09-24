%% Newton.m
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Recherche par la méthode de Newton de la solution de l'équation f(x)=0 
% autour de la valeur x0 avec une précision espilon
% La courbe y = f(x) est tracée
% L'utilisateur peut alors spécifier la valeur de x0 permettant de démarrer
% le processus de recherche de solution ainsi que la précision epsilon
% souhaitée
%% Tracé de la fonction dont on cherche les racines par la méthode de Newton
figure;
ezplot(@f2);
grid on; grid minor;

% affichage des axes sur le graphique
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%% Spécification de la valeur de x0 permettant de démarrer le processus de 
% recherche de la solution f(x)=0 et de la précision souhaitée espilon

disp('La solution de l''équation f(x)=0 est recherchée par la méthode de Newton autour de la valeur x0');
x0 = input('Saisir la valeur de x0: ');
disp('La recherche de la solution se fera avec une précision epsilon: ');
eps = input('Spécifier la valeur de epsilon: ');

%% Appel de la fonction fNewton et affichage du résultat
tic;
sol = fNewton(@f2,x0,eps);
t_dicho = toc;
reponse = ['La solution de l''équation f(x)=0  autour de x=',num2str(x0),' est: ', num2str(sol)];
disp(reponse);
temps = ['Le temps nécessaire au calcul est de ',num2str(t_dicho),' secondes'];
disp(temps);






