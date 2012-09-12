
<!--Timekeeping/qry_update_task_team.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task owner.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_team" datasource="#application.datasources.main#">
UPDATE Team
SET active_ind=0
WHERE task_id=#attributes.task_id#
	AND role_id=4
	AND emp_id NOT IN (#attributes.task_team#);
<cfif attributes.task_team>
	INSERT INTO Team(task_id, emp_id, role_id)
	SELECT #attributes.task_id#, emp_id, 4
	FROM Emp_Contact
	WHERE emp_id IN (#attributes.task_team#)
		/*don't duplicate team assignments*/
		AND emp_id NOT IN (
			SELECT emp_id
			FROM Team
			WHERE active_ind=1
				AND task_id=#attributes.task_id#
				AND role_id=4
				AND emp_id IN (#attributes.task_team#)
		);
</cfif>
</cfquery>
</cfsilent>