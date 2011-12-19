
<!--Admin/qry_insert_module_access.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2006/09/15 22:25:30  csy
	<>

	Revision 1.0  2006-08-16 09:32:13-04  csy
	Initial revision

	Revision 1.0  2005-02-15 15:27:41-05  daugherty
	Initial revision

	Revision 1.1  2001-10-11 10:55:30-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
 --->
<cfquery name="insert_module_access" datasource="#application.datasources.main#">
<cfloop collection="#attributes#" item="field">
	<cfif NOT compare(left(field,1),"M") AND NOT listcontains(ignore_these,field)>
		<cfset module_id=Replace(field,"M","")>
		INSERT INTO Security_Module_Access(emp_id,module_id,active_ind)
		VALUES(#attributes.emp_id#,#module_id#,1)
	</cfif>
</cfloop>
</cfquery>
</cfsilent>

