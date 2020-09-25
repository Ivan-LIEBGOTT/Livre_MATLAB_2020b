% Paramètres dimensionnels
A = 2 ; %surface de la vitre en m2

% Dimensions de la pièce intérieure en m
S = 60;  h = 2.5;

% Volume d'air contenu dans la pièce
Vair = S * h;

% Epaisseur des différentes couches
ev = 8; % épaisseur de la couche de verre en mm
ea = 10; % épaisseur de la couche d'argon en mm

% Caractéristiques des matériaux des différentes couches
% Masse volumique en kg/m3
pv = 2530;    % verre
pa = 1.784;   % argon
pair = 1.225; % air

% Chaleur spécifique en J/kg/K
cv = 720; ca = 320; cair = 1030;

% Masse des couches de la paroi en kg
Mv = pv * A * ev * 1e-3; 
Ma = pa * A * ea * 1e-3;

% Masse de l'air contenu dans la pièce
Mair = pair * Vair; 

% Conductivité thermique en W/(K.m)
lam_v = 1; lam_a = 0.018; lam_air = 0.025;

% Coefficients de transfert thermique par convection en W/(m2.K)
ksi = 7.7; % entre intérieur et paroi vitrée
kse = 25;  % entre extérieur et paroi vitrée

% Température en degrés Celsius
T_int = 20;  % température intérieure 
T_ext = 10;  % Température extérieure

