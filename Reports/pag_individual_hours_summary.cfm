
<!--Reports/pag_individual_hours_summary.cfm
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
<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
</cfsilent>
<cfinclude template="../common_files/qry_get_employee_details.cfm">
<cfinclude template="qry_get_individual_hours_summary.cfm">

<script type="text/javascript">
	//if Modernizr determines they can be supported, load the following JavaScript resources
	Modernizr.load([
		{
			test: Modernizr.canvas,
			nope: '//s3.amazonaws.com/external-projects/excanvas.js',
			complete: function () {
				Modernizr.load('//s3.amazonaws.com/external-projects/pieChart.jQuery.js');
			}
		}
	]);
</script>
<h2>Hours Report Summary <small><cfoutput>#get_employee_details.last_name#, #get_employee_details.first_name#; #monthasstring(attributes.report_month)# #attributes.report_year#</cfoutput></small></h2>
<cfinclude template="dsp_personal_summary_by_code.cfm">
<cfinclude template="dsp_personal_summary_by_week.cfm">

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
	<label for="user_account_id">Employee</label>
	<cfmodule template="../common_files/dsp_team_select.cfm" onchange="" user_account_id="">
	<input type="submit" value="Update Report" class="btn btn-primary" />
</cfform>
</cfoutput>