%% filtre_pb_ordre_1(t,Y,tau)
% Ivan LIEBGOTT @ D�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Cette fonction permet de filtrer un signal en utilisant un filtre
% passe-bas du premier ordre
% t : vecteur contenant les valeurs du temps correspondant au signal �
% filtrer
% Y : repr�sente le vecteur contenant le valeurs du signal � filtrer
% tau : constante de temps du filtre
function [Y_pb_ordre_1] = filtre_pb_ordre_1(t,Y,tau)
% d�finition du pas h
h = (t(end) - t(1)) / (length(t)-1);
Y_pb_ordre_1(1) = Y(1);
for k = 1:1:length(Y)-1
    % calcul de Y au rang k+1
    Y_pb_ordre_1(k+1) = Y(k)*(h/tau) + Y_pb_ordre_1(k)*(tau-h)/tau;
end

    
