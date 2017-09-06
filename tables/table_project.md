# Table: Project

Cette table contient les informations sur les projets.

**(Toutes les colonnes ne sont pas affichées)**

> Écran: Projets

Colonnes|Description|Libellé à l'écran
--------|-----------|-----------------
id | Clé unique identifiant le projet | id
Name | Nom du projet | nom
idClient | Identifiant du client du projet [Table: Client](/table_client.md) | client
ProjectCode | Code de projet (Texte libre) | code projet
idProject | Identifiant du projet parent | est sous projet de
idStatus | État du projet [Table: Status](/table_status.md) | état
Done & DoneDate | Indique que le projet est terminé | fait
idleDate | Indique que le projet est clos "Archivé" | clos
idProjectType | Identifiant du type de projet [Table: Type](/table_type.md) | type
CodeType | Type de projet (OPE: Opérationnel, ADM: Administratif, TMP: Gabarit) | 
Cancelled | Indique que le projet a été cancellé | annulé
isUnderContruction | Indique que le projet est en construction | en construction
Handled & HandledDate | Indique que le projet est prise en charge | prise en charge
