
<!--Reports/pag_project_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view projects page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
</cfsilent>
<cfinclude template="qry_get_project_dashboard_SBC.cfm">
<table border="1" cellpadding="1" cellspacing="0" align="center" width="95%" bordercolordark="#e1e1e1">
	<cfinclude template="dsp_project_dashboard_row_header_customer.cfm">
	<cfinclude template="dsp_project_dashboard_rows_customer.cfm">
</table>

