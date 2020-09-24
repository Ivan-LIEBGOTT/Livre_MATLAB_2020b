%% solve_ode_Van_der_Pol
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% comparaison de my_ode et ode_23 pour la r�solution de l'�quation
% diff�rentielle de Van der Pol (@ Mathworks documentation)
% La fonction qui d�finit la fonction F(t,y) est d�finie en fin de script

% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 40;

% sp�cification du nombre de points et du pas h
nb_points = 10000;
h= (b-a) / nb_points;

%% R�solution de l'�quation diff�rentielle de Van der Pol 

% sp�cification des conditions initiales CI = [y0 ; dydt0] (matrice 2-by-1)
CI = [2;0];

% R�solution avec my_ode
[t_my_ode_vdp,sol_my_ode_vdp] = my_ode(@vdp,a,b,CI,nb_points);

% R�solution avec ode23
% pour utiliser ode23 on rentre directement en argument le vecteur temporel
% n�c�ssaire au calcul (tspan). Dans my_ode, il fallait rentrer [a;b] et le nombre
% de points ce qui revient exactement au m�me
tspan = [a:h:b];
[t_ode23_vdp,sol_ode23_vdp] = ode23(@vdp,[a b],CI);

%repr�sentation graphique de la solution
figure;
hold all;
% Trac� de la premi�re colonne de la matrice sol qui correspond � la
% fonction y, solution de l'�quation diff�rentielle
plot(t_my_ode_vdp,sol_my_ode_vdp(:,1),'c','LineWidth',2);
plot(t_ode23_vdp,sol_ode23_vdp(:,1),'k--','LineWidth',2);

grid on; grid minor;
title({'Comparaison des solveurs pour la r�solution',...
    'd''une �quation diff�rentielle du troisi�me ordre',string(nb_points) + ' points sont calcul�s '});

legend('Solution calcul�e avec my ode','Solution calcul�e avec ode23');

function f = vdp(t,y)
f = [y(2); (1-y(1)^2)*y(2)-y(1)];
end
