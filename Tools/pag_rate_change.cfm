
<!--Tools/pag_rate_change.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the customer rate insert page.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif isdefined("attributes.submit")>
	<!--- insert/update rates into Billing_Rate --->
	<cfinclude template="act_rate_change.cfm">
</cfif>
<cfinclude template="qry_get_billing_rate.cfm">
<cfinclude template="dsp_rate_change.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_project" field_name="project_id" field2_name="option" field2_variable_ind="1">