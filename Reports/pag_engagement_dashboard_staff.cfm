
<!--Reports/pag_engagement_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="0">
</cfsilent>
<cfinclude template="qry_get_engagement_dashboard.cfm">
<cfinclude template="qry_get_engagement_ie.cfm">

<table align="center" border="1" cellpadding="0" cellpadding="0" bordercolor="gray" cellspacing="0" width="98%">
	<cfinclude template="dsp_engagement_dashboard_row_header_staff.cfm">
	<cfinclude template="dsp_engagement_dashboard_rows_staff.cfm">
</table>
