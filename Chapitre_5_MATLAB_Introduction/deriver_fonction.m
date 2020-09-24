%% dériver une fonction 
%définition de t comme une variable symbolique
syms t
%définition de la fonction à dériver
f=sin(t)+3*t^3;

%calcul de la dérivée première
df=diff(f,t)

%calcul de la dérivée cinquième
d5f=diff(f,t,5)


