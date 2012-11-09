
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
	AND user_account_id NOT IN (#attributes.task_team#);
<cfif listlen(attributes.task_team)>
	INSERT INTO Team(task_id, user_account_id, role_id,
		created_by)
	SELECT #attributes.task_id#, user_account_id, 4,
		#variables.user_identification#
	FROM Emp_Contact
	WHERE user_account_id IN (#attributes.task_team#)
		/*don't duplicate team assignments*/
		AND user_account_id NOT IN (
			SELECT user_account_id
			FROM Team
			WHERE active_ind=1
				AND task_id=#attributes.task_id#
				AND role_id=4
				AND user_account_id IN (#attributes.task_team#)
		);
</cfif>
</cfquery>
</cfsilent>