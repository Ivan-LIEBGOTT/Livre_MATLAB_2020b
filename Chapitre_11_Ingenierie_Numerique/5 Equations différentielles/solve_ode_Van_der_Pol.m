%% solve_ode_Van_der_Pol
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% comparaison de my_ode et ode_23 pour la résolution de l'équation
% différentielle de Van der Pol (@ Mathworks documentation)
% La fonction qui définit la fonction F(t,y) est définie en fin de script

% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 40;

% spécification du nombre de points et du pas h
nb_points = 10000;
h= (b-a) / nb_points;

%% Résolution de l'équation différentielle de Van der Pol 

% spécification des conditions initiales CI = [y0 ; dydt0] (matrice 2-by-1)
CI = [2;0];

% Résolution avec my_ode
[t_my_ode_vdp,sol_my_ode_vdp] = my_ode(@vdp,a,b,CI,nb_points);

% Résolution avec ode23
% pour utiliser ode23 on rentre directement en argument le vecteur temporel
% nécéssaire au calcul (tspan). Dans my_ode, il fallait rentrer [a;b] et le nombre
% de points ce qui revient exactement au même
tspan = [a:h:b];
[t_ode23_vdp,sol_ode23_vdp] = ode23(@vdp,[a b],CI);

%représentation graphique de la solution
figure;
hold all;
% Tracé de la première colonne de la matrice sol qui correspond à la
% fonction y, solution de l'équation différentielle
plot(t_my_ode_vdp,sol_my_ode_vdp(:,1),'c','LineWidth',2);
plot(t_ode23_vdp,sol_ode23_vdp(:,1),'k--','LineWidth',2);

grid on; grid minor;
title({'Comparaison des solveurs pour la résolution',...
    'd''une équation différentielle du troisième ordre',string(nb_points) + ' points sont calculés '});

legend('Solution calculée avec my ode','Solution calculée avec ode23');

function f = vdp(t,y)
f = [y(2); (1-y(1)^2)*y(2)-y(1)];
end
