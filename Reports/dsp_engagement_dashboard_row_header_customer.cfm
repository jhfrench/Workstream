
<!--Reports/dsp_engagements_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I display the engagement dashboard header.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.5  2005/10/13 21:48:28  stetzer
	<>

	Revision 1.4  2005-10-13 17:46:08-04  stetzer
	<>

	Revision 1.3  2005-10-13 17:41:14-04  stetzer
	<>

	Revision 1.2  2005-08-26 15:34:30-04  french
	Improvements to customer-specific engagement dashboard. Task 34802

	||
	END FUSEDOC --->
<cfset today = now()>
</cfsilent>
<cfoutput>
<form name="inactive" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<tr>
		<td colspan="8">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr bgcolor="##008080">
					<td class="HeadText#session.workstream_text_size#White">
						Engagement Dashboard - #dateformat(today,'mm/dd/yy')#
					</td>
					<td align="right" class="HeadText#session.workstream_text_size#White" colspan="2">
						Engagement view: <select name="inactive" onchange="javascript:document.forms.inactive.submit();">
							<option value="1,2"<cfif NOT comparenocase(attributes.inactive,"1,2")> SELECTED</cfif>>All</option>
							<option value="2"<cfif attributes.inactive EQ 2> SELECTED</cfif>>Active only</option>
							<option value="1"<cfif attributes.inactive EQ 1> SELECTED</cfif>>Inactive only</option>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</form>
	<tr bgcolor="##c0c0c0" valign="bottom">
		<td colspan="2" class="SubHeadText#session.workstream_text_size#">
			Customer &amp;<br>Engagement Name
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			IE
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Due Date
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Progress
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Status
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Project Update
		</td>	
		<td class="SubHeadText#session.workstream_text_size#">
			Next Step(s)
		</td>			
		<td class="SubHeadText#session.workstream_text_size#">
			Date Last<br>Updated
		</td>
	</tr>
</cfoutput>
