-- ============================================================================
-- Fichier : 4_interrogation.sql
-- Description : Requêtes d'interrogation couvrant les différents concepts SQL
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. Projections et sélections (Tri, données uniques, masques, IN, BETWEEN)
-- ----------------------------------------------------------------------------

-- 1.1 - Projection, sélection et tri (ORDER BY)
-- Étape 1 : On sélectionne les colonnes C_Nom et C_Prix.
-- Étape 2 : On filtre pour ne garder que les champions de difficulté 3.
-- Étape 3 : On trie le résultat par prix décroissant (du plus cher au moins cher).
SELECT C_Nom, C_Prix 
FROM Champion 
WHERE C_Difficulté = 3 
ORDER BY C_Prix DESC;

-- 1.2 - Données uniques (DISTINCT) et masques (LIKE)
-- Étape 1 : On utilise DISTINCT pour éviter les doublons dans les résultats.
-- Étape 2 : On cible la colonne L_Origine.
-- Étape 3 : Le masque '%a%' filtre les origines contenant la lettre 'a' n'importe où.
SELECT DISTINCT L_Origine 
FROM Lore 
WHERE L_Origine LIKE '%a%';

-- 1.3 - Utilisation de BETWEEN et projection
-- Étape 1 : On choisit les attributs pertinents du monstre (id, HP, Attaque, XP).
-- Étape 2 : L'opérateur BETWEEN sélectionne les monstres dont les HP sont inclus entre 1000 et 2000.
SELECT M_id, M_HP, M_Attaque, M_XP 
FROM Monstre 
WHERE M_HP BETWEEN 1000 AND 2000;

-- 1.4 - Utilisation de IN et tri
-- Étape 1 : On extrait la description et le coût des objets.
-- Étape 2 : L'opérateur IN remplace une suite de OR (I_Cout = 300 OR I_Cout = 400...).
-- Étape 3 : On trie par ordre croissant (ASC est par défaut, mais explicite ici).
SELECT I_Description, I_Cout 
FROM Item 
WHERE I_Cout IN (300, 400, 450) 
ORDER BY I_Cout ASC;

-- 1.5 - Combinaison de masques et opérateurs logiques
-- Étape 1 : On sélectionne le nom du chroma et le prix du skin.
-- Étape 2 : On vérifie que le nom contient "Star" AVEC la clause LIKE.
-- Étape 3 : On ajoute une condition stricte sur le prix (> 1000) liée par l'opérateur AND.
SELECT Sk_Chroma, Sk_Prix 
FROM Skin 
WHERE Sk_Chroma LIKE '%Star%' AND Sk_Prix > 1000;


-- ----------------------------------------------------------------------------
-- 2. Fonctions d'agrégation (GROUP BY et HAVING)
-- ----------------------------------------------------------------------------

-- 2.1 - Agrégation simple (COUNT) avec GROUP BY
-- Étape 1 : On regroupe les données par niveau de difficulté (GROUP BY).
-- Étape 2 : Pour chaque groupe, la fonction COUNT(*) compte le nombre total de lignes (champions).
SELECT C_Difficulté, COUNT(*) AS Nombre_Champions 
FROM Champion 
GROUP BY C_Difficulté;

-- 2.2 - Agrégation (AVG) avec GROUP BY
-- Étape 1 : On regroupe les skins par l'identifiant de leur champion.
-- Étape 2 : La fonction AVG() calcule la moyenne mathématique des prix pour chaque groupe.
SELECT C_id, AVG(Sk_Prix) AS Prix_Moyen_Skins 
FROM Skin 
GROUP BY C_id;

-- 2.3 - GROUP BY avec filtrage HAVING (SUM)
-- Étape 1 : On regroupe les monstres par cycle d'apparition.
-- Étape 2 : On additionne toute l'expérience (SUM) pour chaque cycle.
-- Étape 3 : HAVING filtre les groupes APRÈS le calcul pour ne garder que les totaux > 1000.
SELECT M_Cycle, SUM(M_XP) AS Total_XP 
FROM Monstre 
GROUP BY M_Cycle 
HAVING SUM(M_XP) > 1000;

-- 2.4 - Statistiques multiples (MIN, MAX) avec GROUP BY
-- Étape 1 : On crée des groupes basés sur le cycle du monstre.
-- Étape 2 : On applique MIN() pour trouver la plus petite attaque du groupe.
-- Étape 3 : On applique MAX() pour trouver la plus grande attaque du groupe.
SELECT M_Cycle, MIN(M_Attaque) AS Attaque_Min, MAX(M_Attaque) AS Attaque_Max 
FROM Monstre 
GROUP BY M_Cycle;

-- 2.5 - Comptage conditionnel avec HAVING
-- Étape 1 : On regroupe les sorts par leur nom de classe.
-- Étape 2 : COUNT(So_id) compte le nombre de sorts existants pour cette classe.
-- Étape 3 : HAVING élimine les classes qui ont 2 sorts ou moins.
SELECT Cl_Nom, COUNT(So_id) AS Nombre_Sorts_Assignés 
FROM Sort 
GROUP BY Cl_Nom 
HAVING COUNT(So_id) > 2;


-- ----------------------------------------------------------------------------
-- 3. Jointures internes, externes, simples, multiples
-- ----------------------------------------------------------------------------

-- 3.1 - Jointure interne simple (INNER JOIN)
-- Étape 1 : On relie la table Champion (alias C) à la table Lore (alias L).
-- Étape 2 : La condition de jointure ON vérifie que l'ID du lore correspond dans les deux tables.
-- Résultat : Seules les correspondances parfaites sont affichées.
SELECT C.C_Nom, L.L_Origine 
FROM Champion C
INNER JOIN Lore L ON C.L_id = L.L_id;

-- 3.2 - Jointure interne multiple (3 tables)
-- Étape 1 : On part de la table Champion.
-- Étape 2 : On fait une première jointure avec la table de relation 'Achète' via le C_id.
-- Étape 3 : On fait une seconde jointure avec la table 'Item' via le I_id pour récupérer les infos de l'objet.
SELECT C.C_Nom, I.I_Description, I.I_Cout 
FROM Champion C
INNER JOIN Achète A ON C.C_id = A.C_id
INNER JOIN Item I ON A.I_id = I.I_id;

-- 3.3 - Jointure externe simple (LEFT JOIN)
-- Étape 1 : La table de gauche (Item alias i1) affiche toutes ses lignes.
-- Étape 2 : Le premier LEFT JOIN cherche les correspondances dans la table 'Composé_de'.
-- Étape 3 : Le second LEFT JOIN récupère le nom du composant (Item alias i2). Si l'objet n'a pas de composant, le résultat sera NULL.
SELECT i1.I_Description AS Objet_Final, i2.I_Description AS Objet_Composant
FROM Item i1
LEFT JOIN Composé_de c ON i1.I_id = c.I_id
LEFT JOIN Item i2 ON c.I_id_1 = i2.I_id;

-- 3.4 - Jointure externe droite (RIGHT JOIN)
-- Étape 1 : La table de droite (Lore) est prioritaire, toutes ses lignes s'afficheront.
-- Étape 2 : On relie avec Champion. Si un Lore n'a aucun Champion, la colonne C_Nom affichera NULL.
SELECT C.C_Nom, L.L_Origine 
FROM Champion C
RIGHT JOIN Lore L ON C.L_id = L.L_id;

-- 3.5 - Jointure simple avec condition de filtrage (WHERE)
-- Étape 1 : On joint Champion et Sort pour lier chaque personnage à ses compétences.
-- Étape 2 : On applique un filtre WHERE classique post-jointure pour cibler une tranche de prix précise.
SELECT C.C_Nom, S.So_Texte, S.Cl_Nom 
FROM Champion C
INNER JOIN Sort S ON C.C_id = S.C_id
WHERE C.C_Prix = 6300;


-- ----------------------------------------------------------------------------
-- 4. Requêtes imbriquées avec (NOT) IN, (NOT) EXISTS, ANY, ALL
-- ----------------------------------------------------------------------------

-- 4.1 - Requête imbriquée avec IN
-- Étape 1 (Interne) : Trouver les ID des champions qui ont tué un monstre dont l'XP est > 500.
-- Étape 2 (Externe) : Afficher le nom des champions dont l'ID se trouve dans la liste générée à l'étape 1.
SELECT C_Nom 
FROM Champion 
WHERE C_id IN (
    SELECT C_id 
    FROM Tuer T 
    INNER JOIN Monstre M ON T.M_id = M.M_id 
    WHERE M.M_XP > 500
);

-- 4.2 - Requête imbriquée corrélée avec NOT EXISTS
-- Étape 1 (Interne) : Pour CHAQUE champion de la requête principale, vérifier s'il existe une ligne dans 'Achète'.
-- Étape 2 (Externe) : Ne conserver que les champions pour lesquels la sous-requête ne renvoie AUCUN résultat (NOT EXISTS).
SELECT C_Nom 
FROM Champion C 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Achète A 
    WHERE A.C_id = C.C_id
);

-- 4.3 - Requête imbriquée avec ALL
-- Étape 1 (Interne) : Extraire la liste de tous les coûts des objets donnant de l'armure.
-- Étape 2 (Externe) : Trouver les objets dont le coût est strictement supérieur au plus grand coût de la liste générée (condition ALL).
SELECT I_Description, I_Cout 
FROM Item 
WHERE I_Cout > ALL (
    SELECT I_Cout 
    FROM Item 
    WHERE I_Stat LIKE '%Armor%'
);

-- 4.4 - Requête imbriquée avec ANY
-- Étape 1 (Interne) : Obtenir la liste des points de vie (HP) de tous les monstres du cycle 3.
-- Étape 2 (Externe) : Trouver les monstres dont les HP sont supérieurs à au moins UNE des valeurs de la liste précédente (condition ANY).
SELECT M_id, M_HP, M_Cycle 
FROM Monstre 
WHERE M_HP > ANY (
    SELECT M_HP 
    FROM Monstre 
    WHERE M_Cycle = 3
);

-- 4.5 - Requête imbriquée avec NOT IN
-- Étape 1 (Interne) : Lister toutes les classes (Cl_Nom) actuellement attribuées à des sorts.
-- Étape 2 (Externe) : Extraire de la table 'Classe' celles qui NE SONT PAS dans cette liste (classes inutilisées).
SELECT Cl_Nom 
FROM Classe 
WHERE Cl_Nom NOT IN (
    SELECT Cl_Nom 
    FROM Sort 
    WHERE Cl_Nom IS NOT NULL
);