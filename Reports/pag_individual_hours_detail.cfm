
<!--Reports/pag_individual_hours_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain teh output for the individual hours report.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfparam name="attributes.from_date" default="#dateadd('m',-1, now())#">
<cfparam name="attributes.through_date" default="#now()#">
<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
</cfsilent>
<cfinclude template="qry_get_individual_hours_detail.cfm">
<cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Individual Hours Detail <small>#get_individual_hours_detail.employee#, #attributes.from_date# to #attributes.through_date#</small></h2></caption>
	<thead>
		<tr>
			<th>Work Date</th>
			<th>Code</th>
			<th>Notes</th>
			<th>Hours</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="3">
				Total hours
			</td>
			<td class="number">
				#decimalformat(get_individual_hours_summary.hours_worked)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_individual_hours_detail">
		<tr>
			<td class="date">
				#dateformat(work_date, "mm/dd/yyyy")#
			</td>
			<td>
				#project_display#
			</td>
			<td>
				#note#
			</td>
			<td class="number">
				#decimalformat(hours)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>
<cfoutput>
<cfform name="individual_hours_detail" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<fieldset>
		<legend>Individual Hours Detail Criteria</legend>
		<label for="from_date">From</label>
		<input type="date" name="from_date" id="from_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" class="span3 date" />
		<label for="through_date">To</label>
		<input type="date" name="through_date" id="through_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" value="#dateformat(attributes.through_date, 'yyyy-mm-dd')#" class="span3 date" />
		<label for="user_account_id">Employee</label>
		<cfmodule template="../common_files/dsp_team_select.cfm" onchange="" user_account_id="#attributes.user_account_id#">
		<input type="submit" value="Update Report" class="btn btn-primary" />
	</fieldset>
</cfform>
</cfoutput>