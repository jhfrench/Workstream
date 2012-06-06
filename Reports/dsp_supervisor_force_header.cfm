
<!--Reports/dsp_supervisor_force_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the employee's ForcePlanner report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfform name="date_range" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
	<tr bgcolor="##5F5F5F" class="HeadTextWhite">
		<td colspan="9" align="left" valign="bottom" class="SubHeadTextWhite">
			&nbsp;Tasks due between <cfinput type="datefield" name="from_date" value="#attributes.from_date#" size="10" validate="date"> and <cfinput type="datefield" name="to_date" value="#attributes.to_date#" size="10" validate="date">&nbsp;<input type="submit" value="Retrieve Taskss">
		</td>
	</tr>
</cfform>
	<tr bgcolor="##c0c0c0" class="SubHeadText">
		<td valign="bottom" class="SubHeadText">
			&nbsp;
		</td>
		<td align="center" colspan="4" valign="bottom" class="SubHeadText">
			Complete
		</td>
		<td align="center" colspan="4" valign="bottom" class="SubHeadText">
			Not Complete
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText">
		<td valign="bottom" class="SubHeadText">
			&nbsp;
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegTextBd">
			Budgeted
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegTextBd">
			Not Budgeted
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegTextBd">
			Budgeted
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegTextBd">
			Not Budgeted
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText">
		<td valign="bottom" class="SubHeadText">
			Employee
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Hours
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Hours
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Hours
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegTextBd">
			Hours
		</td>
	</tr>
</cfoutput>

