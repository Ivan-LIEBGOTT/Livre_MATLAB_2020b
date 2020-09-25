% Paramètres dimensionnels
h = 6; %hauteur del a paroi en m
L = 10; %largeur de la paroi en m
S = h*L; %surface de la paroi en m2

% Epaisseur des différentes couches de la paroi en cm
e1 = 1;  e2 = 30;  e3 = 10;

% Caractéristiques des matériaux des différentes couches
% Masse volumique en kg/m3
p1 = 1800;  p2 = 2500; p3 = 20;

% Masse des couches de la paroi en kg
m1 = p1*e1*1e-2*S; m2 = p2*e2*1e-2*S; m3 = p3*e3*1e-2*S;

% Conductivité thermique en W/(K.m)
lam_1 = 1.15; lam_2 = 1.75; lam_3 = 0.032;

% Chaleur spécifique en J/kg/K
c1 = 864; c2 = 880; c3 = 1030;

% Coefficients de transfert thermique par convection en W/(m2.K)
ksi = 7.7; kse = 25;

% Température en degrés Celsius
T_int = 20;  % température intérieure 
T_ext = 5;  % Température extérieure

