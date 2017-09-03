select project.name as "Projet",assignedWork as "Efforts prévus",realWork as "Efforts effectués",leftwork as "Efforts restants",plannedwork as "Efforts réévalués", assignedCost as "Coûts prévus", realCost as "Coûts réels",leftCost as "Coûts restants", plannedCost as "Coûts réévalués"
from planningelement
join project ON planningelement.idProject = project.id
where planningelement.refType = "Project"
