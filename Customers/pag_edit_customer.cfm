
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
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="qry_customer_change.cfm">
<cfset code="#customer_change.root_code#">
<cfinclude template="qry_get_visible_to.cfm">
<cfinclude template="dsp_edit_customer.cfm">