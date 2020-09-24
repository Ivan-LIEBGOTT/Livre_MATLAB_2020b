%% num_deriv_plot_comparison_subplot
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
% Il est possible de faire varier l'intervalle [a;b] d'étude de la fonction
% Représentation de 4 courbes correspondant à 4 valeurs du nombres de
% points calculés choisies équitablement réparties entre nb_points_min et
% nb_points_max
% La fonction à dériver est stockée dans la fonction f1.m
%% Script
% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 10;

% spécification des nombres de points mini et maxi
nb_points_min = 10;
nb_points_max = 50;
pas = round((nb_points_max - nb_points_min) / 3);
%% 
fig = figure('Units','centimeters','Position',[2 5 35 25]);
set(fig,'Color','white');
sgtitle({'Comparaison des différentes méthodes de dérivation numérique';...
    ' de la fonction f1 en fonction du nombre de points calculés'});

% initialisation du compteur de boucle
k = 1;

for nb_points = nb_points_min : pas : nb_points_max;
    
subplot(2,2,k); hold on; grid on; grid minor;

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

title('Nombre de points calculés  ' + string(nb_points))
k = k + 1;
end

% spécification de la légende générale du graphique
leg = legend('dérivée analytique','différence finie centrée',...
    'différence finie progressive','différence fine rétrograde');

% Positionnement de la légende au centre du graphique
newPosition = [0.45 0.47 0.1 0.07];
newUnits = 'normalized';
set(leg,'Position', newPosition,'Units', newUnits);




    


 






