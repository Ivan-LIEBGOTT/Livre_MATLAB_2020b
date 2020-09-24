%% fdichotomie.m
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction renvoie la solution de l'équation f(x)=0 recherchée dans
% l'intervalle [a;b] avec une précision epsilon en utilisant la méthode de
% dichotomie

function sol = fdichotomie(f,a,b,epsilon)
while (b-a) > epsilon
    m = (a+b)/2;
    if f(a) * f(m) > 0
        a = m;
    else
        b = m;
    end
    end
sol = (a+b)/2;
end





