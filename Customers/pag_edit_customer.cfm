
<!--Customers/pag_edit_customer.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I hold the fuses and logic for the edit customer function.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_get_states.cfm">
<cfinclude template="../common_files/qry_get_ref_company.cfm">
<cfinclude template="qry_get_customer_details.cfm">
<cfinclude template="../common_files/qry_get_link_customer_company.cfm">
<cfset variables.visible_to_company_id=valuelist(get_link_customer_company.company_id)>
<cfinclude template="dsp_edit_customer.cfm">