%% X = Pivot_de_Gauss(A,B)
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Algorithme de résolution d'un système d'équation linéaire en utilisant la
% méthode du pivot de Gauss
% le système est de la forme [A][X] = [B]
% On forme la matrice augmentée

function X = Pivot_de_Gauss(A,B)
% concaténation de A et de B pour former la matrice augmentée M
M = [A B];

% triangularisation de M
M = triangularisation (M);

% résolution de M
X = resolution(M)
end


