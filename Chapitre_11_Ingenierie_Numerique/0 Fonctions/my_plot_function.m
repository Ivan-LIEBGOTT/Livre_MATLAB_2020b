%% my_plot_function.m
% Ivan LIEBGOTT @ Novembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Trace une courbe avec une mise en forme pr�d�finie
% 
% my_plot_function(a,b,nb_points,f,titre,Xtitle,Ytitle)
% 
% a : limite inf�rieure pour les abscisses
% b : limite sup�rieure pour les abscisses
% nb_points : nombres de points � calculer pour le trac�
% f : fonction � tracer
% titre: titre du graphique
% Xtitle: titre de l'axe des abscisses
% Ytitle: titre de l'axe des ordonn�es

function my_plot_function(a,b,nb_points,f,titre,Xtitle,Ytitle)
% Cr�ation d'une fen�tre graphique
figure;
% cr�ation du vecteur des temps 
t = [a:(b-a)/nb_points:b];
% trac� de la courbe et utilisation de la fonction prise en argument
plot(t,f(t),'LineWidth',2);
%g�n�ration de la grille
grid on;
grid minor;
% titre et �tiquette des axes
title(titre,'Color','red');
xlabel(Xtitle,'Color','blue');
ylabel(Ytitle,'Color','blue');
% sp�cification des limites sur l'axe des abscisses
xlim([a,b]);
% sp�cification des limites sur l'axe des ordonn�e
% axis donne les limites ymin et ymax
% les limites sur l'axe des ordonn�es sont fix�es � 20% au dessus des
% valeurs mini et maxi de la courbe
l = axis;
ymin = l(3); ymax = l(4);
ylim([1.2*ymin,1.2*ymax]);
end



