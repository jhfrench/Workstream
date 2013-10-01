
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
	<cfmodule template="../common_files/qry_get_ref_company.cfm" company_id="#attributes.company_id#">
	<cfquery name="get_new_root_code" datasource="#application.datasources.main#">
	SELECT COALESCE(MAX(root_code),'0') AS root_code
	FROM Customer
	WHERE 1=1<cfif len(get_ref_company.code_prefix)>
		AND root_code LIKE '#get_ref_company.code_prefix#%'</cfif>
		AND SUBSTRING(root_code, 1, 4) NOT IN ('9998','9999')<!--- $issue$: do we still need to reserve these codes? --->
	</cfquery>
	<cfset variables.new_code=get_new_root_code.root_code+1>
</cfif>