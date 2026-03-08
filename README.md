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

Voici le prompt utilisé : 

Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant : Selon l'image joint.
Les clés primaires correspondent aux id, sauf si autre chose est précisé (quand c'est un attribut composé) les clés étrangères sont identifiées comme si c'était du SQL, et ont le même nom que les clés primaires auxquelles elles font référence.
Donne environ 50 lignes par table.
Les clés étrangères doivent faire référence aux clés primaires existantes : donne les lignes en commençant par remplir les tables dans lesquelles il n'y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font références à des clés primaires des tables déjà remplies. 

Fournis l'ensemble sous la forme d’un script SQL prêt à être exécuté.

