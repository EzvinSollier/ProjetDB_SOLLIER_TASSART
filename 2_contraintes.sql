USE projetsql_ezben;

-- Les contraintes sur le champions vont être au niveau de son prix ainsi que de sa difficulté ( de 1 à 3 ce qui correspond à Faible -> Modérée -> Élevée)
ALTER TABLE champion ADD CONSTRAINT champion_prix_constraint CHECK (C_Prix > 0);
ALTER TABLE champion ADD CONSTRAINT champion_difficulte_constraint CHECK ( C_Difficulté BETWEEN 1 AND 3);


-- Les contraintes pour les items vont être au niveau du prix (supérieur à 0 et n'excédant pas un certain niveau)
ALTER TABLE item ADD CONSTRAINT item_prix_constraint CHECK (I_Cout > 0 and I_Cout < 4000);

-- Les contraintes pour les skins vont être au niveau du prix aussi
ALTER TABLE skin ADD CONSTRAINT skin_prix_constraint CHECK (Sk_Prix > 0 );


-- Pour les monstres les contraintes vont être au niveau des pv (qu'ils soient positifs et différent de zéro) pour la puissance d'attaque (positifs et différent de zéro) pour l'xp qu'ils donnent (la même chose encore) pour l'argent qu'ils donnent (la même chose) et pour le cycle (la même chose 
ALTER TABLE monstre ADD CONSTRAINT monstre_hp_constraint CHECK (M_HP > 0);
ALTER TABLE monstre ADD CONSTRAINT monstre_attaque_constraint CHECK (M_Attaque > 0);
ALTER TABLE monstre ADD CONSTRAINT monstre_xp_constraint CHECK (M_XP > 0);
ALTER TABLE monstre ADD CONSTRAINT monstre_argent_constraint CHECK (M_Argent > 0);
ALTER TABLE monstre ADD CONSTRAINT monstre_cycle_constraint CHECK (M_Cycle > 0);


-- Pour les Sorts les contraintes vont être concernant le temps de recharge du sort ainsi que le ratio (les 2 ne devant être supérieur à 0)
ALTER TABLE sort ADD CONSTRAINT sort_recharge_constraint CHECK (So_Recharge > 0);
ALTER TABLE sort ADD CONSTRAINT sort_ratio_constraint CHECK (So_Ratio > 0);
