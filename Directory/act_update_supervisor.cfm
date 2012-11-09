
<!-- path/act_update_supervisor.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="supervisor_delete" datasource="#application.datasources.main#">
UPDATE Supervisor
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#
</cfquery>
<cfif isdefined("attributes.supervisor_id")>
<cfloop list="#attributes.supervisor_id#" index="ii">
	<cfquery name="supervisor_entry" datasource="#application.datasources.main#">
	INSERT INTO Supervisor (user_account_id,supervisor_user_account_id)
	VALUES(#attributes.user_account_id#,#ii#)
	</cfquery>
</cfloop>
</cfif>
</cfsilent>
