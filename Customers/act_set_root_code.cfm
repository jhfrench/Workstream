

<!--Customers/act_set_root_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the root code for the new customer insert.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif len(attributes.root_code)>
	<cfset variables.new_code=attributes.root_code>
<cfelse>
	<cfinclude template="qry_get_prefix.cfm">
	<cfset variables.code_prefix=get_prefix.prefix>
	<cfquery name="get_new_root" datasource="#application.datasources.main#">
	SELECT MAX(root_code)+1 AS 'new_code'
	FROM Customer
	WHERE root_code LIKE '#variables.code_prefix#%' 
		AND root_code NOT LIKE '9999%'
		AND root_code NOT LIKE '9998%'
	</cfquery>
	<cfset variables.new_code=get_new_root.new_code>
</cfif>
