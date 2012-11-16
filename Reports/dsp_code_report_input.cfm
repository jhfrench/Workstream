
<!--Reports/dsp_code_report_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I dispaly a drop down box that has a list of all active projects for the compaies that you have selected to view.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfif NOT isdefined("attributes.used_by_search_ind")>
	<cfset attributes.used_by_search_ind=0>
</cfif>
</cfsilent>

<cfoutput>
<cfform name="form_code_report_input" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
<fieldset>
	<legend>Criteria</legend>
	<label for="from_date">From</label>
	<input type="date" name="from_date" id="from_date" value="#dateformat(attributes.from_date,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
	<label for="from_date">From</label>
	<input type="date" name="through_date" id="through_date" value="#dateformat(attributes.through_date,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
	<label for="project_id">Project</label>
	<cfselect name="project_id" id="project_id" query="project" value="project_id" display="display" required="yes" message="Please specify an project." size="10" class="span6"></cfselect>
	<label class="checkbox"><input type="checkbox" name="used_by_search_ind" id="used_by_search_ind" value="1"<cfif attributes.used_by_search_ind> checked="checked"</cfif> /> Show non-billable projects</label>
	<input type="submit" value="Update Report" class="btn btn-primary" />
</fieldset>
</cfform>
</cfoutput>