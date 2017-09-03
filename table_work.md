# Table: Work

Cette table contient les efforts faites sur les activités de projet.


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