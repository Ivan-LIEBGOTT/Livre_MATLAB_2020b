%% Loi_en_trapeze_de_vitesse.m
% Ivan LIEBGOTT @ d�cembre 2019
% Mod�lisation et Simulation des Syst�mes Multi-Physiques
% avec MATLAB - Simulink
% Calcul l'int�grale d'une fonction par la m�thode des trap�zes
% Un relev� exp�rimental donne l'acc�l�ration en mm/s2 en fonction du
% temps. En utilisant l'int�gration par la m�thode des trap�zes, on calcule
% la vitesse et la position.
% les trois courbes sont trac�es dans la m�me fen�tre graphique

% chargement des mesures de l'acc�l�ration
clear all;
load loi_en_trapeze_de_vitesse_data.mat

%% Calcul de la vitesse par int�gration de l'acceleration

% d�finition des conditions initiale de la vitesse
vitesse(1) = 0;

% La boucle va ajouter l'aire des trap�zes pour chaque intervalle 
% d'amplitude h = t(k-1)-t(k) 
for k = [2:1:length(t)]
    % calcul du pas d'int�gration
    h = t(k) - t(k-1);
    
    % construction du vecteur contenant les valeur de la vitesse en
    % utilisant la m�thode des trap�zes
    vitesse(k) = vitesse(k-1) + (acceleration(k)+acceleration(k-1)) * h/2;
end

%% Calcul de la position par int�gration de la vitesse

% d�finition des conditions initiale de la vitesse
position(1) = 0;

% La boucle va ajouter l'aire des trap�zes pour chaque intervalle 
% d'amplitude h = t(k-1)-t(k) 
for k = [2:1:length(t)]
    % calcul du pas d'int�gration
    h = t(k) - t(k-1);
    
    % construction du vecteur contenant les valeur de la vitesse en
    % utilisant la m�thode des trap�zes
    position(k) = position(k-1) + (vitesse(k)+vitesse(k-1)) * h/2;
end

% Trac� des trois courbes dans la m�me fen�tre graphique
figure('Units','centimeters','Position',[2 8 25 20]);
subplot(3,1,1);
plot(t,acceleration);
grid on; grid minor;
xlabel('temps en s');
ylabel('acc�l�ration en mm/s^2')
title('Mesure de l''acc�l�ration du chariot en fonction du temps en mm/s^2')

subplot(3,1,2);
plot(t,vitesse);
grid on; grid minor;
xlabel('temps en s');
ylabel('vitesse en mm/s')
title({'Vitesse du chariot en fonction du temps en mm/s',...
    'obtenue par int�gration num�rique'})

subplot(3,1,3);
plot(t,position);
grid on; grid minor;
xlabel('temps en s');
ylabel('Position en mm')
title({'Position du chariot en fonction du temps en mm',...
    'obtenue par int�gration num�rique'});

xlabel('temps en s');
ylabel('Position en mm')
title({'Position du chariot en fonction du temps en mm',...
    'obtenue par int�gration num�rique'});

