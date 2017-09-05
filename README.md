# projeqtor_data

Ce répertoire est utilisé pour présenter les possibilités d'extraction des données du logiciel libre ProjeQtor.

## Suivi des efforts et des coûts des ressources

### Table: [Work](/table_work.md)

Cette table contient les données saisies par la feuille de temps "Real work allocation". Chaque enregistrement corresponds au temps travaillé d'une ressource (real work) dans une journée pour une activité et pour une fonction.

> Voir: [modèle de données](/md_facette_effort_reel.png)

#### Exemple #1 - Requête simple

Une requête qui liste tous les efforts saisis.

```sql
SELECT 
    project.name AS 'Nom projet',
    activity.name AS 'Nom activité',
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    work.workDate AS 'Journée',
    work.work AS 'Effort',
    work.cost AS 'Coût'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
```

#### Exemple #2 - Filtrer les efforts saisis via la table [Resource](/table_resource.md)

Il est possible d'appliquer des filtres.

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


#### Exemple #1 - Somme des efforts et des coûts des ressources 

Les requêtes SQL suivantes extraits la somme des efforts et des coûts des ressources.

##### Par semaine

```sql
SELECT 
    project.name AS 'Nom projet',
    activity.name AS 'Nom activité',
    work.week AS 'Semaine',
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    SUM(work.work) AS 'Efforts',
    SUM(work.cost) AS 'Coûts'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
GROUP BY resource.fullName , role.name , work.week
```

##### Par mois

```sql
SELECT 
    project.name AS 'Nom projet',
    activity.name AS 'Nom activité',
    work.month AS 'Mois',
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    SUM(work.work) AS 'Efforts',
    SUM(work.cost) AS 'Coûts'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
GROUP BY resource.fullName , role.name , work.month
```

##### Par année

```sql
SELECT 
    project.name AS 'Nom projet',
    activity.name AS 'Nom activité',
    work.year AS 'Année',
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    SUM(work.work) AS 'Efforts',
    SUM(work.cost) AS 'Coûts'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
GROUP BY resource.fullName , role.name , work.year
```

