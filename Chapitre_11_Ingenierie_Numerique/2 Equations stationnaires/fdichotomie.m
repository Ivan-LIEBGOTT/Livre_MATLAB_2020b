%% fdichotomie.m
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction renvoie la solution de l'�quation f(x)=0 recherch�e dans
% l'intervalle [a;b] avec une pr�cision epsilon en utilisant la m�thode de
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





