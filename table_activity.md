# Table: Activity

Cette table contient les informmations sur les activités.

**(Toutes les colonnes ne sont pas affichées)**

> Écran: Travail > Activité

Colonnes|Description|Libellé à l'écran
--------|-----------|-----------------
id | Clé unique identifiant l'activité | id
idProjet | Identifiant du projet [Table: Project](/table_project.md) | projet
idActivityType | Identifiant du type de projet [Table: Type](/table_type.md) | type d'activité
Name | Nom de l'activité | nom
idStatus | État de l'activité [Table: Status](/table_status.md) | état
idle | Indique que l'activité est close "Archivé" | clos
idActivity | Identifiant de l'activité parente | activité parente
Done & DoneDate | Indique que l'activité est terminée | fait
Handled & HandledDate | Indique que l'activité est prise en charge | prise en charge
Cancelled | Indique que le projet a été cancellé | annulé
