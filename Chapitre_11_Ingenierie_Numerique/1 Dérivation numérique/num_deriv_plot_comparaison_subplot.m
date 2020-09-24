%% num_deriv_plot_comparison_subplot
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
% Il est possible de faire varier l'intervalle [a;b] d'�tude de la fonction
% Repr�sentation de 4 courbes correspondant � 4 valeurs du nombres de
% points calcul�s choisies �quitablement r�parties entre nb_points_min et
% nb_points_max
% La fonction � d�river est stock�e dans la fonction f1.m
%% Script
% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 10;

% sp�cification des nombres de points mini et maxi
nb_points_min = 10;
nb_points_max = 50;
pas = round((nb_points_max - nb_points_min) / 3);
%% 
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
sgtitle({'Comparaison des diff�rentes m�thodes de d�rivation num�rique';...
    ' de la fonction f1 en fonction du nombre de points calcul�s'});

% initialisation du compteur de boucle
k = 1;

for nb_points = nb_points_min : pas : nb_points_max;
    
subplot(2,2,k); hold on; grid on; grid minor;

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

title('Nombre de points calcul�s  ' + string(nb_points))
k = k + 1;
end

% sp�cification de la l�gende g�n�rale du graphique
leg = legend('d�riv�e analytique','diff�rence finie centr�e',...
    'diff�rence finie progressive','diff�rence fine r�trograde');

% Positionnement de la l�gende au centre du graphique
newPosition = [0.45 0.47 0.1 0.07];
newUnits = 'normalized';
set(leg,'Position', newPosition,'Units', newUnits);




    


 






