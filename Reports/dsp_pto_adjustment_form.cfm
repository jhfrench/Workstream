
<!--Reports/dsp_pto_adjustment_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfform action="" method="POST">
<cfoutput>
<hr width="80%">
<table align="center" border="0" cellspacing="0">
	<tr>
		<td class="RegTextBd">
			Date
		</td>
		<td class="RegTextBd">
			Hours
		</td>
		<td class="RegTextBd">
			Comment
		</td>
	</tr>
	<tr>
		<td>
			<input type="date" name="date_granted" id="date_granted" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</td>
		<td>
			<input type="number" name="granted_hours" id="granted_hours" step="0.25" min="0" max="999" required="required" class="span5" />
		</td>
		<td>
			<cfinput type="text" name="comments" size="50" maxlength="50" required="yes" message="Enter comment.">
		</td>
	</tr>
	<tr>
		<td colspan="3" class="btn-group">
			<input type="hidden" name="adjustment_flag" value="#now()#" />
			<input type="hidden" name="emp_id" value="#attributes.pin#" />
			<input type="hidden" name="pin" value="#attributes.pin#" />
			<input type="submit" value="Create Adjustment" />
		</td>
	</tr>
</table>
<hr width="80%">
</cfoutput>
</cfform>