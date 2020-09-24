%% filtre_mgl(Y,n)
% Ivan LIEBGOTT @ Décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction permet de filtrer un signal en utilisant un filtre à
% moyenne glissante. Chaque point calculé représente la moyenne des n
% dernières valeurs du signal.
% Y : représente le vecteur contenant le valeurs du signal à filtrer
% n : nombre de points pris en compte pour faire la moyenne

function [Y_mgl] = filtre_mgl(Y,n)
% pour chaque point du signal Y à partir du point Y(n+1)
for p = n+1:1:length(Y)
    % calcul de la moyenne des n termes précédents
    moyenne_glissante = 0;
        for k = 1:1:n
        moyenne_glissante = moyenne_glissante + Y(p-k)/n;
        end
    % affectation de la valeur de l'échantillon pour la valeur de p
    Y_mgl(p) = moyenne_glissante;
% transposition pour obtenir une matrice colonne
Y_mgl = Y_mgl';
end

    
