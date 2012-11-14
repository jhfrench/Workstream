
<!--Reports/pag_project_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view projects page
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.2  2005/08/26 19:34:34  french
	Improvements to customer-specific project dashboard. Task 34802

	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="2">
</cfsilent>
<cfinclude template="qry_get_project_dashboard_GE.cfm">
<table border="1" cellpadding="1" cellspacing="0" align="center" width="95%" bordercolordark="#e1e1e1">
	<cfinclude template="dsp_project_dashboard_row_header_customer.cfm">
	<cfinclude template="dsp_project_dashboard_rows_customer.cfm">
</table>

