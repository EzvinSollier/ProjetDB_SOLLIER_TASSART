
SELECT C_Nom, C_Prix FROM Champion WHERE C_Difficulté = 3 ORDER BY C_Prix DESC;

SELECT DISTINCT L_Origine FROM Lore WHERE L_Origine LIKE '%a%';

SELECT M_id, M_HP, M_Attaque, M_XP FROM Monstre WHERE M_HP BETWEEN 1000 AND 2000;

SELECT I_Description, I_Cout FROM Item WHERE I_Cout IN (300, 400, 450) ORDER BY I_Cout ASC;

SELECT Sk_Chroma, Sk_Prix FROM Skin WHERE Sk_Chroma LIKE '%Star%' AND Sk_Prix > 1000;


SELECT C_Difficulté, COUNT(*) AS Nombre_Champions FROM Champion GROUP BY C_Difficulté;

SELECT C_id, AVG(Sk_Prix) AS Prix_Moyen_Skins FROM Skin GROUP BY C_id;

SELECT M_Cycle, SUM(M_XP) AS Total_XP FROM Monstre GROUP BY M_Cycle HAVING SUM(M_XP) > 1000;

SELECT M_Cycle, MIN(M_Attaque) AS Attaque_Min, MAX(M_Attaque) AS Attaque_Max FROM Monstre GROUP BY M_Cycle;

SELECT Cl_Nom, COUNT(So_id) AS Nombre_Sorts_Assignés FROM Sort GROUP BY Cl_Nom HAVING COUNT(So_id) > 2;


SELECT C.C_Nom, L.L_Origine FROM Champion CINNER JOIN Lore L ON C.L_id = L.L_id;

SELECT C.C_Nom, I.I_Description, I.I_Cout FROM Champion CINNER JOIN Achète A ON C.C_id = A.C_id INNER JOIN Item I ON A.I_id = I.I_id;

SELECT i1.I_Description AS Objet_Final, i2.I_Description AS Objet_ComposantFROM Item i1 LEFT JOIN Composé_de c ON i1.I_id = c.I_id LEFT JOIN Item i2 ON c.I_id_1 = i2.I_id;

SELECT C.C_Nom, L.L_Origine FROM Champion C RIGHT JOIN Lore L ON C.L_id = L.L_id;

SELECT C.C_Nom, S.So_Texte, S.Cl_Nom FROM Champion C INNER JOIN Sort S ON C.C_id = S.C_id WHERE C.C_Prix = 6300;

SELECT C_Nom FROM Champion 
WHERE C_id IN (
    SELECT C_id 
    FROM Tuer T 
    INNER JOIN Monstre M ON T.M_id = M.M_id 
    WHERE M.M_XP > 500
);

SELECT C_Nom FROM Champion C 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Achète A 
    WHERE A.C_id = C.C_id
);

SELECT I_Description, I_Cout FROM Item 
WHERE I_Cout > ALL (
    SELECT I_Cout 
    FROM Item 
    WHERE I_Stat LIKE '%Armor%'
);

SELECT M_id, M_HP, M_Cycle FROM Monstre 
WHERE M_HP > ANY (
    SELECT M_HP 
    FROM Monstre 
    WHERE M_Cycle = 3
);

SELECT Cl_Nom FROM Classe 
WHERE Cl_Nom NOT IN (
    SELECT Cl_Nom 
    FROM Sort 
    WHERE Cl_Nom IS NOT NULL
);