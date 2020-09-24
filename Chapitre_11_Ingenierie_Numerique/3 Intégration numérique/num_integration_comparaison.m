%% num_integration_comparaison
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
%Calcul numérique de l'intégrale  d'une fonctionn en utilisant différentes
% methodes de calcul:
% - méthode des rectangles
% - méthode des trapèzes
% Une comparaison est effectuée avec le calcul de l'intégrale théorique
% exacte effectuée en calcul symbolique
% Il est possible de faire varier l'intervalle [a;b] d'étude de la fonction
% et le nombre de points nb_points pris en compte pour le calcul
% La fonction à intégrer est stockée dans la fonction f3.m

%% Script
% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 10;

% définition du nombre de point à utiliser pour le calcul
nb_points = 20;
close all;
%% Calcul et tracé de l'intégrale de la fonction en utilisant différente méthodes

% création et positionnement de la fenêtre graphique

figure('Units','centimeters','Position',[2 8 18 12]);

grid on; grid minor; hold on;

% calcul analytique exacte et tracé de l'intégrale de la fonction f en 
% utilisant le calcul symbolique
[t_ana_symbolique,int_f_ana_symbolique] = fintegration_ana_symbolique(a,b,nb_points,@f3);
plot(t_ana_symbolique,int_f_ana_symbolique,'red','LineWidth',2);

% calcul et tracé de l'intégrale de la fonction en utilisant la méthode des
% rectangles
[t_rec,int_f_rec] = fintegration_rec(a,b,nb_points,@f3);
plot(t_rec,int_f_rec,'cyan','LineWidth',2);

% calcul et tracé de l'intégrale de la fonction en utilisant la méthode des
% trapèzes
[t_trap,int_f_trap] = fintegration_trap(a,b,nb_points,@f3);
plot(t_trap,int_f_trap,'blue','LineWidth',2);
% titre et légende

title({'Comparaison des méthodes d''intégration numérique';...
    ' de la fonction f3'});


legend('Intégrale calculée analytiquement','Intégrale calculée avec la méthode des rectangles',...
    'Intégrale calculée avec la méthode des trapèzes');


%% %% Calcul des différents écarts en prenant comme référence le calcul 
% de l'intégrale exacte déterminée en calcul symbolique

error_rec = int_f_ana_symbolique - int_f_rec;
error_trap = int_f_ana_symbolique - int_f_trap;

% création du vecteur des abscisses

t = [a:(b-a)/nb_points:b]; 

t(end) = [];

% création et positionnement de la fenêtre graphique

figure('Units','centimeters','Position',[22 8 18 12]);
hold on; grid on; grid minor;

% tracé des différents écarts

plot(t,error_rec,'green','LineWidth',2)
plot(t,error_trap,'blue','LineWidth',2)

% titre et légende

title({'Erreurs comparées des différentes méthodes d''intégration numérique';...
    'par rapport à l''intégrale calculée analytiquement'});

legend('Méthode des rectangles','Méthode des trapèzes')

xlim([a b]);





