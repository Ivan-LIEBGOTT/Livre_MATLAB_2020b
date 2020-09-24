%% F_1.m
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% F_1.m contient l'expression de la fonction F(t,y) utilis�e pour r�soudre
% une �quation diff�rentielle en utilisant la m�thode d'Euler
% cette fonction correcpond � l'�quation diff�rentielle suivante:
% 5.dy/dt + y = 10
% dy/dt = F(t,y)= (10 - y) / 5

function f = F_1(t,y);
f = (10 - y) / 5;
end
 