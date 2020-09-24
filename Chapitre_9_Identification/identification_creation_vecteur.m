
%--------------------------------------------------------------  
    clc %efface la fenêtre de commande

%-------------------------------------------------------------- 


load ('Reponse_indicielle.txt') % On charge le fichier texte



t = Reponse_indicielle(:,1); %On crée le vecteur colonne t : temps
x = Reponse_indicielle(:,3); %On crée le vecteur colonne x : position réelle
v= Reponse_indicielle(:,9); %On crée le vecteur colonne v : vitesse réelle
u= Reponse_indicielle(:,7); %On crée le vecteur colonne u : tension moteur

%visualisation des données

figure;
subplot(2,1,1);
plot(t,u,'LineWidth',2);
grid on;
title('grandeur d''entree: tension moteur')


subplot(2,1,2);
plot(t,v,'r','LineWidth',2);
grid on;
title('grandeur de sortie: vitesse linéaire de l''axe')

%% Création d'un élément iddata pour l'identification par ligne de commande
mydata=iddata(v,u,0.01);

% Identification par une fonction de transfert avec 2 pôle et 0 zéro
sys = tfest(mydata,2,0)




