%% my_ode
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Résolution d'une équation différentielle mise sous la forme d'un problème 
% de Cauchy
% Equation vectorielle: dy/dt = F(t,y)

function [t,sol] = my_ode_colonne(f,a,b,CI,nb_points)
h = (b-a)/nb_points;
t = [a:h:b];

% La première ligne de la matrice solution est constituée du vecteur
% condition initiales CI
sol(1,:) = CI;

% Chaque ligne de la matrice est construite en utilisant le schéma d'Euler
% Il est nécessaire de transposer l'expression "h * f(t(k),sol(k,:))" afin
% de la rendre de même dimension que les autres termes de l'équation (1-by-2)
for k = 1:1:nb_points
    sol(k+1,:) = sol(k,:) + h * f(t(k),sol(k,:))';
end
end


