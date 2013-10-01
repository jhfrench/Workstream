
<!--Customers/pag_new_customer.cfm
	Author: Jeromy F -->
	<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I show the form for adding a new customer.
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
	</cfsilent>

<cfif isdefined("attributes.description")>
	<cfinclude template="act_add_customer.cfm">
<cfelse>
	<cfmodule template="../common_files/qry_get_ref_company.cfm" company_id="#session.workstream_selected_company_id#">
	<cfinclude template="../common_files/qry_get_states.cfm">
	<cfinclude template="dsp_new_customer.cfm">
</cfif>