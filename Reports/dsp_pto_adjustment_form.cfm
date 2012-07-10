
<!--Reports/dsp_pto_adjustment_form.cfm
	Author: Jeromy F  -->
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
			<cfinput type="Text" name="date_granted" size="10" required="Yes" validate="date" message="Enter a date.">
		</td>
		<td>
			<cfinput type="Text" name="granted_hours" size="5" required="Yes" validate="float" message="Enter hours.">
		</td>
		<td>
			<cfinput type="Text" name="comments" size="50" maxlength="50" required="Yes" message="Enter comment.">
		</td>
	</tr>
	<tr>
		<td align="center" colspan="3">
			<input type="hidden" name="adjustment_flag" value="#now()#">
			<input type="hidden" name="emp_id" value="#attributes.pin#">
			<input type="hidden" name="pin" value="#attributes.pin#">
			<input type="submit" value="Create Adjustment">
		</td>
	</tr>
</table>
<hr width="80%">
</cfoutput>
</cfform>