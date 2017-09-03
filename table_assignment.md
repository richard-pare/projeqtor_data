# Table: Assignment

Cette table contient les assignations de ressources aux activités de projets.

Colonnes|Description|Libelllé à l'écran
--------|-----------|------------------
id | Clé unique identifiant l'assignation
idResource | Identifiant de la ressource [Table: Resource](/table_resource.md) | ressource
idProject | Identifiant du projet [Table: Project](/table_project.md)
RefType et RefId | Identifiant de l'activité **(RefType = "Activity")** [Table: Activity](/table_activity.md)
Rate | Pourcentage d'assignation de la ressource pour l'activité | taux (%)
AssignedWork | Effort assigné à la ressource selon la fonction pour l'activité | effort assigné
RealWork | Somme des efforts réels faites par la ressource selon la fonction à l'activité | effort réel
LeftWork | Effort restant (AssignedWork - RealWork) pour la ressource selon la fonction | effort restant
PlannedWork | (RealWork + LeftWork) | effort réévalué
Idle | Indique si l'élément est clos **(1: Clos)**
RealStartDate | Date de début de la saisie des efforts
RealEndDate | Date de fin de la saisie des efforts
Comment | Commentaires | Commentaires
PlannedStartDate | Date de début planifiée
PlannedEndDate | Date de fin planifiée
idRole | Identifiant de la fonction de la ressource [Table: Role](/table_role.md) | fonction
DailyCost ||coût
NewDailyCost |
AssignedCost |
RealCost |
LeftCost |
PlannedCost |
NotPlannedWork | Les efforts restant pour l'activité qui n'ont pas pu être planifiés à l'intérieur de la période d'affectation de la ressource au projet
