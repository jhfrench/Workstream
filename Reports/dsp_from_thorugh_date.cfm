
<!--Reports/dsp_from_thorugh_date.cfm
	Author: Jeromy F  -->
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
<cfparam name="attributes.action" default="index.cfm">
<cfparam name="attributes.report_name" default="">
<cfparam name="attributes.required" default="">
<!--- $issue$: is this template used? should the common_files version be used instead? --->
</cfsilent>
<cfoutput>
<cfform name="report" action="index.cfm?fuseaction=Reports.#attributes.action#"> 
<table align="center" border="0" cellpadding="2" cellspacing="0" width="40%">
	<tr bgcolor="##008080">
		<td colspan="2" class="HeadTextWhite">#attributes.report_name#</td>
	</tr>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="RegTextWhite">Enter Dates (m/d/yyyy)</td>
	</tr>
	<tr>
		<td>
			<label for="from_date">From</label>:
			<input type="date" name="from_date" id="from_date" min="#application.application_specific_settings_workstream_start_date#" maxlength="10"<cfif attributes.required> required="required"</cfif> class="span3 date" />
		</td>
		<td>
			<label for="through_date">To</label>: 
			<input type="date" name="through_date" id="through_date" min="#application.application_specific_settings_workstream_start_date#" maxlength="10"<cfif attributes.required> required="required"</cfif> class="span3 date" />
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" value="Enter Dates"></td>
	</tr>
</table>
</cfform>
</cfoutput>

