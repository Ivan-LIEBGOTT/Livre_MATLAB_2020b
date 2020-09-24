%défintion de x comme une variable symbolique
syms x
%% développer une expression
expr1=(x-8)*(x+2)^2
expand(expr1)

%% factoriser une expression
expr2=x^3 - 4*x^2 - 28*x - 32
factor(expr2,x)
