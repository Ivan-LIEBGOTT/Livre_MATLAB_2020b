%défintion de x comme une variable symbolique
syms x
%% %résolution d'une equation algébrique

%définition de l'équation à résoudre
equation= x^2+2*x-3==0;
%Résolution de l'équation
solution=solve(equation,x);

disp('La première racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))