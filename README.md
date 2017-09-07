# projeqtor_data

Ce répertoire est utilisé pour présenter les possibilités d'extraction des données du logiciel libre ProjeQtor.

## Suivi des efforts et des coûts des ressources

### Table: [Work](/tables/table_work.md)

Cette table contient les données saisies par la feuille de temps "Real work allocation". Chaque enregistrement corresponds au temps travaillé d'une ressource (real work) dans une journée pour une tâche et pour une fonction.

#### Tâche

Une tâche peut être une activité, une recontre ou une session de test.

#### Exemple #1 - Liste tous les efforts saisis sur les tâches

Cette requête unie tous les efforts saisis sur les tâches de projet (activité, rencontre, session de test).

> Notez bien la colonne coût peut être NULL, si le coût journalier de la ressource pour une fonction n'a pas été précisé.

```sql
(SELECT 
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',    
    work.workDate AS 'Journée',    
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',

    work.work AS 'Effort',
    IFNULL(work.cost, 0) AS 'Coût'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id)
UNION ALL
(SELECT 
    resource.fullName,
    role.name,    
    work.workDate,    
    project.name,
    CONCAT('Rencontre (',meeting.name,')'),
    work.work,
    IFNULL(work.cost, 0)
FROM work
JOIN project ON work.idProject = project.id
JOIN meeting ON (work.refId = meeting.id AND work.refType = 'Meeting')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id)
UNION ALL
(SELECT 
    resource.fullName,
    role.name,    
    work.workDate,    
    project.name,
    CONCAT('Session de test (',testsession.name,')'),
    work.work,
    IFNULL(work.cost, 0)
FROM work
JOIN project ON work.idProject = project.id
JOIN testsession ON (work.refId = testsession.id AND work.refType = 'TestSession')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id)
ORDER BY 1 , 2 , 3 , 4 , 5
```

#### Exemple #2 - Filtrer la liste des ressources

Il est possible de filtrer la liste des ressource via la table [Resource](/tables/table_resource.md)

> Notez bien que pour simplifier les requêtes seuls efforts saisis sur les activités sont utilisés comme exemple. Les filtres peuvent s'appliquer aussi aux rencontres et aux sessions de test.

##### Par profil de sécurité

_Seuls les efforts saisis des ressources qui ont le profil de sécurité "Membre d'équipe simple" (code profil: MES)_

> Table: [Profile](/tables/table_profile.md)

```sql
SELECT 
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    work.workDate AS 'Journée',    
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',    
    work.work AS 'Effort',
    IFNULL(work.cost, 0) AS 'Coût'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
LEFT JOIN profile ON resource.idProfile = profile.id
WHERE profile.profileCode = 'MES'
ORDER BY 1 , 2 , 3 , 4 , 5
```
##### Par organisation

_Seuls les efforts saisis des ressources qui sont membres de l'organisation "Poly IND 6130 E2017"_

> Table: [Organization](/tables/table_organization.md)


```sql
SELECT 
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    work.workDate AS 'Journée',    
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',    
    work.work AS 'Effort',
    IFNULL(work.cost, 0) AS 'Coût'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
LEFT JOIN organization ON resource.idOrganization = organization.id
WHERE organization.name = "Poly IND 6130 E2017"
ORDER BY 1 , 2 , 3 , 4 , 5
```

##### Par équipe

_Seuls les efforts saisis des ressources qui sont membres de l'équipe "Équipe 2 IND 6130 E 2017"_

> Table: [Team](/tables/table_team.md)

```sql
SELECT 
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',
    work.workDate AS 'Journée',    
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',    
    work.work AS 'Effort',
    IFNULL(work.cost, 0) AS 'Coût'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
LEFT JOIN team ON resource.idTeam = team.id
WHERE team.name = 'Équipe 2 IND 6130 E 2017'
ORDER BY 1 , 2 , 3 , 4 , 5
```


#### Exemple #3 - Somme des efforts et des coûts des ressources 

Les requêtes SQL suivantes extraits la somme des efforts et des coûts des ressources.

##### Par semaine

```sql
SELECT 
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',
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
ORDER BY 1,2,3,4,5
```

##### Par mois

```sql
SELECT 
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',
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
ORDER BY 1,2,3,4,5
```

##### Par année

```sql
SELECT 
    work.year AS 'Année',
    resource.fullName AS 'Nom ressource',
    role.name AS 'Fonction',    
    project.name AS 'Nom projet',
    CONCAT('Activité (',activity.name,')') AS 'Tâche',
    SUM(work.work) AS 'Efforts',
    SUM(work.cost) AS 'Coûts'
FROM work
JOIN project ON work.idProject = project.id
JOIN activity ON (work.refId = activity.id AND work.refType = 'Activity')
JOIN resource ON work.idResource = resource.id
LEFT JOIN assignment ON work.idAssignment = assignment.id
LEFT JOIN role ON assignment.idRole = role.id
GROUP BY resource.fullName , role.name , work.year
ORDER BY 1,2,3,4,5
```

