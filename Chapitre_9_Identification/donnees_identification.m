
%--------------------------------------------------------------  
    clc %efface la fen�tre de commande

%-------------------------------------------------------------- 


load ('Reponse_indicielle.txt') % On charge le fichier texte

t = Reponse_indicielle(:,1); %On cr�e le vecteur colonne t : temps
x = Reponse_indicielle(:,3); %On cr�e le vecteur colonne x : position r�elle
v= Reponse_indicielle(:,9); %On cr�e le vecteur colonne v : vitesse r�elle
u= Reponse_indicielle(:,7); %On cr�e le vecteur colonne u : tension moteur

%visualisation des donn�es
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
title('grandeur de sortie: vitesse lin�aire de l''axe en mm/s')

