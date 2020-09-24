%% [t,df] = fderiv_anasymbolique(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Calcul de la dérivée analytique exacte d'une fonction en utilisant le calcul
% symbolique
function [t,df]=fderiv_ana_symbolique(a,b,nb_points,f)
h = (b-a)/nb_points;
t = [a:h:b];
% x est déclarée comme variable symbolique
syms x;

% création de la fonction symbolique f_symbolique à partir de f(x)
f_symbolique(x) = f(x);

% dérivation de la fonction f_symbolique pour créer la fonction dérivée
% symbolique
df_symbolique(x) = diff(f_symbolique,x);

% calcul des valeurs du vecteur df qui contient les valeurs de la dérivée
% calculée analytiquement
df = df_symbolique(t);

% conversion de la fonction symbolique en double précision
df = double(df);

df(1) = [];
t(1) = [];
df(end) = [];
t(end) = [];
end


