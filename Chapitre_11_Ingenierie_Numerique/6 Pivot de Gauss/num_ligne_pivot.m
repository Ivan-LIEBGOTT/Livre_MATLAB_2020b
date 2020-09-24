%% n = num_ligne_pivot(A,num_col)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilis�e par le script Pivot_de_Gauss.m
% Recherche la ligne correspondant au plus grand pivot de la colonne 
% num_col pour la matrice A

function n = num_ligne_pivot(A,num_col);

% affectation du nombre de lignes et du nombre de colonnes de la matrice
[nb_lignes, nb_colonnes] = size(A);

% affectation du pivot provisoire � la ligne correspondant � num_col. La
% ligne du pivot provisoire correspond � la colonne de recherche
n = num_col;

% on parcourt la colonne en effectuant une comparaison �l�ment par �l�ment
for k = num_col:1:nb_lignes
    if abs(A(k,num_col)) > abs(A(n,num_col))
        % on r�cup�re la valeur du pivot si l'�l�ment compar� est plus
        % grand que le pivot m�moris�
        n = k;     
    end 
end
end




        
    
