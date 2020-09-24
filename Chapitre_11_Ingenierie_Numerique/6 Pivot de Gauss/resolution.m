%% M = r�solution(M)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilis�e par le script Pivot_de_Gauss.m
% R�solution d'un syst�me triangulaire

function X = resolution(M)
[nb_lignes, nb_colonnes] = size(M);
X = zeros(nb_lignes,1);
% on parcourt les lignes en partant du bas et en remontant
for k = nb_lignes:-1:1
    somme = 0;
    % calcul de la somme en injectant les valeurs des inconnues d�j�
    % d�termin�es
    for i = k+1:1:nb_lignes
        somme = somme + M(k,i) * X(i);
    end
    % calcul de la solution X(k)
    X(k) = (1/M(k,k))*(M(k,nb_lignes + 1) - somme);
end
end
