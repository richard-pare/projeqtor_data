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
ValidatedWork | Les efforts validés permettent de fixer la charge pour la réalisation d'un projet ou d'une tâche | Effort validé
AssignedWork | Les efforts assignés aux ressources pour la réalisation d'un projet ou d'une tâche | Effort assigné
RealWork | Les efforts effectués par les ressources pour la réalisation d'un projet ou d'une tâche | Effort réel
LeftWork | Le travail restant aux ressources pour la réalisation d'un projet ou d'une tâche |  Effort reste
PlannedWork | Les efforts réévalués pour terminer la réalisation d'un projet ou d'une tâche  | Effort réévalué
ValidatedCost, ExpenseValidatedAmount, TotalValidatedCost | Montants budgéter pour les efforts des ressources et les dépenses d'un projet | Coût, Dépenses, Coût total **(Validé)**
AssignedCost | Les coûts estimés pour la réalisation d'un projet ou d'une tâche calculé à partir des efforts assignés aux ressources et de leurs coût journalier | Coût assigné
RealCost | Les coûts engagés pour la réalisation d'un projet ou d'une tâche calculé à partir des efforts effectués par les ressources et leurs coûts journalier | Coût réel
LeftCost | Les coûts restants pour la réalisation d'un projet ou d'une tâche calculé à partir du travail restant | Coût reste
PlannedCost | Les coûts réévalés | Coût réévalué
ExpenseValidatedAmount | Montant budgéter pour les dépenses du projet | Dépenses validé
ExpenseAssignedAmount | La somme des montants planifiés de toutes les dépenses d'un projet | Dépenses assigné
ExpenseRealAmount | La somme des dépenses engagées d'un projet | Dépenses réel
ExpenseLeftAmount | La somme des dépenses non engagées d'un projet  | Dépenses reste
ExpensePlannedAmount | Le montant réévalué des dépenses| Dépenses réévalué
TotalValidatedCost | Montant total du coût budgéter pour les ressources et des dépenses du projet | Coût total validé
TotalAssignedCost | Montant total du coût initial des efforts des ressources et des montants planifiés des dépenses du projet | Coût total assigné
TotalRealCost | Montant total des coûts des ressources et des dépenses engagées du projet | Coût total réel
TotalLeftCost | Montant total des coûts restants des efforts des ressources et des dépenses non engagées du projet | Coût total reste
TotalPlannedCost | Montant total des coûts réévalués des efforts des ressources et des dépenses du projet  | Coût total réévalué
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
