%% X = Pivot_de_Gauss(A,B)
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Algorithme de r�solution d'un syst�me d'�quation lin�aire en utilisant la
% m�thode du pivot de Gauss
% le syst�me est de la forme [A][X] = [B]
% On forme la matrice augment�e

function X = Pivot_de_Gauss(A,B)
% concat�nation de A et de B pour former la matrice augment�e M
M = [A B];

% triangularisation de M
M = triangularisation (M);

% r�solution de M
X = resolution(M)
end


