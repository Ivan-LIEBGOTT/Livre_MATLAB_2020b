%% my_plot_function.m
% Ivan LIEBGOTT @ Novembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Trace une courbe avec une mise en forme prédéfinie
% 
% my_plot_function(a,b,nb_points,f,titre,Xtitle,Ytitle)
% 
% a : limite inférieure pour les abscisses
% b : limite supérieure pour les abscisses
% nb_points : nombres de points à calculer pour le tracé
% f : fonction à tracer
% titre: titre du graphique
% Xtitle: titre de l'axe des abscisses
% Ytitle: titre de l'axe des ordonnées

function my_plot_function(a,b,nb_points,f,titre,Xtitle,Ytitle)
% Création d'une fenêtre graphique
figure;
% création du vecteur des temps 
t = [a:(b-a)/nb_points:b];
% tracé de la courbe et utilisation de la fonction prise en argument
plot(t,f(t),'LineWidth',2);
%génération de la grille
grid on;
grid minor;
% titre et étiquette des axes
title(titre,'Color','red');
xlabel(Xtitle,'Color','blue');
ylabel(Ytitle,'Color','blue');
% spécification des limites sur l'axe des abscisses
xlim([a,b]);
% spécification des limites sur l'axe des ordonnée
% axis donne les limites ymin et ymax
% les limites sur l'axe des ordonnées sont fixées à 20% au dessus des
% valeurs mini et maxi de la courbe
l = axis;
ymin = l(3); ymax = l(4);
ylim([1.2*ymin,1.2*ymax]);
end



