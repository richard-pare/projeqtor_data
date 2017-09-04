# projeqtor_data

Ce répertoire est utilisé pour présenter les possibilités d'extraction des données du logiciel libre ProjeQtor.

## Suivi des efforts et des coûts des ressources

### Table: [Work](/table_work.md)

Cette table contient les données saisies par la feuille de temps "Real work allocation". Chaque enregistrement corresponds au temps travaillé par la ressource (real work) d'une journée dans une activité et avec une fonction.

#### Exemple #1 - Somme des efforts et des coûts des ressources 

Les requêtes SQL suivantes extraits la somme des efforts et des coûts des ressources.

##### Par semaine

```sql
select project.name as "Nom projet",activity.name as "Nom activité", resource.fullName as "Nom ressource",role.name as "Fonction", work.week as "Semaine",sum(work.work) as "Sum of work",sum(work.cost) as "Sum of cost"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,work.week
```

- [Par semaine](/work_group_by_week.sql)

- [Par mois](/work_group_by_month.sql)

- [Par année](/work_group_by_year.sql)
