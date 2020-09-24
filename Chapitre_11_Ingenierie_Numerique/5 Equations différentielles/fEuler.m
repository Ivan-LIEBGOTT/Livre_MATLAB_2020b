%% fEuler
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Résolution d'une équation différentielle du premier ordre mise sous 
% la forme d'un problème de Cauchy
% Equation scalaire: dy/dt = F(t,y)

function [t,y] = fEuler(f,a,b,CI,nb_points)
% calcul du pas h en fonction de a,b et nb_points
h = (b-a)/nb_points;

% définition du vecteur t
t = [a:h:b];

y(1) = CI;
for k = 1:1:nb_points
    y(k+1) = y(k) + h * f(t(k),y(k));
end;


