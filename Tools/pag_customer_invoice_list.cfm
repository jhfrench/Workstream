
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
<table border="0" cellpadding="4" cellspacing="0" align="center" width="70%" class="table_striped">
	<thead>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="772862" section_title="&nbsp;Invoice List for Work Completed in #MonthAsString(attributes.month)#, #attributes.year#" colspan="5" gutter=0>
	<tr class="SubHeadText">
		<th class="SubHeadText">Customer</th>
		<th class="SubHeadText">Total Monthly Bill</th>
		<th class="SubHeadText">Generate Invoice</th>
	</tr>
	</thead>
	<tbody>
	<cfinclude template="dsp_customer_invoice_list.cfm">
	</tbody>
	<cfinclude template="dsp_invoice_list_form.cfm">
</table>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="customer_to_project" field_name="customer_id" field2_name="drill_through" field2_value="#attributes.month#|#attributes.year#" fuseaction="Tools.invoice_list">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_tasks" field_name="project_id" field2_name="ignore_owner" field2_value="#attributes.month#|#attributes.year#" fuseaction="Timekeeping.task_list">