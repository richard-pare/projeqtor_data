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
InitialStartDate |
ValidatedStartDate |
PlannedStartDate |
RealStartDate |
InitialEndDate |
ValidatedEndDate |
PlannedEndDate |
RealEndDate |
InitialDuration |
ValidatedDuration |
PlannedDuration |
RealDuration |
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
