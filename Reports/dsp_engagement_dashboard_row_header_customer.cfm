
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
					<td class="HeadTextWhite">
						Project Dashboard - #dateformat(today,'mm/dd/yy')#
					</td>
					<td align="right" class="HeadTextWhite" colspan="2">
						Project view: <select name="inactive" onchange="javascript:document.forms.inactive.submit();">
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
		<td colspan="2" class="SubHeadText">
			Customer &amp;<br>Project Name
		</td>
		<td class="SubHeadText">
			IE
		</td>
		<td class="SubHeadText">
			Due Date
		</td>
		<td class="SubHeadText">
			Progress
		</td>
		<td class="SubHeadText">
			Status
		</td>
		<td class="SubHeadText">
			Project Update
		</td>	
		<td class="SubHeadText">
			Next Step(s)
		</td>			
		<td class="SubHeadText">
			Date Last<br>Updated
		</td>
	</tr>
</cfoutput>
