%% [t,df] = fintegration_rec(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Calcul l'intégrale d'une fonction par la méthode des rectangles
%% 
function [t,int_f] = fintegration_rec(a,b,nb_points,f)
% calcul du pas h
h = (b-a)/nb_points;

% définition des conditions initiale de l'intégration (par défaut CI=0)
int_f(1) = 0;
t(1) = a;
% La boucle va ajouter l'aire des rectangles pour chaque intervalle et
% créer le vecteur contenant les temps et le vecteur contenant les valeurs
% de l'intégrale de la fonction prise en argument

for k = [2:1:nb_points]
    % construction du vecteur des abscisses
    t(k) = t(k-1) + h;
    % construction du vecteur contenant les valeurs de l'intégrale 
    % de la fonction
    int_f(k) = int_f(k-1) + f3(t(k)) * h;
end

    
