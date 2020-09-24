%% num_integration_error
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul de la forme math�mathique de l'erreur effectu�e lors des 
% op�rations d'int�gration num�rique  pour diff�rentes m�thodes de calcul:
% - m�thode des rectangles
% - m�thode des trap�zes
% Une comparaison est effectu�e avec le calcul de l'int�grale th�orique
% exacte effectu�e en calcul symbolique
% On se place arbitrairement au centre de l'intervalle d'�tude de la
% fonction en un point x0 afin d'�valuer l'erreur en ce point pour 
% diff�rentes valeurs de h et du nombre de points de calcul
% on utilise ensuite une interpolation polyn�miale pour d�terminer la forme
% math�matique de l'erreur en fonction de h
% La fonction � int�grer est stock�e dans la fonction f3.m

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
    
% calcul analytique exacte et trac� de l'int�grale de la fonction f en 
% utilisant le calcul symbolique
[t_ana_symbolique,int_f_ana_symbolique] = fintegration_ana_symbolique(a,b,nb_points,@f3);

% calcul et trac� de l'int�grale de la fonction en utilisant la m�thode des
% rectangles
[t_rec,int_f_rec] = fintegration_rec(a,b,nb_points,@f3);

% calcul et trac� de l'int�grale de la fonction en utilisant la m�thode des
% trap�zes
[t_trap,int_f_trap] = fintegration_trap(a,b,nb_points,@f3);

% calcul des erreurs au point x0, milieu de l'intervalle d'�tude en prenant
% comme r�f�rence la d�riv�e exacte d�termin�e en calcul symbolique
x0 = round(nb_points/2);
error_f_rec_h(k) = int_f_ana_symbolique(x0) - int_f_rec(x0);
error_f_trap_h(k) = int_f_ana_symbolique(x0) - int_f_trap(x0);


% d�termination de la valeur du pas h(k) pour l'it�ration en cours
h(k) = (b-a)/nb_points;

% incr�mentation de k
k = k + 1;
end



%% Trac� et interpolation de l'erreur pour la m�thode des rectangles
% Cr�ation d'une nouvelle figure pour les graphiques
figure('Units','centimeters','Position',[2 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_rec_h,'sm','MarkerSize',10,'LineWidth',2);

% Calcul des coefficients du polyn�me d'interpolation
coeff_poly_inter_rec = polyfit (h,error_f_rec_h,1);

% Trac� du polyn�me d'interpolation
t = linspace(0,h(1),100);
poly_inter_rec = polyval(coeff_poly_inter_rec,t);
plot(t,poly_inter_rec,'LineWidth',2);

% Ecriture de la l�gende
legend('M�thode des rectangles',...
     string(coeff_poly_inter_rec(2)) + '  h + ' ...
     + string(coeff_poly_inter_rec(1)),'FontSize',12);
 
% Ecriture du titre et des �tiquettes des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour la m�thode des rectangles'});

xlabel('pas h');
ylabel('erreur');

%% Trac� et interpolation de l'erreur pour la m�thode des trap�zes
figure('Units','centimeters','Position',[22 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_trap_h,'sb','MarkerSize',10,'LineWidth',2)

% D�termination du polynome d'interpolation pour la diff�rence finie
% progressive

% Calcul des coefficients du polyn�me d'interpolation
coeff_poly_inter_trap = polyfit (h,error_f_trap_h,2);

% Trac� du polyn�me d'interpolation
t = linspace(0,h(1),100);
poly_inter_trap = polyval(coeff_poly_inter_trap,t);
plot(t,poly_inter_trap,'LineWidth',2);

% �criture de la l�gende
legend('M�thode des trap�zes',...
     string(coeff_poly_inter_trap(3)) + '  h^2 + ' ...
     + string(coeff_poly_inter_trap(2)) + '  h + ' ...
     + string(coeff_poly_inter_trap(1)),...
     'Location','southwest','FontSize',12);
 
% titre et �tiquette des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour la m�thode des trap�zes'});

xlabel('pas h');
ylabel('erreur');
