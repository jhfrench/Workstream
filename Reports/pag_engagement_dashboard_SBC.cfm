
<!--Reports/pag_engagement_dashboard.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.inactive" default="2">
</cfsilent>
<cfinclude template="qry_get_engagement_dashboard_SBC.cfm">
<table border="1" cellpadding="1" cellspacing="0" align="center" width="95%" bordercolordark="#e1e1e1">
	<cfinclude template="dsp_engagement_dashboard_row_header_customer.cfm">
	<cfinclude template="dsp_engagement_dashboard_rows_customer.cfm">
</table>

