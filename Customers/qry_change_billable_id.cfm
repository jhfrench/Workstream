
<!--Customers/qry_change_billable_type_id.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:04  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:22-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="change_billable_type_id" datasource="#application.datasources.main#">
UPDATE Project
SET billable_type_id=#attributes.billable_type_id#
WHERE Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

