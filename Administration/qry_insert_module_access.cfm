
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

