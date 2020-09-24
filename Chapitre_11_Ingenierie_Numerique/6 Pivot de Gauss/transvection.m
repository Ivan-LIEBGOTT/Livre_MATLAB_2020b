%% A = transvection(A,num_ligne_pivot)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilis�e par le script Pivot_de_Gauss.m
% Permet de soustraire � la ligne Li la Ligne_pivot multipli�e par un
% coefficient c. 

function A = transvection(A,num_ligne_pivot)
% affectation du nombre de lignes et du nombre de colonnes de la matrice
[nb_lignes, nb_colonnes] = size(A);

% la boucle parcourt les lignes en partant de num_ligne_pivot + 1
for k = num_ligne_pivot + 1:1:nb_lignes
    % calcul du coefficient c permettant d'�liminer l'inconnue
    c = A(k,num_ligne_pivot) / A(num_ligne_pivot,num_ligne_pivot);
    % op�ration de transvection
    A(k,:) = A(k,:) -  c * A(num_ligne_pivot,:);
    end
end

    
