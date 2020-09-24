%% Transformée  inverse de Laplace d'une expression
syms t;
syms w;
syms a;

%% Transformée inverse de Laplace d'une expression
syms s
ilaplace(s/(s^2 + w^2))
ilaplace(3/(2+s)-5/(3+s)^2)

