
<!--Reports/qry_get_project_manager.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the names of all people who are the project managers for projects active and inactive.
	||
	Name: Jeromy French
	||
	Edits:

	 ||
	END FUSEDOC --->

<cfquery name="get_project_manager" datasource="#application.datasources.main#">
SELECT COALESCE(Demographics.user_account_id,0) AS user_account_id, COALESCE((Demographics.last_name ||', '|| Demographics.first_name), 'Unassigned') AS last_name
FROM Project
	LEFT OUTER JOIN Demographics ON Demographics.user_account_id=Project.project_manager_id
		AND Demographics.active_ind=1
WHERE Project.active_ind=1
GROUP BY Demographics.user_account_id, Demographics.last_name, Demographics.first_name
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>
