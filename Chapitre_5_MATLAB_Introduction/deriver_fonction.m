%% d�river une fonction 
%d�finition de t comme une variable symbolique
syms t
%d�finition de la fonction � d�river
f=sin(t)+3*t^3;

%calcul de la d�riv�e premi�re
df=diff(f,t)

%calcul de la d�riv�e cinqui�me
d5f=diff(f,t,5)


