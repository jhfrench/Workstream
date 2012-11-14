
<!--Reports/dsp_from_through_date_NO_Form.cfm
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
	--> attributes.required:this is wether or not the form fields will be required. 
	 || 
	END FUSEDOC --->
<cfparam name="attributes.form_name" default="form[0]">
<cfparam name="attributes.action" default="index.cfm">
<cfparam name="attributes.report_name" default="">
<cfparam name="attributes.required_ind" default="0">
</cfsilent>
<cfoutput>
<table border="0" cellpadding="1" cellspacing="0" width="90%" align="center">
	<tr bgcolor="##008080" class="HeadTextWhite">
		<td colspan="2">#attributes.report_name#</td>
	</tr>
	<tr bgcolor="##5F5F5F" class="HeadTextSmWhite">
		<td colspan="2">Enter Dates (m/d/yyyy)</td>
	</tr>
	<tr>
		<td>
			From: 
			<input type="date" name="from_date" id="from_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" maxlength="10"<cfif attributes.required_ind> required="required"</cfif> class="span6 date" />
			<!-- Use CF to create validation <cfinput  type="text" name="from_date" required="#attributes.required#" validate="date" size="11" message="You must enter a valid from date"> --->
		</td>
		<td>
			To: 
			<input type="date" name="through_date" id="through_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" maxlength="10"<cfif attributes.required_ind> required="required"</cfif> class="span6 date" />
			<!-- Use CF to create validation <cfinput type="text" name="through_date" required="#attributes.required#" validate="date" size="11" message="You must enter a valid through date"> --->
		</td>
	</tr>
</table>
</cfoutput>

