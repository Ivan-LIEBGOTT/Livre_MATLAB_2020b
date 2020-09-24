
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
subplot(2,1,2);
plot(t,u,'LineWidth',2);
xlabel('temps en s')
grid on;
title('grandeur d''entree: tension moteur en V')


subplot(2,1,1);
plot(t,v,'r','LineWidth',2);
xlabel('temps en s')
grid on;
title('grandeur de sortie: vitesse linéaire de l''axe en mm/s')

