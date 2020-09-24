%% filtre_mgl(Y,n)
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction permet de filtrer un signal en utilisant un filtre �
% moyenne glissante. Chaque point calcul� repr�sente la moyenne des n
% derni�res valeurs du signal.
% Y : repr�sente le vecteur contenant le valeurs du signal � filtrer
% n : nombre de points pris en compte pour faire la moyenne

function [Y_mgl] = filtre_mgl(Y,n)
% pour chaque point du signal Y � partir du point Y(n+1)
for p = n+1:1:length(Y)
    % calcul de la moyenne des n termes pr�c�dents
    moyenne_glissante = 0;
        for k = 1:1:n
        moyenne_glissante = moyenne_glissante + Y(p-k)/n;
        end
    % affectation de la valeur de l'�chantillon pour la valeur de p
    Y_mgl(p) = moyenne_glissante;
% transposition pour obtenir une matrice colonne
Y_mgl = Y_mgl';
end

    
