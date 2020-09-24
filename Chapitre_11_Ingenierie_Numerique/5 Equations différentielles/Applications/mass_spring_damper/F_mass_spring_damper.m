%% F_mass_spring_damper.m
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% F_mass_sprog_damper.m contient l'expression de la fonction F(t,y) utilis�e pour r�soudre
% l'�quation diff�rentielle du second ordre correspondant � un oscillateur
% m�canique:
% M.d2y/dt2 + b.dy/dt + K.y = M.g
% F(t,y) est une matrice 2-by-1 tel que :
% f(1) = y(2)
% f(2) = M.g-b.y(2)-K.y(1))/M

function f = F_mass_spring_damper(t,y);

% d�finition des grandeurs physique qui interviennent dans l'�quation
m = 1;     % mass : kg
k = 100;   % spring rate : N/m 
b = 2;     % damping coefficient : N/(m/s)
g = 9.81;  % gravity acceleration : N/kg

f = [y(2) ; (m*g-b*y(2)-k*y(1))/m];
end
