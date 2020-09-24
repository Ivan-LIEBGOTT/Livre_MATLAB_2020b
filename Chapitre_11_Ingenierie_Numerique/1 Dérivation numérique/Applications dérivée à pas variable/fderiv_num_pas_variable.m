%% fderiv_pas_variable(t,Y,step_size)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction permet de r�aliser une d�rivation num�rique en choisissant
% la longueur du pas de d�rivation
% step_size repr�sente la longueur du pas de d�rivation

function [t_step,dY_step] = fderiv_num_pas_variable(t,Y,step_size)

% Evaluation du nombre de points des vecteurs
nb_points = length(t);

% calcul du pas h
h = (t(end)-t(1))/(nb_points - 1);

% calcul du pas � utiliser pour l'op�ration de d�rivation num�rique
pas = step_size * h;

% calcul de la d�riv�e en chaque point
i = 1;
% construction des vecteurs t_step et dY_step
for k = 1:step_size:(nb_points-1-step_size)
    dY_step(i) = (Y(k+step_size)-Y(k))/pas;
    t_step(i) = t(k+step_size);
    i = i + 1;
end
end


