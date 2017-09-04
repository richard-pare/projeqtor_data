# projeqtor_data

Ce répertoire est utilisé pour présenter les possibilités d'extraction des données du logiciel libre ProjeQtor.

## Suivi des efforts et des coûts des ressources

### Table: [Work](/table_work.md)

Cette table contient les données saisies par la feuille de temps "Real work allocation". Chaque enregistrement corresponds au temps travaillé par la ressource (real work) d'une journée dans une activité et avec une fonction.

#### Exemple #1 - Somme des efforts et des coûts des ressources 

Les requêtes SQL suivantes extraits la somme des efforts et des coûts des ressources.

##### Par semaine

```sql
select project.name as "Nom projet",activity.name as "Nom activité", work.week as "Semaine", resource.fullName as "Nom ressource",role.name as "Fonction",sum(work.work) as "Efforts",sum(work.cost) as "Coûts"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,work.week
```

##### Par mois

```sql
select project.name as "Nom projet",activity.name as "Nom activité", work.month as "Mois", resource.fullName as "Nom ressource",role.name as "Fonction",sum(work.work) as "Efforts",sum(work.cost) as "Coûts"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,work.month
```

##### Par année

```sql
select project.name as "Nom projet",activity.name as "Nom activité", work.year as "Année", resource.fullName as "Nom ressource",role.name as "Fonction",sum(work.work) as "Efforts",sum(work.cost) as "Coûts"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,work.year
```

#### Exemple #2 - Filtrer les efforts saisis

Via la table [resource](/table_resource.md), il est possible d'appliquer des filtres.

##### Par profil de sécurité

_Seuls les efforts saisis des ressources qui ont le profil de sécurité "Membre d'équipe externe" (code profil: ETM)_

> Table: [profile](/table_profile.md)

```sql
select project.name as "Nom projet",activity.name as "Nom activité", resource.fullName as "Nom ressource",role.name as "Fonction", work.workDate as "Journée",work.work as "Effort",work.cost as "Coût"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
left join profile on resource.idProfile = profile.id
where profile.profileCode = "ETM"
```

##### Par organisation

_Seuls les efforts saisis des ressources qui sont membres de l'organisation "Organisation"_

> Table: [organization](/table_organization.md)


```sql
select project.name as "Nom projet",activity.name as "Nom activité", resource.fullName as "Nom ressource",role.name as "Fonction", work.workDate as "Journée",work.work as "Effort",work.cost as "Coût"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
left join organization on resource.idOrganization = organization.id
where organization.name = "Organisation"
```

##### Par équipe

_Seuls les efforts saisis des ressources qui sont membres de l'équipe "Equipe"_

> Table: [team](/table_team.md)

```sql
select project.name as "Nom projet",activity.name as "Nom activité", resource.fullName as "Nom ressource",role.name as "Fonction", work.workDate as "Journée",work.work as "Effort",work.cost as "Coût"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
left join team on resource.idTeam = team.id
where team.name = "Equipe"
```
