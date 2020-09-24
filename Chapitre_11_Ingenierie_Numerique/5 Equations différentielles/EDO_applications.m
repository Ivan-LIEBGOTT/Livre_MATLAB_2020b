% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = -40;
b = 40;

% spécification du nombre de points
nb_points = 10000;

h= (b-a) / nb_points;

%% Résolution
% spécification des conditions initiales CI = [y0 dydt0]
y0 = 3;

% Résolution avec my_ode
[t_my_ode,sol_my_ode] = my_ode(@F_exemple_1,a,b,y0,nb_points);

% Résolution avec ode23
tspan = [a:h:b];
[t_ode23,sol_ode23] = ode23(@F_exemple_1,tspan,y0);

figure;
hold all;
plot(t_my_ode,sol_my_ode(:,1),'b');
plot(t_ode23,sol_ode23(:,1),'k--','LineWidth',2);
grid on; grid minor;
title('Comparaison des solveurs pour la résolution d''une équation différentielle du second ordre');

legend('solution calculée avec my ode','Solution calculée avec ode23');

%% %% Résolution
% spécification des conditions initiales CI = [y0 dydt0]
y0 = 3;

% Résolution avec my_ode
[t_my_ode,sol_my_ode] = my_ode(@F_exemple_2,a,b,y0,nb_points);

% Résolution avec ode23
tspan = [a:h:b];
[t_ode23,sol_ode23] = ode23(@F_exemple_2,tspan,y0);

figure;
hold all;
plot(t_my_ode,sol_my_ode(:,1),'b');
plot(t_ode23,sol_ode23(:,1),'k--','LineWidth',2);
grid on; grid minor;
title('Comparaison des solveurs pour la résolution d''une équation différentielle du second ordre');

legend('solution calculée avec my ode','Solution calculée avec ode23');
