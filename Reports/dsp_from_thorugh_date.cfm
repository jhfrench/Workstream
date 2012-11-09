
<!--Reports/dsp_from_thorugh_date.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the fuse that is used in the reports module to submit to reports.

	||
	Edits:
	$Log$
	 || 
	--> attributes.report_name: this is the name of the report that the form is submitting to.
	--> attributes.required: this is wether or not the form fields will be required. 
	 || 
	END FUSEDOC --->
<cfparam name="attributes.report_name" default="">
<cfparam name="attributes.required" default="">
<cfif isdefined("attributes.action")>
	<cfset variables.form_action="index.cfm?fuseaction=Reports.#attributes.action#">
<cfelse>
	<cfset variables.form_action="index.cfm?fuseaction=#attributes.fuseaction#">
</cfif>
</cfsilent>
<cfoutput>
<form name="report" action="" class="well form-inline">
	<fieldset>
		<legend>#attributes.report_name# Criteria</legend>
		<label for="from_date">From</label>
		<input type="date" name="from_date" id="from_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10"<cfif attributes.required> required="required"</cfif> class="span3 date" />
		<label for="through_date">To</label>
		<input type="date" name="through_date" id="through_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10"<cfif attributes.required> required="required"</cfif> class="span3 date" />
		<input type="submit" value="Enter Dates" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>