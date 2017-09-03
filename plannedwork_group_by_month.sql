select project.name as "Project name",activity.name as "Activity name", resource.fullName as "Resource name",role.name as "Function", plannedwork.month,sum(plannedwork.work) as "Sum of planned work"
from plannedwork 
join project ON plannedwork.idProject = project.id
join activity ON (plannedwork.refId = activity.id and plannedwork.refType = "Activity")
join resource on plannedwork.idResource = resource.id
left join assignment on plannedwork.idAssignment = assignment.id
left join role on assignment.idRole = role.id
group by resource.fullName,role.name,plannedwork.month
order by plannedwork.month,resource.fullName,role.name
