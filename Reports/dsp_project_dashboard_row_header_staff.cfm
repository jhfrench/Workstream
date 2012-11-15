
<!--Reports/dsp_projects_row_header.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain a one-field form that allows the user to toggle between active and inactive projects.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset today = now()>
</cfsilent>
<cfoutput>
<form name="inactive" action="index.cfm?fuseaction=Reports.projects" method="post">
	<tr bgcolor="##008080">
		<td colspan="100%" class="HeadTextWhite"><strong>
			Project Dashboard - #dateformat(today,'m/d/yyyy')#</strong>
			<input type="hidden" name="client_code" value="NOTHING">
		</td>
	</tr>
</form>
	<tr>
		<td colspan="2" bgcolor="##c0c0c0" class="SubHeadText">
			Customer & Project Name
		</td>
<td bgcolor="##c0c0c0" class="SubHeadText">
			IE
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Due Date
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Progress
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Status
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText">
			Project Update
		</td>


						<td bgcolor="##c0c0c0" class="SubHeadText">
			Date Last<br />Updated
		</td>
	</tr>
</cfoutput>
