%% fNewton.m
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction renvoie la solution de l'équation f(x)=0 recherchée 
% autour de la valeur x0 avec une précision epsilon en utilisant la 
% méthode de Newton
% La fonction derive=df(f,x) permet d'obtenir la dérivée numérique de 
% la fonction f avec un pas h

function [sol,N] = Newton(f,x0,epsilon)
sol = x0 - f(x0)/df(f,x0);

% tant que la précision n'est pas atteinte, on continue la méthode
while abs(f(sol)) > epsilon
    sol = sol - f(sol)/df(f,sol);
end
end

% fonction permettant de calculer la dérivée numérique de la fonction
% (différence finie progressive)
function derive = df(f,x)
h = 1e-5;
derive = (f(x+h/2)-f(x-h/2))/h;
end
