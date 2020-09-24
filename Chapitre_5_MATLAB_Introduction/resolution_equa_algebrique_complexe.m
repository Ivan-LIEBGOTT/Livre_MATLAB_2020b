%défintion de x comme une variable symbolique
syms x
%% %résolution d'une equation algébrique (racines complexes)

%définition de l'équation à résoudre
equation= x^2+2*x+5==0;
%Résolution de l'équation
solution=solve(equation,x);

disp('La première racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))


