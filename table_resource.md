# Table: Resource

Cette table contient les données sur les ressources (Matérielle et Humaine).

Colonnes|Description|Libellé à l'écran
--------|-----------|-----------------
id | Clé unique identifiant la ressource | id
FullName | Nom de la ressource | Nom usuel
Description | Description de la (ressource, utilisateur et contact) | description
idProfile | Identifiant du profil de sécurité [Table: Profile](/table_profile.md) | profil
idTeam | Identifiant de l'équipe dans lequel la resource est membre [Table: Team](/table_team.md) | équipe
idRole | Identifiant de la fonction par défaut de la ressource [Table: Role](/table_role.md) | fonction principale
Initials | Initiale de la ressource (affiché dans les diagrammes Gantt)  | initiales
IdOrganization | Identifiant de l'organisation au quelle la ressource appartient [Table: Organization](/table_organization.md)  | organisation
