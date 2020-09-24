x = [-5:0.01:5];
a = 1;
b = 0;
c = -3;

plot(x,my_5_function(x,a,b,c));
grid on;
grid minor;

racine1 = fzero(@(x)my_5_function(x,a,b,c),2);
racine2 = fzero(@(x)my_5_function(x,a,b,c),-2);

disp(racine1)
disp(racine2)







