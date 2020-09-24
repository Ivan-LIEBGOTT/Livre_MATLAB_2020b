%% my_ode
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% R�solution d'une �quation diff�rentielle mise sous la forme d'un probl�me 
% de Cauchy
% Equation vectorielle: dy/dt = F(t,y)

function [t,sol] = my_ode_colonne(f,a,b,CI,nb_points)
h = (b-a)/nb_points;
t = [a:h:b];

% La premi�re ligne de la matrice solution est constitu�e du vecteur
% condition initiales CI
sol(1,:) = CI;

% Chaque ligne de la matrice est construite en utilisant le sch�ma d'Euler
% Il est n�cessaire de transposer l'expression "h * f(t(k),sol(k,:))" afin
% de la rendre de m�me dimension que les autres termes de l'�quation (1-by-2)
for k = 1:1:nb_points
    sol(k+1,:) = sol(k,:) + h * f(t(k),sol(k,:))';
end
end


