select project.name as "Projet",type.name as "Type projet",assignedWork as "Efforts prévus",realWork as "Efforts effectués",leftwork as "Efforts restants",plannedwork as "Efforts réévalués", assignedCost as "Coûts prévus", realCost as "Coûts réels",leftCost as "Coûts restants", plannedCost as "Coûts réévalués"
from planningelement
left join project ON planningelement.idProject = project.id
left join type ON project.idProjectType = type.id
where planningelement.refType = "Project"
and planningelement.idle = 0
