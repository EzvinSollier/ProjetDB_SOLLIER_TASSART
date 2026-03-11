PARTIE 1 :

Voici le prompt utilisé par l'IA pour avoir les donnnees des différents tableaux :

" Fournis une base de données brutes qui respecte le modèle suivant 

(
1. Champion : 4
2. Skin : 3
3. Classe : 1
4. Sort : 4
5. Lore : 3
6. Monstre : 6
7. Item : 4)

Regroupées dans un tableau. Il doit y avoir entre 25 et 35 données par entité. 
De plus crée les différentes colonnes des bases de données pour en respectant 
les chiffres en fassent des differents bases de données (Exemple : pour 3 tu dois fournir 
3 données pertinentes pour cette tables). Pour remplir ce tableau tu dois aller 
chercher les informations sur Internet. "
(Plus une capture d'ecran du fichier MCD).


Voici les liens des tableaux excel ou toutes les données ont été générées par IA suite au prompt :

Classe : https://docs.google.com/spreadsheets/d/1-6iIFrhHvyVGu0bAVz21DwWlgtQTR7xlmfrHRINegrw/edit?usp=sharing

Lore : https://docs.google.com/spreadsheets/d/1eGyKXYrTrB6i4Pf6X43R4IfnDv97PHDxgGHSAF55R0c/edit?usp=sharing

Monstre : https://docs.google.com/spreadsheets/d/1Mq6bZv3nP2Qwl1qt97nogRgrfOlN7iA_mc7TjZKtNUE/edit?usp=sharing

Item : https://docs.google.com/spreadsheets/d/18xGnVijer7EQE6EaUKDneU_P5yFITT6piEwc7GqO4FI/edit?usp=sharing

Sort : https://docs.google.com/spreadsheets/d/1wwzojVJd8y8Xm6NhZrI-GgasUqCyejGUEOPS8zhSPjY/edit?usp=sharing

Skin : https://docs.google.com/spreadsheets/d/1HG-t46yEeQDXxLyWAH9sPjCkiJdGEsZ0UimtUVYj3ac/edit?usp=sharing

Champion : https://docs.google.com/spreadsheets/d/1KqssiYngF3adlSGVDUCOIjxOYNDjiz-0Vh-IkKDDcSc/edit?usp=sharing


Image du MCD : 
<img width="1502" height="876" alt="image" src="https://github.com/user-attachments/assets/a5afd965-877a-438a-bc95-aa7dd3dd2226" />





Image du MLD : 
<img width="1056" height="454" alt="image" src="https://github.com/user-attachments/assets/d6c10213-748c-4a77-ac2c-d9af3df754a6" />


Partie 2 : 

Partie 4

Voici le prompt utilisé : 

Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant : Selon l'image joint.
Les clés primaires correspondent aux id, sauf si autre chose est précisé (quand c'est un attribut composé) les clés étrangères sont identifiées comme si c'était du SQL, et ont le même nom que les clés primaires auxquelles elles font référence.
Donne environ 50 lignes par table.
Les clés étrangères doivent faire référence aux clés primaires existantes : donne les lignes en commençant par remplir les tables dans lesquelles il n'y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font références à des clés primaires des tables déjà remplies. 

Fournis l'ensemble sous la forme d’un script SQL prêt à être exécuté.

Partie 5

Contexte de l'entreprise : Notre base de données gère les informations fondamentales d'un jeu vidéo de type MOBA (arène de bataille en ligne multijoueur), incluant les champions, leurs statistiques, les objets en boutique, les monstres présents sur la carte et le lore de l'univers.

Rôles des Utilisateurs : Ce scénario met en scène deux départements distincts au sein du studio de développement :

L'Équipe de Game Design (Équilibrage) : Chargée de s'assurer que le jeu est équitable, que la courbe de difficulté est bonne et que l'économie en jeu (or et expérience) est saine.

L'Équipe de Monétisation & Marketing : Chargée d'analyser les prix des champions et des skins pour préparer les prochaines promotions et événements narratifs.

Objectif principal :
Extraire des statistiques ciblées sur l'état actuel du jeu pour décider des ajustements (buffs/nerfs) du prochain patch et planifier la prochaine campagne promotionnelle.

