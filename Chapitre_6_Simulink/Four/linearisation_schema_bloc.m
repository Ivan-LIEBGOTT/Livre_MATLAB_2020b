% affectation dans une variable du nom du fichier contenant le schéma bloc
% à linéariser
model = 'four_linearisation';
% récupération des points de linéarisation
io = getlinio(model);

% création de la fonction de transfert à partir des points de linéarisation
FTBO = tf(linearize(model,io));

% tracé du diagramme de BOde en boucle ouverte
bode(FTBO);
grid on;
