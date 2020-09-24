%% num_deriv_plot_comparison
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul de la dérivée numérique d'une fonction en utilisant différentes
% methodes de calcul:
% - différence finie centrée
% - différence finie rétrograde
% - différence finie progressive
% Une comparaison est effectuée avec le calcul de la dérivée théorique
% exacte effectuée en calcul symbolique
% Toutes les courbes sont placées sur le même graphiques afin de pouvoir
% évaluer visuellement les erreurs dues au processus de dérivation
% numérique
% Il est possible de faire varier l'intervalle [a;b] d'étude de la fonction
% et le nombre de points nb_points que l'on souhaitent pour effectuer le
% calcul
% La fonction à dériver est stockée dans la fonction f1.m
%% Script
% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 10;

% définition du nombre de point à utiliser pour le calcul
nb_points = 200;

%% Calcul et tracé de la dérivée numérique avec les différentes méthode

% création et positionnement de la fenêtre graphique

figure('Units','centimeters','Position',[2 8 18 12]);

grid on; grid minor; hold on;


% calcul et tracé de la dérivée exacte en calcul symbolique
[t_ana_symbolique,df_num_ana_symbolique] = fderiv_ana_symbolique(a,b,nb_points,@f1);
plot(t_ana_symbolique,df_num_ana_symbolique,'red','LineWidth',2);

% calcul  et tracé de la dérivée avec différence finie centrée
[t_center,df_num_center] = fderiv_center(a,b,nb_points,@f1);
plot(t_center,df_num_center,'green','LineWidth',2);

% calcul et tracé de la dérivée avec différence finie progressive
[t_forward,df_num_forward] = fderiv_forward(a,b,nb_points,@f1);
plot(t_forward,df_num_forward,'blue','LineWidth',2);

% calcul et tracé de la dérivée avec différence finie retrograde
[t_backward,df_num_backward] = fderiv_backward(a,b,nb_points,@f1);
plot(t_backward,df_num_backward,'cyan','LineWidth',1);

% titre et légende
title({'Comparaison des méthodes de dérivation numérique';...
    ' de la fonction f1'});

legend('dérivée analytique','différence finie centrée',...
    'différence finie progressive','différence fine rétrograde')
xlim([a b]);

%% Calcul des différents écarts en prenant comme référence la dérivée 
% exacte déterminée en calcul symbolique

error_center = df_num_ana_symbolique - df_num_center;
error_forward = df_num_ana_symbolique - df_num_forward;
error_backward = df_num_ana_symbolique - df_num_backward;


% création du vecteur des abscisses

t = [a:(b-a)/nb_points:b]; 
t(1) = [];
t(end) = [];

% création et positionnement de la fenêtre graphique

figure('Units','centimeters','Position',[22 8 18 12]);
hold on; grid on; grid minor;

% tracé des différents écarts

plot(t,error_center,'green','LineWidth',2)
plot(t,error_forward,'blue','LineWidth',2)
plot(t,error_backward,'cyan','LineWidth',2)

% titre et légende

title({'Erreurs comparées des différentes méthodes de dérivation numérique';...
    'par rapport à la dérivée analytique'});

legend('différence finie centrée','différence finie progressive',...
    'différence fine rétrograde')

xlim([a b]);





    


 






