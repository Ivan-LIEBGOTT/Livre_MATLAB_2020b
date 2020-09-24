%% n = num_ligne_pivot(A,num_col)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilisée par le script Pivot_de_Gauss.m
% Recherche la ligne correspondant au plus grand pivot de la colonne 
% num_col pour la matrice A

function n = num_ligne_pivot(A,num_col);

% affectation du nombre de lignes et du nombre de colonnes de la matrice
[nb_lignes, nb_colonnes] = size(A);

% affectation du pivot provisoire à la ligne correspondant à num_col. La
% ligne du pivot provisoire correspond à la colonne de recherche
n = num_col;

% on parcourt la colonne en effectuant une comparaison élément par élément
for k = num_col:1:nb_lignes
    if abs(A(k,num_col)) > abs(A(n,num_col))
        % on récupère la valeur du pivot si l'élément comparé est plus
        % grand que le pivot mémorisé
        n = k;     
    end 
end
end




        
    
