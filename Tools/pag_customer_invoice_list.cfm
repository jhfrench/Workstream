
<!--Tools/pag_customer_invoice_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
</cfsilent>
<cfinclude template="qry_get_extreme_dates.cfm">
<cfinclude template="qry_get_customer_invoice_list.cfm">
<table class="table table-striped table-bordered table-condensed span8">
	<caption><h3>Invoice List for Work Completed in <cfoutput>#MonthAsString(attributes.month)#, #attributes.year#</cfoutput></h3></caption>
	<thead>
	<tr>
		<th>Customer</th>
		<th>Total Monthly Bill</th>
		<th>Generate Invoice</th>
	</tr>
	</thead>
	<tbody>
	<cfinclude template="dsp_customer_invoice_list.cfm">
	</tbody>
</table>
	<cfinclude template="dsp_invoice_list_form.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="customer_to_project" field_name="customer_id" field2_name="drill_through" field2_value="#attributes.month#|#attributes.year#" fuseaction="Tools.invoice_list">