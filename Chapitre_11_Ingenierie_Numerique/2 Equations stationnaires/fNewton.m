%% fNewton.m
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction renvoie la solution de l'�quation f(x)=0 recherch�e 
% autour de la valeur x0 avec une pr�cision epsilon en utilisant la 
% m�thode de Newton
% La fonction derive=df(f,x) permet d'obtenir la d�riv�e num�rique de 
% la fonction f avec un pas h

function [sol,N] = Newton(f,x0,epsilon)
sol = x0 - f(x0)/df(f,x0);

% tant que la pr�cision n'est pas atteinte, on continue la m�thode
while abs(f(sol)) > epsilon
    sol = sol - f(sol)/df(f,sol);
end
end

% fonction permettant de calculer la d�riv�e num�rique de la fonction
% (diff�rence finie progressive)
function derive = df(f,x)
h = 1e-5;
derive = (f(x+h/2)-f(x-h/2))/h;
end
