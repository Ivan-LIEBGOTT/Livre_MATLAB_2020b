%% F_1.m
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% F_1.m contient l'expression de la fonction F(t,y) utilisée pour résoudre
% une équation différentielle en utilisant la méthode d'Euler
% cette fonction correcpond à l'équation différentielle suivante:
% 5.dy/dt + y = 10
% dy/dt = F(t,y)= (10 - y) / 5

function f = F_1(t,y);
f = (10 - y) / 5;
end
 