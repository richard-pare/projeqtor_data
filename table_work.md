# Table: Work

Cette table contient les efforts saisies sur les activités de projets.

> Écran: Suivi > Feuille de temps


Colonnes|Description
--------|-----------
id | Clé unique identifiant l'effort
idResource | Identifiant de la ressource [Table: Resource](/table_resource.md)
idProject | Identifiant du projet [Table: Project](/table_project.md)
RefType et RefId | Identifiant de l'activité **(RefType = "Activity")** [Table: Activity](/table_activity.md)
idAssignment | Identifiant de l'assignation de la ressource à l'activité [Table: Assignment](/table_assignment.md)
Work | Effort réel saisie du jour pour l'activité et selon la fonction
WorkDate | Date de la saisie de l'effort **(AAAA-MM-JJ)**
Day | Date de la saisie de l'effort **(Alphanumérique - AAAAMMJJ)**
Week | Semaine de la saisie de l'effort **(Alphanumérique - AAAAWW)**
Mouth | Mois de la saisie de l'effort **(Alphanumérique - AAAAMM)**
Year | Année de la saisie de l'effort **(Alphanumérique - AAAA)**
DailyCost | Coût journalier de la ressource pour une fonction au moment de la saisie
Cost | Coût réel de l'effort du jour pour l'activité et selon la fonction **(Work * DailyCost)**

## Colonne: Work

La valeur de cette colonne est conservée selon les paramètres : "unités pour la feuille de temps" et "nombre d'heures par jour".

> Écran: Paramètres > Paramètres globaux - Section "Unité pour les efforts"

Si la valeur du paramètre "unités pour la feuille de temps" est **"jours"** alors la donnée sera conservée telle que saisie **[1 jours = 1]**.

Si la valeur du paramètre "unités pour la feuille de temps" est **"heures"** alors la donnée sera conservée comme une fraction de la journée  **[1 heure = (1 / nombre d'heures par jour)]**.
