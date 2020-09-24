%% B = echange_lignes(A,ligne_i,ligne_k)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction est utilis�e par le script Pivot_de_Gauss.m
% Permet d'�changer la ligne_i et la ligne_k dans la matrice A 

function A = echange_lignes(A,ligne_i,ligne_k)
% permutation des �l�ments des lignes i et j
A([ligne_i ligne_k],:) = A([ligne_k ligne_i],:);
end


