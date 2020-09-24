%% [t,df] = fderiv_center(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Calcul la d�riv�e num�rique de la fonction f sur l'intervalle [a;b] en
% prenant nb_points pour le calcul
% La m�thode est celle de la diff�rence finie centr�e

%% 
function [t,df] = fderiv_center(a,b,nb_points,f)

% calcul du pas h
h = (b-a)/nb_points;

% d�fintion du vecteur t
t = [a:h:b];

% calcul de la d�riv�e en chaque point
for k = 2:1:nb_points
    df(k) = (f(t(k)+h/2)-f(t(k)-h/2))/h;
end
% suppression du dernier �l�ment du vecteur t afin d'�galiser le nombre de
% composantes des deux vecteurs
t(end)= [];

% suppression du premier point pour �viter les effets de
% bords
df(1) = [];
t(1) = [];
end

    