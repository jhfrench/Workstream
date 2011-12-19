
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
	<tr bgcolor="##5F5F5F" class="HeadText#session.workstream_text_size#White">
		<td colspan="9" align="left" valign="bottom" class="SubHeadText#session.workstream_text_size#White">
			&nbsp;Tasks due between <cfinput type="datefield" name="from_date" value="#attributes.from_date#" size="10" validate="date" class="RegText#session.workstream_text_size#"> and <cfinput type="datefield" name="to_date" value="#attributes.to_date#" size="10" validate="date" class="RegText#session.workstream_text_size#">&nbsp;<input type="submit" value="Retrieve Taskss" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfform>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td align="center" colspan="4" valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Complete
		</td>
		<td align="center" colspan="4" valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Not Complete
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Budgeted
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Not Budgeted
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Budgeted
		</td>
		<td align="center" colspan="2" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Not Budgeted
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Employee
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Hours
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Hours
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Hours
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Tasks
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#Bd">
			Hours
		</td>
	</tr>
</cfoutput>

