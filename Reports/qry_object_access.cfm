
<!--Reports/qry_object_access.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the names of all active reports for the reports module.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:14:24  stetzer
	<>

	||
	END FUSEDOC --->
<cfquery name="get_objects" datasource="#application.datasources.main#">
SELECT report_name, action, custom_url, custom_ind, description
FROM REF_Objects, Security_Object_Access
WHERE REF_Objects.object_id=Security_Object_Access.object_id
	AND Security_Object_Access.active_ind=1
	AND Security_Object_Access.emp_id=#session.user_account_id#
	AND REF_Objects.active_ind=1
	AND REF_Objects.module_id=6<cfif NOT comparenocase("Timekeeping",listfirst(attributes.fuseaction))>
	AND report_name='tech support'</cfif>	
ORDER BY report_name
</cfquery>
</cfsilent>

