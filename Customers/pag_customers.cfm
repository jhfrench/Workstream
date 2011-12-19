
<!--Customers/pag_customers.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the fuses for the Customers page.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.inactive" default="0">
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="customer" fuseaction="Customers.engagements" otherfield="description" field_name="client_code">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit" fuseaction="Customers.edit_customer" field_name="customers_id">
<cfinclude template="qry_get_customers.cfm">
<table align="center" cellpadding="2" cellspacing="0" border="0" width="50%">
    <cfinclude template="dsp_customers_row_header.cfm">
    <cfinclude template="dsp_customers_rows.cfm">
</table>	