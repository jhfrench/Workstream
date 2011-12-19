
<!--qry_module_access.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the modules that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:54:37  daugherty
	Initial revision

	Revision 1.2  2001-11-01 11:58:39-05  french
	Specified the table in the ORDER BY.

	Revision 1.1  2001-10-11 11:04:55-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasource.main: string that contains the name of the datasource as mapped in CF administrator
	<-- module_name: string containing the name of the module
	END FUSEDOC --->
<cfquery name="get_modules" datasource="#application.datasources.main#">
SELECT REF_Module.module_name
FROM Security_Module_Access, REF_Module
WHERE Security_Module_Access.module_id = REF_Module.module_id
	AND Security_Module_Access.active_ind=1
	AND REF_Module.active_ind=1
	AND Security_Module_Access.emp_id=#session.workstream_emp_id#
ORDER BY REF_Module.order_by
</cfquery>
</cfsilent>

