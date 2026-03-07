CREATE DATABASE ProjetSQL_EZBEN;
use ProjetSQL_EZBEN;

-- Les tables qui sont sans clés étrangères
CREATE TABLE Item (
	I_id INT PRIMARY KEY,
    I_description VARCHAR(50),
    I_Cout INT,
    I_Stat VARCHAR(50)
);

CREATE TABLE Lore (
	L_id INT PRIMARY KEY,
    L_Origine VARCHAR(50),
    L_Cinématique VARCHAR(50)
);

CREATE TABLE Monstre (
	M_id INT PRIMARY KEY,
    M_HP INT,
    M_Attaque INT,
    M_XP INT,
    M_Cycle INT,
    M_Argent INT
);

CREATE TABLE Classe (
	Cl_Nom VARCHAR(50) PRIMARY KEY
);

-- Pour les tables avec des clés étrangères on ajoute des contraintes d'intégrité avec les 'ON UPDATE CASCADE' et 'ON DELETE CASCADE'
CREATE TABLE Champion (
	C_id INT PRIMARY KEY,
    C_Nom VARCHAR(50),
    C_Difficulté INT,
    C_Prix INT,
    L_id INT,
    FOREIGN KEY (L_id) REFERENCES Lore(L_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Skin (
	C_id INT,
    SK_ID INT,
    SK_Chrome VARCHAR(50),
    Sk_Prix INT,
    PRIMARY KEY (C_id, Sk_id),
    FOREIGN KEY (C_id) REFERENCES Champion(C_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE Sort (
	So_id INT PRIMARY KEY,
    So_Texte VARCHAR(50),
    So_Ratio VARCHAR(50),
    So_Recharge INT,
    C_id INT,
    Cl_nom VARCHAR(50),
    FOREIGN KEY (C_id) REFERENCES Champion(C_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (Cl_nom) REFERENCES Classe(Cl_nom)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

-- Sur cette partie on est au niveau des tables d'associations
CREATE TABLE Composé_de (
	I_id INT,
    I_id_1 INT,
    PRIMARY KEY (I_id, I_id_1),
    FOREIGN KEY (I_id) REFERENCES Item(I_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (I_id_1) REFERENCES Item(I_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE Tuer (
	C_id INT,
    M_id INT,
    PRIMARY KEY (C_id, M_id),
    FOREIGN KEY (C_id) REFERENCES Champion(C_id)
    ON UPDATE CASCADE 
    ON DELETE CASCADE,
    FOREIGN KEY (M_id) REFERENCES Monstre(M_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE Achète (
	C_id INT,
    I_id INT,
    PRIMARY KEY (C_id, I_id),
    FOREIGN KEY (C_id) REFERENCES Champion(C_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (I_id) REFERENCES Item(I_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);