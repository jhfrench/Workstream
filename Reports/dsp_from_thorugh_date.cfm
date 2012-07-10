
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
<cfparam name="attributes.required" default="No">
</cfsilent>
<cfoutput>
<cfform name="report" action="index.cfm?fuseaction=Reports.#attributes.action#"> 
<table align="center" border="0" cellpadding="2" cellspacing="0" width="40%">
	<tr bgcolor="##008080">
		<td colspan="2" class="HeadTextWhite">#attributes.report_name#</td>
	</tr>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="RegTextWhite">Enter Dates (mm/dd/yyyy)</td>
	</tr>
	<tr>	
		<td>
			<label for="from_date">From</label>: <cfinput type="datefield" name="from_date" id="from_date" required="#attributes.required#" size="9" validate="date" message="You must enter a valid from date">
		</td>
		<td>
			<label for="through_date">To</label>: <cfinput type="datefield" name="through_date" id="through_date" required="#attributes.required#" size="9" validate="date" message="You must enter a valid through date">
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" value="Enter Dates"></td>
	</tr>	
</table>
</cfform>
</cfoutput>

