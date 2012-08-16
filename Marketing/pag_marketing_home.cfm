
<!--Marketing/pag_marketing_home.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing home.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfinclude template="../common_files/qry_get_revenue_goal.cfm">
<cfinclude template="qry_get_marketing_duration.cfm">
<cfinclude template="qry_get_marketing_data.cfm">
<cfinclude template="../Reports/qry_revenue_report.cfm">
<cfinclude template="qry_get_prospects_last_month.cfm">
<cfinclude template="qry_get_marketing_home.cfm">
<table cellpadding="0" cellspacing="3" border="0" width="100%">
	<cfinclude template="dsp_marketing_home.cfm">
</table>
			