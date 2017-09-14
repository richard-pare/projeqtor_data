# Table: PlanningElement

Cette table contient les informations sur les éléments de planification: projet, tâche (activité, rencontre, session de test), jalon. Hiéarchie et avancement

Les données de cette table sont déjà aggrégées par type d'élément de planfication.



**(Toutes les colonnes ne sont pas affichées)**

> Écran: Projets

Colonnes|Description|Libellé à l'écran
--------|-----------|-----------------
id | Clé unique identifiant de l'enregistrement
idProject | Identifiant du projet
RefType et RefId | Identifiant de l'élément de planification 
RefName | Nom donné à l'élément de planification
ValidatedStartDate, ValidatedEndDate, ValidatedDuration | Elles sont utilisées pour arrêter la période pour la réalisation du projet ou d'une tâche. Elles ne sont pas contraignantes.  | Date de début, Date de fin, Durée **(Validé)**
PlannedStartDate, PlannedEndDate, PlannedDuration | Dates déterminés lors du calcul de la planification. | Date de début, Date de fin, Durée **(Planifié)**
RealStartDate, RealEndDate, RealDuration | La date de début indique le jour des premiers efforts saisis. La date de fin indique le jour des derniers efforts saisis (Lors qu'il n'y a plus de "reste à faire"). | Date de début, Date de fin, Durée **(Réel)**
InitialStartDate, InitialEndDate, InitialDuration | Dates qu'à titre informatif. Elles sont utilisées pour inscrire la période souhaitée pour la réalisation du projet ou d'une tâche. | Date de début, Date de fin, Durée **(Demandé)**
ValidatedWork, AssignedWork, RealWork, LeftWork, PlannedWork || **Effort** (validé, assigné, réel, reste, réévalué)
ValidatedCost, AssignedCost, RealCost, LeftCost, PlannedCost || **Coût** (validé, assigné, réel, reste, réévalué)
ExpenseValidatedAmount, ExpenseAssignedAmount, ExpenseRealAmount, ExpenseLeftAmount, ExpensePlannedAmount || **Dépenses** (validé, assigné, réel, reste, réévalué)
ReserveAmount | | **Réserve** (reste)
TotalValidatedCost, TotalAssignedCost, TotalRealCost, TotalLeftCost, TotalPlannedCost || **Coût total** (validé, assigné, réel, reste, réévalué)
Idle |
Elementary | 


idClient | Identifiant du client du projet [Table: Client](table_client.md) | client
ProjectCode | Code de projet (Texte libre) | code projet
idProject | Identifiant du projet parent | est sous projet de
idStatus | État du projet [Table: Status](table_status.md) | état

## Colonne idProject

Cette colonne identifie le projet de tête sous lequel sont associé les éléments de planification.

## Colonnes: RefType et RefId

Ces colonnes permettrent d'identifier les éléments de planification. 

> RefType = "Project" pour les projets

> RefType = "Activity" pour les activités

> RefType = "Meeting" pour les rencontres

> RefType = "TestSession" pour les sessions de test

> RefType = "Milestone" pour les jalons
