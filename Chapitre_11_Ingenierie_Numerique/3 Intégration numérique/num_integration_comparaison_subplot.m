%% num_integration_comparaison_subplot
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul numérique de l'intégrale  d'une fonctionn en utilisant différentes
% methodes de calcul:
% - méthode des rectangles
% - méthode des trapèzes
% Une comparaison est effectuée avec le calcul de l'intégrale théorique
% exacte effectuée en calcul symbolique
% Il est possible de faire varier l'intervalle [a;b] d'étude de la fonction
% Représentation de 4 courbes correspondant à 4 valeurs du nombres de
% points calculés choisies équitablement réparties entre nb_points_min et
% nb_points_max
% La fonction à intégrer est stockée dans la fonction f3.m
%% Script
% définition de l'intervalle d'étude  [a;b] de la fonction considérée
a = 0;
b = 10;

% spécification des nombres de points mini et maxi
nb_points_min = 10;
nb_points_max = 50;
pas = round((nb_points_max - nb_points_min) / 3);
%% 
fig = figure('Units','centimeters','Position',[1 1 35 25]);
set(fig,'Color','white');
sgtitle({'Comparaison des différentes méthodes d''intégration numérique';...
    ' de la fonction f3 en fonction du nombre de points calculés'});

% initialisation du compteur de boucle
k = 1;

for nb_points = nb_points_min : pas : nb_points_max;
    
subplot(2,2,k); hold on; grid on; grid minor;

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

% legend('dérivée analytique','différence finie centrée',...
%     'différence finie progressive','différence fine rétrograde');

title('Nombre de points calculés  ' + string(nb_points))
k = k + 1;
end

% spécification de la légende générale du graphique
leg = legend('Intégration analytique','Méthode des rectangles',...
    'Méthode des trapèzes');

% Positionnement de la légende au centre du graphique
newPosition = [0.45 0.47 0.1 0.07];
newUnits = 'normalized';
set(leg,'Position', newPosition,'Units', newUnits);




    


 






