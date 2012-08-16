
<!--Reports/pag_personal_summary.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
<cfparam name="attributes.emp_id" default="#session.user_account_id#">
</cfsilent>
<cfset variables.show_details_ind=0>
<cfinclude template="qry_leader_hours_by_month.cfm">
<h2>Personal Hours Report for <cfoutput>#monthasstring(attributes.month)# #attributes.year#</cfoutput></h2>
<cfinclude template="dsp_personal_summary_by_code.cfm">
<cfinclude template="dsp_personal_summary_by_week.cfm">