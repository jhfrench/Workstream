
<!--Customers/pag_edit_customer.cfm
	Author: Jeromy F  -->
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
<cfset code = "#customer_change.root_code#">
<cfinclude template="qry_get_visable_to.cfm">

<table width="95%" border="0" cellpadding="2" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Edit Customer" colspan="1" title_class="HeadText#session.workstream_text_size#"  section_color="ffffff" align="center" gutter="true">
</table>
<table align="center" border="1" cellpadding="2" cellspacing="0" width="95%" bordercolor="#000000">
	<cfform name="cust_change" action="index.cfm?fuseaction=Customers.update_customers" method="POST">
		<cfinclude template="dsp_cust_edit_row_head1.cfm">
		<cfinclude template="dsp_cust_edit_rows1.cfm">
		<cfinclude template="dsp_cust_edit_row_head2.cfm">
		<cfinclude template="dsp_cust_edit_rows2.cfm">
		<cfinclude template="dsp_cust_edit_row_head3.cfm">
		<cfinclude template="dsp_cust_edit_rows3.cfm">
		<cfinclude template="dsp_submit.cfm">
	</cfform>
</table>



