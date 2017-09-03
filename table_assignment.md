# Table: Assignment

Cette table contient les assignations de ressources aux activités de projets.

Colonnes|Description
--------|-----------
id | Clé unique identifiant l'assignation
idResource | Identifiant de la ressource [Table: Resource](/table_resource.md)
idProject | Identifiant du projet [Table: Project](/table_project.md)
RefType et RefId | Identifiant de l'activité **(RefType = "Activity")** [Table: Activity](/table_activity.md)
Rate | Pourcentage d'assignation de la ressource pour l'activité
AssignedWork | Effort assigné à la ressource selon la fonction pour l'activité
RealWork | Somme des efforts réels faites par la ressource selon la fonction à l'activité
LeftWork | Effort restant (AssignedWork - RealWork) pour la ressource selon la fonction
PlannedWork | 
Idle | Indique si l'élément est clos **(1: Clos)**
RealStartDate | Date de début de la saisie des efforts
RealEndDate | Date de fin de la saisie des efforts
Comment | Commentaires
PlannedStartDate | Date de début planifiée
PlannedEndDate | Date de fin planifiée
idRole | Identifiant de la fonction de la ressource [Table: Role]
DailyCost |
NewDailyCost |
AssignedCost |
RealCost |
LeftCost |
PlannedCost |
NotPlannedWork |
