%% num_deriv_plot_comparison
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul de la d�riv�e num�rique d'une fonction en utilisant diff�rentes
% methodes de calcul:
% - diff�rence finie centr�e
% - diff�rence finie r�trograde
% - diff�rence finie progressive
% Une comparaison est effectu�e avec le calcul de la d�riv�e th�orique
% exacte effectu�e en calcul symbolique
% Toutes les courbes sont plac�es sur le m�me graphiques afin de pouvoir
% �valuer visuellement les erreurs dues au processus de d�rivation
% num�rique
% Il est possible de faire varier l'intervalle [a;b] d'�tude de la fonction
% et le nombre de points nb_points que l'on souhaitent pour effectuer le
% calcul
% La fonction � d�river est stock�e dans la fonction f1.m
%% Script
% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 10;

% d�finition du nombre de point � utiliser pour le calcul
nb_points = 200;

%% Calcul et trac� de la d�riv�e num�rique avec les diff�rentes m�thode

% cr�ation et positionnement de la fen�tre graphique

figure('Units','centimeters','Position',[2 8 18 12]);

grid on; grid minor; hold on;


% calcul et trac� de la d�riv�e exacte en calcul symbolique
[t_ana_symbolique,df_num_ana_symbolique] = fderiv_ana_symbolique(a,b,nb_points,@f1);
plot(t_ana_symbolique,df_num_ana_symbolique,'red','LineWidth',2);

% calcul  et trac� de la d�riv�e avec diff�rence finie centr�e
[t_center,df_num_center] = fderiv_center(a,b,nb_points,@f1);
plot(t_center,df_num_center,'green','LineWidth',2);

% calcul et trac� de la d�riv�e avec diff�rence finie progressive
[t_forward,df_num_forward] = fderiv_forward(a,b,nb_points,@f1);
plot(t_forward,df_num_forward,'blue','LineWidth',2);

% calcul et trac� de la d�riv�e avec diff�rence finie retrograde
[t_backward,df_num_backward] = fderiv_backward(a,b,nb_points,@f1);
plot(t_backward,df_num_backward,'cyan','LineWidth',1);

% titre et l�gende
title({'Comparaison des m�thodes de d�rivation num�rique';...
    ' de la fonction f1'});

legend('d�riv�e analytique','diff�rence finie centr�e',...
    'diff�rence finie progressive','diff�rence fine r�trograde')
xlim([a b]);

%% Calcul des diff�rents �carts en prenant comme r�f�rence la d�riv�e 
% exacte d�termin�e en calcul symbolique

error_center = df_num_ana_symbolique - df_num_center;
error_forward = df_num_ana_symbolique - df_num_forward;
error_backward = df_num_ana_symbolique - df_num_backward;


% cr�ation du vecteur des abscisses

t = [a:(b-a)/nb_points:b]; 
t(1) = [];
t(end) = [];

% cr�ation et positionnement de la fen�tre graphique

figure('Units','centimeters','Position',[22 8 18 12]);
hold on; grid on; grid minor;

% trac� des diff�rents �carts

plot(t,error_center,'green','LineWidth',2)
plot(t,error_forward,'blue','LineWidth',2)
plot(t,error_backward,'cyan','LineWidth',2)

% titre et l�gende

title({'Erreurs compar�es des diff�rentes m�thodes de d�rivation num�rique';...
    'par rapport � la d�riv�e analytique'});

legend('diff�rence finie centr�e','diff�rence finie progressive',...
    'diff�rence fine r�trograde')

xlim([a b]);





    


 






