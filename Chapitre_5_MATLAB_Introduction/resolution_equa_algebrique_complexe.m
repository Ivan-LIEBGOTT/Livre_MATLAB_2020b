%d�fintion de x comme une variable symbolique
syms x
%% %r�solution d'une equation alg�brique (racines complexes)

%d�finition de l'�quation � r�soudre
equation= x^2+2*x+5==0;
%R�solution de l'�quation
solution=solve(equation,x);

disp('La premi�re racine est:'),disp (solution(1))
disp('La seconde racine est:'),disp (solution(2))


