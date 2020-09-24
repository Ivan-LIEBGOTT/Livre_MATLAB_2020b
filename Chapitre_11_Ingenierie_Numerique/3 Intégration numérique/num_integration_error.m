%% num_integration_error
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
%
% Calcul de la forme mathémathique de l'erreur effectuée lors des 
% opérations d'intégration numérique  pour différentes méthodes de calcul:
% - méthode des rectangles
% - méthode des trapèzes
% Une comparaison est effectuée avec le calcul de l'intégrale théorique
% exacte effectuée en calcul symbolique
% On se place arbitrairement au centre de l'intervalle d'étude de la
% fonction en un point x0 afin d'évaluer l'erreur en ce point pour 
% différentes valeurs de h et du nombre de points de calcul
% on utilise ensuite une interpolation polynômiale pour déterminer la forme
% mathématique de l'erreur en fonction de h
% La fonction à intégrer est stockée dans la fonction f3.m

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
    
% calcul analytique exacte et tracé de l'intégrale de la fonction f en 
% utilisant le calcul symbolique
[t_ana_symbolique,int_f_ana_symbolique] = fintegration_ana_symbolique(a,b,nb_points,@f3);

% calcul et tracé de l'intégrale de la fonction en utilisant la méthode des
% rectangles
[t_rec,int_f_rec] = fintegration_rec(a,b,nb_points,@f3);

% calcul et tracé de l'intégrale de la fonction en utilisant la méthode des
% trapèzes
[t_trap,int_f_trap] = fintegration_trap(a,b,nb_points,@f3);

% calcul des erreurs au point x0, milieu de l'intervalle d'étude en prenant
% comme référence la dérivée exacte déterminée en calcul symbolique
x0 = round(nb_points/2);
error_f_rec_h(k) = int_f_ana_symbolique(x0) - int_f_rec(x0);
error_f_trap_h(k) = int_f_ana_symbolique(x0) - int_f_trap(x0);


% détermination de la valeur du pas h(k) pour l'itération en cours
h(k) = (b-a)/nb_points;

% incrémentation de k
k = k + 1;
end



%% Tracé et interpolation de l'erreur pour la méthode des rectangles
% Création d'une nouvelle figure pour les graphiques
figure('Units','centimeters','Position',[2 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_rec_h,'sm','MarkerSize',10,'LineWidth',2);

% Calcul des coefficients du polynôme d'interpolation
coeff_poly_inter_rec = polyfit (h,error_f_rec_h,1);

% Tracé du polynôme d'interpolation
t = linspace(0,h(1),100);
poly_inter_rec = polyval(coeff_poly_inter_rec,t);
plot(t,poly_inter_rec,'LineWidth',2);

% Ecriture de la légende
legend('Méthode des rectangles',...
     string(coeff_poly_inter_rec(2)) + '  h + ' ...
     + string(coeff_poly_inter_rec(1)),'FontSize',12);
 
% Ecriture du titre et des étiquettes des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour la méthode des rectangles'});

xlabel('pas h');
ylabel('erreur');

%% Tracé et interpolation de l'erreur pour la méthode des trapèzes
figure('Units','centimeters','Position',[22 8 18 12]);
hold all;grid on; grid minor;
plot(h,error_f_trap_h,'sb','MarkerSize',10,'LineWidth',2)

% Détermination du polynome d'interpolation pour la différence finie
% progressive

% Calcul des coefficients du polynôme d'interpolation
coeff_poly_inter_trap = polyfit (h,error_f_trap_h,2);

% Tracé du polynôme d'interpolation
t = linspace(0,h(1),100);
poly_inter_trap = polyval(coeff_poly_inter_trap,t);
plot(t,poly_inter_trap,'LineWidth',2);

% écriture de la légende
legend('Méthode des trapèzes',...
     string(coeff_poly_inter_trap(3)) + '  h^2 + ' ...
     + string(coeff_poly_inter_trap(2)) + '  h + ' ...
     + string(coeff_poly_inter_trap(1)),...
     'Location','southwest','FontSize',12);
 
% titre et étiquette des axes
title({'Variation de l''erreur en fonction du pas h' ;...
    'pour la méthode des trapèzes'});

xlabel('pas h');
ylabel('erreur');
