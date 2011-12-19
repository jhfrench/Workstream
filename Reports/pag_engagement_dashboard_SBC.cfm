
<!--Reports/pag_engagement_dashboard.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
Revision 1.1  2005/08/26 19:35:13  french
Improvements to customer-specific engagement dashboard. Task 34802

Revision 1.0  2005-03-09 13:15:28-05  stetzer
Initial revision

Revision 1.1  2001-10-11 10:56:24-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	(KL | 9/14/2001) added logic to make the access to the edit function database driven.
	||
	END FUSEDOC --->
<cfparam name="attributes.inactive" default="2">
</cfsilent>
<cfinclude template="qry_get_engagement_dashboard_SBC.cfm">
<table border="1" cellpadding="1" cellspacing="0" align="center" width="95%" bordercolordark="#e1e1e1">
	<cfinclude template="dsp_engagement_dashboard_row_header_customer.cfm">
	<cfinclude template="dsp_engagement_dashboard_rows_customer.cfm">
</table>

