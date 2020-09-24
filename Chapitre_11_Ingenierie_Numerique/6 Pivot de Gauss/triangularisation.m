%% A = triangularisation(A)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilis�e par le script Pivot_de_Gauss.m
% Cette fonction permet de triangulariser la matrice augment�e du syst�me 
function A = triangularisation(A)
% affectation du nombre de lignes et du nombre de colonnes de la matrice
[nb_lignes, nb_colonnes] = size(A);

% la boucle parcourt les lignes, fait remonter la ligne de plus grand
% pivot en utilisant la fonction echange_lignes et r�alise les op�rations de
% transvection en utilisant la fonction transvection afin de
% triangulariser la matrice
for k = 1:1:(nb_lignes-1)  
ligne_pivot = num_ligne_pivot(A,k);
    % remont� du plus grand pivot
    if ligne_pivot ~= k
        A = echange_lignes(A,ligne_pivot,k);
    end
    % op�rations de transvections pour toutes les lignes sous la ligne du
    % pivot
    for p = k:1:nb_lignes-1
        A = transvection(A,p);
    end    
end
end


