
<!--Reports/pag_customer_monthly_progress.cfm
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
<cfparam name="attributes.report_month" default="#month(dateadd('m',-1, now()))#">
<cfparam name="attributes.report_year" default="#year(dateadd('m',-1, now()))#">
<cfparam name="attributes.customer_id" default="1">
</cfsilent>
<cfinclude template="../common_files/qry_get_link_customer_company.cfm">
<cfinclude template="qry_get_customer_monthly_progress.cfm">

<h2>Monthly Progress <small><cfoutput>#get_customer_monthly_progress.customer_name#, #monthasstring(attributes.report_month)# #attributes.report_year#</cfoutput></small></h2>
<cfinclude template="dsp_customer_monthly_progress.cfm">

<cfoutput>
<cfform name="personal_summary" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
	<label for="report_month">Month</label>
	<select name="report_month" id="report_month">
	<cfloop from="1" to="12" index="variables.month_ii">
		<option value="#variables.month_ii#"<cfif attributes.report_month EQ variables.month_ii> selected="selected"</cfif>>#monthasstring(variables.month_ii)#</option>
	</cfloop>
	</select>
	<label for="report_year">Year</label>
	<select name="report_year" id="report_year">
		<cfloop from="#year(application.application_specific_settings.workstream_start_date)#" to="#year(now())#" index="variables.year_ii">
		<option value="#variables.year_ii#"<cfif attributes.report_year EQ variables.year_ii> selected="selected"</cfif>>#variables.year_ii#</option>
		</cfloop>
	</select>
	<label for="customer_id">Customer</label>
	<cfmodule template="../common_files/qry_get_link_customer_company.cfm">
	<select name="customer_id" id="customer_id">
		<cfloop query="get_link_customer_company">
		<option value="#customer_id#"<cfif attributes.customer_id EQ customer_id> selected="selected"</cfif>>#customer_name#</option>
		</cfloop>
	</select>
	<input type="submit" value="Update Report" class="btn btn-primary" />
</cfform>
</cfoutput>