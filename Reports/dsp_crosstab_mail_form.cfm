
<!--Reports/dsp_crosstab_mail_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form that the manager's use to "verify" the hours on the cross tab report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr align="left"> 
		<td>
<form action="index.cfm?fuseaction=Reports.manager_cross_tab_mail" method="post">
	<input type="hidden" name="from_date" value="#attributes.from_date#">
	<input type="hidden" name="through_date" value="#attributes.through_date#">
	<input type="hidden" name="name" value="#session.first_name#">
	<input type="hidden" name="lname" value="#session.last_name#">
	<label for="verify"><input type="checkbox" name="verify" id="verify" onmouseup="submit();">Check here to verify your subordinates hours.</label>
</form> 
		</td>
	</tr>
</cfoutput>

