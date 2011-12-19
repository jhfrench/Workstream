
<!--Customers/pag_customers.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the fuses for the Customers page.

	||
	Edits:
	$Log$
Revision 1.1  2006/03/31 15:36:06  csy
task 42741 Modified code to include customer name to title

Revision 1.0  2005-02-15 15:45:58-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:25-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	(KL | 9/14/2001) added logic to make the access to the edit function database driven.
	||
	END FUSEDOC --->
<cfparam name="attributes.inactive" default="0">
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="customer" fuseaction="engagements" otherfield="description" field_name="client_code">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit" fuseaction="edit_customer" field_name="customers_id">
<cfinclude template="qry_get_customers.cfm">
<table align="center" cellpadding="2" cellspacing="0" border="0" width="50%">
    <cfinclude template="dsp_customers_row_header.cfm">
    <cfinclude template="dsp_customers_rows.cfm">
</table>	