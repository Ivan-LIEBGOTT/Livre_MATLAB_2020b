%% Loi_en_trapeze_de_vitesse.m
% Ivan LIEBGOTT @ décembre 2019
% Modélisation et Simulation des Systèmes Multi-Physiques
% avec MATLAB - Simulink
% Calcul l'intégrale d'une fonction par la méthode des trapèzes
% Un relevé expérimental donne l'accélération en mm/s2 en fonction du
% temps. En utilisant l'intégration par la méthode des trapèzes, on calcule
% la vitesse et la position.
% les trois courbes sont tracées dans la même fenêtre graphique

% chargement des mesures de l'accélération
clear all;
load loi_en_trapeze_de_vitesse_data.mat

%% Calcul de la vitesse par intégration de l'acceleration

% définition des conditions initiale de la vitesse
vitesse(1) = 0;

% La boucle va ajouter l'aire des trapèzes pour chaque intervalle 
% d'amplitude h = t(k-1)-t(k) 
for k = [2:1:length(t)]
    % calcul du pas d'intégration
    h = t(k) - t(k-1);
    
    % construction du vecteur contenant les valeur de la vitesse en
    % utilisant la méthode des trapèzes
    vitesse(k) = vitesse(k-1) + (acceleration(k)+acceleration(k-1)) * h/2;
end

%% Calcul de la position par intégration de la vitesse

% définition des conditions initiale de la vitesse
position(1) = 0;

% La boucle va ajouter l'aire des trapèzes pour chaque intervalle 
% d'amplitude h = t(k-1)-t(k) 
for k = [2:1:length(t)]
    % calcul du pas d'intégration
    h = t(k) - t(k-1);
    
    % construction du vecteur contenant les valeur de la vitesse en
    % utilisant la méthode des trapèzes
    position(k) = position(k-1) + (vitesse(k)+vitesse(k-1)) * h/2;
end

% Tracé des trois courbes dans la même fenêtre graphique
figure('Units','centimeters','Position',[2 8 25 20]);
subplot(3,1,1);
plot(t,acceleration);
grid on; grid minor;
xlabel('temps en s');
ylabel('accélération en mm/s^2')
title('Mesure de l''accélération du chariot en fonction du temps en mm/s^2')

subplot(3,1,2);
plot(t,vitesse);
grid on; grid minor;
xlabel('temps en s');
ylabel('vitesse en mm/s')
title({'Vitesse du chariot en fonction du temps en mm/s',...
    'obtenue par intégration numérique'})

subplot(3,1,3);
plot(t,position);
grid on; grid minor;
xlabel('temps en s');
ylabel('Position en mm')
title({'Position du chariot en fonction du temps en mm',...
    'obtenue par intégration numérique'});

xlabel('temps en s');
ylabel('Position en mm')
title({'Position du chariot en fonction du temps en mm',...
    'obtenue par intégration numérique'});

