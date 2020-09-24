%% solve_ode_3
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% comparaison de my_ode et ode_23 pour la r�solution d'une �quation
% diff�rentielle du troisi�me ordre
% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 40;

% sp�cification du nombre de points et du pas h
nb_points = 4000;
h= (b-a) / nb_points;

%% R�solution d'une �quation diff�rentielle du second ordre en utilisant 
% des solveurs num�riques

% sp�cification des conditions initiales CI = [y0 ; dydt0 ; d2y/dt2] (matrice 3-by-1)
CI = [1;0;3];

% R�solution avec my_ode
[t_my_ode_3,sol_my_ode_3] = my_ode(@F_3,a,b,CI,nb_points);

% R�solution avec ode23
% pour utiliser ode23 on rentre directement en argument le vecteur temporel
% n�c�ssaire au calcul (tspan). Dans my_ode, il fallait rentrer [a;b] et le nombre
% de points ce qui revient exactement au m�me
tspan = [a:h:b];
[t_ode23_3,sol_ode23_3] = ode23(@F_3,tspan,CI);


%repr�sentation graphique de la solution
figure;
hold all;
% Trac� de la premi�re colonne de la matrice sol qui correspond � la
% fonction y, solution de l'�quation diff�rentielle
plot(t_my_ode_3,sol_my_ode_3(:,1),'c','LineWidth',2);
plot(t_ode23_3,sol_ode23_3(:,1),'k--','LineWidth',2);

grid on; grid minor;
title({'Comparaison des solveurs pour la r�solution',...
    'd''une �quation diff�rentielle du troisi�me ordre',string(nb_points) + ' points sont calcul�s '});

legend('Solution calcul�e avec my ode','Solution calcul�e avec ode23');
