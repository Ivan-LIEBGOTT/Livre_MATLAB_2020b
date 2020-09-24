%% A = transvection(A,num_ligne_pivot)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilisée par le script Pivot_de_Gauss.m
% Permet de soustraire à la ligne Li la Ligne_pivot multipliée par un
% coefficient c. 

function A = transvection(A,num_ligne_pivot)
% affectation du nombre de lignes et du nombre de colonnes de la matrice
[nb_lignes, nb_colonnes] = size(A);

% la boucle parcourt les lignes en partant de num_ligne_pivot + 1
for k = num_ligne_pivot + 1:1:nb_lignes
    % calcul du coefficient c permettant d'éliminer l'inconnue
    c = A(k,num_ligne_pivot) / A(num_ligne_pivot,num_ligne_pivot);
    % opération de transvection
    A(k,:) = A(k,:) -  c * A(num_ligne_pivot,:);
    end
end

    
