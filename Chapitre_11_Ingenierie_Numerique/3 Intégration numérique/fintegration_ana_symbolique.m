%% [t,df] = fintegration_anasymbolique(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Calcul analytique exacte de l'intégrale d'une fonction en utilisant
% le calcul symbolique

function [t,int_f]=fintegration_ana_symbolique(a,b,nb_points,f)
h = (b-a)/nb_points;
t = [a:h:b];
% x est déclarée comme variable symbolique
syms x;

% création de la fonction symbolique f_symbolique à partir de f(x)
f_symbolique(x) = f(x);

% intégration de la fonction f_symbolique pour créer la fonction dérivée
% symbolique
int_f_symbolique(x) = int(f_symbolique,x);

% calcul des valeurs du vecteur int_f qui contient les valeurs de
% l'intégrale de la fonction calculée analytiquement
int_f = int_f_symbolique(t);

% conversion de la fonction symbolique en double précision
int_f = double(int_f);


int_f(end) = [];
t(end) = [];
end


