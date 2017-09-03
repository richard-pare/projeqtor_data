select project.name as "Nom projet",activity.name as "Nom activité", resource.fullName as "Nom ressource",role.name as "Fonction", work.workDate as "Journée",work.work as "Effort",work.cost as "Coût"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
left join team on resource.idTeam = team.id
where team.name = "Équipe"
