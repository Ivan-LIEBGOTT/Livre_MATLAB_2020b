%% [t,df] = fderiv_center(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Calcul la dérivée numérique de la fonction f sur l'intervalle [a;b] en
% prenant nb_points pour le calcul
% La méthode est celle de la différence finie centrée

%% 
function [t,df] = fderiv_center(a,b,nb_points,f)

% calcul du pas h
h = (b-a)/nb_points;

% défintion du vecteur t
t = [a:h:b];

% calcul de la dérivée en chaque point
for k = 2:1:nb_points
    df(k) = (f(t(k)+h/2)-f(t(k)-h/2))/h;
end
% suppression du dernier élément du vecteur t afin d'égaliser le nombre de
% composantes des deux vecteurs
t(end)= [];

% suppression du premier point pour éviter les effets de
% bords
df(1) = [];
t(1) = [];
end

    