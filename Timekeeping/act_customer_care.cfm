
<!--Timekeeping/act_customer_care.cfm
	Author: Jeromy F-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the data for the customer care blurb on the welcome page of workstream Timekeeping.
	||
	Name: Jeromy French
	||
	Edits:

	||
 --->
</cfsilent>
<cfinclude template="..\reports\qry_object_access.cfm">
<cfinclude template="qry_get_open_tech_supports.cfm">
<cfinclude template="qry_get_calls_today.cfm">
<cfoutput>
<cfif get_objects.recordcount>
	<cfset cc_blurb = 'There are currently <a href="index.cfm?fuseaction=Reports.tech_support" class="RegText' & #session.workstream_text_size# & '">' & #qry_get_open_tech_supports.open_tasks# & '</a> open Tech Support tasks. There have been ' & #qry_get_calls_today.calls_today# & ' in-bound customer care phone calls today. '>
<cfelse>
	<cfset cc_blurb = 'There are currently ' & #qry_get_open_tech_supports.open_tasks# & ' open Tech Support tasks. There have been ' & #qry_get_calls_today.calls_today# & ' in-bound customer care phone calls today. '>
</cfif>
</cfoutput>


