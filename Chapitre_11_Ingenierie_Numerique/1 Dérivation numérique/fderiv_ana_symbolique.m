%% [t,df] = fderiv_anasymbolique(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Calcul de la d�riv�e analytique exacte d'une fonction en utilisant le calcul
% symbolique
function [t,df]=fderiv_ana_symbolique(a,b,nb_points,f)
h = (b-a)/nb_points;
t = [a:h:b];
% x est d�clar�e comme variable symbolique
syms x;

% cr�ation de la fonction symbolique f_symbolique � partir de f(x)
f_symbolique(x) = f(x);

% d�rivation de la fonction f_symbolique pour cr�er la fonction d�riv�e
% symbolique
df_symbolique(x) = diff(f_symbolique,x);

% calcul des valeurs du vecteur df qui contient les valeurs de la d�riv�e
% calcul�e analytiquement
df = df_symbolique(t);

% conversion de la fonction symbolique en double pr�cision
df = double(df);

df(1) = [];
t(1) = [];
df(end) = [];
t(end) = [];
end


