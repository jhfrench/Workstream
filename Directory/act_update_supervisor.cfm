
<!-- path/act_update_supervisor.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:28  daugherty
	Initial revision

	Revision 1.0  2002-02-14 09:23:56-05  long
	Created File

	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="supervisor_delete" datasource="#application.datasources.main#">
DELETE Supervisor
WHERE emp_id=#attributes.emp_id#
</cfquery>
<cfif isdefined("attributes.supervisor_id")>
<cfloop list="#attributes.supervisor_id#" index="ii">
	<cfquery name="supervisor_entry" datasource="#application.datasources.main#">
	INSERT INTO Supervisor(emp_id,sup_id)
	VALUES(#attributes.emp_id#,#ii#)
	</cfquery>
</cfloop>	
</cfif>
</cfsilent>
