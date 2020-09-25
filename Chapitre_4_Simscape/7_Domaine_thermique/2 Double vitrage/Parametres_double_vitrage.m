% Param�tres dimensionnels
A = 2 ; %surface de la vitre en m2

% Dimensions de la pi�ce int�rieure en m
S = 60;  h = 2.5;

% Volume d'air contenu dans la pi�ce
Vair = S * h;

% Epaisseur des diff�rentes couches
ev = 8; % �paisseur de la couche de verre en mm
ea = 10; % �paisseur de la couche d'argon en mm

% Caract�ristiques des mat�riaux des diff�rentes couches
% Masse volumique en kg/m3
pv = 2530;    % verre
pa = 1.784;   % argon
pair = 1.225; % air

% Chaleur sp�cifique en J/kg/K
cv = 720; ca = 320; cair = 1030;

% Masse des couches de la paroi en kg
Mv = pv * A * ev * 1e-3; 
Ma = pa * A * ea * 1e-3;

% Masse de l'air contenu dans la pi�ce
Mair = pair * Vair; 

% Conductivit� thermique en W/(K.m)
lam_v = 1; lam_a = 0.018; lam_air = 0.025;

% Coefficients de transfert thermique par convection en W/(m2.K)
ksi = 7.7; % entre int�rieur et paroi vitr�e
kse = 25;  % entre ext�rieur et paroi vitr�e

% Temp�rature en degr�s Celsius
T_int = 20;  % temp�rature int�rieure 
T_ext = 10;  % Temp�rature ext�rieure

