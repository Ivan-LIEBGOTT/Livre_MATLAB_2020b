%% Exploitation des données issues de l'accéléromètre d'un smartphone
% Ivan LIEBGOTT @ Novembre 2020
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
%%
load test_mesures_acc_3_axes.mat
close all;

% création des variables permettant d'effectuer les tracés
t = Acceleration.Timestamp;
AX = Acceleration.X;
AY = Acceleration.Y;
AZ = Acceleration.Z;

% tracés des courbes d'accélération

subplot(3,1,1);
plot(t,AX);grid on;

subplot(3,1,2);
plot(t,AY);grid on;

subplot(3,1,3);
plot(t,AZ);grid on;


