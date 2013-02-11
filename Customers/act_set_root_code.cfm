

<!--Customers/act_set_root_code.cfm
	Author: Jeromy F -->
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
	<cfinclude template="qry_get_code_prefix.cfm">
	<cfquery name="get_new_root" datasource="#application.datasources.main#">
	SELECT MAX(root_code)+1 AS 'new_code'
	FROM Customer
	WHERE 1=1<cfif len(get_code_prefix.code_prefix)>
		AND root_code LIKE '#get_code_prefix.code_prefix#%'</cfif>
		AND SUBSTRING(root_code, 1, 4) NOT IN ('9998','9999')
	</cfquery>
	<cfset variables.new_code=get_new_root.new_code>
</cfif>
