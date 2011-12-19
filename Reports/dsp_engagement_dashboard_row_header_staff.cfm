
<!--Reports/dsp_engagements_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I contain a one-field form that allows the user to toggle between active and inactive engagements.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset today = now()>
</cfsilent>
<cfoutput>
<form name="inactive" action="index.cfm?fuseaction=Reports.engagements" method="post">
	<tr bgcolor="##008080">
		<td colspan="100%" class="HeadText#session.workstream_text_size#White"><b>
			Project Dashboard - #dateformat(today,'mm/dd/yy')#</b>
			<input type="hidden" name="client_code" value="NOTHING">
		</td>

	</tr>
</form>
	<tr>
		<td colspan="2" bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Customer & Project Name
		</td>
<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			IE
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Due Date
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Progress
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Status
		</td>
		<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Project Update
		</td>			


						<td bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
			Date Last<br>Updated
		</td>
	</tr>
</cfoutput>
