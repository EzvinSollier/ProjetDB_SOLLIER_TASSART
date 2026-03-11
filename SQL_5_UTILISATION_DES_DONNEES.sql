-- 1er point :

-- Vérifier le prix des champions les plus difficiles à jouer (C_Difficulté = 3), triés par prix décroissant.
SELECT C_Nom, C_Prix FROM Champion WHERE C_Difficulté = 3 ORDER BY C_Prix DESC;

-- Extraire de manière unique les régions du lore contenant la lettre 'a' pour préparer un événement narratif ciblé.
SELECT DISTINCT L_Origine FROM Lore WHERE L_Origine LIKE '%a%';

-- Analyser les statistiques des monstres de "mid-game" dont les points de vie sont compris entre 1000 et 2000.
SELECT M_id, M_HP, M_Attaque, M_XP FROM Monstre WHERE M_HP BETWEEN 1000 AND 2000;

-- Contrôler le coût des items de départ (300, 400 ou 450 pièces d'or), triés du moins cher au plus cher.
SELECT I_Description, I_Cout FROM Item WHERE I_Cout IN (300, 400, 450) ORDER BY I_Cout ASC;

-- Cibler les skins haut de gamme de la thématique "Star" coûtant plus de 1000 pièces pour une campagne promotionnelle.
SELECT Sk_Chroma, Sk_Prix FROM Skin WHERE Sk_Chroma LIKE '%Star%' AND Sk_Prix > 1000;


-- 2e point :

-- Compter le nombre de champions disponibles pour chaque niveau de difficulté afin de s'assurer que le jeu reste accessible aux débutants.
SELECT C_Difficulté, COUNT(*) AS Nombre_Champions FROM Champion GROUP BY C_Difficulté;

-- Calculer le prix moyen des skins pour chaque champion afin d'identifier les personnages qui sont trop cher.
SELECT C_id, AVG(Sk_Prix) AS Prix_Moyen_Skins FROM Skin GROUP BY C_id;

-- Identifier les cycles de monstres qui rapportent un total d'expérience (XP) cumulé supérieur à 1000 pour équilibrer le "farming".
SELECT M_Cycle, SUM(M_XP) AS Total_XP FROM Monstre GROUP BY M_Cycle HAVING SUM(M_XP) > 1000;

-- Trouver l'attaque minimale et maximale des monstres pour chaque cycle afin d'ajuster les dégâts subis par les joueurs.
SELECT M_Cycle, MIN(M_Attaque) AS Attaque_Min, MAX(M_Attaque) AS Attaque_Max FROM Monstre GROUP BY M_Cycle;

-- Déterminer quelles classes possèdent plus de 2 sorts enregistrés dans la base pour éviter de surcharger certaines mécaniques de jeu.
SELECT Cl_Nom, COUNT(So_id) AS Nombre_Sorts_Assignés FROM Sort GROUP BY Cl_Nom HAVING COUNT(So_id) > 2;


-- 3e point :

-- (Jointure Interne) Associer chaque champion à sa région d'origine dans le lore pour les descriptions de l'interface utilisateur.
SELECT C.C_Nom, L.L_Origine FROM Champion C INNER JOIN Lore L ON C.L_id = L.L_id;

-- (Jointure Multiple) Afficher les objets (et leur coût) achetés par chaque champion pour analyser la "méta" actuelle et les inventaires favoris.
SELECT C.C_Nom, I.I_Description, I.I_Cout 
FROM Champion C 
INNER JOIN Achète A ON C.C_id = A.C_id 
INNER JOIN Item I ON A.I_id = I.I_id;

-- (Jointure Externe - Left) Reconstruire l'arbre de création des objets en affichant l'objet final et ses éventuels composants.
SELECT i1.I_Description AS Objet_Final, i2.I_Description AS Objet_Composant 
FROM Item i1 
LEFT JOIN Composé_de c ON i1.I_id = c.I_id 
LEFT JOIN Item i2 ON c.I_id_1 = i2.I_id;

-- (Jointure Externe - Right) Vérifier toutes les régions du Lore, y compris celles qui n'ont pas encore de champion associé.
SELECT C.C_Nom, L.L_Origine FROM Champion C RIGHT JOIN Lore L ON C.L_id = L.L_id;

-- (Jointure Interne avec Condition) Extraire les sorts et la classe associés uniquement aux champions coûtant le prix maximum (6300).
SELECT C.C_Nom, S.So_Texte, S.Cl_Nom FROM Champion C INNER JOIN Sort S ON C.C_id = S.C_id WHERE C.C_Prix = 6300;

-- 4e point :

-- (IN) Trouver les champions capables de tuer des monstres d'élite (qui rapportent plus de 500 XP).
SELECT C_Nom FROM Champion 
WHERE C_id IN (
    SELECT T.C_id 
    FROM Tuer T 
    INNER JOIN Monstre M ON T.M_id = M.M_id 
    WHERE M.M_XP > 500
);

-- (NOT EXISTS) Identifier les champions qui n'ont effectué aucun achat d'objet dans la base (builds manquants à corriger).
SELECT C_Nom FROM Champion C 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Achète A 
    WHERE A.C_id = C.C_id
);

-- (ALL) Chercher les objets de "luxe" dont le coût est strictement supérieur à tous les objets conférant de l'Armure (Armor).
SELECT I_Description, I_Cout FROM Item 
WHERE I_Cout > ALL (
    SELECT I_Cout 
    FROM Item 
    WHERE I_Stat LIKE '%Armor%'
);

-- (ANY) Trouver les "Boss" ou monstres qui ont plus de points de vie que n'importe quel monstre appartenant au cycle 3.
SELECT M_id, M_HP, M_Cycle FROM Monstre 
WHERE M_HP > ANY (
    SELECT M_HP 
    FROM Monstre 
    WHERE M_Cycle = 3
);

-- (NOT IN) Trouver les classes (Cl_Nom) qui sont déclarées dans la table Classe mais qui n'ont aucun sort qui leur est attribué.
SELECT Cl_Nom FROM Classe 
WHERE Cl_Nom NOT IN (
    SELECT Cl_Nom 
    FROM Sort 
    WHERE Cl_Nom IS NOT NULL
);
