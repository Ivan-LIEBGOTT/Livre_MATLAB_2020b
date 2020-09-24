%% A = triangularisation(A)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilisée par le script Pivot_de_Gauss.m
% Cette fonction permet de triangulariser la matrice augmentée du système 
function A = triangularisation(A)
% affectation du nombre de lignes et du nombre de colonnes de la matrice
[nb_lignes, nb_colonnes] = size(A);

% la boucle parcourt les lignes, fait remonter la ligne de plus grand
% pivot en utilisant la fonction echange_lignes et réalise les opérations de
% transvection en utilisant la fonction transvection afin de
% triangulariser la matrice
for k = 1:1:(nb_lignes-1)  
ligne_pivot = num_ligne_pivot(A,k);
    % remonté du plus grand pivot
    if ligne_pivot ~= k
        A = echange_lignes(A,ligne_pivot,k);
    end
    % opérations de transvections pour toutes les lignes sous la ligne du
    % pivot
    for p = k:1:nb_lignes-1
        A = transvection(A,p);
    end    
end
end


