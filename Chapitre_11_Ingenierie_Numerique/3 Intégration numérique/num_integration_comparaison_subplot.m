%% num_integration_comparaison_subplot
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul num�rique de l'int�grale  d'une fonctionn en utilisant diff�rentes
% methodes de calcul:
% - m�thode des rectangles
% - m�thode des trap�zes
% Une comparaison est effectu�e avec le calcul de l'int�grale th�orique
% exacte effectu�e en calcul symbolique
% Il est possible de faire varier l'intervalle [a;b] d'�tude de la fonction
% Repr�sentation de 4 courbes correspondant � 4 valeurs du nombres de
% points calcul�s choisies �quitablement r�parties entre nb_points_min et
% nb_points_max
% La fonction � int�grer est stock�e dans la fonction f3.m
%% Script
% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 10;

% sp�cification des nombres de points mini et maxi
nb_points_min = 10;
nb_points_max = 50;
pas = round((nb_points_max - nb_points_min) / 3);
%% 
fig = figure('Units','centimeters','Position',[1 1 35 25]);
set(fig,'Color','white');
sgtitle({'Comparaison des diff�rentes m�thodes d''int�gration num�rique';...
    ' de la fonction f3 en fonction du nombre de points calcul�s'});

% initialisation du compteur de boucle
k = 1;

for nb_points = nb_points_min : pas : nb_points_max;
    
subplot(2,2,k); hold on; grid on; grid minor;

% calcul analytique exacte et trac� de l'int�grale de la fonction f en 
% utilisant le calcul symbolique
[t_ana_symbolique,int_f_ana_symbolique] = fintegration_ana_symbolique(a,b,nb_points,@f3);
plot(t_ana_symbolique,int_f_ana_symbolique,'red','LineWidth',2);

% calcul et trac� de l'int�grale de la fonction en utilisant la m�thode des
% rectangles
[t_rec,int_f_rec] = fintegration_rec(a,b,nb_points,@f3);
plot(t_rec,int_f_rec,'cyan','LineWidth',2);

% calcul et trac� de l'int�grale de la fonction en utilisant la m�thode des
% trap�zes
[t_trap,int_f_trap] = fintegration_trap(a,b,nb_points,@f3);
plot(t_trap,int_f_trap,'blue','LineWidth',2);

% legend('d�riv�e analytique','diff�rence finie centr�e',...
%     'diff�rence finie progressive','diff�rence fine r�trograde');

title('Nombre de points calcul�s  ' + string(nb_points))
k = k + 1;
end

% sp�cification de la l�gende g�n�rale du graphique
leg = legend('Int�gration analytique','M�thode des rectangles',...
    'M�thode des trap�zes');

% Positionnement de la l�gende au centre du graphique
newPosition = [0.45 0.47 0.1 0.07];
newUnits = 'normalized';
set(leg,'Position', newPosition,'Units', newUnits);




    


 






