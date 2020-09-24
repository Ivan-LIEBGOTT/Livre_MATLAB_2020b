%% F_2.m
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% F_2.m contient l'expression de la fonction F(t,y) utilis�e pour r�soudre
% une �quation diff�rentielle du second ordre en utilisant la m�thode d'Euler
% cette fonction correspond � l'�quation diff�rentielle suivante:
% 5.d2y/dt2 + dy/dt + y = 2
% f(t,y) est une matrice 2-by-1 tel que :
% f(1) = y(2)
% f(2) = 2-y(2)-y(1))/5

function f = F_2(t,y);
f = [y(2) ; (2-y(2)-y(1))/5];
end
