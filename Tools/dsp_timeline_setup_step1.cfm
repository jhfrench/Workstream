
<!--Tools/dsp_timeline_setup_step1.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 21:01:27  daugherty
	Initial revision

	Revision 1.0  2001-11-28 13:48:42-05  french
	Initial file creation.

	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_valid_projects.cfm">
<cfoutput>
<tr valign="top">
	<td class="RegText#session.workstream_text_size#" width="50%">
		Timeline name<br>
		<cfinput type="Text" name="project_planning_name" required="Yes" message="Please name this new timeline." size="30" class="RegText#session.workstream_text_size#">
	</td>
	<td><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" class="Note#session.workstream_text_size#"><li>Designate a name for this new timeline.</li></ol>
	</td>
</tr>
<tr valign="top">
	<td class="RegText#session.workstream_text_size#" width="50%">
		Engagement<br>
</cfoutput>
		<cfselect name="project_id" size="5" required="yes" message="Please specify the engagement for your new project timeline." class="RegText#session.workstream_text_size#">
		<cfoutput query="get_valid_projects">
			<option value="#project_id#"><cfif session.workstream_project_list_order EQ 1>#customer# #replace(project_name,customer,"","ALL")# (#project_code#)<cfelse>#project_code# - #customer# #replace(project_name,customer,"","ALL")#</cfif></option>
		</cfoutput>
	</cfselect>
	</td>
	<td><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" start="<cfoutput>#variables.start#" class="Note#session.workstream_text_size#</cfoutput>"><li>Select the engagement that contains (or will contain) the tasks for this timeline. Please note that timelines are organized by using custom fields. If your engagement does not use custom fields it will not appear in this select list. You can add custom fields by editing the engagement from the Customers module. See your workstream administrator for more details.</li></ol>
	</td>
</tr>
<input type="hidden" name="step" value="2">

