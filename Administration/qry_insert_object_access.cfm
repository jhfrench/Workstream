
<!--Admin/qry_insert_object_access.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert object access for a user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfloop collection="#attributes#" item="field">
	<cfif NOT compare(left(field,1),"R") AND NOT listcontains(ignore_these,field)>
		<cfset object_id=Replace(field,"R","")>
<cfquery name="insert_object_access" datasource="#application.datasources.main#">
INSERT INTO Security_Object_Access (emp_id, object_id, active_ind, all_option)
VALUES (#attributes.emp_id#, #object_id#, 1, <cfif isdefined("attributes.a_o#object_id#")>1<cfelse>0</cfif>)
</cfquery>
	</cfif>
</cfloop>
</cfsilent>

