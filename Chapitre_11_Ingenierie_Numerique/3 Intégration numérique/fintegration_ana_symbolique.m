%% [t,df] = fintegration_anasymbolique(a,b,nb_points,f)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Calcul analytique exacte de l'int�grale d'une fonction en utilisant
% le calcul symbolique

function [t,int_f]=fintegration_ana_symbolique(a,b,nb_points,f)
h = (b-a)/nb_points;
t = [a:h:b];
% x est d�clar�e comme variable symbolique
syms x;

% cr�ation de la fonction symbolique f_symbolique � partir de f(x)
f_symbolique(x) = f(x);

% int�gration de la fonction f_symbolique pour cr�er la fonction d�riv�e
% symbolique
int_f_symbolique(x) = int(f_symbolique,x);

% calcul des valeurs du vecteur int_f qui contient les valeurs de
% l'int�grale de la fonction calcul�e analytiquement
int_f = int_f_symbolique(t);

% conversion de la fonction symbolique en double pr�cision
int_f = double(int_f);


int_f(end) = [];
t(end) = [];
end


