# Table: PlanningElement

Cette table contient les informations sur les éléments de planification: projet, tâche (activité, rencontre, session de test), jalon.

Les données de cette table sont déjà aggrégées par type d'élément de planfication.

**(Toutes les colonnes ne sont pas affichées)**

> Écran: Projets

Colonnes|Description|Libellé à l'écran
--------|-----------|-----------------
id | Clé unique identifiant l'élément de planification 
idProject | Identifiant du projet
Name | Nom du projet | nom
idClient | Identifiant du client du projet [Table: Client](table_client.md) | client
ProjectCode | Code de projet (Texte libre) | code projet
idProject | Identifiant du projet parent | est sous projet de
idStatus | État du projet [Table: Status](table_status.md) | état

## Colonne idProject

Cette colonne identifie le projet de tête sous lequel sont associé les éléments de planification.
