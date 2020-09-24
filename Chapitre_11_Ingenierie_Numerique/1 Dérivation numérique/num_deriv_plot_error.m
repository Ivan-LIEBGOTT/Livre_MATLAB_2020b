%% num_deriv_plot_error
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul de la forme math�mathique de l'erreur effectu�e lors des 
% op�rations de d�rivation num�riques pour diff�rentes m�thodes de calcul:
% - diff�rence finie centr�e
% - diff�rence finie r�trograde
% - diff�rence finie progressive
% Une comparaison est effectu�e avec le calcul de la d�riv�e th�orique
% exacte effectu�e en calcul symbolique
% 
% On se place arbitrairement au centre de l'intervalle d'�tude de la
% fonction en un point x0 afin d'�valuer l'erreur en ce point pour 
% diff�rentes valeurs de h
% et du nombre de points de calcul
% on utilise ensuite une interpolation polyn�miale pour d�terminer la forme
% math�matique de l'erreur en fonction de h
% La fonction � d�river est stock�e dans la fonction f1.m

%% Script
% d�finition de l'intervalle d'�tude [a;b] de la fonction consid�r�e
a = 0;
b = 10;

% initialisation du compteur qui servira d'indice
k = 1;

%% On d�finit ici une boucle qui permettra de calculer l'erreur pour un
% �chantillon de points allant de 100 points jusqu'� 1000 points par pas 
% de 100 pour toutes les m�thodes de d�rivation

for nb_points = 100:100:1000
    
% calcul de la d�riv�e exacte en utilisant le calcul symbolique
[t_ana_symbolique,df_num_ana_symbolique] = fderiv_ana_symbolique(a,b,nb_points,@f1);

% calcul de la d�riv�e avec diff�rence finie centr�e
[t_center,df_num_center] = fderiv_center(a,b,nb_points,@f1);

% calcul  et trac� de la d�riv�e avec diff�rence finie r�trograde
[t_backward,df_num_backward] = fderiv_backward(a,b,nb_points,@f1);

% calcul  et trac� de la d�riv�e avec diff�rence finie progressive
[t_forward,df_num_forward] = fderiv_forward(a,b,nb_points,@f1);

% calcul des erreurs au point x0, milieu de l'intervalle d'�tude en prenant
% comme r�f�rence la d�riv�e exacte d�termin�e en calcul symbolique
x0 = round(nb_points/2);
error_f_center_h(k) = df_num_ana_symbolique(x0) - df_num_center(x0);
error_f_forward_h(k) = df_num_ana_symbolique(x0) - df_num_forward(x0);
error_f_backward_h(k) = df_num_ana_symbolique(x0) - df_num_backward(x0);

% d�termination de la valeur du pas h(k) pour l'it�ration en cours
h(k) = (b-a)/nb_points;

% incr�mentation de k
k = k + 1;
end

%% Trac� et interpolation de l'erreur pour la diff�rence finie centr�e
% Cr�ation d'une nouvelle figure pour les graphiques
figure('Units','centimeters','Position',[2 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_center_h,'sm','MarkerSize',10,'LineWidth',2);

% Calcul des coefficients du polyn�me d'interpolation
coeff_poly_inter_center = polyfit (h,error_f_center_h,2);

% Trac� du polyn�me d'interpolation
t = linspace(0,h(1),100);
poly_inter_center = polyval(coeff_poly_inter_center,t);
plot(t,poly_inter_center,'LineWidth',2);

% Ecriture de la l�gende
legend('diff�rence finie centr�e',...
     string(coeff_poly_inter_center(3)) + '  h^2 + ' ...
     + string(coeff_poly_inter_center(2)) + '  h + ' ...
     + string(coeff_poly_inter_center(1)),...
     'Location','northwest','FontSize',12);
 
% Ecriture du titre et des �tiquettes des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour la diff�rence finie centr�e'});

xlabel('pas h');
ylabel('erreur');

%% Trac� et interpolation de l'erreur pour la diff�rence finie progressive
figure('Units','centimeters','Position',[22 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_forward_h,'sb','MarkerSize',10,'LineWidth',2)

% D�termination du polynome d'interpolation pour la diff�rence finie
% progressive

% Calcul des coefficients du polyn�me d'interpolation
coeff_poly_inter_forward = polyfit (h,error_f_forward_h,1);

% Trac� du polyn�me d'interpolation
t = linspace(0,h(1),100);
poly_inter_forward = polyval(coeff_poly_inter_forward,t);
plot(t,poly_inter_forward,'LineWidth',2);

%% Trac� et interpolation de l'erreur pour la diff�rence finie r�trograde
plot(h,error_f_backward_h,'og','MarkerSize',10,'LineWidth',2)

% D�termination du polynome d'interpolation pour la diff�rence finie
% r�trograde

% Calcul des coefficients du polyn�me d'interpolation
coeff_poly_inter_backward = polyfit (h,error_f_backward_h,1);

% Trac� du polyn�me d'interpolation
t = linspace(0,h(1),100);
poly_inter_backward = polyval(coeff_poly_inter_backward,t);
plot(t,poly_inter_backward,'LineWidth',2);

% �criture de la l�gende
legend('diff�rence finie progressive',...
       string(coeff_poly_inter_forward(1)) + '  h + ' ...
     + string(coeff_poly_inter_forward(2)) ,...
       'diff�rence finie r�trograde',...
     string(coeff_poly_inter_backward(1)) + '  h + ' ...
     + string(coeff_poly_inter_backward(2)),...
     'Location','northwest','FontSize',12);
 
% titre et �tiquette des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour les diff�rences finies progressive et retrograde'});

xlabel('pas h');
ylabel('erreur');
