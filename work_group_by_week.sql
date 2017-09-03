select project.name as "Nom projet",activity.name as "Nom activité", resource.fullName as "Nom ressource",role.name as "Fonction", work.week as "Semaine",sum(work.work) as "Sum of work",sum(work.cost) as "Sum of cost"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,work.week
