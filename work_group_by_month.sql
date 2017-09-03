select project.name as "Project name",activity.name as "Activity name", resource.fullName as "Resource name",role.name as "Function", work.month,sum(work.work) as "Sum of work",sum(work.cost) as "Sum of cost"
from work 
join project ON work.idProject = project.id
join activity ON (work.refId = activity.id and work.refType = "Activity")
join resource on work.idResource = resource.id
left join assignment on work.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,work.month
