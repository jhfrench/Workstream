
<!--Reports/dsp_from_through_date.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the supervisor's ForcePlanner report. This report shows direct report's tasks and hours for complete and incomplete, budgeted and un-budgeted tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.through_date" default="#month(now())#/#daysinmonth(now())#/#year(now())#">
<cfparam name="attributes.report_name" default="">
<cfparam name="attributes.required" default="0">
</cfsilent>
<cfoutput>
<form name="report" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<fieldset>
		<legend>#attributes.report_name# Criteria</legend>
		<label for="from_date">From</label>
		<input type="date" name="from_date" id="from_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10"<cfif attributes.required> required="required"</cfif> value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" class="span3 date" />
		<label for="through_date">To</label>
		<input type="date" name="through_date" id="through_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10"<cfif attributes.required> required="required"</cfif> value="#dateformat(attributes.through_date, 'yyyy-mm-dd')#" class="span3 date" />
		<input type="submit" value="Update Report" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>