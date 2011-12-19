
<!--Marketing/pag_marketing_home.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing home.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:46-04  long
Added $log $ for edits to all CFM files that have fusedocs.



	||
	END FUSEDOC --->
<cfinclude template="qry_get_revenue_goals.cfm">
<cfinclude template="qry_get_marketing_duration.cfm">
<cfinclude template="qry_get_marketing_data.cfm">
<cfinclude template="../reports/qry_revenue_report.cfm">
<cfinclude template="qry_get_prospects_last_month.cfm">
<cfinclude template="qry_get_marketing_home.cfm">
<table cellpadding="0" cellspacing="3" border="0" width="100%">
	<cfinclude template="dsp_marketing_home.cfm">
</table>
			