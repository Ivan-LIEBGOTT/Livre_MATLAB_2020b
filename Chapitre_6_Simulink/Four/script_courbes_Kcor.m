close all;
figure;
hold all;
grid on;
% pour Kp variant de 1 � 10 avec un pas de 1 (valeur par d�faut du pas)
% ex�cute la simulation du fichier simulink four_import
% trace la temp�rature en fonction du temps
for Kp=1:10
    sim('four_export');
    plot(t,Tf,'LineWidth',2);
end
