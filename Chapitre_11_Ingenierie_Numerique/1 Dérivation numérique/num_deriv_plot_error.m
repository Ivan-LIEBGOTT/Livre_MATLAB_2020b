%% num_deriv_plot_error
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul de la forme mathémathique de l'erreur effectuée lors des 
% opérations de dérivation numériques pour différentes méthodes de calcul:
% - différence finie centrée
% - différence finie rétrograde
% - différence finie progressive
% Une comparaison est effectuée avec le calcul de la dérivée théorique
% exacte effectuée en calcul symbolique
% 
% On se place arbitrairement au centre de l'intervalle d'étude de la
% fonction en un point x0 afin d'évaluer l'erreur en ce point pour 
% différentes valeurs de h
% et du nombre de points de calcul
% on utilise ensuite une interpolation polynômiale pour déterminer la forme
% mathématique de l'erreur en fonction de h
% La fonction à dériver est stockée dans la fonction f1.m

%% Script
% définition de l'intervalle d'étude [a;b] de la fonction considérée
a = 0;
b = 10;

% initialisation du compteur qui servira d'indice
k = 1;

%% On définit ici une boucle qui permettra de calculer l'erreur pour un
% échantillon de points allant de 100 points jusqu'à 1000 points par pas 
% de 100 pour toutes les méthodes de dérivation

for nb_points = 100:100:1000
    
% calcul de la dérivée exacte en utilisant le calcul symbolique
[t_ana_symbolique,df_num_ana_symbolique] = fderiv_ana_symbolique(a,b,nb_points,@f1);

% calcul de la dérivée avec différence finie centrée
[t_center,df_num_center] = fderiv_center(a,b,nb_points,@f1);

% calcul  et tracé de la dérivée avec différence finie rétrograde
[t_backward,df_num_backward] = fderiv_backward(a,b,nb_points,@f1);

% calcul  et tracé de la dérivée avec différence finie progressive
[t_forward,df_num_forward] = fderiv_forward(a,b,nb_points,@f1);

% calcul des erreurs au point x0, milieu de l'intervalle d'étude en prenant
% comme référence la dérivée exacte déterminée en calcul symbolique
x0 = round(nb_points/2);
error_f_center_h(k) = df_num_ana_symbolique(x0) - df_num_center(x0);
error_f_forward_h(k) = df_num_ana_symbolique(x0) - df_num_forward(x0);
error_f_backward_h(k) = df_num_ana_symbolique(x0) - df_num_backward(x0);

% détermination de la valeur du pas h(k) pour l'itération en cours
h(k) = (b-a)/nb_points;

% incrémentation de k
k = k + 1;
end

%% Tracé et interpolation de l'erreur pour la différence finie centrée
% Création d'une nouvelle figure pour les graphiques
figure('Units','centimeters','Position',[2 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_center_h,'sm','MarkerSize',10,'LineWidth',2);

% Calcul des coefficients du polynôme d'interpolation
coeff_poly_inter_center = polyfit (h,error_f_center_h,2);

% Tracé du polynôme d'interpolation
t = linspace(0,h(1),100);
poly_inter_center = polyval(coeff_poly_inter_center,t);
plot(t,poly_inter_center,'LineWidth',2);

% Ecriture de la légende
legend('différence finie centrée',...
     string(coeff_poly_inter_center(3)) + '  h^2 + ' ...
     + string(coeff_poly_inter_center(2)) + '  h + ' ...
     + string(coeff_poly_inter_center(1)),...
     'Location','northwest','FontSize',12);
 
% Ecriture du titre et des étiquettes des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour la différence finie centrée'});

xlabel('pas h');
ylabel('erreur');

%% Tracé et interpolation de l'erreur pour la différence finie progressive
figure('Units','centimeters','Position',[22 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_forward_h,'sb','MarkerSize',10,'LineWidth',2)

% Détermination du polynome d'interpolation pour la différence finie
% progressive

% Calcul des coefficients du polynôme d'interpolation
coeff_poly_inter_forward = polyfit (h,error_f_forward_h,1);

% Tracé du polynôme d'interpolation
t = linspace(0,h(1),100);
poly_inter_forward = polyval(coeff_poly_inter_forward,t);
plot(t,poly_inter_forward,'LineWidth',2);

%% Tracé et interpolation de l'erreur pour la différence finie rétrograde
plot(h,error_f_backward_h,'og','MarkerSize',10,'LineWidth',2)

% Détermination du polynome d'interpolation pour la différence finie
% rétrograde

% Calcul des coefficients du polynôme d'interpolation
coeff_poly_inter_backward = polyfit (h,error_f_backward_h,1);

% Tracé du polynôme d'interpolation
t = linspace(0,h(1),100);
poly_inter_backward = polyval(coeff_poly_inter_backward,t);
plot(t,poly_inter_backward,'LineWidth',2);

% écriture de la légende
legend('différence finie progressive',...
       string(coeff_poly_inter_forward(1)) + '  h + ' ...
     + string(coeff_poly_inter_forward(2)) ,...
       'différence finie rétrograde',...
     string(coeff_poly_inter_backward(1)) + '  h + ' ...
     + string(coeff_poly_inter_backward(2)),...
     'Location','northwest','FontSize',12);
 
% titre et étiquette des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour les différences finies progressive et retrograde'});

xlabel('pas h');
ylabel('erreur');
