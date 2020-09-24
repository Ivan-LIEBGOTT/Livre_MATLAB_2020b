% fermeture de toutes les fenêtres graphiqes en cours
close all;

% création des vecteurs X et Y
X = [0 10 20 30 40];
Y = [2 5 12 25 46];

% création du vecteur A qui contient les coeeficients du polynôme
% d'interpolation de degrés 2 de la série de données
A = polyfit(X,Y,2);

% Création du vecteur t contenant 100 composantes prises entre X(1) et
% X(end)
t = linspace(X(1),X(end),100);

% création du vecteur U qui contient 100 éléments correspondants aux
% valeurs du polynôme d'interpolation pour les 100 éléments du vecteur t
U = polyval(A,t);

% tracé dy polynôme d'interpolation
plot(t,U,'g','LineWidth',3);
hold on;

%tracé des points Y en fonction de X, la commande MarkerSize permet de
%spécifier la taille des marqueurs
plot(X,Y,'r.','MarkerSize',25);
grid on;

% titre
title('Interpolation d''une série de données');