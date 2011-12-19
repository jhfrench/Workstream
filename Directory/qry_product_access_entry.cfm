
<!-- Directory/qry_product_access_entry.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I  insert records into the security product access table

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
<cfif isdefined("attributes.workstream")>
	<cfquery name="insert_product_access" datasource="#application.datasources.main#">
    INSERT INTO security_product_access(emp_id, product_id)
    VALUES(#variables.emp_id#, 2)
    </cfquery>
</cfif>
</cfsilent>
