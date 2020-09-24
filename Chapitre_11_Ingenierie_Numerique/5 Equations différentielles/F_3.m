%% F_3.m
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% F_2.m contient l'expression de la fonction F(t,y) utilisée pour résoudre
% une équation différentielle du second ordre en utilisant la méthode d'Euler
% cette fonction correspond à l'équation différentielle suivante:
% d3y/dt3 + 3.d2y/dt2 + 3dy/dt + y = 10
% f(t,y) est une matrice 3-by-1 tel que :
% f(1) = y(2)
% f(2) = y(3)
% f(3) = 10 - 3*y(3) - 3*y(2) - y(1))/5

function f = F_3(t,y);
f = [y(2) ; y(3) ; (10 - 3*y(3) - 3*y(2) - y(1))/5];
end
