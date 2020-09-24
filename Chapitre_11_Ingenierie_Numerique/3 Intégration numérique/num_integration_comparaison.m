%% num_integration_comparaison
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
%Calcul num�rique de l'int�grale  d'une fonctionn en utilisant diff�rentes
% methodes de calcul:
% - m�thode des rectangles
% - m�thode des trap�zes
% Une comparaison est effectu�e avec le calcul de l'int�grale th�orique
% exacte effectu�e en calcul symbolique
% Il est possible de faire varier l'intervalle [a;b] d'�tude de la fonction
% et le nombre de points nb_points pris en compte pour le calcul
% La fonction � int�grer est stock�e dans la fonction f3.m

%% Script
% d�finition de l'intervalle d'�tude  [a;b] de la fonction consid�r�e
a = 0;
b = 10;

% d�finition du nombre de point � utiliser pour le calcul
nb_points = 20;
close all;
%% Calcul et trac� de l'int�grale de la fonction en utilisant diff�rente m�thodes

% cr�ation et positionnement de la fen�tre graphique

figure('Units','centimeters','Position',[2 8 18 12]);

grid on; grid minor; hold on;

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
% titre et l�gende

title({'Comparaison des m�thodes d''int�gration num�rique';...
    ' de la fonction f3'});


legend('Int�grale calcul�e analytiquement','Int�grale calcul�e avec la m�thode des rectangles',...
    'Int�grale calcul�e avec la m�thode des trap�zes');


%% %% Calcul des diff�rents �carts en prenant comme r�f�rence le calcul 
% de l'int�grale exacte d�termin�e en calcul symbolique

error_rec = int_f_ana_symbolique - int_f_rec;
error_trap = int_f_ana_symbolique - int_f_trap;

% cr�ation du vecteur des abscisses

t = [a:(b-a)/nb_points:b]; 

t(end) = [];

% cr�ation et positionnement de la fen�tre graphique

figure('Units','centimeters','Position',[22 8 18 12]);
hold on; grid on; grid minor;

% trac� des diff�rents �carts

plot(t,error_rec,'green','LineWidth',2)
plot(t,error_trap,'blue','LineWidth',2)

% titre et l�gende

title({'Erreurs compar�es des diff�rentes m�thodes d''int�gration num�rique';...
    'par rapport � l''int�grale calcul�e analytiquement'});

legend('M�thode des rectangles','M�thode des trap�zes')

xlim([a b]);





